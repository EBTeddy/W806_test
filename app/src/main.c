
#include <stdio.h>
#include <string.h>
#include "wm_hal.h"
#include "fifo.h"

UART_HandleTypeDef huart1;

static void UART1_Init(void);
void Error_Handler(void);

#define IT_LEN 0 	// 大于等于0，0：接收不定长数据即可触发中断回调；大于0：接收N个长度数据才触发中断回调
static uint8_t buf[32] = {0}; // 必须大于等于32字节
void Error_Handler(void);
static void GPIO_Init(void);

static volatile uint8_t key_flag = 0;
#define LEN 2048
static uint8_t pdata[LEN] = {0};
int main(void)
{
	volatile int tx_len = 0;
	uint8_t tx_buf[100] = {0};
	
	SystemClock_Config(CPU_CLK_160M);
	printf("enter main\r\n");
	
	UART1_Init();
	FifoInit(pdata, LEN);
	HAL_UART_Receive_IT(&huart1, buf, IT_LEN);		// 只需调用一次，接收够设定的长度，进入中断回调，用户需要在中断回调中取走数据，此处设置了
												// 0个字节，即不定长
												
												
												
	while(1)
	{	
		tx_len = FifoDataLen();
		if (tx_len > 0)
		{
			HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_0 | GPIO_PIN_1);
			tx_len = (tx_len > 100) ? 100 : tx_len;
			FifoRead(tx_buf, tx_len);
			HAL_UART_Transmit(&huart1, tx_buf, tx_len, 1000);
			printf("receive\r\n");
		}
		else
		{
			HAL_Delay(20);
			HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_2);

		}
		
	}
	
    return 0;
}

static void UART1_Init(void)
{
	huart1.Instance = UART1;
	huart1.Init.BaudRate = 115200;
	huart1.Init.WordLength = UART_WORDLENGTH_8B;
	huart1.Init.StopBits = UART_STOPBITS_1;
	huart1.Init.Parity = UART_PARITY_NONE;
	huart1.Init.Mode = UART_MODE_TX | UART_MODE_RX;
	huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
	if (HAL_UART_Init(&huart1) != HAL_OK)
	{
		Error_Handler();
	}
}
/**
  * 以中断方式接收一定长度的数据.
  * 注意：pData指向的地址，空间长度必须大于等于32字节
  * 	  Size大于0，则接收够Size长度的数据执行一次HAL_UART_RxCpltCallback(huart);
  * 	  Sized等于0，则接收不定长的数据就执行一次HAL_UART_RxCpltCallback(huart);
  *       两种情况下，数据都存放在huart->pRxBuffPtr或者pData中，数据长度存放在huart->RxXferCount中
  */
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
	if (FifoSpaceLen() >= huart->RxXferCount)
	{
		FifoWrite(huart->pRxBuffPtr, huart->RxXferCount);
	}
				printf("irq\r\n");
}

void Error_Handler(void)
{
	while (1)
	{
	}
}

void assert_failed(uint8_t *file, uint32_t line)
{
	printf("Wrong parameters value: file %s on line %d\r\n", file, line);
}

/*
 * GPIO初始化
 */
 static void GPIO_Init(void)
{
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	
	__HAL_RCC_GPIO_CLK_ENABLE();

	GPIO_InitStruct.Pin = GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2, GPIO_PIN_SET);
	
	GPIO_InitStruct.Pin = GPIO_PIN_5;
	GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
	GPIO_InitStruct.Pull = GPIO_PULLUP;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
	
	HAL_NVIC_SetPriority(GPIOB_IRQn, 0);
	HAL_NVIC_EnableIRQ(GPIOB_IRQn);

}

void HAL_GPIO_EXTI_Callback(GPIO_TypeDef *GPIOx, uint32_t GPIO_Pin)
{
	if ((GPIOx == GPIOB) && (GPIO_Pin == GPIO_PIN_5))
	{
		key_flag = 1;
	}
}
