################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libs/src/algorithm_by_RF.c \
../libs/src/fonts.c \
../libs/src/gpio.c \
../libs/src/graphics.c \
../libs/src/heartRate.c \
../libs/src/i2c.c \
../libs/src/max30102.c \
../libs/src/max30102_new.c \
../libs/src/mpu9250.c \
../libs/src/mpu9250_DMP.c \
../libs/src/pedometer.c \
../libs/src/spi.c \
../libs/src/st7735.c \
../libs/src/st7735_reg.c 

OBJS += \
./libs/src/algorithm_by_RF.o \
./libs/src/fonts.o \
./libs/src/gpio.o \
./libs/src/graphics.o \
./libs/src/heartRate.o \
./libs/src/i2c.o \
./libs/src/max30102.o \
./libs/src/max30102_new.o \
./libs/src/mpu9250.o \
./libs/src/mpu9250_DMP.o \
./libs/src/pedometer.o \
./libs/src/spi.o \
./libs/src/st7735.o \
./libs/src/st7735_reg.o 

C_DEPS += \
./libs/src/algorithm_by_RF.d \
./libs/src/fonts.d \
./libs/src/gpio.d \
./libs/src/graphics.d \
./libs/src/heartRate.d \
./libs/src/i2c.d \
./libs/src/max30102.d \
./libs/src/max30102_new.d \
./libs/src/mpu9250.d \
./libs/src/mpu9250_DMP.d \
./libs/src/pedometer.d \
./libs/src/spi.d \
./libs/src/st7735.d \
./libs/src/st7735_reg.d 


# Each subdirectory must supply rules for building sources it contributes
libs/src/%.o libs/src/%.su libs/src/%.cyclo: ../libs/src/%.c libs/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32WBXX_NUCLEO -DENABLE_USART -DSTM32WB55xx -c -I../../../../../../../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/STM32WBxx_HAL_Driver/Inc -I../../../../../../../Drivers/BSP/P-NUCLEO-WB55.Nucleo -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/Inc -I../../Core/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/auto -I../../../../../../../Middlewares/ST/STM32_WPAN/utilities -I../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../Utilities/sequencer -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/template -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../../STM32_WPAN/app -I../../../../../../../Middlewares/ST/STM32_WPAN/ble -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/inc" -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-libs-2f-src

clean-libs-2f-src:
	-$(RM) ./libs/src/algorithm_by_RF.cyclo ./libs/src/algorithm_by_RF.d ./libs/src/algorithm_by_RF.o ./libs/src/algorithm_by_RF.su ./libs/src/fonts.cyclo ./libs/src/fonts.d ./libs/src/fonts.o ./libs/src/fonts.su ./libs/src/gpio.cyclo ./libs/src/gpio.d ./libs/src/gpio.o ./libs/src/gpio.su ./libs/src/graphics.cyclo ./libs/src/graphics.d ./libs/src/graphics.o ./libs/src/graphics.su ./libs/src/heartRate.cyclo ./libs/src/heartRate.d ./libs/src/heartRate.o ./libs/src/heartRate.su ./libs/src/i2c.cyclo ./libs/src/i2c.d ./libs/src/i2c.o ./libs/src/i2c.su ./libs/src/max30102.cyclo ./libs/src/max30102.d ./libs/src/max30102.o ./libs/src/max30102.su ./libs/src/max30102_new.cyclo ./libs/src/max30102_new.d ./libs/src/max30102_new.o ./libs/src/max30102_new.su ./libs/src/mpu9250.cyclo ./libs/src/mpu9250.d ./libs/src/mpu9250.o ./libs/src/mpu9250.su ./libs/src/mpu9250_DMP.cyclo ./libs/src/mpu9250_DMP.d ./libs/src/mpu9250_DMP.o ./libs/src/mpu9250_DMP.su ./libs/src/pedometer.cyclo ./libs/src/pedometer.d ./libs/src/pedometer.o ./libs/src/pedometer.su ./libs/src/spi.cyclo ./libs/src/spi.d ./libs/src/spi.o ./libs/src/spi.su ./libs/src/st7735.cyclo ./libs/src/st7735.d ./libs/src/st7735.o ./libs/src/st7735.su ./libs/src/st7735_reg.cyclo ./libs/src/st7735_reg.d ./libs/src/st7735_reg.o ./libs/src/st7735_reg.su

.PHONY: clean-libs-2f-src

