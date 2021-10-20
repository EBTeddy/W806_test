#ifndef _BOARD_CONFIG_H_
#define _BOARD_CONFIG_H_
/**
 * 本文件是跟随不同的开发板迁移的，所以不同的开发板单独收设置即可
*/

/********************************** (C) COPYRIGHT  *******************************
* File Name          : debug.h
* Author             : WCH
* Version            : V1.0.0
* Date               : 2019/10/15
* Description        : This file contains all the functions prototypes for UART
*                      Printf , Delay and Bit-Banding functions.
*******************************************************************************/
#ifndef __DEBUG_H
#define __DEBUG_H 	

#include "stdio.h"

#define UART_BAUDE_RATE 115200

/*
初始化控制所用的GPIO名字
当前的引脚规定
L		引脚对应B5-B10
R		引脚对应B11-16
DEP		引脚分别为A6 A7 B0 B1

继电器动作为0
继电器常闭为1
*/
#define RELAY_ON 1
#define RELAY_OFF 0
#define PIN_L(n) PAout(n-1)
#define PIN_R(n) PBout(n+2)
#define PIN_DEP1 PAout(6)
#define PIN_DEP2 PAout(7)
#define PIN_DEP3 PBout(0)
#define PIN_DEP4 PBout(1)
//设置最大串口接收字节数为16
#define USART_REC_LEN 16
/* UART Printf Definition */
#define DEBUG_UART1    1
#define DEBUG_UART2    2
#define DEBUG_UART3    3

/* DEBUG UATR Definition */
/*
选用串口1作为数据交换的端口
*/
//#define DEBUG   DEBUG_UART1
//#define DEBUG   DEBUG_UART2
#define DEBUG   DEBUG_UART3

/**
 * 服务函数声明
*/
static void UART1_Init(void);
void Error_Handler(void);
static void GPIO_Init(void)



#endif