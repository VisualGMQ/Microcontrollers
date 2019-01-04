#include <8051.h>
#define SCL P0_0
#define SDA P0_1
void InitTimer(){
	TMOD=0x01;
	TH0=0;
	TL0=0;
	TF0=0;
	TR0=0;
}

void IIC_Init(){
	SCL=1;
	SDA=1;
}

void IIC_Delay(){
	TH0=0xff;
	TL0=0x25;
	TR0=1;
	while(TF0==0);
	TR0=0;
	TF0=0;
}

void IIC_Start(){
	SDA=1;
	IIC_Delay();
	SCL=1;
	IIC_Delay();
	SDA=0;
	IIC_Delay();
}

void IIC_Stop(){
	SDA=0;
	IIC_Delay();
	SCL=1;
	IIC_Delay();
	SDA=1;
	IIC_Delay();
}

unsigned char IIC_Response(){
	unsigned int i=0,isAck=0;;
	SCL=1;
	SDA=1;
	IIC_Delay();
	while(SDA==1 && i<255)i++;
	isAck=SDA;
	SCL=0;
	IIC_Delay();
	return isAck;
}

void IIC_Ack(unsigned int isack){
	if(isack==1){
		SDA=0;
		IIC_Delay();
		SCL=1;
		IIC_Delay();
		SCL=0;
		SDA=1;
	}else{
		SDA=1;
		IIC_Delay();
		SCL=1;
		IIC_Delay();
		SCL=0;
		SDA=0;
	}	
}

unsigned char IIC_Write(unsigned char data){
	unsigned char i=0;
	unsigned char tmp=data;
	SCL=0;
	IIC_Delay();
	for(i=0;i<8;i++){
		tmp<<=1;
		SDA=CY;		
		IIC_Delay();
		SCL=1;
		IIC_Delay();
		SCL=0;
	}
	return IIC_Response();
}

unsigned char IIC_Read(unsigned char isAck){
	unsigned int i=0,data=0;
	SCL=0;
	SDA=1;
	IIC_Delay();
	for(i=0;i<8;i++){
		SCL=1;
		IIC_Delay();
		data<<=1;
		data|=SDA;
		IIC_Delay();
		SCL=0;
	}	
	IIC_Ack(isAck);
	return data;
}
