################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk.c \
../Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_audio.c \
../Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_bus.c \
../Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_env_sensors.c \
../Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_env_sensors_ex.c \
../Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_lcd.c \
../Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_motion_sensors.c \
../Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_motion_sensors_ex.c \
../Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_qspi.c 

OBJS += \
./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk.o \
./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_audio.o \
./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_bus.o \
./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_env_sensors.o \
./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_env_sensors_ex.o \
./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_lcd.o \
./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_motion_sensors.o \
./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_motion_sensors_ex.o \
./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_qspi.o 

C_DEPS += \
./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk.d \
./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_audio.d \
./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_bus.d \
./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_env_sensors.d \
./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_env_sensors_ex.d \
./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_lcd.d \
./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_motion_sensors.d \
./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_motion_sensors_ex.d \
./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_qspi.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/STM32WB5MM-DK/%.o Drivers/BSP/STM32WB5MM-DK/%.su Drivers/BSP/STM32WB5MM-DK/%.cyclo: ../Drivers/BSP/STM32WB5MM-DK/%.c Drivers/BSP/STM32WB5MM-DK/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32WBXX_NUCLEO -DENABLE_USART -DSTM32WB55xx -c -I../../../../../../../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/STM32WBxx_HAL_Driver/Inc -I../../../../../../../Drivers/BSP/P-NUCLEO-WB55.Nucleo -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/Inc -I../../Core/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/auto -I../../../../../../../Middlewares/ST/STM32_WPAN/utilities -I../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../Utilities/sequencer -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/template -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../../STM32_WPAN/app -I../../../../../../../Middlewares/ST/STM32_WPAN/ble -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/inc" -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-STM32WB5MM-2d-DK

clean-Drivers-2f-BSP-2f-STM32WB5MM-2d-DK:
	-$(RM) ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk.cyclo ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk.d ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk.o ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk.su ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_audio.cyclo ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_audio.d ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_audio.o ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_audio.su ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_bus.cyclo ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_bus.d ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_bus.o ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_bus.su ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_env_sensors.cyclo ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_env_sensors.d ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_env_sensors.o ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_env_sensors.su ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_env_sensors_ex.cyclo ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_env_sensors_ex.d ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_env_sensors_ex.o ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_env_sensors_ex.su ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_lcd.cyclo ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_lcd.d ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_lcd.o ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_lcd.su ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_motion_sensors.cyclo ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_motion_sensors.d ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_motion_sensors.o ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_motion_sensors.su ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_motion_sensors_ex.cyclo ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_motion_sensors_ex.d ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_motion_sensors_ex.o ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_motion_sensors_ex.su ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_qspi.cyclo ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_qspi.d ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_qspi.o ./Drivers/BSP/STM32WB5MM-DK/stm32wb5mm_dk_qspi.su

.PHONY: clean-Drivers-2f-BSP-2f-STM32WB5MM-2d-DK

