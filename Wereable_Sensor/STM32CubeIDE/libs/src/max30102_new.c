#include "max30102_new.h"

uint32_t getRed(I2C_HandleTypeDef* hi2c1, sense_struct_t sense) //Returns immediate red value
{
	if (safeCheck(hi2c1, sense, 250))
	{
		return (sense.red[sense.head]);
	}
	else
	{
		return(0);
	}
}

uint32_t getIR(I2C_HandleTypeDef* hi2c1, sense_struct_t sense) //Returns immediate IR value
{
	if (safeCheck(hi2c1, sense, 250))
	{
		return (sense.IR[sense.head]);
	}
	else
	{
		return(0);
	}
}

uint32_t getGreen(I2C_HandleTypeDef* hi2c1, sense_struct_t sense)   //Returns immediate green value
{
	if (safeCheck(hi2c1, sense, 250))
	{
		return (sense.green[sense.head]);
	}
	else
	{
		return(0);
	}
}

bool safeCheck(I2C_HandleTypeDef* hi2c1, sense_struct_t sense, uint8_t maxTimeToCheck)   //Given a max amount of time, check for new data
{
	uint32_t markTime = HAL_GetTick();
	while(1)
	{
		if (HAL_GetTick() - markTime > maxTimeToCheck)
		{
			return false;
		}

		if (check(hi2c1, sense) == true) // New data has been founded
		{
			return true;
		}

		HAL_Delay(1);
	}

}

// Configuration
void softReset(I2C_HandleTypeDef* hi2c1)
{
	  bitMask(hi2c1, MAX30102_MODECONFIG, MAX30102_RESET_MASK, MAX30102_RESET);

	  // Poll for bit to clear, reset is then complete
	  // Timeout after 100ms
	  unsigned long startTime = HAL_GetTick();
	  while (HAL_GetTick() - startTime < 100)
	  {
	    uint8_t response = readRegister8(hi2c1, MAX30102_MODECONFIG);
	    if ((response & MAX30102_RESET) == 0) break; //We're done!
	    delay(1); //Let's not over burden the I2C bus
	  }
}

void shutDown(I2C_HandleTypeDef* hi2c1)
{
	  // Put IC into low power mode (datasheet pg. 19)
	  // During shutdown the IC will continue to respond to I2C commands but will
	  // not update with or take new readings (such as temperature)
	  bitMask(hi2c1, MAX30102_MODECONFIG, MAX30102_SHUTDOWN_MASK, MAX30102_SHUTDOWN);
}

void wakeUp(I2C_HandleTypeDef* hi2c1)
{
	  // Pull IC out of low power mode (datasheet pg. 19)
	  bitMask(hi2c1, MAX30102_MODECONFIG, MAX30102_SHUTDOWN_MASK, MAX30102_WAKEUP);
}

void setLEDMode(I2C_HandleTypeDef* hi2c1, uint8_t mode)
{
	  // Set which LEDs are used for sampling -- Red only, RED+IR only, or custom.
	  // See datasheet, page 19
	  bitMask(hi2c1, MAX30102_MODECONFIG, MAX30102_MODE_MASK, mode);
}

void setADCRange(I2C_HandleTypeDef* hi2c1, uint8_t adcRange)
{
	  // adcRange: one of MAX30102_ADCRANGE_2048, _4096, _8192, _16384
	  bitMask(hi2c1, MAX30102_PARTICLECONFIG, MAX30102_ADCRANGE_MASK, adcRange);
}

void setSampleRate(I2C_HandleTypeDef* hi2c1, uint8_t sampleRate)
{
	  // sampleRate: one of MAX30102_SAMPLERATE_50, _100, _200, _400, _800, _1000, _1600, _3200
	  bitMask(hi2c1, MAX30102_PARTICLECONFIG, MAX30102_SAMPLERATE_MASK, sampleRate);
}

void setPulseWidth(I2C_HandleTypeDef* hi2c1, uint8_t pulseWidth)
{
	  // pulseWidth: one of MAX30102_PULSEWIDTH_69, _188, _215, _411
	  bitMask(hi2c1, MAX30102_PARTICLECONFIG, MAX30102_PULSEWIDTH_MASK, pulseWidth);
}

void setPulseAmplitudeRed(I2C_HandleTypeDef* hi2c1, uint8_t value)
{
	  writeRegister8(hi2c1, MAX30102_LED1_PULSEAMP, value);
}

void setPulseAmplitudeIR(I2C_HandleTypeDef* hi2c1, uint8_t value)
{
	  writeRegister8(hi2c1, MAX30102_LED2_PULSEAMP, value);
}

void setPulseAmplitudeGreen(I2C_HandleTypeDef* hi2c1, uint8_t value)
{
	  writeRegister8(hi2c1, MAX30102_LED3_PULSEAMP, value);
}

void setPulseAmplitudeProximity(I2C_HandleTypeDef* hi2c1, uint8_t value)
{
	  writeRegister8(hi2c1, MAX30102_LED_PROX_AMP, value);
}

void setProximityThreshold(I2C_HandleTypeDef* hi2c1, uint8_t threshMSB)
{
	  // Set the IR ADC count that will trigger the beginning of particle-sensing mode.
	  // The threshMSB signifies only the 8 most significant-bits of the ADC count.
	  // See datasheet, page 24.
	  writeRegister8(hi2c1, MAX30102_PROXINTTHRESH, threshMSB);
}



//Given a slot number assign a thing to it
//Devices are SLOT_RED_LED or SLOT_RED_PILOT (proximity)
//Assigning a SLOT_RED_LED will pulse LED
//Assigning a SLOT_RED_PILOT will ??
void enableSlot(I2C_HandleTypeDef* hi2c1, uint8_t slotNumber, uint8_t device)   //Given slot number, assign a device to slot
{
	  uint8_t originalContents;

	  switch (slotNumber) {
	    case (1):
	      bitMask(hi2c1, MAX30102_MULTILEDCONFIG1, MAX30102_SLOT1_MASK, device);
	      break;
	    case (2):
	      bitMask(hi2c1, MAX30102_MULTILEDCONFIG1, MAX30102_SLOT2_MASK, device << 4);
	      break;
	    case (3):
	      bitMask(hi2c1, MAX30102_MULTILEDCONFIG2, MAX30102_SLOT3_MASK, device);
	      break;
	    case (4):
	      bitMask(hi2c1, MAX30102_MULTILEDCONFIG2, MAX30102_SLOT4_MASK, device << 4);
	      break;
	    default:
	      //Shouldn't be here!
	      break;
	  }
}

void disableSlots(I2C_HandleTypeDef* hi2c1)
{
	  writeRegister8(hi2c1, MAX30102_MULTILEDCONFIG1, 0);
	  writeRegister8(hi2c1, MAX30102_MULTILEDCONFIG2, 0);
}


// Data Collection

uint8_t getINT1(I2C_HandleTypeDef* hi2c1)   //Returns the main interrupt group
{
	return (readRegister8(hi2c1, MAX30102_INTSTAT1));
}

uint8_t getINT2(I2C_HandleTypeDef* hi2c1)   //Returns the temp ready interrupt
{
	return (readRegister8(hi2c1, MAX30102_INTSTAT2));
}

void enableAFULL(I2C_HandleTypeDef* hi2c1)   //Enable/disable individual interrupts
{
	bitMask(hi2c1, MAX30102_INTENABLE1, MAX30102_INT_A_FULL_MASK, MAX30102_INT_A_FULL_ENABLE);
}

void disableAFULL(I2C_HandleTypeDef* hi2c1)
{
	bitMask(hi2c1, MAX30102_INTENABLE1, MAX30102_INT_A_FULL_MASK, MAX30102_INT_A_FULL_DISABLE);
}

void enableDATARDY(I2C_HandleTypeDef* hi2c1)
{
	  bitMask(hi2c1, MAX30102_INTENABLE1, MAX30102_INT_DATA_RDY_MASK, MAX30102_INT_DATA_RDY_ENABLE);
}

void disableDATARDY(I2C_HandleTypeDef* hi2c1)
{
	bitMask(hi2c1, MAX30102_INTENABLE1, MAX30102_INT_DATA_RDY_MASK, MAX30102_INT_DATA_RDY_DISABLE);
}

void enableALCOVF(I2C_HandleTypeDef* hi2c1)
{
	bitMask(hi2c1, MAX30102_INTENABLE1, MAX30102_INT_ALC_OVF_MASK, MAX30102_INT_ALC_OVF_ENABLE);
}

void disableALCOVF(I2C_HandleTypeDef* hi2c1)
{
	bitMask(hi2c1, MAX30102_INTENABLE1, MAX30102_INT_ALC_OVF_MASK, MAX30102_INT_ALC_OVF_DISABLE);
}

void enablePROXINT(I2C_HandleTypeDef* hi2c1)
{
	bitMask(hi2c1, MAX30102_INTENABLE1, MAX30102_INT_PROX_INT_MASK, MAX30102_INT_PROX_INT_ENABLE);
}

void disablePROXINT(I2C_HandleTypeDef* hi2c1)
{
	bitMask(hi2c1, MAX30102_INTENABLE1, MAX30102_INT_PROX_INT_MASK, MAX30102_INT_PROX_INT_DISABLE);
}

void enableDIETEMPRDY(I2C_HandleTypeDef* hi2c1)
{
	bitMask(hi2c1, MAX30102_INTENABLE2, MAX30102_INT_DIE_TEMP_RDY_MASK, MAX30102_INT_DIE_TEMP_RDY_ENABLE);
}

void disableDIETEMPRDY(I2C_HandleTypeDef* hi2c1)
{
	bitMask(hi2c1, MAX30102_INTENABLE2, MAX30102_INT_DIE_TEMP_RDY_MASK, MAX30102_INT_DIE_TEMP_RDY_DISABLE);
}



//FIFO Configuration (page 18)
void setFIFOAverage(I2C_HandleTypeDef* hi2c1, uint8_t samples)
{
	bitMask(hi2c1, MAX30102_FIFOCONFIG, MAX30102_SAMPLEAVG_MASK, samples);
}

void enableFIFORollover(I2C_HandleTypeDef* hi2c1)
{
	bitMask(hi2c1, MAX30102_FIFOCONFIG, MAX30102_ROLLOVER_MASK, MAX30102_ROLLOVER_ENABLE);
}

void disableFIFORollover(I2C_HandleTypeDef* hi2c1)
{
	bitMask(hi2c1, MAX30102_FIFOCONFIG, MAX30102_ROLLOVER_MASK, MAX30102_ROLLOVER_DISABLE);
}

void setFIFOAlmostFull(I2C_HandleTypeDef* hi2c1, uint8_t samples)
{
	bitMask(hi2c1, MAX30102_FIFOCONFIG, MAX30102_A_FULL_MASK, samples);
}



//FIFO Reading
uint16_t check(I2C_HandleTypeDef* hi2c1, sense_struct_t sense)   //Checks for new data and fills FIFO
{
	//Read register FIDO_DATA in (3-byte * number of active LED) chunks
	//Until FIFO_RD_PTR = FIFO_WR_PTR

	uint8_t readPointer = getReadPointer(hi2c1);
	uint8_t writePointer = getWritePointer(hi2c1);

	int numberOfSamples = 0;

	  //Do we have new data?
	  if (readPointer != writePointer)
	  {
	    //Calculate the number of readings we need to get from sensor
	    numberOfSamples = writePointer - readPointer;
	    if (numberOfSamples < 0) numberOfSamples += 32; //Wrap condition

	    //We now have the number of readings, now calc bytes to read
	    //For this example we are just doing Red and IR (3 bytes each)
	    int bytesLeftToRead = numberOfSamples * activeLEDs * 3;

	    //Get ready to read a burst of data from the FIFO register
//	    _i2cPort->beginTransmission(MAX30102_ADDRESS);
//	    _i2cPort->write(MAX30102_FIFODATA);
//	    _i2cPort->endTransmission();

//	    HAL_I2C_Master_Transmit(hi2c1, I2C_WRITE_ADDR, MAX30102_FIFODATA, 1, 1000);

	    //We may need to read as many as 288 bytes so we read in blocks no larger than I2C_BUFFER_LENGTH
	    //I2C_BUFFER_LENGTH changes based on the platform. 64 bytes for SAMD21, 32 bytes for Uno.
	    //Wire.requestFrom() is limited to BUFFER_LENGTH which is 32 on the Uno
	    while (bytesLeftToRead > 0)
	    {
	      int toGet = bytesLeftToRead;
	      if (toGet > I2C_BUFFER_LENGTH)
	      {
	        //If toGet is 32 this is bad because we read 6 bytes (Red+IR * 3 = 6) at a time
	        //32 % 6 = 2 left over. We don't want to request 32 bytes, we want to request 30.
	        //32 % 9 (Red+IR+GREEN) = 5 left over. We want to request 27.

	        toGet = I2C_BUFFER_LENGTH - (I2C_BUFFER_LENGTH % (activeLEDs * 3)); //Trim toGet to be a multiple of the samples we need to read
	      }

	      bytesLeftToRead -= toGet;

	      //Request toGet number of bytes from sensor
//	      _i2cPort->requestFrom(MAX30102_ADDRESS, toGet);
	      uint8_t gotten_data[toGet];
	      HAL_I2C_Mem_Read(hi2c1, I2C_READ_ADDR, MAX30102_FIFODATA, 1U, *gotten_data, toGet, 250U);
	      uint8_t i = 0;
	      while (toGet > 0)
	      {
	        sense.head++; //Advance the head of the storage struct
	        sense.head %= STORAGE_SIZE; //Wrap condition

	        uint32_t tempLong;
	        uint32_t un_temp;

	        //Burst read three bytes - RED
	        un_temp = (uint32_t)gotten_data[0 + 3 * i * activeLEDs];
	        un_temp <<= 16;
	        tempLong += un_temp;
	        un_temp = (uint32_t)gotten_data[1 + 3 * i * activeLEDs];
	        un_temp <<= 8;
	        tempLong += un_temp;
	        un_temp = (uint32_t)gotten_data[2 + 3 * i * activeLEDs];
	        tempLong += un_temp;

//	        //Convert array to long
//	        memcpy(&tempLong, temp, sizeof(tempLong));

			tempLong &= 0x3FFFF; //Zero out all but 18 bits

	        sense.red[sense.head] = tempLong; //Store this reading into the sense array

	        if (activeLEDs > 1)
	        {
	          //Burst read three more bytes - IR
		        un_temp = (uint32_t)gotten_data[3 + 3 * i * activeLEDs];
		        un_temp <<= 16;
		        tempLong += un_temp;
		        un_temp = (uint32_t)gotten_data[4 + 3 * i * activeLEDs];
		        un_temp <<= 8;
		        tempLong += un_temp;
		        un_temp = (uint32_t)gotten_data[5 + 3 * i * activeLEDs];
		        tempLong += un_temp;

//	          //Convert array to long
//	          memcpy(&tempLong, temp, sizeof(tempLong));

			  tempLong &= 0x3FFFF; //Zero out all but 18 bits

			  sense.IR[sense.head] = tempLong;
	        }

	        if (activeLEDs > 2)
	        {
	          //Burst read three more bytes - Green
		        un_temp = (uint32_t)gotten_data[6 + 3 * i * activeLEDs];
		        un_temp <<= 16;
		        tempLong += un_temp;
		        un_temp = (uint32_t)gotten_data[7 + 3 * i * activeLEDs];
		        un_temp <<= 8;
		        tempLong += un_temp;
		        un_temp = (uint32_t)gotten_data[8 + 3 * i * activeLEDs];
		        tempLong += un_temp;

//	          //Convert array to long
//	          memcpy(&tempLong, temp, sizeof(tempLong));

			  tempLong &= 0x3FFFF; //Zero out all but 18 bits

	          sense.green[sense.head] = tempLong;
	        }

	        toGet -= activeLEDs * 3;
	        i++;
	      }

	    } //End while (bytesLeftToRead > 0)

	  } //End readPtr != writePtr

	  return (numberOfSamples); //Let the world know how much new data we found

}

uint8_t available(sense_struct_t sense)   //Tells caller how many new samples are available (head - tail)
{
	  int8_t numberOfSamples = sense.head - sense.tail;
	  if (numberOfSamples < 0) numberOfSamples += STORAGE_SIZE;

	  return (numberOfSamples);
}

void nextSample(sense_struct_t sense)   //Advances the tail of the sense array
{
	  if(available(sense)) //Only advance the tail if new data is available
	  {
	    sense.tail++;
	    sense.tail %= STORAGE_SIZE; //Wrap condition
	  }
}

uint32_t getFIFORed(sense_struct_t sense)   //Returns the FIFO sample pointed to by tail
{
	return (sense.red[sense.tail]);
}

uint32_t getFIFOIR(sense_struct_t sense)   //Returns the FIFO sample pointed to by tail
{
	return (sense.IR[sense.tail]);
}

uint32_t getFIFOGreen(sense_struct_t sense)   //Returns the FIFO sample pointed to by tail
{
	return (sense.green[sense.tail]);
}

uint8_t getWritePointer(I2C_HandleTypeDef* hi2c1)
{
	  return (readRegister8(hi2c1, MAX30102_FIFOWRITEPTR));
}

uint8_t getReadPointer(I2C_HandleTypeDef* hi2c1)
{
	  return (readRegister8(hi2c1, MAX30102_FIFOREADPTR));
}

void clearFIFO(I2C_HandleTypeDef* hi2c1)   //Sets the read/write pointers to zero
{
	writeRegister8(hi2c1, MAX30102_FIFOWRITEPTR, 0);
	writeRegister8(hi2c1, MAX30102_FIFOOVERFLOW, 0);
	writeRegister8(hi2c1, MAX30102_FIFOREADPTR, 0);
}

//Proximity Mode Interrupt Threshold

void setPROXINTTHRESH(I2C_HandleTypeDef* hi2c1, uint8_t val)
{
	writeRegister8(hi2c1, MAX30102_PROXINTTHRESH, val);
}


// Die Temperature
float readTemperature(I2C_HandleTypeDef* hi2c1)
{

	  //DIE_TEMP_RDY interrupt must be enabled
	  //See issue 19: https://github.com/sparkfun/SparkFun_MAX3010x_Sensor_Library/issues/19

	  // Step 1: Config die temperature register to take 1 temperature sample
	  writeRegister8(hi2c1, MAX30102_DIETEMPCONFIG, 0x01);

	  // Poll for bit to clear, reading is then complete
	  // Timeout after 100ms
	  unsigned long startTime = HAL_GetTick();
	  while (HAL_GetTick() - startTime < 100)
	  {
	    //uint8_t response = readRegister8(_i2caddr, MAX30102_DIETEMPCONFIG); //Original way
	    //if ((response & 0x01) == 0) break; //We're done!

		//Check to see if DIE_TEMP_RDY interrupt is set
		uint8_t response = readRegister8(hi2c1, MAX30102_INTSTAT2);
	    if ((response & MAX30102_INT_DIE_TEMP_RDY_ENABLE) > 0) break; //We're done!
	    delay(1); //Let's not over burden the I2C bus
	  }
	  //TODO How do we want to fail? With what type of error?
	  //? if(millis() - startTime >= 100) return(-999.0);

	  // Step 2: Read die temperature register (integer)
	  int8_t tempInt = readRegister8(hi2c1, MAX30102_DIETEMPINT);
	  uint8_t tempFrac = readRegister8(hi2c1, MAX30102_DIETEMPFRAC); //Causes the clearing of the DIE_TEMP_RDY interrupt

	  // Step 3: Calculate temperature (datasheet pg. 23)
	  return (float)tempInt + ((float)tempFrac * 0.0625);
}

float readTemperatureF(I2C_HandleTypeDef* hi2c1)
{
	  float temp = readTemperature(hi2c1);

	  if (temp != -999.0) temp = temp * 1.8 + 32.0;

	  return (temp);
}

// Detecting ID/Revision
uint8_t getRevisionID(I2C_HandleTypeDef* hi2c1)
{

}

uint8_t readPartID(I2C_HandleTypeDef* hi2c1)
{
	return readRegister8(hi2c1, MAX30102_PARTID);
}

// Setup the IC with user selectable settings
void setupMAX30102(I2C_HandleTypeDef* hi2c1, uint8_t powerLevel, uint8_t sampleAverage, uint8_t ledMode, uint16_t sampleRate, uint16_t pulseWidth, uint16_t adcRange)
{
	softReset(hi2c1); //Reset all configuration, threshold, and data registers to POR values

	//FIFO Configuration
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	//The chip will average multiple samples of same type together if you wish
	if (sampleAverage == 1)
	{
		setFIFOAverage(hi2c1, MAX30102_SAMPLEAVG_1); //No averaging per FIFO record
	}
	else if (sampleAverage == 2)
	{
		setFIFOAverage(hi2c1, MAX30102_SAMPLEAVG_2);
	}
	else if (sampleAverage == 4)
	{
		setFIFOAverage(hi2c1, MAX30102_SAMPLEAVG_4);
	}
	else if (sampleAverage == 8)
	{
		setFIFOAverage(hi2c1, MAX30102_SAMPLEAVG_8);
	}
	else if (sampleAverage == 16)
	{
		setFIFOAverage(hi2c1, MAX30102_SAMPLEAVG_16);
	}
	else if (sampleAverage == 32)
	{
		setFIFOAverage(hi2c1, MAX30102_SAMPLEAVG_32);
	}
	else
	{
		setFIFOAverage(hi2c1, MAX30102_SAMPLEAVG_4);
	}

	//setFIFOAlmostFull(2); //Set to 30 samples to trigger an 'Almost Full' interrupt
	enableFIFORollover(hi2c1); //Allow FIFO to wrap/roll over
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

	//Mode Configuration
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	if (ledMode == 3)
	{
		setLEDMode(hi2c1, MAX30102_MODE_MULTILED); //Watch all three LED channels
	}
	else if (ledMode == 2)
	{
		setLEDMode(hi2c1, MAX30102_MODE_REDIRONLY); //Red and IR
	}
	else
	{
		setLEDMode(hi2c1, MAX30102_MODE_REDONLY); //Red only
	}

	activeLEDs = ledMode; //Used to control how many bytes to read from FIFO buffer
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

	//Particle Sensing Configuration
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	if(adcRange < 4096)
	{
		setADCRange(hi2c1, MAX30102_ADCRANGE_2048); //7.81pA per LSB
	}
	else if(adcRange < 8192)
	{
		setADCRange(hi2c1, MAX30102_ADCRANGE_4096); //15.63pA per LSB
	}
	else if(adcRange < 16384)
	{
		setADCRange(hi2c1, MAX30102_ADCRANGE_8192); //31.25pA per LSB
	}
	else if(adcRange == 16384)
	{
		setADCRange(hi2c1, MAX30102_ADCRANGE_16384); //62.5pA per LSB
	}
	else
	{
		setADCRange(hi2c1, MAX30102_ADCRANGE_2048);
	}

	if (sampleRate < 100)
	{
		setSampleRate(hi2c1, MAX30102_SAMPLERATE_50); //Take 50 samples per second
	}
	else if (sampleRate < 200)
	{
		setSampleRate(hi2c1, MAX30102_SAMPLERATE_100);
	}
	else if (sampleRate < 400)
	{
		setSampleRate(hi2c1, MAX30102_SAMPLERATE_200);
	}
	else if (sampleRate < 800)
	{
		setSampleRate(hi2c1, MAX30102_SAMPLERATE_400);
	}
	else if (sampleRate < 1000)
	{
		setSampleRate(hi2c1, MAX30102_SAMPLERATE_800);
	}
	else if (sampleRate < 1600)
	{
		setSampleRate(hi2c1, MAX30102_SAMPLERATE_1000);
	}
	else if (sampleRate < 3200)
	{
		setSampleRate(hi2c1, MAX30102_SAMPLERATE_1600);
	}
	else if (sampleRate == 3200)
	{
		setSampleRate(hi2c1, MAX30102_SAMPLERATE_3200);
	}
	else
	{
		setSampleRate(hi2c1, MAX30102_SAMPLERATE_50);
	}

	//The longer the pulse width the longer range of detection you'll have
	//At 69us and 0.4mA it's about 2 inches
	//At 411us and 0.4mA it's about 6 inches
	if (pulseWidth < 118)
	{
		setPulseWidth(hi2c1, MAX30102_PULSEWIDTH_69); //Page 26, Gets us 15 bit resolution
	}
	else if (pulseWidth < 215)
	{
		setPulseWidth(hi2c1, MAX30102_PULSEWIDTH_118); //16 bit resolution
	}
	else if (pulseWidth < 411)
	{
		setPulseWidth(hi2c1, MAX30102_PULSEWIDTH_215); //17 bit resolution
	}
	else if (pulseWidth == 411)
	{
		setPulseWidth(hi2c1, MAX30102_PULSEWIDTH_411); //18 bit resolution
	}
	else
	{
		setPulseWidth(hi2c1, MAX30102_PULSEWIDTH_69);
	}
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

	//LED Pulse Amplitude Configuration
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	//Default is 0x1F which gets us 6.4mA
	//powerLevel = 0x02, 0.4mA - Presence detection of ~4 inch
	//powerLevel = 0x1F, 6.4mA - Presence detection of ~8 inch
	//powerLevel = 0x7F, 25.4mA - Presence detection of ~8 inch
	//powerLevel = 0xFF, 50.0mA - Presence detection of ~12 inch

	setPulseAmplitudeRed(hi2c1, powerLevel);
	setPulseAmplitudeIR(hi2c1, powerLevel);
	setPulseAmplitudeGreen(hi2c1, powerLevel);
	setPulseAmplitudeProximity(hi2c1, powerLevel);
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

	//Multi-LED Mode Configuration, Enable the reading of the three LEDs
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	enableSlot(hi2c1, 1, SLOT_RED_LED);
	if (ledMode > 1)
	{
		enableSlot(hi2c1, 2, SLOT_IR_LED);
	}
	if (ledMode > 2)
	{
		enableSlot(hi2c1, 3, SLOT_GREEN_LED);
	}
	//enableSlot(1, SLOT_RED_PILOT);
	//enableSlot(2, SLOT_IR_PILOT);
	//enableSlot(3, SLOT_GREEN_PILOT);
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

	clearFIFO(hi2c1); //Reset the FIFO before we begin checking the sensor
}

// Low-level I2C communication
uint8_t readRegister8(I2C_HandleTypeDef *hi2c1, uint8_t reg)
{
	uint8_t value = 0;
	HAL_I2C_Mem_Read(hi2c1, I2C_READ_ADDR, REG_FIFO_DATA, 1U, &value, 1U, 250U);
	return value;
}
void writeRegister8(I2C_HandleTypeDef *hi2c1, uint8_t reg, uint8_t value)
{
	HAL_I2C_Mem_Write(hi2c1, I2C_WRITE_ADDR, reg, 1U, &value, 1U, 100U);
}

void readRevisionID(I2C_HandleTypeDef* hi2c1)
{
	revisionID = readRegister8(hi2c1, MAX30102_REVISIONID);
}

void bitMask(I2C_HandleTypeDef* hi2c1, uint8_t reg, uint8_t mask, uint8_t thing)
{
	// Grab current register context
	uint8_t originalContents = readRegister8(hi2c1, reg);

	// Zero-out the portions of the register we're interested in
	originalContents = originalContents & mask;

	// Change contents
//	writeRegister8(_i2caddr, reg, originalContents | thing);
	writeRegister8(hi2c1, reg, originalContents | thing);
}


