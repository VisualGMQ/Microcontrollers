#include <8051.h>
#define DS P2_2
#define STCP P2_1
#define SHCP P2_2

void init595(){
	STCP=0;
	SHCP=0;
}

void delay(int milli){while(milli--);}

void transform(char bits){
	int i=0;
	for(i=0;i<8;i++){
		DS = bits&0x01;		
		bits>>=1;
		delay(10);
		SHCP=1;
		delay(10);
		SHCP=0;
		delay(10);
	}
	STCP=1;
	delay(10);
	STCP=0;
}

void main(){
	init595();
	transform(0x02);
	while(1);	
}
