################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/cfft_family_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/cfft_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/dct4_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/rfft_fast_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/rfft_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/transform_test_group.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/transform_tests_common_data.c 

OBJS += \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/cfft_family_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/cfft_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/dct4_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/rfft_fast_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/rfft_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/transform_test_group.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/transform_tests_common_data.o 

C_DEPS += \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/cfft_family_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/cfft_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/dct4_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/rfft_fast_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/rfft_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/transform_test_group.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/transform_tests_common_data.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/%.o Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/%.su Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/%.cyclo: ../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/%.c Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32WBXX_NUCLEO -DENABLE_USART -DSTM32WB55xx -c -I../../../../../../../Drivers/CMSIS/Device/ST/STM32WBxx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/STM32WBxx_HAL_Driver/Inc -I../../../../../../../Drivers/BSP/P-NUCLEO-WB55.Nucleo -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/Inc -I../../Core/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/auto -I../../../../../../../Middlewares/ST/STM32_WPAN/utilities -I../../../../../../../Utilities/lpm/tiny_lpm -I../../../../../../../Utilities/sequencer -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core/template -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/core -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci -I../../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Inc -I../../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread -I../../STM32_WPAN/app -I../../../../../../../Middlewares/ST/STM32_WPAN/ble -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/inc" -I"C:/Users/Asus/Desktop/Wearable Sensor/STM32CubeIDE/libs/src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-Common-2f-src-2f-transform_tests

clean-Drivers-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-Common-2f-src-2f-transform_tests:
	-$(RM) ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/cfft_family_tests.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/cfft_family_tests.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/cfft_family_tests.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/cfft_family_tests.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/cfft_tests.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/cfft_tests.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/cfft_tests.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/cfft_tests.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/dct4_tests.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/dct4_tests.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/dct4_tests.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/dct4_tests.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/rfft_fast_tests.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/rfft_fast_tests.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/rfft_fast_tests.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/rfft_fast_tests.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/rfft_tests.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/rfft_tests.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/rfft_tests.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/rfft_tests.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/transform_test_group.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/transform_test_group.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/transform_test_group.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/transform_test_group.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/transform_tests_common_data.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/transform_tests_common_data.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/transform_tests_common_data.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/transform_tests/transform_tests_common_data.su

.PHONY: clean-Drivers-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-Common-2f-src-2f-transform_tests

