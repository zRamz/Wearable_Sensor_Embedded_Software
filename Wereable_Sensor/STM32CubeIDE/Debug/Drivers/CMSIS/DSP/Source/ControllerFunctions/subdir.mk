################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/DSP/Source/ControllerFunctions/ControllerFunctions.c \
../Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_f32.c \
../Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_q15.c \
../Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_q31.c \
../Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_f32.c \
../Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_q15.c \
../Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_q31.c \
../Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_sin_cos_f32.c \
../Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_sin_cos_q31.c 

OBJS += \
./Drivers/CMSIS/DSP/Source/ControllerFunctions/ControllerFunctions.o \
./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_f32.o \
./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_q15.o \
./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_q31.o \
./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_f32.o \
./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_q15.o \
./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_q31.o \
./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_sin_cos_f32.o \
./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_sin_cos_q31.o 

C_DEPS += \
./Drivers/CMSIS/DSP/Source/ControllerFunctions/ControllerFunctions.d \
./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_f32.d \
./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_q15.d \
./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_q31.d \
./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_f32.d \
./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_q15.d \
./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_q31.d \
./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_sin_cos_f32.d \
./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_sin_cos_q31.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/DSP/Source/ControllerFunctions/%.o Drivers/CMSIS/DSP/Source/ControllerFunctions/%.su Drivers/CMSIS/DSP/Source/ControllerFunctions/%.cyclo: ../Drivers/CMSIS/DSP/Source/ControllerFunctions/%.c Drivers/CMSIS/DSP/Source/ControllerFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32WBXX_NUCLEO -DENABLE_USART -DSTM32WB55xx -c -I../../../../../../../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/STM32WBxx_HAL_Driver/Inc -I../../../../../../../Drivers/BSP/P-NUCLEO-WB55.Nucleo -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/Inc -I../../Core/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/auto -I../../../../../../../Middlewares/ST/STM32_WPAN/utilities -I../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../Utilities/sequencer -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/template -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../../STM32_WPAN/app -I../../../../../../../Middlewares/ST/STM32_WPAN/ble -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/inc" -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-CMSIS-2f-DSP-2f-Source-2f-ControllerFunctions

clean-Drivers-2f-CMSIS-2f-DSP-2f-Source-2f-ControllerFunctions:
	-$(RM) ./Drivers/CMSIS/DSP/Source/ControllerFunctions/ControllerFunctions.cyclo ./Drivers/CMSIS/DSP/Source/ControllerFunctions/ControllerFunctions.d ./Drivers/CMSIS/DSP/Source/ControllerFunctions/ControllerFunctions.o ./Drivers/CMSIS/DSP/Source/ControllerFunctions/ControllerFunctions.su ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_f32.cyclo ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_f32.d ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_f32.o ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_f32.su ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_q15.cyclo ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_q15.d ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_q15.o ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_q15.su ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_q31.cyclo ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_q31.d ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_q31.o ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_init_q31.su ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_f32.cyclo ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_f32.d ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_f32.o ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_f32.su ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_q15.cyclo ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_q15.d ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_q15.o ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_q15.su ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_q31.cyclo ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_q31.d ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_q31.o ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_pid_reset_q31.su ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_sin_cos_f32.cyclo ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_sin_cos_f32.d ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_sin_cos_f32.o ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_sin_cos_f32.su ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_sin_cos_q31.cyclo ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_sin_cos_q31.d ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_sin_cos_q31.o ./Drivers/CMSIS/DSP/Source/ControllerFunctions/arm_sin_cos_q31.su

.PHONY: clean-Drivers-2f-CMSIS-2f-DSP-2f-Source-2f-ControllerFunctions
