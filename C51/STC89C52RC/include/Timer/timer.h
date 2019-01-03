#ifndef __TIMER__
#define __TIMER__
#include <8051.h>

void InitTimer(){
	TMOD=0x01;
	TF0=0;
	TR0=0;
	T0=0;
}

void Delay_us(unsigned int us){
	T0=0xff-us+1;
	TR0=1;
	while(TF0!=1);
	TR0=0;
	TF0=0;
}
#endif
