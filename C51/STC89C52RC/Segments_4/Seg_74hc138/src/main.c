#include <8051.h>
#define A0 P0_0
#define A1 P0_1
#define A2 P0_2

void delay(int milli){
	while(milli--);
}

void main(){
	while(1){
		A0=0;A1=0;A2=0;	
		delay(100000);
		A0=1;A1=0;A2=0;
		delay(100000);
		A0=0;A1=1;A2=0;
		delay(100000);
		A0=1;A1=1;A2=0;
		delay(100000);
		A0=0;A1=0;A2=1;
		delay(100000);
		A0=1;A1=0;A2=1;
		delay(100000);
		A0=0;A1=1;A2=1;
		delay(100000);
		A0=1;A1=1;A2=1;
		delay(100000);
	}	
}
