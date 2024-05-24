#ifndef INC_MPU9250_H_
#define INC_MPU9250_H_

#define AK8963_ADDRESS   0x0C<<1
#define WHO_AM_I_AK8963  0x00 // should return 0x48
#define INFO             0x01
#define AK8963_ST1       0x02  // data ready status bit 0
#define AK8963_XOUT_L    0x03  // data
#define AK8963_XOUT_H    0x04
#define AK8963_YOUT_L    0x05
#define AK8963_YOUT_H    0x06
#define AK8963_ZOUT_L    0x07
#define AK8963_ZOUT_H    0x08
#define AK8963_ST2       0x09  // Data overflow bit 3 and data read error status bit 2
#define AK8963_CNTL      0x0A  // Power down (0000), single-measurement (0001), self-test (1000) and Fuse ROM (1111) modes on bits 3:0
#define AK8963_ASTC      0x0C  // Self test control
#define AK8963_I2CDIS    0x0F  // I2C disable
#define AK8963_ASAX      0x10  // Fuse ROM x-axis sensitivity adjustment value
#define AK8963_ASAY      0x11  // Fuse ROM y-axis sensitivity adjustment value
#define AK8963_ASAZ      0x12
#define SELF_TEST_X_GYRO 0x00
#define SELF_TEST_Y_GYRO 0x01
#define SELF_TEST_Z_GYRO 0x02

/*#define X_FINE_GAIN      0x03 // [7:0] fine gain
#define Y_FINE_GAIN      0x04
#define Z_FINE_GAIN      0x05
#define XA_OFFSET_H      0x06 // User-defined trim values for accelerometer
#define XA_OFFSET_L_TC   0x07
#define YA_OFFSET_H      0x08
#define YA_OFFSET_L_TC   0x09
#define ZA_OFFSET_H      0x0A
#define ZA_OFFSET_L_TC   0x0B */

#define SELF_TEST_X_ACCEL 0x0D
#define SELF_TEST_Y_ACCEL 0x0E
#define SELF_TEST_Z_ACCEL 0x0F

#define SELF_TEST_A      0x10

#define XG_OFFSET_H      0x13  // User-defined trim values for gyroscope
#define XG_OFFSET_L      0x14
#define YG_OFFSET_H      0x15
#define YG_OFFSET_L      0x16
#define ZG_OFFSET_H      0x17
#define ZG_OFFSET_L      0x18
#define SMPLRT_DIV       0x19
#define CONFIG           0x1A
#define GYRO_CONFIG      0x1B
#define ACCEL_CONFIG     0x1C
#define ACCEL_CONFIG2    0x1D
#define LP_ACCEL_ODR     0x1E
#define WOM_THR          0x1F

#define MOT_DUR          0x20  // Duration counter threshold for motion interrupt generation, 1 kHz rate, LSB = 1 ms
#define ZMOT_THR         0x21  // Zero-motion detection threshold bits [7:0]
#define ZRMOT_DUR        0x22  // Duration counter threshold for zero motion interrupt generation, 16 Hz rate, LSB = 64 ms

#define FIFO_EN          0x23
#define I2C_MST_CTRL     0x24
#define I2C_SLV0_ADDR    0x25
#define I2C_SLV0_REG     0x26
#define I2C_SLV0_CTRL    0x27

#define I2C_SLV0_EN		 0x80
#define I2C_READ_FLAG 	 0x80

#define I2C_SLV1_ADDR    0x28
#define I2C_SLV1_REG     0x29
#define I2C_SLV1_CTRL    0x2A
#define I2C_SLV2_ADDR    0x2B
#define I2C_SLV2_REG     0x2C
#define I2C_SLV2_CTRL    0x2D
#define I2C_SLV3_ADDR    0x2E
#define I2C_SLV3_REG     0x2F
#define I2C_SLV3_CTRL    0x30
#define I2C_SLV4_ADDR    0x31
#define I2C_SLV4_REG     0x32
#define I2C_SLV4_DO      0x33
#define I2C_SLV4_CTRL    0x34
#define I2C_SLV4_DI      0x35
#define I2C_MST_STATUS   0x36
#define INT_PIN_CFG      0x37
#define INT_ENABLE       0x38
#define DMP_INT_STATUS   0x39  // Check DMP interrupt
#define INT_STATUS       0x3A
#define ACCEL_XOUT_H     0x3B
#define ACCEL_XOUT_L     0x3C
#define ACCEL_YOUT_H     0x3D
#define ACCEL_YOUT_L     0x3E
#define ACCEL_ZOUT_H     0x3F
#define ACCEL_ZOUT_L     0x40
#define TEMP_OUT_H       0x41
#define TEMP_OUT_L       0x42
#define GYRO_XOUT_H      0x43
#define GYRO_XOUT_L      0x44
#define GYRO_YOUT_H      0x45
#define GYRO_YOUT_L      0x46
#define GYRO_ZOUT_H      0x47
#define GYRO_ZOUT_L      0x48
#define EXT_SENS_DATA_00 0x49
#define EXT_SENS_DATA_01 0x4A
#define EXT_SENS_DATA_02 0x4B
#define EXT_SENS_DATA_03 0x4C
#define EXT_SENS_DATA_04 0x4D
#define EXT_SENS_DATA_05 0x4E
#define EXT_SENS_DATA_06 0x4F
#define EXT_SENS_DATA_07 0x50
#define EXT_SENS_DATA_08 0x51
#define EXT_SENS_DATA_09 0x52
#define EXT_SENS_DATA_10 0x53
#define EXT_SENS_DATA_11 0x54
#define EXT_SENS_DATA_12 0x55
#define EXT_SENS_DATA_13 0x56
#define EXT_SENS_DATA_14 0x57
#define EXT_SENS_DATA_15 0x58
#define EXT_SENS_DATA_16 0x59
#define EXT_SENS_DATA_17 0x5A
#define EXT_SENS_DATA_18 0x5B
#define EXT_SENS_DATA_19 0x5C
#define EXT_SENS_DATA_20 0x5D
#define EXT_SENS_DATA_21 0x5E
#define EXT_SENS_DATA_22 0x5F
#define EXT_SENS_DATA_23 0x60
#define MOT_DETECT_STATUS 0x61
#define I2C_SLV0_DO      0x63
#define I2C_SLV1_DO      0x64
#define I2C_SLV2_DO      0x65
#define I2C_SLV3_DO      0x66
#define I2C_MST_DELAY_CTRL 0x67
#define SIGNAL_PATH_RESET  0x68
#define MOT_DETECT_CTRL  0x69
#define USER_CTRL        0x6A  // Bit 7 enable DMP, bit 3 reset DMP
#define PWR_MGMT_1       0x6B // Device defaults to the SLEEP mode
#define PWR_MGMT_2       0x6C
#define DMP_BANK         0x6D  // Activates a specific bank in the DMP
#define DMP_RW_PNT       0x6E  // Set read/write pointer to a specific start address in specified DMP bank
#define DMP_REG          0x6F  // Register in DMP from which to read or to which to write
#define DMP_REG_1        0x70
#define DMP_REG_2        0x71
#define FIFO_COUNTH      0x72
#define FIFO_COUNTL      0x73
#define FIFO_R_W         0x74
#define WHO_AM_I_MPU9250 0x75 // Should return 0x71
#define XA_OFFSET_H      0x77
#define XA_OFFSET_L      0x78
#define YA_OFFSET_H      0x7A
#define YA_OFFSET_L      0x7B
#define ZA_OFFSET_H      0x7D
#define ZA_OFFSET_L      0x7E


#define MPU9250_WHOAMI_DEFAULT_VALUE 0x71
#define MPU9255_WHOAMI_DEFAULT_VALUE 0x73
#define MPU6500_WHOAMI_DEFAULT_VALUE 0x70
#define AK8963_WHOAMI_DEFAULT_VALUE  0x48
#define MPU9250_DEFAULT_ADDRESS 0x68

#define CALIB_ACCEL_SENSITIVITY 16384
#define CALIB_GYRO_SENSITIVITY 131
// Using the MSENSR-9250 breakout board, ADO is set to 0
// Seven-bit device address is 110100 for ADO = 0 and 110101 for ADO = 1
//mbed uses the eight-bit device address, so shift seven-bit addresses left by one!
#define ADO 0
#if ADO
#define MPU9250_ADDRESS 0x69<<1  // Device address when ADO = 1
#else
#define MPU9250_ADDRESS 0x68<<1  // Device address when ADO = 0
#endif


#define PI 3.14159265358979323846
#define DEG_TO_RAD PI / 180.0


// тесты

//Accessing DMP Registers
#define DMP_CTRL_1 0x6D // Записать старший байт адреса DMP
#define DMP_CTRL_2 0x6E // Записать 2 младших адреса DMP
#define DMP_CTRL_3 0x6F // Записать данные для DPM регистра

// Pedometer Minimum Step Buffer Threshold (p. 28)

#define PEDO_MIN_STEP_BUFFER_THR_1 		0x328
#define PEDO_MIN_STEP_BUFFER_THR_2 		0x329

//Pedometer Minimum Step Time

#define PEDO_MIN_STEP_TIME_1 			0x32A
#define PEDO_MIN_STEP_TIME_2 			0x32B

//Pedometer Maximum Step Buffer Time

#define PEDO_MAX_STEP_BUFFER_TIME_1 	0x32C
#define PEDO_MAX_STEP_BUFFER_TIME_2 	0x32D

//Pedometer Maximum Step Time
#define PEDO_MAX_STEP_TIME_1 			0x32E
#define PEDO_MAX_STEP_TIME_2 			0x32F

//Pedometer Step Count
#define PEDO_STEP_COUNT_1 				0x360
#define PEDO_STEP_COUNT_2 				0x361
#define PEDO_STEP_COUNT_3 				0x362
#define PEDO_STEP_COUNT_4 				0x363

//Pedometer Peak Threshold
#define PEDO_PEAK_THR_1 				0x398
#define PEDO_PEAK_THR_2 				0x399
#define PEDO_PEAK_THR_3 				0x39A
#define PEDO_PEAK_THR_4 				0x39B

//Pedometer Walk Time
#define PEDO_WALK_TIME_1 				0x3C4
#define PEDO_WALK_TIME_2 				0x3C5
#define PEDO_WALK_TIME_3 				0x3C6
#define PEDO_WALK_TIME_4 				0x3C7





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


/* These defines are copied from dmpDefaultMPU6050.c in the general MPL
 * releases. These defines may change for each DMP image, so be sure to modify
 * these values when switching to a new image.
 */
#define CFG_LP_QUAT             (2712)
#define END_ORIENT_TEMP         (1866)
#define CFG_27                  (2742)
#define CFG_20                  (2224)
#define CFG_23                  (2745)
#define CFG_FIFO_ON_EVENT       (2690)
#define END_PREDICTION_UPDATE   (1761)
#define CGNOTICE_INTR           (2620)
#define X_GRT_Y_TMP             (1358)
#define CFG_DR_INT              (1029)
#define CFG_AUTH                (1035)
#define UPDATE_PROP_ROT         (1835)
#define END_COMPARE_Y_X_TMP2    (1455)
#define SKIP_X_GRT_Y_TMP        (1359)
#define SKIP_END_COMPARE        (1435)
#define FCFG_3                  (1088)
#define FCFG_2                  (1066)
#define FCFG_1                  (1062)
#define END_COMPARE_Y_X_TMP3    (1434)
#define FCFG_7                  (1073)
#define FCFG_6                  (1106)
#define FLAT_STATE_END          (1713)
#define SWING_END_4             (1616)
#define SWING_END_2             (1565)
#define SWING_END_3             (1587)
#define SWING_END_1             (1550)
#define CFG_8                   (2718)
#define CFG_15                  (2727)
#define CFG_16                  (2746)
#define CFG_EXT_GYRO_BIAS       (1189)
#define END_COMPARE_Y_X_TMP     (1407)
#define DO_NOT_UPDATE_PROP_ROT  (1839)
#define CFG_7                   (1205)
#define FLAT_STATE_END_TEMP     (1683)
#define END_COMPARE_Y_X         (1484)
#define SKIP_SWING_END_1        (1551)
#define SKIP_SWING_END_3        (1588)
#define SKIP_SWING_END_2        (1566)
#define TILTG75_START           (1672)
#define CFG_6                   (2753)
#define TILTL75_END             (1669)
#define END_ORIENT              (1884)
#define CFG_FLICK_IN            (2573)
#define TILTL75_START           (1643)
#define CFG_MOTION_BIAS         (1208)
#define X_GRT_Y                 (1408)
#define TEMPLABEL               (2324)
#define CFG_ANDROID_ORIENT_INT  (1853)
#define CFG_GYRO_RAW_DATA       (2722)
#define X_GRT_Y_TMP2            (1379)

#define D_0_22                  (22+512)
#define D_0_24                  (24+512)

#define D_0_36                  (36)
#define D_0_52                  (52)
#define D_0_96                  (96)
#define D_0_104                 (104)
#define D_0_108                 (108)
#define D_0_163                 (163)
#define D_0_188                 (188)
#define D_0_192                 (192)
#define D_0_224                 (224)
#define D_0_228                 (228)
#define D_0_232                 (232)
#define D_0_236                 (236)

#define D_1_2                   (256 + 2)
#define D_1_4                   (256 + 4)
#define D_1_8                   (256 + 8)
#define D_1_10                  (256 + 10)
#define D_1_24                  (256 + 24)
#define D_1_28                  (256 + 28)
#define D_1_36                  (256 + 36)
#define D_1_40                  (256 + 40)
#define D_1_44                  (256 + 44)
#define D_1_72                  (256 + 72)
#define D_1_74                  (256 + 74)
#define D_1_79                  (256 + 79)
#define D_1_88                  (256 + 88)
#define D_1_90                  (256 + 90)
#define D_1_92                  (256 + 92)
#define D_1_96                  (256 + 96)
#define D_1_98                  (256 + 98)
#define D_1_106                 (256 + 106)
#define D_1_108                 (256 + 108)
#define D_1_112                 (256 + 112)
#define D_1_128                 (256 + 144)
#define D_1_152                 (256 + 12)
#define D_1_160                 (256 + 160)
#define D_1_176                 (256 + 176)
#define D_1_178                 (256 + 178)
#define D_1_218                 (256 + 218)
#define D_1_232                 (256 + 232)
#define D_1_236                 (256 + 236)
#define D_1_240                 (256 + 240)
#define D_1_244                 (256 + 244)
#define D_1_250                 (256 + 250)
#define D_1_252                 (256 + 252)
#define D_2_12                  (512 + 12)
#define D_2_96                  (512 + 96)
#define D_2_108                 (512 + 108)
#define D_2_208                 (512 + 208)
#define D_2_224                 (512 + 224)
#define D_2_236                 (512 + 236)
#define D_2_244                 (512 + 244)
#define D_2_248                 (512 + 248)
#define D_2_252                 (512 + 252)

#define CPASS_BIAS_X            (35 * 16 + 4)
#define CPASS_BIAS_Y            (35 * 16 + 8)
#define CPASS_BIAS_Z            (35 * 16 + 12)
#define CPASS_MTX_00            (36 * 16)
#define CPASS_MTX_01            (36 * 16 + 4)
#define CPASS_MTX_02            (36 * 16 + 8)
#define CPASS_MTX_10            (36 * 16 + 12)
#define CPASS_MTX_11            (37 * 16)
#define CPASS_MTX_12            (37 * 16 + 4)
#define CPASS_MTX_20            (37 * 16 + 8)
#define CPASS_MTX_21            (37 * 16 + 12)
#define CPASS_MTX_22            (43 * 16 + 12)
#define D_EXT_GYRO_BIAS_X       (61 * 16)
#define D_EXT_GYRO_BIAS_Y       (61 * 16) + 4
#define D_EXT_GYRO_BIAS_Z       (61 * 16) + 8
#define D_ACT0                  (40 * 16)
#define D_ACSX                  (40 * 16 + 4)
#define D_ACSY                  (40 * 16 + 8)
#define D_ACSZ                  (40 * 16 + 12)

#define FLICK_MSG               (45 * 16 + 4)
#define FLICK_COUNTER           (45 * 16 + 8)
#define FLICK_LOWER             (45 * 16 + 12)
#define FLICK_UPPER             (46 * 16 + 12)

#define D_AUTH_OUT              (992)
#define D_AUTH_IN               (996)
#define D_AUTH_A                (1000)
#define D_AUTH_B                (1004)

#define D_PEDSTD_BP_B           (768 + 0x1C)
#define D_PEDSTD_HP_A           (768 + 0x78)
#define D_PEDSTD_HP_B           (768 + 0x7C)
#define D_PEDSTD_BP_A4          (768 + 0x40)
#define D_PEDSTD_BP_A3          (768 + 0x44)
#define D_PEDSTD_BP_A2          (768 + 0x48)
#define D_PEDSTD_BP_A1          (768 + 0x4C)
#define D_PEDSTD_INT_THRSH      (768 + 0x68)
#define D_PEDSTD_CLIP           (768 + 0x6C)
#define D_PEDSTD_SB             (768 + 0x28)
#define D_PEDSTD_SB_TIME        (768 + 0x2C)
#define D_PEDSTD_PEAKTHRSH      (768 + 0x98)
#define D_PEDSTD_TIML           (768 + 0x2A)
#define D_PEDSTD_TIMH           (768 + 0x2E)
#define D_PEDSTD_PEAK           (768 + 0X94)
#define D_PEDSTD_STEPCTR        (768 + 0x60)
#define D_PEDSTD_TIMECTR        (964)
#define D_PEDSTD_DECI           (768 + 0xA0)

#define D_HOST_NO_MOT           (976)
#define D_ACCEL_BIAS            (660)

#define D_ORIENT_GAP            (76)

#define D_TILT0_H               (48)
#define D_TILT0_L               (50)
#define D_TILT1_H               (52)
#define D_TILT1_L               (54)
#define D_TILT2_H               (56)
#define D_TILT2_L               (58)
#define D_TILT3_H               (60)
#define D_TILT3_L               (62)

#define DMP_CODE_SIZE           (3062)

// конец тестов

enum Ascale {
  AFS_2G = 1,
  AFS_4G,
  AFS_8G,
  AFS_16G
};

enum Gscale {
  GFS_250DPS = 1,
  GFS_500DPS,
  GFS_1000DPS,
  GFS_2000DPS
};

enum Mscale {
  MFS_14BITS = 1, // 0.6 mG per LSB
  MFS_16BITS      // 0.15 mG per LSB
};

enum FIFO_SAMPLE_RATE {
    SMPL_1000HZ = 0,
    SMPL_500HZ,
    SMPL_333HZ,
    SMPL_250HZ,
    SMPL_200HZ,
    SMPL_167HZ,
    SMPL_143HZ,
    SMPL_125HZ,
};

enum GYRO_DLPF_CFG {
    DLPF_250HZ = 0,
    DLPF_184HZ,
    DLPF_92HZ,
    DLPF_41HZ,
    DLPF_20HZ,
    DLPF_10HZ,
    DLPF_5HZ,
    DLPF_3600HZ,
};

enum ACCEL_DLPF_CFG {
    ADLPF_218HZ_0 = 0,
    ADLPF_218HZ_1,
    ADLPF_99HZ,
    ADLPF_45HZ,
    ADLPF_21HZ,
    ADLPF_10HZ,
    ADLPF_5HZ,
    ADLPF_420HZ,
};

typedef struct {
	float acc_resolution;                // scale resolutions per LSB for the sensors
	float gyro_resolution;               // scale resolutions per LSB for the sensors
	float mag_resolution;                // scale resolutions per LSB for the sensors

	// Calibration Parameters
	float acc_bias[3];   // acc calibration value in ACCEL_FS_SEL: 2g
	float gyro_bias[3];  // gyro calibration value in GYRO_FS_SEL: 250dps
	float mag_bias_factory[3];
	float mag_bias[3];  // mag calibration value in MAG_OUTPUT_BITS: 16BITS
	float mag_scale[3];
	float magnetic_declination;  // Japan, 24th June

	    // Temperature
	int16_t temperature_count;  // temperature raw count output
	float temperature;        // Stores the real internal chip temperature in degrees Celsius

	// Self Test
	float self_test_result[6];  // holds results of gyro and accelerometer self test

	// IMU Data
	float a[3];
	float g[3];
	float m[3];
	float q[4];  // vector to hold quaternion
	float rpy[3];
	float lin_acc[3];

	uint8_t has_connected;
	size_t n_filter_iter;

} MPU9250_t;


void print_float(char *str, float data);


void MPU9250SetDefault(MPU9250_t *MPU9250);
uint8_t setupMPU(MPU9250_t *MPU9250, const uint8_t addr);
void MPU9250_Init(MPU9250_t *MPU9250);
void initAK8963(MPU9250_t *MPU9250);
void readAccelGyro(int16_t* destination);
//void readGyroData(MPU9250_t *MPU9250);
uint8_t readMag(int16_t* destination);
void getGres(MPU9250_t *MPU9250);
void getAres(MPU9250_t *MPU9250);
void getMres(MPU9250_t *MPU9250);
void update_accel_gyro(MPU9250_t *MPU9250);
void update_mag(MPU9250_t *MPU9250);
uint8_t updateMPU(MPU9250_t *MPU9250);

uint8_t isConnectedMPU9250();
uint8_t isConnectedAK8963();
uint8_t MPUisConnected(MPU9250_t *MPU9250);
uint8_t MPUisSleeping();
uint8_t MPUavailable(MPU9250_t *MPU9250);
void sleep(uint8_t b);
void setFilterIterations(MPU9250_t *MPU9250, const size_t n);

// SETTINGS
void setAccBias(MPU9250_t *MPU9250, const float x, const float y, const float z);
void setGyroBias(MPU9250_t *MPU9250, const float x, const float y, const float z);
void setMagBias(MPU9250_t *MPU9250, const float x, const float y, const float z);
void setMagScale(MPU9250_t *MPU9250, const float x, const float y, const float z);
void setMagneticDeclination(MPU9250_t *MPU9250, const float d);

// MADGWICK FILTER
void update_rpy(MPU9250_t *MPU9250, float qw, float qx, float qy, float qz);
void update_madgwick(float ax, float ay, float az, float gx, float gy, float gz, float mx, float my, float mz, float* q);
void madgwick(float ax, float ay, float az, float gx, float gy, float gz, float mx, float my, float mz, float* q);


//CALIBRATING
void calibrate(MPU9250_t *MPU9250);
void print_calibration(MPU9250_t *MPU9250);
void calibrate_acc_gyro_impl(MPU9250_t *MPU9250);
void set_acc_gyro_to_calibration();
void collect_acc_gyro_data_to(float * a_bias, float * g_bias);
void write_accel_offset(MPU9250_t *MPU9250);
void write_gyro_offset(MPU9250_t *MPU9250);

void calibrate_mag_impl(MPU9250_t *MPU9250);
void collect_mag_data_to(MPU9250_t *MPU9250);

//HELP FUNCTIONS
float getRoll(MPU9250_t *MPU9250);
float getPitch(MPU9250_t *MPU9250);
float getYaw(MPU9250_t *MPU9250);

float getEulerX(MPU9250_t *MPU9250);
float getEulerY(MPU9250_t *MPU9250);
float getEulerZ(MPU9250_t *MPU9250);

float getQuaternionX(MPU9250_t *MPU9250);
float getQuaternionY(MPU9250_t *MPU9250);
float getQuaternionZ(MPU9250_t *MPU9250);
float getQuaternionW(MPU9250_t *MPU9250);

float getAcc(MPU9250_t *MPU9250, const uint8_t i);
float getGyro(MPU9250_t *MPU9250, const uint8_t i);
float getMag(MPU9250_t *MPU9250, const uint8_t i);
float getLinearAcc(MPU9250_t *MPU9250, const uint8_t i);

float getAccX(MPU9250_t *MPU9250);
float getAccY(MPU9250_t *MPU9250);
float getAccZ(MPU9250_t *MPU9250);
float getGyroX(MPU9250_t *MPU9250);
float getGyroY(MPU9250_t *MPU9250);
float getGyroZ(MPU9250_t *MPU9250);
float getMagX(MPU9250_t *MPU9250);
float getMagY(MPU9250_t *MPU9250);
float getMagZ(MPU9250_t *MPU9250);
float getLinearAccX(MPU9250_t *MPU9250);
float getLinearAccY(MPU9250_t *MPU9250);
float getLinearAccZ(MPU9250_t *MPU9250);
float getAccBias(MPU9250_t *MPU9250, const uint8_t i);
float getGyroBias(MPU9250_t *MPU9250, const uint8_t i);
float getMagBias(MPU9250_t *MPU9250, const uint8_t i);
float getMagScale(MPU9250_t *MPU9250, const uint8_t i);
float getAccBiasX(MPU9250_t *MPU9250);
float getAccBiasY(MPU9250_t *MPU9250);
float getAccBiasZ(MPU9250_t *MPU9250);
float getGyroBiasX(MPU9250_t *MPU9250);
float getGyroBiasY(MPU9250_t *MPU9250);
float getGyroBiasZ(MPU9250_t *MPU9250);
float getMagBiasX(MPU9250_t *MPU9250);
float getMagBiasY(MPU9250_t *MPU9250);
float getMagBiasZ(MPU9250_t *MPU9250);
float getMagScaleX(MPU9250_t *MPU9250);
float getMagScaleY(MPU9250_t *MPU9250);
float getMagScaleZ(MPU9250_t *MPU9250);
float getTemperature(MPU9250_t *MPU9250);


// READ/WRITE I2C BYTES
void writeByte(uint8_t I2C_ADDRESS, uint8_t RegAddr, uint8_t data);
char readByte(uint8_t I2C_ADDRESS, uint8_t RegAddr);
void readBytes(uint8_t I2C_ADDRESS, uint8_t RegAddr, uint8_t count, uint8_t * dest);
#endif /* INC_MPU9250_H_ */
