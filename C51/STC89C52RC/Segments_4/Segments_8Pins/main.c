#include <8051.h>



void delay(int time){
	int i=0;
	for(i=0;i<time*10;i++);
}

void main(){
	P2_7=1;
	while(1){
		delay(10);
		P0=~0x01;
		delay(10);
		P0=~0x02;
		delay(10);
		P0=~0x04;
	}
}
