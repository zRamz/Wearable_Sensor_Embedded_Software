################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1.c \
../Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_bus.c \
../Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_eeprom.c \
../Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_env_sensors.c \
../Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_env_sensors_ex.c \
../Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_motion_sensors.c \
../Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_motion_sensors_ex.c 

OBJS += \
./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1.o \
./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_bus.o \
./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_eeprom.o \
./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_env_sensors.o \
./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_env_sensors_ex.o \
./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_motion_sensors.o \
./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_motion_sensors_ex.o 

C_DEPS += \
./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1.d \
./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_bus.d \
./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_eeprom.d \
./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_env_sensors.d \
./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_env_sensors_ex.d \
./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_motion_sensors.d \
./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_motion_sensors_ex.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/B-WB1M-WPAN1/%.o Drivers/BSP/B-WB1M-WPAN1/%.su Drivers/BSP/B-WB1M-WPAN1/%.cyclo: ../Drivers/BSP/B-WB1M-WPAN1/%.c Drivers/BSP/B-WB1M-WPAN1/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32WBXX_NUCLEO -DENABLE_USART -DSTM32WB55xx -c -I../../../../../../../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/STM32WBxx_HAL_Driver/Inc -I../../../../../../../Drivers/BSP/P-NUCLEO-WB55.Nucleo -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/Inc -I../../Core/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/auto -I../../../../../../../Middlewares/ST/STM32_WPAN/utilities -I../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../Utilities/sequencer -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/template -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../../STM32_WPAN/app -I../../../../../../../Middlewares/ST/STM32_WPAN/ble -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/inc" -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-B-2d-WB1M-2d-WPAN1

clean-Drivers-2f-BSP-2f-B-2d-WB1M-2d-WPAN1:
	-$(RM) ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1.cyclo ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1.d ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1.o ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1.su ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_bus.cyclo ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_bus.d ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_bus.o ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_bus.su ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_eeprom.cyclo ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_eeprom.d ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_eeprom.o ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_eeprom.su ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_env_sensors.cyclo ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_env_sensors.d ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_env_sensors.o ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_env_sensors.su ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_env_sensors_ex.cyclo ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_env_sensors_ex.d ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_env_sensors_ex.o ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_env_sensors_ex.su ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_motion_sensors.cyclo ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_motion_sensors.d ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_motion_sensors.o ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_motion_sensors.su ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_motion_sensors_ex.cyclo ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_motion_sensors_ex.d ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_motion_sensors_ex.o ./Drivers/BSP/B-WB1M-WPAN1/b_wb1m_wpan1_motion_sensors_ex.su

.PHONY: clean-Drivers-2f-BSP-2f-B-2d-WB1M-2d-WPAN1

