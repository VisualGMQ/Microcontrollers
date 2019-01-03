#include <8051.h>
#define RS P1_1
#define RW P1_2
#define E  P1_3
#define Data P3

unsigned char GetStatus(){
	Data=0xff;
	RS=0;
	RW=1;
	E=1;
	return Data;
}

void WaitAck(){
	Data=0xff;
	RS=0;
	RW=1;
	E=1;
	while(Data&0x80);
}

void WriteCmd(unsigned char cmd){
	WaitAck();
	E=0;
	RS=0;
	RW=0;
	Data=cmd;
	E=1;
	E=0;
}

void WriteDate(unsigned char data){
	WaitAck();
	E=0;
	RS=1;
	RW=0;
	Data=data;
	E=1;
	E=0;
}

void main(){
	unsigned char str[]="Visual GMQ";	
	int i=0;
	//Init Lcd1602
	WriteCmd(0x38);
	WriteCmd(0x0C);
	WriteCmd(0x06);
	WriteCmd(0x01);
	//Set Cursor
	WriteCmd(0x80|0x02);
	while(str[i]!=0){
		WriteDate(str[i]);
		i++;
	}
	while(1);
	
}
