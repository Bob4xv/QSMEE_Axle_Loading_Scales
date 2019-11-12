//-------------------------------------------------------------------------------------
// QSMEE axle weighing scales by Bob Campbell.
// Using the HX711 ADC SPI module and I2c 7 segment display from ebay.
// Processor is Arduino Uno.
// Libraries used are LedControl-master from git-hub.  https://github.com/wayoda/LedControl
//    and HX711_ADC-master from git-hub. https://github.com/olkal/HX711_ADC & https://github.com/bogde/HX711
//  The load cells are two LC4103-K100 in parallel supporting a track segment.
//-------------------------------------------------------------------------------------
/* This is an example sketch on how to find correct calibration factor for your HX711:
 - Power up the scale and open Arduino serial terminal
 - After stabilizing and tare is complete, put a known weight on the load cell
 - Observe values on serial terminal
 - Adjust the calibration factor until output value is same as your known weight:
 - Sending 'h' from the serial terminal displays usage help
 - Observe and note the value of the new calibration factor
 - Saving the calibration factor places the value into EEProm
 Bob.c
 */
#include "Arduino.h"
#include <HX711.h>  //CURRENT HX711 Lib
#include <EEPROM.h>
float VERSION = 1.00;

/*
 Now we need a LedControl to work with.
 ***** These pin numbers will may not work with your hardware *****
 pin 12 is connected to the DataIn
 pin 11 is connected to the CLK
 pin 10 is connected to LOAD
 We have only a single MAX72XX.
 */
#include "LedControl.h"

/* we always wait a bit between updates of the display */
unsigned long delaytime = 500;  // time out for display 2 per second.
unsigned long offTime = 3600;   //time out for shutdown 30 Min.
unsigned long t;
unsigned long power_timeout;

//HX711 constructor
HX711 LoadCell;

// HX711 circuit wiring
const int LOADCELL_DOUT_PIN = 4;
const int LOADCELL_SCK_PIN = 5;

// LedControl(data,clk,cs,No. of devices)
LedControl lc = LedControl(12, 11, 10, 1);

int eeaddress = 0;
int gain = 64;			// 128 or 64
unsigned char samples = 2;
float Calfactor = 696.0;
float defaultScale = 582.0;
float weight = 0;
int totalweight = 0;
bool done_add = false;
const int addMemPin = 6;
const int clrMemPin = 3;
const int powerPin = 2;
const int tarePin = 7;

void write_axle_load(int load) {
	bool digit23 = false;
	bool digit34 = false;
//          Serial.print("'"); Serial.print(weight); Serial.print("'  ");
	if (load < 0) {
		lc.setChar(0, 3, '-', false);
		unsigned int wt10 = 65536 - load;   //Change to pos number
//          Serial.print("'"); Serial.print(wt10); Serial.print("'  ");
		if (wt10 >= 100) {
			lc.setDigit(0, 2, (wt10 / 100), false);
			digit23 = true;
			wt10 = load - 100;
		} else
			lc.setRow(0, 2, 0);
		if (wt10 >= 10) {
//           Serial.print("'"); Serial.print(wt10); Serial.print("'  ");
			lc.setDigit(0, 1, (wt10 / 10), true);
			digit23 = true;
			wt10 = wt10 - 10;
		} else if (!digit34) {
			lc.setRow(0, 1, 0);
		} else
			lc.setDigit(0, 1, 0, true);
		lc.setDigit(0, 0, (wt10), false);
	}
	if (load >= 0) {

//        lc.setChar(0,4,' ',false);
		if (load >= 1000) {
			lc.setDigit(0, 3, (load / 1000), false);
			lc.setDigit(0, 2, 0, false);
			digit34 = true;
			load = load - (1000 * (load / 1000));
		} else
			lc.setRow(0, 3, 0);
		if (load >= 100) {
			lc.setDigit(0, 2, (load / 100), false);
			lc.setDigit(0, 1, 0, true);
			digit23 = true;
			load = load - (100 * (load / 100));
		} else if (!digit34) {
			lc.setRow(0, 2, 0);
		} else if (!digit23) {
			lc.setDigit(0, 2, 0, true);
		}
		if (load >= 10) {
			lc.setDigit(0, 1, (load / 10), true);
			digit23 = true;
			load = load - (10 * (load / 10));
		} else if (!digit23) {
			lc.setDigit(0, 1, 0, true);
		} else
			lc.setDigit(0, 1, 0, true);
		lc.setDigit(0, 0, load, false);
	}

}

void write_mem(int mem) {

	lc.setRow(0,7,0);	// clear all
	lc.setRow(0,6,0);
	lc.setRow(0,5,0);
	if (mem >= 0) {
		mem = mem / 10;			// remove decimal
	}
	if (mem >= 1000) {
			lc.setDigit(0, 7, (mem / 1000), false);
			lc.setDigit(0, 6, 0, false);
			lc.setDigit(0, 5, 0, false);
			mem = mem - (1000 * (mem / 1000));
	}
	if (mem >= 100) {
			lc.setDigit(0, 6, (mem / 100), false);
			lc.setDigit(0, 5, 0, false);
			lc.setDigit(0, 4, 0, false);
			mem = mem - (100 * (mem / 100));
	}
	if (mem >= 10) {
			lc.setDigit(0, 5, (mem / 10), false);
			mem = mem - (10 * (mem / 10));
	}
	lc.setDigit(0, 4, mem, false);
}

void do_tare() {
	long int tare_value = 0;
	LoadCell.tare();
	tare_value = LoadCell.get_offset();
	Serial.print("Tare Value = ");
	Serial.println(tare_value);
}

void new_tare() {
	long int tare_value = 0;
	tare_value = LoadCell.read();
//	LoadCell.set_offset(tare_value);
	Serial.print("New Tare Value = ");
	Serial.println(tare_value);
}

void do_help() {
	Serial.println("  Calibration Usage ");
	Serial.println("  H or h Print this page ");
	Serial.println("  l move value down by 1 ");
	Serial.println("  L move value down by 10 ");
	Serial.println("  u move value up by 1 ");
	Serial.println("  U move value up by 10 ");
	Serial.println("  r Reset Scalefactor to default");
	Serial.println("  s or S save new Calfactor ");
}

void do_saveScale(float newscale) {

	EEPROM.put(eeaddress, newscale);  //update non-volitle calibration
	Serial.print(" **** New Calibrate factor = ");
	Serial.println(newscale);

}

void setup() {
	pinMode(addMemPin, INPUT_PULLUP);
	pinMode(clrMemPin, INPUT_PULLUP);
	pinMode(tarePin, INPUT_PULLUP);
	pinMode(powerPin, OUTPUT);

	Serial.begin(38400);
	delay(50);
	Serial.println("QSMEE Axle Load Measurement Scales");
	delay(20);
	Serial.print("VERSION ");
	Serial.println(VERSION);

	/*
	 The MAX72XX is in power-saving mode on startup,
	 we have to do a wakeup call
	 */
	lc.shutdown(0, false);
	/* Set the brightness to a medium values */
	lc.setIntensity(0, 8);
	/* and clear the display */
	lc.clearDisplay(0);
	write_axle_load(8888);		//Show startup

	Serial.println("Wait...");
	digitalWrite(powerPin, HIGH);  			//latch power on
	power_timeout = 0;			// Start
	LoadCell.begin(LOADCELL_DOUT_PIN, LOADCELL_SCK_PIN, gain);
	delay(5000);
	LoadCell.power_up();
	LoadCell.wait_ready(20);
	do_tare();
	LoadCell.wait_ready(1);
	totalweight = 0;

	EEPROM.get(eeaddress, Calfactor);
	Serial.print("Calfactor = ");
	Serial.println(Calfactor);

	/*
	 * Has non volatile EEPROM ever been set?
	 */
	if (Calfactor < 10) {
		Calfactor = defaultScale;  //default value
		EEPROM.put(eeaddress, defaultScale);
	}
	LoadCell.set_scale(Calfactor);
	LoadCell.wait_ready(1);


	Serial.println("Startup + tare is complete");
}

void loop() {
//	int weight=0;

	//get smoothed value from data set + current calibration factor
	if (millis() > t + delaytime) {
		LoadCell.wait_ready(10);
		float f_weight = LoadCell.get_units(samples); // Kg.
		Serial.print("   Load_cell TimeCount: ");
		Serial.print(power_timeout);
		Serial.print("   Load_cell output val: ");
		Serial.println(f_weight / 10);
		t = millis();
		power_timeout = power_timeout + 1;
		if (power_timeout >= offTime) {
			digitalWrite(powerPin, LOW);
		}
		done_add = false;
		weight = int(f_weight);
		write_axle_load(weight);
	}

	while (!digitalRead(addMemPin)) {   //do only one add per keypress
		if (!done_add) {
			totalweight = totalweight + weight;
			done_add = true;
			Serial.println("**** ADD MEM ");
			write_mem(totalweight);
		}
	}
	done_add=false;
	while (!digitalRead(clrMemPin) && (totalweight != 0)) { //reset
		Serial.println("**** Clear MEM ");
		totalweight = 0;
		write_mem(totalweight);
		lc.clearDisplay(0);
	}

	//receive from serial terminal
	if (Serial.available() > 0) {
		float inc = 0;
		float newscale = 0;
		char crud[5];
		char inByte = Serial.read();
		Serial.readBytes(crud, 5);
		if (inByte == 'l')
			inc = 1.0;
		else if (inByte == 'L')
			inc = 10.0;
		else if (inByte == 'u')
			inc = -1.0;
		else if (inByte == 'U')
			inc = -10.0;
		else if (inByte == ('h'))
			do_help();
		else if (inByte == ('H'))
			do_help();
		else if (inByte == 's') {
			newscale = LoadCell.get_scale();
			do_saveScale(newscale);
		} else if (inByte == 'r') {
			newscale = defaultScale;
		} else
			do_help();
		newscale = LoadCell.get_scale() + inc;
		Serial.print("Scale = ");
		Serial.println(newscale);
		LoadCell.set_scale(newscale);
	}
	if (!digitalRead(tarePin)) {
		do_tare();
	}

}

