#include "iic.h"
#include <8051.h>
#define LED P1
void EEPROM_Write(unsigned int data){
	IIC_Start();
	IIC_Write(0xA0);
	IIC_Write(3);
	IIC_Write(data);
	IIC_Stop();
}

unsigned int EEPROM_Read(){
	unsigned int data;
	IIC_Start();
	IIC_Write(0xA0);
	IIC_Write(3);
	IIC_Start();
	IIC_Write(0xA1);
	data=IIC_Read(1);
	IIC_Stop();
	return data;
}

void main(){
	InitTimer();
	IIC_Init();
	EEPROM_Write(0xaa);
	IIC_Delay();
	LED= EEPROM_Read();
	while(1);
}

