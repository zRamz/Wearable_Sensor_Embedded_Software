################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/StatisticsFunctions.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/max.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/mean.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/min.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/power.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/rms.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/std.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/var.c 

OBJS += \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/StatisticsFunctions.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/max.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/mean.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/min.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/power.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/rms.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/std.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/var.o 

C_DEPS += \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/StatisticsFunctions.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/max.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/mean.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/min.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/power.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/rms.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/std.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/var.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/%.o Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/%.su Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/%.cyclo: ../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/%.c Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32WBXX_NUCLEO -DENABLE_USART -DSTM32WB55xx -c -I../../../../../../../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/STM32WBxx_HAL_Driver/Inc -I../../../../../../../Drivers/BSP/P-NUCLEO-WB55.Nucleo -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/Inc -I../../Core/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/auto -I../../../../../../../Middlewares/ST/STM32_WPAN/utilities -I../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../Utilities/sequencer -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/template -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../../STM32_WPAN/app -I../../../../../../../Middlewares/ST/STM32_WPAN/ble -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/inc" -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-RefLibs-2f-src-2f-StatisticsFunctions

clean-Drivers-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-RefLibs-2f-src-2f-StatisticsFunctions:
	-$(RM) ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/StatisticsFunctions.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/StatisticsFunctions.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/StatisticsFunctions.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/StatisticsFunctions.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/max.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/max.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/max.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/max.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/mean.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/mean.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/mean.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/mean.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/min.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/min.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/min.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/min.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/power.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/power.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/power.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/power.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/rms.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/rms.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/rms.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/rms.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/std.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/std.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/std.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/std.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/var.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/var.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/var.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/StatisticsFunctions/var.su

.PHONY: clean-Drivers-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-RefLibs-2f-src-2f-StatisticsFunctions

