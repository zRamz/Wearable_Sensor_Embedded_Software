################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb10xx_cm4.s \
../Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb15xx_cm4.s \
../Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb1mxx_cm4.s \
../Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb30xx_cm4.s \
../Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb35xx_cm4.s \
../Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb50xx_cm4.s \
../Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb55xx_cm4.s \
../Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb5mxx_cm4.s 

OBJS += \
./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb10xx_cm4.o \
./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb15xx_cm4.o \
./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb1mxx_cm4.o \
./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb30xx_cm4.o \
./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb35xx_cm4.o \
./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb50xx_cm4.o \
./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb55xx_cm4.o \
./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb5mxx_cm4.o 

S_DEPS += \
./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb10xx_cm4.d \
./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb15xx_cm4.d \
./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb1mxx_cm4.d \
./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb30xx_cm4.d \
./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb35xx_cm4.d \
./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb50xx_cm4.d \
./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb55xx_cm4.d \
./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb5mxx_cm4.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/%.o: ../Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/%.s Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Drivers-2f-CMSIS-2f-Device-2f-ST-2f-STM32WBxx-2f-Source-2f-Templates-2f-arm

clean-Drivers-2f-CMSIS-2f-Device-2f-ST-2f-STM32WBxx-2f-Source-2f-Templates-2f-arm:
	-$(RM) ./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb10xx_cm4.d ./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb10xx_cm4.o ./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb15xx_cm4.d ./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb15xx_cm4.o ./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb1mxx_cm4.d ./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb1mxx_cm4.o ./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb30xx_cm4.d ./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb30xx_cm4.o ./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb35xx_cm4.d ./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb35xx_cm4.o ./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb50xx_cm4.d ./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb50xx_cm4.o ./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb55xx_cm4.d ./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb55xx_cm4.o ./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb5mxx_cm4.d ./Drivers/CMSIS/Device/ST/STM32WBxx/Source/Templates/arm/startup_stm32wb5mxx_cm4.o

.PHONY: clean-Drivers-2f-CMSIS-2f-Device-2f-ST-2f-STM32WBxx-2f-Source-2f-Templates-2f-arm

