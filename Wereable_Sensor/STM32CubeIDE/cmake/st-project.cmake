# THIS FILE IS AUTOMATICALLY GENERATED. DO NOT EDIT.
# BASED ON c:\Users\Asus\Desktop\STMWB\WB\Projects\P-NUCLEO-WB55.Nucleo\Applications\BLE\BLE_MeshLightingPRFNode\STM32CubeIDE

function(add_st_target_properties TARGET_NAME)

target_compile_definitions(
    ${TARGET_NAME} PRIVATE
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:USE_HAL_DRIVER>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:USE_STM32WBXX_NUCLEO>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:ENABLE_USART>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:STM32WB55xx>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:USE_HAL_DRIVER>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:USE_STM32WBXX_NUCLEO>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:ENABLE_USART>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:STM32WB55xx>"
)

target_include_directories(
    ${TARGET_NAME} PRIVATE
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Drivers\\CMSIS\\Device\\ST\\STM32WBxx\\Include>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Drivers\\CMSIS\\Include>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Drivers\\STM32WBxx_HAL_Driver\\Inc>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Drivers\\BSP\\P-NUCLEO-WB55.Nucleo>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\ble\\mesh\\Inc>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\Core\\Inc>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\ble\\core\\auto>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\utilities>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Utilities\\lpm\\tiny_lpm>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Utilities\\sequencer>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\ble\\core\\template>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\ble\\core>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\interface\\patterns\\ble_thread\\tl>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\interface\\patterns\\ble_thread\\shci>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\ble\\mesh\\MeshModel\\Inc>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\interface\\patterns\\ble_thread>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\STM32_WPAN\\app>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\ble>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Drivers\\CMSIS\\Device\\ST\\STM32WBxx\\Include>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Drivers\\CMSIS\\Include>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Drivers\\STM32WBxx_HAL_Driver\\Inc>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Drivers\\BSP\\P-NUCLEO-WB55.Nucleo>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\ble\\mesh\\Inc>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\Core\\Inc>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\ble\\core\\auto>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\utilities>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Utilities\\lpm\\tiny_lpm>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Utilities\\sequencer>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\ble\\core\\template>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\ble\\core>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\interface\\patterns\\ble_thread\\tl>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\interface\\patterns\\ble_thread\\shci>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\ble\\mesh\\MeshModel\\Inc>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\interface\\patterns\\ble_thread>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\STM32_WPAN\\app>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\ble>"
)

target_compile_options(
    ${TARGET_NAME} PRIVATE
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:ASM>>:-g3>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-g3>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-g3>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:ASM>>:-g0>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:-g0>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:CXX>>:-g0>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:-Os>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:CXX>>:-Os>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:CXX>>:>"
    "$<$<CONFIG:Debug>:-mcpu=cortex-m4>"
    "$<$<CONFIG:Debug>:-mfpu=fpv4-sp-d16>"
    "$<$<CONFIG:Debug>:-mfloat-abi=hard>"
    "$<$<NOT:$<CONFIG:Debug>>:-mcpu=cortex-m4>"
    "$<$<NOT:$<CONFIG:Debug>>:-mfpu=fpv4-sp-d16>"
    "$<$<NOT:$<CONFIG:Debug>>:-mfloat-abi=hard>"
)

target_link_libraries(
    ${TARGET_NAME} PRIVATE
    "$<$<CONFIG:Debug>::libBle_Mesh_CM4_GCC.a>"
    "$<$<NOT:$<CONFIG:Debug>>::libBle_Mesh_CM4_GCC.a>"
)

target_link_directories(
    ${TARGET_NAME} PRIVATE
    "$<$<CONFIG:Debug>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\ble\\mesh\\Library>"
    "$<$<NOT:$<CONFIG:Debug>>:${PROJECT_SOURCE_DIR}/..\\..\\..\\..\\..\\..\\Middlewares\\ST\\STM32_WPAN\\ble\\mesh\\Library>"
)

target_link_options(
    ${TARGET_NAME} PRIVATE
    "$<$<CONFIG:Debug>:-mcpu=cortex-m4>"
    "$<$<CONFIG:Debug>:-mfpu=fpv4-sp-d16>"
    "$<$<CONFIG:Debug>:-mfloat-abi=hard>"
    "$<$<NOT:$<CONFIG:Debug>>:-mcpu=cortex-m4>"
    "$<$<NOT:$<CONFIG:Debug>>:-mfpu=fpv4-sp-d16>"
    "$<$<NOT:$<CONFIG:Debug>>:-mfloat-abi=hard>"
    -T
    "$<$<CONFIG:Debug>:${PROJECT_SOURCE_DIR}/STM32WB55RGVX_FLASH.ld>"
    "$<$<NOT:$<CONFIG:Debug>>:${PROJECT_SOURCE_DIR}/STM32WB55RGVX_FLASH.ld>"
)

target_sources(
    ${TARGET_NAME} PRIVATE
    "../readme.txt"
    "../Core/Src/app_debug.c"
    "../Core/Src/app_entry.c"
    "../Core/Src/flash_driver.c"
    "../Core/Src/hw_timerserver.c"
    "../Core/Src/hw_uart.c"
    "../Core/Src/lp_timer.c"
    "../Core/Src/main.c"
    "../Core/Src/stm32_lpm_if.c"
    "../Core/Src/stm32wbxx_hal_msp.c"
    "../Core/Src/stm32wbxx_it.c"
    "../Core/Src/system_stm32wbxx.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_cortex.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_dma.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_dma_ex.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_exti.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_flash.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_flash_ex.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_gpio.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_hsem.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_i2c.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_i2c_ex.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_ipcc.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_pwr.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_pwr_ex.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_rcc.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_rcc_ex.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_rng.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_rtc.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_rtc_ex.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_tim.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_tim_ex.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_uart.c"
    "../../../../../../Drivers/STM32WBxx_HAL_Driver/Src/stm32wbxx_hal_uart_ex.c"
    "../STM32_WPAN/app/app_ble.c"
    "../STM32_WPAN/app/appli_config.c"
    "../STM32_WPAN/app/appli_config_client.c"
    "../STM32_WPAN/app/appli_generic.c"
    "../STM32_WPAN/app/appli_generic_client.c"
    "../STM32_WPAN/app/appli_light.c"
    "../STM32_WPAN/app/appli_light_client.c"
    "../STM32_WPAN/app/appli_light_lc.c"
    "../STM32_WPAN/app/appli_mesh.c"
    "../STM32_WPAN/app/appli_nvm.c"
    "../STM32_WPAN/app/appli_sensor.c"
    "../STM32_WPAN/app/appli_sensors_client.c"
    "../STM32_WPAN/app/appli_vendor.c"
    "../STM32_WPAN/app/models_if.c"
    "../STM32_WPAN/app/pal_nvm.c"
    "../STM32_WPAN/target/hw_ipcc.c"
    "../../../../../../Drivers/BSP/P-NUCLEO-WB55.Nucleo/stm32wbxx_nucleo.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/utilities/dbg_trace.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/utilities/otp.c"
    "../../../../../../Utilities/lpm/tiny_lpm/stm32_lpm.c"
    "../../../../../../Utilities/sequencer/stm32_seq.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/utilities/stm_list.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/utilities/stm_queue.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Src/common.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Src/config_client.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Src/generic.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Src/generic_client.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Src/light.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Src/light_client.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Src/light_lc.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/svc/Src/mesh.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/Src/mesh_cfg.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Src/sensors.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Src/sensors_client.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/svc/Src/svc_ctl.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Src/time_scene.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/mesh/MeshModel/Src/vendor.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/core/auto/ble_gap_aci.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/core/auto/ble_gatt_aci.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/core/auto/ble_hal_aci.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/core/auto/ble_hci_le.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/core/auto/ble_l2cap_aci.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/ble/core/template/osal.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/shci/shci.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl/hci_tl.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl/hci_tl_if.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl/shci_tl.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl/shci_tl_if.c"
    "../../../../../../Middlewares/ST/STM32_WPAN/interface/patterns/ble_thread/tl/tl_mbox.c"
    "Application\\Core\\syscalls.c"
    "Application\\Core\\sysmem.c"
    "Application\\Startup\\startup_stm32wb55rgvx.s"
)

add_custom_command(
    TARGET ${TARGET_NAME} POST_BUILD
    COMMAND ${CMAKE_SIZE} $<TARGET_FILE:${TARGET_NAME}>
)

add_custom_command(
    TARGET ${TARGET_NAME} POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O ihex
    $<TARGET_FILE:${TARGET_NAME}> ${TARGET_NAME}.hex
)

add_custom_command(
    TARGET ${TARGET_NAME} POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary
    $<TARGET_FILE:${TARGET_NAME}> ${TARGET_NAME}.bin
)

endfunction()