#include "iic.h"
#include <8051.h>
#define LED P1
void EEPROM_Write(unsigned int data){
	IIC_Start();
	IIC_Write(0xA0);
	IIC_Write(0x00);
	IIC_Write(data);
	IIC_Stop();
}

unsigned int EEPROM_Read(){
	unsigned int data;
	IIC_Start();
	IIC_Write(0xA1);
	IIC_Write(0x00);
	IIC_Start();
	data=IIC_Read();
	IIC_Stop();
	return data;
}

void main(){
	unsigned int data;
	InitTimer();
	EEPROM_Write(0xAA);
	IIC_Delay();
	data = EEPROM_Read();
	LED = data;
	while(1);
}
