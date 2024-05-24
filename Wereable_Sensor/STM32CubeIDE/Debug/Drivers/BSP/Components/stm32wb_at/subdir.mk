################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/Components/stm32wb_at/stm32wb_at.c \
../Drivers/BSP/Components/stm32wb_at/stm32wb_at_ble.c \
../Drivers/BSP/Components/stm32wb_at/stm32wb_at_client.c \
../Drivers/BSP/Components/stm32wb_at/stm32wb_at_ll.c 

OBJS += \
./Drivers/BSP/Components/stm32wb_at/stm32wb_at.o \
./Drivers/BSP/Components/stm32wb_at/stm32wb_at_ble.o \
./Drivers/BSP/Components/stm32wb_at/stm32wb_at_client.o \
./Drivers/BSP/Components/stm32wb_at/stm32wb_at_ll.o 

C_DEPS += \
./Drivers/BSP/Components/stm32wb_at/stm32wb_at.d \
./Drivers/BSP/Components/stm32wb_at/stm32wb_at_ble.d \
./Drivers/BSP/Components/stm32wb_at/stm32wb_at_client.d \
./Drivers/BSP/Components/stm32wb_at/stm32wb_at_ll.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/stm32wb_at/%.o Drivers/BSP/Components/stm32wb_at/%.su Drivers/BSP/Components/stm32wb_at/%.cyclo: ../Drivers/BSP/Components/stm32wb_at/%.c Drivers/BSP/Components/stm32wb_at/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32WBXX_NUCLEO -DENABLE_USART -DSTM32WB55xx -c -I../../../../../../../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/STM32WBxx_HAL_Driver/Inc -I../../../../../../../Drivers/BSP/P-NUCLEO-WB55.Nucleo -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/Inc -I../../Core/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/auto -I../../../../../../../Middlewares/ST/STM32_WPAN/utilities -I../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../Utilities/sequencer -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/template -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../../STM32_WPAN/app -I../../../../../../../Middlewares/ST/STM32_WPAN/ble -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/inc" -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-Components-2f-stm32wb_at

clean-Drivers-2f-BSP-2f-Components-2f-stm32wb_at:
	-$(RM) ./Drivers/BSP/Components/stm32wb_at/stm32wb_at.cyclo ./Drivers/BSP/Components/stm32wb_at/stm32wb_at.d ./Drivers/BSP/Components/stm32wb_at/stm32wb_at.o ./Drivers/BSP/Components/stm32wb_at/stm32wb_at.su ./Drivers/BSP/Components/stm32wb_at/stm32wb_at_ble.cyclo ./Drivers/BSP/Components/stm32wb_at/stm32wb_at_ble.d ./Drivers/BSP/Components/stm32wb_at/stm32wb_at_ble.o ./Drivers/BSP/Components/stm32wb_at/stm32wb_at_ble.su ./Drivers/BSP/Components/stm32wb_at/stm32wb_at_client.cyclo ./Drivers/BSP/Components/stm32wb_at/stm32wb_at_client.d ./Drivers/BSP/Components/stm32wb_at/stm32wb_at_client.o ./Drivers/BSP/Components/stm32wb_at/stm32wb_at_client.su ./Drivers/BSP/Components/stm32wb_at/stm32wb_at_ll.cyclo ./Drivers/BSP/Components/stm32wb_at/stm32wb_at_ll.d ./Drivers/BSP/Components/stm32wb_at/stm32wb_at_ll.o ./Drivers/BSP/Components/stm32wb_at/stm32wb_at_ll.su

.PHONY: clean-Drivers-2f-BSP-2f-Components-2f-stm32wb_at

