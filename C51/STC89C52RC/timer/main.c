#include <8051.h>

void initTimer(){
	TMOD=0x01;	
	TH0=0;
	TL0=0;
	TR0=1;
}

void delay(int i){
	while(i--){
		while(TF0!=1)
			;
		TF0=0;
	}
}

void main(){
	int j=5;
	initTimer();
	while(1){
		if(j!=0)
			j--;
		else
			TR0=0;
		delay(14);
		P2_0 = 1;
		delay(14);
		P2_0 = 0;
		

	}
}
