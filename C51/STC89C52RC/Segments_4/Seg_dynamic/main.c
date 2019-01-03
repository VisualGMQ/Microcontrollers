#include <8051.h>
#define A0 P0_0
#define A1 P0_1
#define A2 P0_2
#define S1 P1_0
#define S2 P1_1
#define S3 P1_2
#define S4 P1_3

void delay(int milli){
	while(milli--);
}

void down(){
	S1=0;S2=0;S3=0;S4=0;
}

void main(){
	down();
	while(1){
		S1=1;
		A0=1;A1=0;A2=0;
		delay(100);
		A0=0;A1=1;A2=0;
		delay(100);
		S1=0;
		S2=1;
		A0=0;A1=0;A2=0;
		delay(100);
		A0=1;A1=0;A2=0;
		delay(100);
		A0=1;A1=1;A2=0;
		delay(100);
		A0=0;A1=0;A2=1;
		delay(100);
		A0=0;A1=1;A2=1;
		delay(100);
		S2=0;
		S3=1;
		A0=1;A1=1;A2=1;
		delay(100);
		S3=0;
		S4=1;
		A0=0;A1=0;A2=0;
		delay(100);
		A0=1;A1=0;A2=0;
		delay(100);
		A0=0;A1=1;A2=0;
		delay(100);
		S4=0;
	}	
}
