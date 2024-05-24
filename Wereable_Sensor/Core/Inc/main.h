/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    main.h
  * @author  MCD Application Team
  * @brief   Header for main.c module
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2019-2021 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef MAIN_H
#define MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32wbxx_hal.h"
#include "app_conf.h"
#include "app_entry.h"
#include "app_common.h"


/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "stm32wbxx_nucleo.h"

#include "i2c.h"
#include "spi.h"
//#include "usart.h"
#include "gpio.h"

#include "math.h"

#include <stdio.h>
#include "math.h"

#include "st7735.h"
#include "fonts.h"
#include "MPU9250.h"
#include "pedometer.h"

#include "max30102.h"
#include "algorithm_by_RF.h"
#include "micros.h"
/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

#define INT_AXEL_Pin GPIO_PIN_0
#define INT_AXEL_GPIO_Port GPIOA
#define INT_GPS_Pin GPIO_PIN_0
#define INT_GPS_GPIO_Port GPIOB
#define INT_PULSE_Pin GPIO_PIN_4
#define INT_PULSE_GPIO_Port GPIOE
#define PWM_LED_TFT_Pin GPIO_PIN_15
#define PWM_LED_TFT_GPIO_Port GPIOA
#define SPI1_CS_TFT_Pin GPIO_PIN_4
#define SPI1_CS_TFT_GPIO_Port GPIOB
#define RS_TFT_Pin GPIO_PIN_5
#define RS_TFT_GPIO_Port GPIOB
#define RESET_TFT_Pin GPIO_PIN_7
#define RESET_TFT_GPIO_Port GPIOB

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
void   MX_LPUART1_UART_Init(void);
void   MX_USART1_UART_Init(void);
/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* MAIN_H */
