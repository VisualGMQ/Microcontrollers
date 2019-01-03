#include <8051.h>
#ifdef DOWN
#define D 1
#else
#define D 0
#endif

void delay(int sec){
	while(sec--);
}

void initINT0(){
	if(D==1)
		IT0=1;
	else
		IT0=0;
	EX0=1;
	EA=1;
}

void main(){
	P0_0=1;
	initINT0();
	while(1){
		delay(5000);
		P0_0=!P0_0;
	}
}

void INT0_inter() __interrupt 0{
		delay(30000);
		P2_0=!P2_0;
}
