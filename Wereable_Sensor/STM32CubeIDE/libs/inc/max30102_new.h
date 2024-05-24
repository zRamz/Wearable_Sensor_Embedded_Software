#ifndef MAX30102_NEW_H_
#define MAX30102_NEW_H_

#include "main.h"

#define I2C_WRITE_ADDR 							0xAE
#define I2C_READ_ADDR 							0xAF


//register addresses

// Status Registers
#define MAX30102_INTSTAT1  						0x00
#define MAX30102_INTSTAT2  						0x01
#define MAX30102_INTENABLE1  					0x02
#define MAX30102_INTENABLE2  					0x03

// FIFO Registers
#define MAX30102_FIFOWRITEPTR   				0x04
#define MAX30102_FIFOOVERFLOW   				0x05
#define MAX30102_FIFOREADPTR   					0x06
#define MAX30102_FIFODATA  						0x07

// Configuration Registers
#define MAX30102_FIFOCONFIG   					0x08
#define MAX30102_MODECONFIG   					0x09
#define MAX30102_PARTICLECONFIG   				0x0A     // Note, sometimes listed as "SPO2" config in datasheet (pg. 11)
#define MAX30102_LED1_PULSEAMP   				0x0C
#define MAX30102_LED2_PULSEAMP   				0x0D
#define MAX30102_LED3_PULSEAMP   				0x0E
#define MAX30102_LED_PROX_AMP   				0x10
#define MAX30102_MULTILEDCONFIG1   				0x11
#define MAX30102_MULTILEDCONFIG2   				0x12

// Die Temperature Registers
#define MAX30102_DIETEMPINT   					0x1F
#define MAX30102_DIETEMPFRAC   					0x20
#define MAX30102_DIETEMPCONFIG   				0x21

// Proximity Function Registers
#define MAX30102_PROXINTTHRESH   				0x30

// Part ID Registers
#define MAX30102_REVISIONID   					0xFE
#define MAX30102_PARTID   						0xFF     // Should always be 0x15. Identical to MAX30102.

// MAX30102 Commands
// Interrupt configuration (pg 13, 14)
#define MAX30102_INT_A_FULL_MASK  				0b10000000
#define MAX30102_INT_A_FULL_ENABLE   			0x80
#define MAX30102_INT_A_FULL_DISABLE   			0x00

#define MAX30102_INT_DATA_RDY_MASK   			0b01000000
#define MAX30102_INT_DATA_RDY_ENABLE  			0x40
#define MAX30102_INT_DATA_RDY_DISABLE   		0x00

#define MAX30102_INT_ALC_OVF_MASK   			0b00100000
#define MAX30102_INT_ALC_OVF_ENABLE   			0x20
#define MAX30102_INT_ALC_OVF_DISABLE   			0x00

#define MAX30102_INT_PROX_INT_MASK   			0b00010000
#define MAX30102_INT_PROX_INT_ENABLE   			0x10
#define MAX30102_INT_PROX_INT_DISABLE   		0x00

#define MAX30102_INT_DIE_TEMP_RDY_MASK   		0b00000010
#define MAX30102_INT_DIE_TEMP_RDY_ENABLE   		0x02
#define MAX30102_INT_DIE_TEMP_RDY_DISABLE   	0x00

#define MAX30102_SAMPLEAVG_MASK  				0b11100000
#define MAX30102_SAMPLEAVG_1   					0x00
#define MAX30102_SAMPLEAVG_2   					0x20
#define MAX30102_SAMPLEAVG_4   					0x40
#define MAX30102_SAMPLEAVG_8   					0x60
#define MAX30102_SAMPLEAVG_16   				0x80
#define MAX30102_SAMPLEAVG_32   				0xA0

#define MAX30102_ROLLOVER_MASK   				0xEF
#define MAX30102_ROLLOVER_ENABLE   				0x10
#define MAX30102_ROLLOVER_DISABLE   			0x00

#define MAX30102_A_FULL_MASK   					0xF0

// Mode configuration commands (page 19)
#define MAX30102_SHUTDOWN_MASK   				0x7F
#define MAX30102_SHUTDOWN   					0x80
#define MAX30102_WAKEUP   						0x00

#define MAX30102_RESET_MASK   					0xBF
#define MAX30102_RESET   						0x40

#define MAX30102_MODE_MASK   					0xF8
#define MAX30102_MODE_REDONLY   				0x02
#define MAX30102_MODE_REDIRONLY   				0x03
#define MAX30102_MODE_MULTILED   				0x07

// Particle sensing configuration commands (pgs 19-20)
#define MAX30102_ADCRANGE_MASK   				0x9F
#define MAX30102_ADCRANGE_2048   				0x00
#define MAX30102_ADCRANGE_4096   				0x20
#define MAX30102_ADCRANGE_8192   				0x40
#define MAX30102_ADCRANGE_16384   				0x60

#define MAX30102_SAMPLERATE_MASK   				0xE3
#define MAX30102_SAMPLERATE_50   				0x00
#define MAX30102_SAMPLERATE_100   				0x04
#define MAX30102_SAMPLERATE_200   				0x08
#define MAX30102_SAMPLERATE_400   				0x0C
#define MAX30102_SAMPLERATE_800   				0x10
#define MAX30102_SAMPLERATE_1000   				0x14
#define MAX30102_SAMPLERATE_1600   				0x18
#define MAX30102_SAMPLERATE_3200   				0x1C

#define MAX30102_PULSEWIDTH_MASK   				0xFC
#define MAX30102_PULSEWIDTH_69   				0x00
#define MAX30102_PULSEWIDTH_118   				0x01
#define MAX30102_PULSEWIDTH_215   				0x02
#define MAX30102_PULSEWIDTH_411   				0x03

//Multi-LED Mode configuration (pg 22)
#define MAX30102_SLOT1_MASK   					0xF8
#define MAX30102_SLOT2_MASK   					0x8F
#define MAX30102_SLOT3_MASK   					0xF8
#define MAX30102_SLOT4_MASK   					0x8F

#define SLOT_NONE   							0x00
#define SLOT_RED_LED   							0x01
#define SLOT_IR_LED   							0x02
#define SLOT_GREEN_LED   						0x03
#define SLOT_NONE_PILOT   						0x04
#define SLOT_RED_PILOT  						0x05
#define SLOT_IR_PILOT   						0x06
#define SLOT_GREEN_PILOT   						0x07

#define MAX_30105_EXPECTEDPARTID   				0x15

// Constants
#define MAX30102_ADDRESS 						0x57
#define I2C_BUFFER_LENGTH 						32
#define STORAGE_SIZE 4 //Each long is 4 bytes so limit this to fit on your micro

typedef struct
{
  uint32_t red[STORAGE_SIZE];
  uint32_t IR[STORAGE_SIZE];
  uint32_t green[STORAGE_SIZE];
  uint8_t head;
  uint8_t tail;
} sense_struct_t; //This is our circular buffer of readings from the sensor

sense_struct_t sense;

// Function prototypes
uint32_t getRed(I2C_HandleTypeDef* hi2c1, sense_struct_t sense); //Returns immediate red value
uint32_t getIR(I2C_HandleTypeDef* hi2c1, sense_struct_t sense); //Returns immediate IR value
uint32_t getGreen(I2C_HandleTypeDef* hi2c1, sense_struct_t sense); //Returns immediate green value
bool safeCheck(I2C_HandleTypeDef* hi2c1, sense_struct_t sense, uint8_t maxTimeToCheck); //Given a max amount of time, check for new data

// Configuration
void softReset(I2C_HandleTypeDef* hi2c1);
void shutDown(I2C_HandleTypeDef* hi2c1);
void wakeUp(I2C_HandleTypeDef* hi2c1);
void setLEDMode(I2C_HandleTypeDef* hi2c1, uint8_t mode);
void setADCRange(I2C_HandleTypeDef* hi2c1, uint8_t adcRange);
void setSampleRate(I2C_HandleTypeDef* hi2c1, uint8_t sampleRate);
void setPulseWidth(I2C_HandleTypeDef* hi2c1, uint8_t pulseWidth);
void setPulseAmplitudeRed(I2C_HandleTypeDef* hi2c1, uint8_t value);
void setPulseAmplitudeIR(I2C_HandleTypeDef* hi2c1, uint8_t value);
void setPulseAmplitudeGreen(I2C_HandleTypeDef* hi2c1, uint8_t value);
void setPulseAmplitudeProximity(I2C_HandleTypeDef* hi2c1, uint8_t value);
void setProximityThreshold(I2C_HandleTypeDef* hi2c1, uint8_t threshMSB);


//Multi-led configuration mode (page 22)
void enableSlot(I2C_HandleTypeDef* hi2c1, uint8_t slotNumber, uint8_t device); //Given slot number, assign a device to slot
void disableSlots(I2C_HandleTypeDef* hi2c1);


// Data Collection
uint8_t getINT1(I2C_HandleTypeDef* hi2c1); //Returns the main interrupt group
uint8_t getINT2(I2C_HandleTypeDef* hi2c1); //Returns the temp ready interrupt
void enableAFULL(I2C_HandleTypeDef* hi2c1); //Enable/disable individual interrupts
void disableAFULL(I2C_HandleTypeDef* hi2c1);
void enableDATARDY(I2C_HandleTypeDef* hi2c1);
void disableDATARDY(I2C_HandleTypeDef* hi2c1);
void enableALCOVF(I2C_HandleTypeDef* hi2c1);
void disableALCOVF(I2C_HandleTypeDef* hi2c1);
void enablePROXINT(I2C_HandleTypeDef* hi2c1);
void disablePROXINT(I2C_HandleTypeDef* hi2c1);
void enableDIETEMPRDY(I2C_HandleTypeDef* hi2c1);
void disableDIETEMPRDY(I2C_HandleTypeDef* hi2c1);


//FIFO Configuration (page 18)
void setFIFOAverage(I2C_HandleTypeDef* hi2c1, uint8_t samples);
void enableFIFORollover(I2C_HandleTypeDef* hi2c1);
void disableFIFORollover(I2C_HandleTypeDef* hi2c1);
void setFIFOAlmostFull(I2C_HandleTypeDef* hi2c1, uint8_t samples);


//FIFO Reading
uint16_t check(I2C_HandleTypeDef* hi2c1, sense_struct_t sense); //Checks for new data and fills FIFO
uint8_t available(sense_struct_t sense); //Tells caller how many new samples are available (head - tail)
void nextSample(sense_struct_t sense); //Advances the tail of the sense array
uint32_t getFIFORed(sense_struct_t sense); //Returns the FIFO sample pointed to by tail
uint32_t getFIFOIR(sense_struct_t sense); //Returns the FIFO sample pointed to by tail
uint32_t getFIFOGreen(sense_struct_t sense); //Returns the FIFO sample pointed to by tail
uint8_t getWritePointer(I2C_HandleTypeDef* hi2c1);
uint8_t getReadPointer(I2C_HandleTypeDef* hi2c1);
void clearFIFO(I2C_HandleTypeDef* hi2c1); //Sets the read/write pointers to zero


//Proximity Mode Interrupt Threshold
void setPROXINTTHRESH(I2C_HandleTypeDef* hi2c1, uint8_t val);


// Die Temperature
float readTemperature(I2C_HandleTypeDef* hi2c1);
float readTemperatureF(I2C_HandleTypeDef* hi2c1);


// Detecting ID/Revision
uint8_t getRevisionID(I2C_HandleTypeDef* hi2c1);
uint8_t readPartID(I2C_HandleTypeDef* hi2c1);


// Setup the IC with user selectable settings
void setupMAX30102(I2C_HandleTypeDef* hi2c1, uint8_t powerLevel, uint8_t sampleAverage, uint8_t ledMode, uint16_t sampleRate, uint16_t pulseWidth, uint16_t adcRange);


// Low-level I2C communication
uint8_t readRegister8(I2C_HandleTypeDef *hi2c, uint8_t reg);
void writeRegister8(I2C_HandleTypeDef *hi2c, uint8_t reg, uint8_t value);

//activeLEDs is the number of channels turned on, and can be 1 to 3. 2 is common for Red+IR.
uint8_t activeLEDs; //Gets set during setup. Allows check() to calculate how many bytes to read from FIFO

uint8_t revisionID;

void readRevisionID(I2C_HandleTypeDef* hi2c1);

void bitMask(I2C_HandleTypeDef* hi2c1, uint8_t reg, uint8_t mask, uint8_t thing);

#endif // MAX30102_NEW_H_
