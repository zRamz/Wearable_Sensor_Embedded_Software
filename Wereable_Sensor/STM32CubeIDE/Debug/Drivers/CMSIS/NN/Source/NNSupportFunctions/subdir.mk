################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q15.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q7.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nntables.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_no_shift.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_no_shift.c 

OBJS += \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q15.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q7.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nntables.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_no_shift.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_no_shift.o 

C_DEPS += \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q15.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q7.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nntables.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_no_shift.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_no_shift.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/NN/Source/NNSupportFunctions/%.o Drivers/CMSIS/NN/Source/NNSupportFunctions/%.su Drivers/CMSIS/NN/Source/NNSupportFunctions/%.cyclo: ../Drivers/CMSIS/NN/Source/NNSupportFunctions/%.c Drivers/CMSIS/NN/Source/NNSupportFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32WBXX_NUCLEO -DENABLE_USART -DSTM32WB55xx -c -I../../../../../../../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/STM32WBxx_HAL_Driver/Inc -I../../../../../../../Drivers/BSP/P-NUCLEO-WB55.Nucleo -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/Inc -I../../Core/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/auto -I../../../../../../../Middlewares/ST/STM32_WPAN/utilities -I../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../Utilities/sequencer -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/template -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../../STM32_WPAN/app -I../../../../../../../Middlewares/ST/STM32_WPAN/ble -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/inc" -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-CMSIS-2f-NN-2f-Source-2f-NNSupportFunctions

clean-Drivers-2f-CMSIS-2f-NN-2f-Source-2f-NNSupportFunctions:
	-$(RM) ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q15.cyclo ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q15.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q15.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q15.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q7.cyclo ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q7.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q7.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q7.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nntables.cyclo ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nntables.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nntables.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nntables.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_no_shift.cyclo ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_no_shift.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_no_shift.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_no_shift.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_no_shift.cyclo ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_no_shift.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_no_shift.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_no_shift.su

.PHONY: clean-Drivers-2f-CMSIS-2f-NN-2f-Source-2f-NNSupportFunctions

