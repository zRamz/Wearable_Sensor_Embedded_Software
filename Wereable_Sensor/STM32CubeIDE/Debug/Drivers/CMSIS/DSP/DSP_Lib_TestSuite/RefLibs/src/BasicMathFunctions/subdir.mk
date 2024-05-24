################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/BasicMathFunctions.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/abs.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/add.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/dot_prod.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/mult.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/negate.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/offset.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/scale.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/shift.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/sub.c 

OBJS += \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/BasicMathFunctions.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/abs.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/add.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/dot_prod.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/mult.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/negate.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/offset.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/scale.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/shift.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/sub.o 

C_DEPS += \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/BasicMathFunctions.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/abs.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/add.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/dot_prod.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/mult.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/negate.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/offset.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/scale.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/shift.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/sub.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/%.o Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/%.su Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/%.cyclo: ../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/%.c Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32WBXX_NUCLEO -DENABLE_USART -DSTM32WB55xx -c -I../../../../../../../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/STM32WBxx_HAL_Driver/Inc -I../../../../../../../Drivers/BSP/P-NUCLEO-WB55.Nucleo -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/Inc -I../../Core/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/auto -I../../../../../../../Middlewares/ST/STM32_WPAN/utilities -I../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../Utilities/sequencer -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/template -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../../STM32_WPAN/app -I../../../../../../../Middlewares/ST/STM32_WPAN/ble -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/inc" -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-RefLibs-2f-src-2f-BasicMathFunctions

clean-Drivers-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-RefLibs-2f-src-2f-BasicMathFunctions:
	-$(RM) ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/BasicMathFunctions.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/BasicMathFunctions.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/BasicMathFunctions.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/BasicMathFunctions.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/abs.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/abs.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/abs.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/abs.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/add.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/add.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/add.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/add.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/dot_prod.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/dot_prod.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/dot_prod.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/dot_prod.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/mult.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/mult.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/mult.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/mult.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/negate.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/negate.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/negate.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/negate.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/offset.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/offset.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/offset.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/offset.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/scale.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/scale.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/scale.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/scale.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/shift.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/shift.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/shift.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/shift.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/sub.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/sub.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/sub.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/BasicMathFunctions/sub.su

.PHONY: clean-Drivers-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-RefLibs-2f-src-2f-BasicMathFunctions

