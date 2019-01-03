#include <8051.h>
#define SIN P0_0

void InitTimer(){
	TMOD=0x01;
	TF0=0;
	TR0=0;
}

void delay(unsigned int duration){
	while(duration--){
		TH0=0xff;
		TL0=0xa3;
		TR0=1;
		while(TF0==0);
		TR0=0;
		TF0=0;		
	}
}

void InitSg(){
	SIN=0;
}

void main(){
	unsigned int t=0;
	InitTimer();
	InitSg();
	while(1){
		if(t<=100){
			SIN=1;
			delay(20);
			SIN=0;
			delay(180);
		}else if(t<=200 && t>100){
			SIN=1;
			delay(5);
			SIN=0;
			delay(195);
		}else
			t=0;
		t++;
	}
}
