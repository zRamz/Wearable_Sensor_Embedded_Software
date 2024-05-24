/* USER CODE BEGIN Header */
/**
  ******************************************************************************
 * @file    main.c
 * @author  MCD Application Team
 * @brief   BLE application with BLE core
 *
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
  @verbatim
  ==============================================================================
                    ##### IMPORTANT NOTE #####
  ==============================================================================

  This application requests having the stm32wb5x_BLE_Stack_fw.bin binary
  flashed on the Wireless Coprocessor.
  If it is not the case, you need to use STM32CubeProgrammer to load the appropriate
  binary.

  All available binaries are located under following directory:
  /Projects/STM32_Copro_Wireless_Binaries

  Refer to UM2237 to learn how to use/install STM32CubeProgrammer.
  Refer to /Projects/STM32_Copro_Wireless_Binaries/ReleaseNote.html for the
  detailed procedure to change the Wireless Coprocessor binary.

  @endverbatim
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

#define TASK_MEASURE 1 << 15
#define TASK_DEBUG 1 << 16
#define PRIO_MEASURE 2
#define PRIO_DEBUG 0
//#define FAKE_MAX30102_CLONE

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

#define YMAX 5000
#define YMIN 0

#define MAX_HEART_BEAT_TRACE 		140.0f
#define MY_SNPRINTF 		snprintf

#define DMP_CODE_SIZE 3062
#define DMP_SAMPLE_RATE (200)

#define MAX_FIFO_SIZE 1024
#define BANK_SIZE 256




//#ifdef __GNUC__									// serial intervals
//#define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
//#else
//#define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
//#endif
//PUTCHAR_PROTOTYPE
//{
//    HAL_UART_Transmit(&huart1 , (uint8_t *)&ch, 1, 0xFFFF);
//    return ch;
//}

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
IPCC_HandleTypeDef hipcc;

UART_HandleTypeDef hlpuart1;
UART_HandleTypeDef huart1;
DMA_HandleTypeDef hdma_lpuart1_tx;
DMA_HandleTypeDef hdma_usart1_tx;

RNG_HandleTypeDef hrng;

RTC_HandleTypeDef hrtc;

/* USER CODE BEGIN PV */

#ifdef __GNUC__									// serial intervals
#define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
#else
#define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
#endif
PUTCHAR_PROTOTYPE
{
    HAL_UART_Transmit(&huart1 , (uint8_t *)&ch, 1, 0xFFFF);
    return ch;
}

MPU9250_t mpu;

float ax = 0, ay = 0, az = 0, gx = 0, gy = 0, gz = 0;
float HeartRate = 0;
static uint32_t aun_ir_buffer[BUFFER_SIZE]; //infrared LED sensor data
static uint32_t aun_red_buffer[BUFFER_SIZE];  //red LED sensor data

const uint8_t RATE_SIZE = 4; //Increase this for more averaging. 4 is good.
float rates[4]; //Array of heart rates
uint8_t rateSpot = 0;
long lastBeat = 0; //Time at which the last beat occurred
float beatAvg = 0;
uint8_t averaging;
uint8_t flagAvg = 0;

bool flag_pulse = 0;

uint8_t dmp_loaded = 0;
uint16_t dmp_sample_rate;

uint32_t stepCount = 0;
uint32_t stepTime = 0;
uint32_t lastStepCount = 0;

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
void PeriphCommonClock_Config(void);
//static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_RF_Init(void);
static void MX_RTC_Init(void);
static void MX_IPCC_Init(void);
static void MX_RNG_Init(void);
/* USER CODE BEGIN PFP */

void setMPUSettings(MPU9250_t * MPU0250);
void Max30102Setup();
void Max30102Loop(void);

void function_Task_Meaure();
void function_Task_Debug();


/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

void check_i2c_bus()
{

	uint8_t buf[8] = {0};
	uint8_t separator[] = " . ";
	uint8_t new_line[] = "\r\n";
	uint8_t start_text[] = "Start scanning I2C: \r\n";
	uint8_t end_text[] = "\r\nStop scanning";

	uint8_t row = 0, state;

	  HAL_Delay(1000);

	  // процедура сканирования
	  HAL_UART_Transmit(&huart1, start_text, sizeof(start_text), 128);
	  for( uint8_t i=1; i<128; i++ )
	  {
		  state = HAL_I2C_IsDeviceReady(&hi2c1, (uint16_t)(i<<1), 3, 5);

		  if ( state != HAL_OK ){ // нет ответа от адреса
			  HAL_UART_Transmit(&huart1, separator, sizeof(separator), 128);
		  }

		  else if(state == HAL_OK){ // есть ответ
			  sprintf(buf, "0x%X", i);
			  HAL_UART_Transmit(&huart1, buf, sizeof(buf), 128);
		  }

		  if( row == 15 ){
			  row = 0;
			  HAL_UART_Transmit(&huart1, new_line, sizeof(new_line), 128);
		  } else
			  row ++;
	  }
	    HAL_UART_Transmit(&huart1, end_text, sizeof(end_text), 128);
}

void Max30102Setup()
{
  uint8_t uch_dummy;

  maxim_max30102_reset();
  maxim_max30102_read_reg(REG_INTR_STATUS_1, &uch_dummy);  // reads/clears the interrupt status register
  maxim_max30102_init();
}

void Max30102Loop()
{
  char buf[20];
  uint8_t i;

  // buffer length of BUFFER_SIZE stores ST seconds of samples running at FS sps
  for (i = 0U; i < BUFFER_SIZE; i++)
  {
	  while (HAL_GPIO_ReadPin(INT_PULSE_GPIO_Port, INT_PULSE_Pin) == 1) {};
#ifdef FAKE_MAX30102_CLONE
    maxim_max30102_read_fifo((aun_ir_buffer + i), (aun_red_buffer + i));  // read from MAX30102 FIFO

#else
    maxim_max30102_read_fifo((aun_red_buffer + i), (aun_ir_buffer + i));  // read from MAX30102 FIFO
#endif


    if (checkForBeat(aun_red_buffer[i]) == true)
    {
		uint32_t delta = HAL_GetTick()- lastBeat;
		lastBeat = HAL_GetTick();

		HeartRate = 60.0 / (delta / 1000.0);

		if (HeartRate < 255 && HeartRate > 60)
		{
			rates[rateSpot++] = HeartRate; //Store this reading in the array
			if (rateSpot < 5 && !flagAvg)
			{
				averaging = rateSpot;
				if (rateSpot == 4)
					flagAvg = 1;
			}

			rateSpot %= RATE_SIZE; //Wrap variable


			//Take average of readings
			beatAvg = 0;
			for (uint8_t i = 0 ; i < RATE_SIZE ; i++)
			  beatAvg += rates[i];
			beatAvg /= averaging;

			snprintf(buf, (size_t)20, "HR %.2f bpm", beatAvg);
			ST7735_DrawString(1, 3, buf, ST7735_BLACK);
		}
    }
  }
}

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();
  /* Config code for STM32_WPAN (HSE Tuning must be done before system clock configuration) */
  MX_APPE_Config();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

/* Configure the peripherals common clocks */
  PeriphCommonClock_Config();

  /* IPCC initialisation */
   MX_IPCC_Init();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_RF_Init();
  MX_RTC_Init();
  MX_RNG_Init();

  MX_I2C1_Init();
  MX_SPI1_Init();

  /* USER CODE BEGIN 2 */

  /* Enable CRC clock */
  __HAL_RCC_CRC_CLK_ENABLE();

  // Unprovivioning

  // Init Display
  // BEGIN
  	check_i2c_bus();
	ST7735_Init();
	ST7735_FillScreen(ST7735_WHITE);
	HAL_GPIO_WritePin(PWM_LED_TFT_GPIO_Port, PWM_LED_TFT_Pin, GPIO_PIN_SET);

	Max30102Setup();

	if (MPU9250_Setup() != INV_SUCCESS)
	  {
		  while(1)
		  {
			  printf("Unable to communicate with MPU-9250\n\r");
			  printf("Check connections, and try again.\n\r");
			  HAL_Delay(5000);
		  }
	  }


	  Pedometer_Setup(DMP_FEATURE_PEDOMETER, 200);
	  dmp_set_pedometer_step_count(stepCount);
	  dmp_set_pedometer_walk_time(stepTime);

	  ST7735_DrawString(1, 1, "ID: 0002", ST7735_BLACK);
	  ST7735_DrawString(1, 9, "Un-Prov", ST7735_BLACK);
	  ST7735_DrawString(4, 12, "MIEM", ST7735_BLACK);
	  ST7735_DrawString(4, 13, "2024", ST7735_BLACK);

  /* USER CODE END 2 */

  /* Init code for STM32_WPAN */
  MX_APPE_Init();
//  UTIL_SEQ_RegTask(TASK_MEASURE, 1, function_Task_Meaure);
//  UTIL_SEQ_SetTask(TASK_MEASURE, PRIO_MEASURE);
//  UTIL_SEQ_RegTask(TASK_DEBUG, 1, function_Task_Debug);
//  UTIL_SEQ_SetTask(TASK_DEBUG, PRIO_DEBUG);

  /* Infinite loop */



  /* USER CODE BEGIN WHILE */
	while(1)
	{

    /* USER CODE END WHILE */
		MX_APPE_Process();
//    First_Unprovision();

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure LSE Drive Capability
  */
  HAL_PWR_EnableBkUpAccess();
  __HAL_RCC_LSEDRIVE_CONFIG(RCC_LSEDRIVE_LOW);

  /** Configure the main internal regulator output voltage
  */
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI48|RCC_OSCILLATORTYPE_HSI
                              |RCC_OSCILLATORTYPE_HSE|RCC_OSCILLATORTYPE_LSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.LSEState = RCC_LSE_ON;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSI48State = RCC_HSI48_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure the SYSCLKSource, HCLK, PCLK1 and PCLK2 clocks dividers
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK4|RCC_CLOCKTYPE_HCLK2
                              |RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSE;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.AHBCLK2Divider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.AHBCLK4Divider = RCC_SYSCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_1) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief Peripherals Common Clock Configuration
  * @retval None
  */
void PeriphCommonClock_Config(void)
{
  RCC_PeriphCLKInitTypeDef PeriphClkInitStruct = {0};

  /** Initializes the peripherals clock
  */
  PeriphClkInitStruct.PeriphClockSelection = RCC_PERIPHCLK_SMPS|RCC_PERIPHCLK_RFWAKEUP;
  PeriphClkInitStruct.RFWakeUpClockSelection = RCC_RFWKPCLKSOURCE_LSE;
  PeriphClkInitStruct.SmpsClockSelection = RCC_SMPSCLKSOURCE_HSE;
  PeriphClkInitStruct.SmpsDivSelection = RCC_SMPSCLKDIV_RANGE1;

  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN Smps */

  /* USER CODE END Smps */
}

/**
  * @brief IPCC Initialization Function
  * @param None
  * @retval None
  */
static void MX_IPCC_Init(void)
{

  /* USER CODE BEGIN IPCC_Init 0 */

  /* USER CODE END IPCC_Init 0 */

  /* USER CODE BEGIN IPCC_Init 1 */

  /* USER CODE END IPCC_Init 1 */
  hipcc.Instance = IPCC;
  if (HAL_IPCC_Init(&hipcc) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN IPCC_Init 2 */

  /* USER CODE END IPCC_Init 2 */

}

/**
  * @brief LPUART1 Initialization Function
  * @param None
  * @retval None
  */
void MX_LPUART1_UART_Init(void)
{

  /* USER CODE BEGIN LPUART1_Init 0 */

  /* USER CODE END LPUART1_Init 0 */

  /* USER CODE BEGIN LPUART1_Init 1 */

  /* USER CODE END LPUART1_Init 1 */
  hlpuart1.Instance = LPUART1;
  hlpuart1.Init.BaudRate = 115200;
  hlpuart1.Init.WordLength = UART_WORDLENGTH_8B;
  hlpuart1.Init.StopBits = UART_STOPBITS_1;
  hlpuart1.Init.Parity = UART_PARITY_NONE;
  hlpuart1.Init.Mode = UART_MODE_TX_RX;
  hlpuart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  hlpuart1.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  hlpuart1.Init.ClockPrescaler = UART_PRESCALER_DIV1;
  hlpuart1.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  hlpuart1.FifoMode = UART_FIFOMODE_DISABLE;
  if (HAL_UART_Init(&hlpuart1) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_UARTEx_SetTxFifoThreshold(&hlpuart1, UART_TXFIFO_THRESHOLD_1_8) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_UARTEx_SetRxFifoThreshold(&hlpuart1, UART_RXFIFO_THRESHOLD_1_8) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_UARTEx_DisableFifoMode(&hlpuart1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN LPUART1_Init 2 */

  /* USER CODE END LPUART1_Init 2 */

}

/**
  * @brief USART1 Initialization Function
  * @param None
  * @retval None
  */
void MX_USART1_UART_Init(void)
{

  /* USER CODE BEGIN USART1_Init 0 */

  /* USER CODE END USART1_Init 0 */

  /* USER CODE BEGIN USART1_Init 1 */

  /* USER CODE END USART1_Init 1 */
  huart1.Instance = USART1;
  huart1.Init.BaudRate = 115200;
  huart1.Init.WordLength = UART_WORDLENGTH_8B;
  huart1.Init.StopBits = UART_STOPBITS_1;
  huart1.Init.Parity = UART_PARITY_NONE;
  huart1.Init.Mode = UART_MODE_TX_RX;
  huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart1.Init.OverSampling = UART_OVERSAMPLING_8;
  huart1.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart1.Init.ClockPrescaler = UART_PRESCALER_DIV1;
  huart1.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  if (HAL_UART_Init(&huart1) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_UARTEx_SetTxFifoThreshold(&huart1, UART_TXFIFO_THRESHOLD_1_8) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_UARTEx_SetRxFifoThreshold(&huart1, UART_RXFIFO_THRESHOLD_8_8) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_UARTEx_EnableFifoMode(&huart1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART1_Init 2 */

  /* USER CODE END USART1_Init 2 */

}

/**
  * @brief RF Initialization Function
  * @param None
  * @retval None
  */
static void MX_RF_Init(void)
{

  /* USER CODE BEGIN RF_Init 0 */

  /* USER CODE END RF_Init 0 */

  /* USER CODE BEGIN RF_Init 1 */

  /* USER CODE END RF_Init 1 */
  /* USER CODE BEGIN RF_Init 2 */

  /* USER CODE END RF_Init 2 */

}

/**
  * @brief RNG Initialization Function
  * @param None
  * @retval None
  */
static void MX_RNG_Init(void)
{

  /* USER CODE BEGIN RNG_Init 0 */

  /* USER CODE END RNG_Init 0 */

  /* USER CODE BEGIN RNG_Init 1 */

  /* USER CODE END RNG_Init 1 */
  hrng.Instance = RNG;
  hrng.Init.ClockErrorDetection = RNG_CED_ENABLE;
  if (HAL_RNG_Init(&hrng) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN RNG_Init 2 */

  /* USER CODE END RNG_Init 2 */

}

/**
  * @brief RTC Initialization Function
  * @param None
  * @retval None
  */
static void MX_RTC_Init(void)
{

  /* USER CODE BEGIN RTC_Init 0 */

  /* USER CODE END RTC_Init 0 */

  /* USER CODE BEGIN RTC_Init 1 */

  /* USER CODE END RTC_Init 1 */

  /** Initialize RTC Only
  */
  hrtc.Instance = RTC;
  hrtc.Init.HourFormat = RTC_HOURFORMAT_24;
  hrtc.Init.AsynchPrediv = CFG_RTC_ASYNCH_PRESCALER;
  hrtc.Init.SynchPrediv = CFG_RTC_SYNCH_PRESCALER;
  hrtc.Init.OutPut = RTC_OUTPUT_DISABLE;
  hrtc.Init.OutPutPolarity = RTC_OUTPUT_POLARITY_HIGH;
  hrtc.Init.OutPutType = RTC_OUTPUT_TYPE_OPENDRAIN;
  hrtc.Init.OutPutRemap = RTC_OUTPUT_REMAP_NONE;
  if (HAL_RTC_Init(&hrtc) != HAL_OK)
  {
    Error_Handler();
  }

  /** Enable the WakeUp
  */
  if (HAL_RTCEx_SetWakeUpTimer_IT(&hrtc, 0, RTC_WAKEUPCLOCK_RTCCLK_DIV16) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN RTC_Init 2 */

  /* USER CODE END RTC_Init 2 */

}

/**
  * Enable DMA controller clock
  */
static void MX_DMA_Init(void)
{

  /* DMA controller clock enable */
  __HAL_RCC_DMAMUX1_CLK_ENABLE();
  __HAL_RCC_DMA1_CLK_ENABLE();
  __HAL_RCC_DMA2_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA1_Channel4_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Channel4_IRQn, 15, 0);
  HAL_NVIC_EnableIRQ(DMA1_Channel4_IRQn);
  /* DMA2_Channel4_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA2_Channel4_IRQn, 15, 0);
  HAL_NVIC_EnableIRQ(DMA2_Channel4_IRQn);

}

///**
//  * @brief GPIO Initialization Function
//  * @param None
//  * @retval None
//  */
//static void MX_GPIO_Init(void)
//{
//
//  /* GPIO Ports Clock Enable */
//  __HAL_RCC_GPIOC_CLK_ENABLE();
//  __HAL_RCC_GPIOA_CLK_ENABLE();
//  __HAL_RCC_GPIOB_CLK_ENABLE();
//
//}

/* USER CODE BEGIN 4 */

// Unprovisioning device

void function_Task_Meaure()
{

//	while(1)
	{
		dmp_get_pedometer_step_count(&stepCount);
		dmp_get_pedometer_walk_time(&stepTime);
		if (stepCount != lastStepCount)
			{
			  lastStepCount = stepCount;
			  printf("Walked: %lu\n\r steps", stepCount);
			  printf("Time: %.2f\n\r", (float)stepTime/ 1000.0);

			  uint8_t buf[20];

			  snprintf(buf, (size_t)20, "Steps: %lu", stepCount);
			  ST7735_DrawString(1, 5, buf, ST7735_BLACK);
			  snprintf(buf, (size_t)40, "Time: %.2f", (float)stepTime/ 1000.0);
			  ST7735_DrawString(1, 6, buf, ST7735_BLACK);
			}

	//	  if (flag_pulse == 1)
		  {
			  Max30102Loop();
			  flag_pulse = 0;
			  printf("HeartRate = %3.2f\n\r", HeartRate);
		  }
	}
}





/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */

  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
