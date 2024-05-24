################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/P-NUCLEO-WB55.USBDongle/stm32wbxx_usb_dongle.c 

OBJS += \
./Drivers/BSP/P-NUCLEO-WB55.USBDongle/stm32wbxx_usb_dongle.o 

C_DEPS += \
./Drivers/BSP/P-NUCLEO-WB55.USBDongle/stm32wbxx_usb_dongle.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/P-NUCLEO-WB55.USBDongle/%.o Drivers/BSP/P-NUCLEO-WB55.USBDongle/%.su Drivers/BSP/P-NUCLEO-WB55.USBDongle/%.cyclo: ../Drivers/BSP/P-NUCLEO-WB55.USBDongle/%.c Drivers/BSP/P-NUCLEO-WB55.USBDongle/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32WBXX_NUCLEO -DENABLE_USART -DSTM32WB55xx -c -I../../../../../../../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/STM32WBxx_HAL_Driver/Inc -I../../../../../../../Drivers/BSP/P-NUCLEO-WB55.Nucleo -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/Inc -I../../Core/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/auto -I../../../../../../../Middlewares/ST/STM32_WPAN/utilities -I../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../Utilities/sequencer -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/template -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../../STM32_WPAN/app -I../../../../../../../Middlewares/ST/STM32_WPAN/ble -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/inc" -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-P-2d-NUCLEO-2d-WB55-2e-USBDongle

clean-Drivers-2f-BSP-2f-P-2d-NUCLEO-2d-WB55-2e-USBDongle:
	-$(RM) ./Drivers/BSP/P-NUCLEO-WB55.USBDongle/stm32wbxx_usb_dongle.cyclo ./Drivers/BSP/P-NUCLEO-WB55.USBDongle/stm32wbxx_usb_dongle.d ./Drivers/BSP/P-NUCLEO-WB55.USBDongle/stm32wbxx_usb_dongle.o ./Drivers/BSP/P-NUCLEO-WB55.USBDongle/stm32wbxx_usb_dongle.su

.PHONY: clean-Drivers-2f-BSP-2f-P-2d-NUCLEO-2d-WB55-2e-USBDongle

