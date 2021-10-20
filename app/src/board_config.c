#include "board_config.h"


extern UART_HandleTypeDef huart1;
/**
 * 串口初始化函数
*/
static void UART1_Init(void)
{
	huart1.Instance = UART1;
	huart1.Init.BaudRate = UART_BAUDE_RATE;
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
 * GPIO初始化函数
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
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
	if (FifoSpaceLen() >= huart->RxXferCount)
	{
		FifoWrite(huart->pRxBuffPtr, huart->RxXferCount);
	}
}

void Error_Handler(void)
{
	while (1)
	{
	}
}


