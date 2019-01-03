#include <8051.h>

void delay(int sec){
	sec=sec*10;
	while(sec--);
}

void main(){
	while(1){
		P0_0=1;
		delay(2000);
		P0_0=0;
		delay(2000);
	}	
}
