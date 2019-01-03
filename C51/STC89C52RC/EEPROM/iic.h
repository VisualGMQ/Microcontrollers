#include <8051.h>
#define SCL P0_0
#define SDA P0_1
void InitTimer(){
	TMOD=0x01;
	T0=0x00;
	TF0=0;
	TR0=0;
}

void Delay(unsigned int i){
	T0=0xffff-i;
	TR0=1;
	while(TF0!=1);
	TR0=0;
	TF0=0;
}

void IIC_Delay(){
	Delay(5);
}

void IIC_Start(){
	SCL=1;
	SDA=1;
	IIC_Delay();
	SDA=0;
	IIC_Delay();
	SCL=0;
}

void IIC_Stop(){
	SCL=0;
	SDA=0;
	IIC_Delay();
	SDA=1;
	IIC_Delay();
}

void IIC_SendAck(){
	SDA=0;
	SCL=1;
	IIC_Delay();
	SCL=0;
}

void IIC_SendNack(){
	SDA=1;
	SCL=1;
	IIC_Delay();
	SCL=0;
}


unsigned int IIC_WaitAck(){
	unsigned int tmp=0;
	SCL=1;
	SDA=1;
	while(SDA==1 && tmp<=255)tmp++;
	if(SDA==1){
		IIC_Stop();
		return 0;
	}
	SCL=0;
	return 1;
}

unsigned int IIC_Write(unsigned int data){
	int i;
	for(i=0;i<8;i++){
		if((data&0x80)==0)
			SDA=0;
		else
			SDA=1;
		SCL=0;
		IIC_Delay();
		SCL=1;
		SDA<<=1;
	}
	return IIC_WaitAck();
}
unsigned int IIC_Read(){
	int i=0,data=0;
	for(i=0;i<8;i++){
		IIC_Delay();
		SCL=1;
		data|=SDA;
		data<<=1;		
		SCL=0; 
	}
	IIC_SendAck();
	return data;
}


