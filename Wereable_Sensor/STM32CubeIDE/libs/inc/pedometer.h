/*
 * pedometer.h
 *
 *  Created on: 2 мая 2024 г.
 *      Author: Asus
 */

#ifndef INC_PEDOMETER_H_
#define INC_PEDOMETER_H_

#include "dmpKey.h"
#include "dmpmap.h"
#include "mpu9250_DMP.h"
#include "stm32wbxx_hal.h"
#include <string.h>
#include "main.h"

//DEFINITIONS
// BEGIN

// For return functions

#define MPU6500


#define INV_SUCCESS 0
#define INV_ERROR 0x20

#define INV_X_GYRO      (0x40)
#define INV_Y_GYRO      (0x20)
#define INV_Z_GYRO      (0x10)
#define INV_XYZ_GYRO    (INV_X_GYRO | INV_Y_GYRO | INV_Z_GYRO)
#define INV_XYZ_ACCEL   (0x08)
#define INV_XYZ_COMPASS (0x01)

#define MPU_INT_STATUS_DATA_READY       (0x0001)
#define MPU_INT_STATUS_DMP              (0x0002)
#define MPU_INT_STATUS_PLL_READY        (0x0004)
#define MPU_INT_STATUS_I2C_MST          (0x0008)
#define MPU_INT_STATUS_FIFO_OVERFLOW    (0x0010)
#define MPU_INT_STATUS_ZMOT             (0x0020)
#define MPU_INT_STATUS_MOT              (0x0040)
#define MPU_INT_STATUS_FREE_FALL        (0x0080)
#define MPU_INT_STATUS_DMP_0            (0x0100)
#define MPU_INT_STATUS_DMP_1            (0x0200)
#define MPU_INT_STATUS_DMP_2            (0x0400)
#define MPU_INT_STATUS_DMP_3            (0x0800)
#define MPU_INT_STATUS_DMP_4            (0x1000)
#define MPU_INT_STATUS_DMP_5            (0x2000)

#define BIT_I2C_MST_VDDIO   (0x80)
#define BIT_FIFO_EN         (0x40)
#define BIT_DMP_EN          (0x80)
#define BIT_FIFO_RST        (0x04)
#define BIT_DMP_RST         (0x08)
#define BIT_FIFO_OVERFLOW   (0x10)
#define BIT_DATA_RDY_EN     (0x01)
#define BIT_DMP_INT_EN      (0x02)
#define BIT_MOT_INT_EN      (0x40)
#define BITS_FSR            (0x18)
#define BITS_LPF            (0x07)
#define BITS_HPF            (0x07)
#define BITS_CLK            (0x07)
#define BIT_FIFO_SIZE_1024  (0x40)
#define BIT_FIFO_SIZE_2048  (0x80)
#define BIT_FIFO_SIZE_4096  (0xC0)
#define BIT_RESET           (0x80)
#define BIT_SLEEP           (0x40)
#define BIT_S0_DELAY_EN     (0x01)
#define BIT_S2_DELAY_EN     (0x04)
#define BITS_SLAVE_LENGTH   (0x0F)
#define BIT_SLAVE_BYTE_SW   (0x40)
#define BIT_SLAVE_GROUP     (0x10)
#define BIT_SLAVE_EN        (0x80)
#define BIT_I2C_READ        (0x80)
#define BITS_I2C_MASTER_DLY (0x1F)
#define BIT_AUX_IF_EN       (0x20)
#define BIT_ACTL            (0x80)
#define BIT_LATCH_EN        (0x20)
#define BIT_ANY_RD_CLR      (0x10)
#define BIT_BYPASS_EN       (0x02)
#define BITS_WOM_EN         (0xC0)
#define BIT_LPA_CYCLE       (0x20)
#define BIT_STBY_XA         (0x20)
#define BIT_STBY_YA         (0x10)
#define BIT_STBY_ZA         (0x08)
#define BIT_STBY_XG         (0x04)
#define BIT_STBY_YG         (0x02)
#define BIT_STBY_ZG         (0x01)
#define BIT_STBY_XYZA       (BIT_STBY_XA | BIT_STBY_YA | BIT_STBY_ZA)
#define BIT_STBY_XYZG       (BIT_STBY_XG | BIT_STBY_YG | BIT_STBY_ZG)


#define INT_SRC_TAP             (0x01)
#define INT_SRC_ANDROID_ORIENT  (0x08)

#define DMP_FEATURE_SEND_ANY_GYRO   (DMP_FEATURE_SEND_RAW_GYRO | \
                                     DMP_FEATURE_SEND_CAL_GYRO)

#define MAX_PACKET_LENGTH   (32)

#define DMP_SAMPLE_RATE     (200)
#define GYRO_SF             (46850825LL * 200 / DMP_SAMPLE_RATE)

#define FIFO_CORRUPTION_CHECK
#ifdef FIFO_CORRUPTION_CHECK
#define QUAT_ERROR_THRESH       (1L<<24)
#define QUAT_MAG_SQ_NORMALIZED  (1L<<28)
#define QUAT_MAG_SQ_MIN         (QUAT_MAG_SQ_NORMALIZED - QUAT_ERROR_THRESH)
#define QUAT_MAG_SQ_MAX         (QUAT_MAG_SQ_NORMALIZED + QUAT_ERROR_THRESH)
#endif

#define MAX_DMP_SAMPLE_RATE 200 // Maximum sample rate for the DMP FIFO (200Hz)
#define FIFO_BUFFER_SIZE 512 // Max FIFO buffer size
//DEFINITIONS
// END

// Structures definition
//BEGIN
//

/* Information for self-test. */
struct test_s {
    uint32_t gyro_sens;
    uint32_t accel_sens;
    uint8_t reg_rate_div;
    uint8_t reg_lpf;
    uint8_t reg_gyro_fsr;
    uint8_t reg_accel_fsr;
    uint16_t wait_ms;
    uint8_t packet_thresh;
    float min_dps;
    float max_dps;
    float max_gyro_var;
    float min_g;
    float max_g;
    float max_accel_var;
#ifdef MPU6500
    float max_g_offset;
    uint16_t sample_wait_ms;
#endif
};


/* When entering motion interrupt mode, the driver keeps track of the
 * previous state so that it can be restored at a later time.
 * TODO: This is tacky. Fix it.
 */
struct motion_int_cache_s {
    uint16_t gyro_fsr;
    uint8_t accel_fsr;
    uint16_t lpf;
    uint16_t sample_rate;
    uint8_t sensors_on;
    uint8_t fifo_sensors;
    uint8_t dmp_on;
};

/* Cached chip configuration data.
 * TODO: A lot of these can be handled with a bitmask.
 */
struct chip_cfg_s {
    /* Matches gyro_cfg >> 3 & 0x03 */
    uint8_t gyro_fsr;
    /* Matches accel_cfg >> 3 & 0x03 */
    uint8_t accel_fsr;
    /* Enabled sensors. Uses same masks as fifo_en, NOT pwr_mgmt_2. */
    uint8_t sensors;
    /* Matches config register. */
    uint8_t lpf;
    uint8_t clk_src;
    /* Sample rate, NOT rate divider. */
    uint16_t sample_rate;
    /* Matches fifo_en register. */
    uint8_t fifo_enable;
    /* Matches int enable register. */
    uint8_t int_enable;
    /* 1 if devices on auxiliary I2C bus appear on the primary. */
    uint8_t bypass_mode;
    /* 1 if half-sensitivity.
     * NOTE: This doesn't belong here, but everything else in hw_s is const,
     * and this allows us to save some precious RAM.
     */
    uint8_t accel_half;
    /* 1 if device in low-power accel-only mode. */
    uint8_t lp_accel_mode;
    /* 1 if interrupts are only triggered on motion events. */
    uint8_t int_motion_only;
    struct motion_int_cache_s cache;
    /* 1 for active low interrupts. */
    uint8_t active_low_int;
    /* 1 for latched interrupts. */
    uint8_t latched_int;
    /* 1 if DMP is enabled. */
    uint8_t dmp_on;
    /* Ensures that DMP will only be loaded once. */
    uint8_t dmp_loaded;
    /* Sampling rate used when DMP is enabled. */
    uint16_t dmp_sample_rate;
#ifdef AK89xx_SECONDARY
    /* Compass sample rate. */
    uint16_t compass_sample_rate;
    uint8_t compass_addr;
    short mag_sens_adj[3];
#endif
};

/* Information specific to a particular device. */
struct hw_s {
    uint8_t addr;
    uint16_t max_fifo;
    uint8_t num_reg;
    uint16_t temp_sens;
    short temp_offset;
    uint16_t bank_size;
#if defined AK89xx_SECONDARY
    uint16_t compass_fsr;
#endif
};

/* Hardware registers needed by driver. */
struct gyro_reg_s {
    uint8_t who_am_i;
    uint8_t rate_div;
    uint8_t lpf;
    uint8_t prod_id;
    uint8_t user_ctrl;
    uint8_t fifo_en;
    uint8_t gyro_cfg;
    uint8_t accel_cfg;
    uint8_t accel_cfg2;
    uint8_t lp_accel_odr;
    uint8_t motion_thr;
    uint8_t motion_dur;
    uint8_t fifo_count_h;
    uint8_t fifo_r_w;
    uint8_t raw_gyro;
    uint8_t raw_accel;
    uint8_t temp;
    uint8_t int_enable;
    uint8_t dmp_int_status;
    uint8_t int_status;
    uint8_t accel_intel;
    uint8_t pwr_mgmt_1;
    uint8_t pwr_mgmt_2;
    uint8_t int_pin_cfg;
    uint8_t mem_r_w;
    uint8_t accel_offs;
    uint8_t i2c_mst;
    uint8_t bank_sel;
    uint8_t mem_start_addr;
    uint8_t prgm_start_h;
#if defined AK89xx_SECONDARY
    uint8_t s0_addr;
    uint8_t s0_reg;
    uint8_t s0_ctrl;
    uint8_t s1_addr;
    uint8_t s1_reg;
    uint8_t s1_ctrl;
    uint8_t s4_ctrl;
    uint8_t s0_do;
    uint8_t s1_do;
    uint8_t i2c_delay_ctrl;
    uint8_t raw_compass;
    /* The I2C_MST_VDDIO bit is in this register. */
    uint8_t yg_offs_tc;
#endif
};

/* Gyro driver state variables. */
struct gyro_state_s {
    const struct gyro_reg_s *reg;
    const struct hw_s *hw;
    struct chip_cfg_s chip_cfg;
    const struct test_s *test;
};


struct dmp_s {
    void (*tap_cb)(uint8_t count, uint8_t direction);
    void (*android_orient_cb)(uint8_t orientation);
    uint16_t orient;
    uint16_t feature_mask;
    uint16_t fifo_rate;
    uint8_t packet_length;
};
// Structures definition
//END
//

// Enumerates
// Begin

/* Filter configurations. */
enum lpf_e {
    INV_FILTER_256HZ_NOLPF2 = 0,
    INV_FILTER_188HZ,
    INV_FILTER_98HZ,
    INV_FILTER_42HZ,
    INV_FILTER_20HZ,
    INV_FILTER_10HZ,
    INV_FILTER_5HZ,
    INV_FILTER_2100HZ_NOLPF,
    NUM_FILTER
};

/* Full scale ranges. */
enum gyro_fsr_e {
    INV_FSR_250DPS = 0,
    INV_FSR_500DPS,
    INV_FSR_1000DPS,
    INV_FSR_2000DPS,
    NUM_GYRO_FSR
};

/* Full scale ranges. */
enum accel_fsr_e {
    INV_FSR_2G = 0,
    INV_FSR_4G,
    INV_FSR_8G,
    INV_FSR_16G,
    NUM_ACCEL_FSR
};

/* Clock sources. */
enum clock_sel_e {
    INV_CLK_INTERNAL = 0,
    INV_CLK_PLL,
    NUM_CLK
};

/* Low-power accel wakeup rates. */
enum lp_accel_rate_e {
#if defined MPU6050
    INV_LPA_1_25HZ,
    INV_LPA_5HZ,
    INV_LPA_20HZ,
    INV_LPA_40HZ
#elif defined MPU6500
    INV_LPA_0_3125HZ,
    INV_LPA_0_625HZ,
    INV_LPA_1_25HZ,
    INV_LPA_2_5HZ,
    INV_LPA_5HZ,
    INV_LPA_10HZ,
    INV_LPA_20HZ,
    INV_LPA_40HZ,
    INV_LPA_80HZ,
    INV_LPA_160HZ,
    INV_LPA_320HZ,
    INV_LPA_640HZ
#endif
};

// Enumerates
// END


// Functions Prototype Definitions
// BEGIN


int8_t i2c_write(uint8_t slave_addr, uint8_t reg_addr, uint8_t length, uint8_t * data);
int8_t i2c_read(uint8_t slave_addr, uint8_t reg_addr, uint8_t length, uint8_t * data);
void delay_ms(uint32_t delay);
int min(int a, int b);

int8_t mpu_set_sensors(uint8_t sensors);
int8_t mpu_set_bypass(uint8_t bypass_on);
int8_t mpu_reset_fifo(void);
int8_t set_int_enable(uint8_t enable);
int8_t mpu_configure_fifo(uint8_t sensors);
int8_t mpu_set_int_latched(uint8_t enable);
int8_t mpu_lp_accel_mode(uint16_t rate);
int8_t mpu_set_sample_rate(uint16_t rate);
int8_t mpu_set_lpf(uint16_t lpf);
int8_t mpu_set_accel_fsr(uint8_t fsr);
int8_t mpu_set_gyro_fsr(uint16_t fsr);
int8_t mpu_init(); //struct int_param_s *int_param

int8_t MPU9250_Setup();

int8_t mpu_read_mem(uint16_t mem_addr, uint16_t length, uint8_t *data);
int8_t mpu_write_mem(uint16_t mem_addr, uint16_t length, uint8_t *data);

int8_t dmp_set_fifo_rate(uint16_t rate);
uint16_t constrain(uint16_t value, uint16_t minValue, uint16_t maxValue);
int32_t dmp_enable_gyro_cal(uint8_t enable);

int8_t mpu_get_accel_fsr(uint8_t *fsr);
int8_t dmp_set_tap_thresh(uint8_t axis, uint16_t thresh);
int8_t dmp_set_tap_axes(uint8_t axis);
int8_t dmp_set_tap_count(uint8_t min_taps);
int8_t dmp_set_tap_time(uint16_t time);
int8_t dmp_set_tap_time_multi(uint16_t time);
int8_t dmp_set_shake_reject_thresh(int32_t sf, uint16_t thresh);
int8_t dmp_set_shake_reject_time(uint16_t time);
int8_t dmp_set_shake_reject_timeout(uint16_t time);
int8_t dmp_enable_lp_quat(uint8_t enable);
int8_t dmp_enable_6x_lp_quat(uint8_t enable);

int8_t dmp_enable_feature(uint16_t mask);
int8_t mpu_load_firmware(uint16_t length, const uint8_t *firmware, uint16_t start_addr, uint16_t sample_rate);
int8_t mpu_set_dmp_state(uint8_t enable);

int8_t Pedometer_Setup(uint16_t features, uint16_t fifoRate);

int8_t dmp_set_pedometer_step_count(uint32_t count);
int8_t dmp_set_pedometer_walk_time(uint32_t time);

int8_t dmp_get_pedometer_step_count(uint32_t *count);
int8_t dmp_get_pedometer_walk_time(uint32_t *time);


// Functions Prototype Definitions
// END


#endif /* INC_PEDOMETER_H_ */
