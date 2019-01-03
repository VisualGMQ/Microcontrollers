#ifndef __SEGMENT__
#define __SEGMENT__
#define <8051.h>
#define SegOn P2_7
#define A0 P2_4
#define A1 P2_5
#define A2 P2_6
#define Seg1 P2_0
#define Seg2 P2_1
#define Seg3 P2_2
#define Seg4 P2_3

enum digital{
	Dig1,
	Dig2,
	Dig3,
	Dig4,
	Dig5,
	Dig6,
	Dig7,
	Dig8,
	Dig9,
	Dig0,
	DigDot
};

void SegOn(unsigned char isOn){
	SegOn=isOn;
}

void SendValue(unsigned char value,unsigned char seg){
	Seg1=seg&0x08;
	Seg2=seg&0x04;
	Seg3=seg&0x02;
	Seg4=seg&0x01;
	switch(value){
		case Dig0:
			break;
		case Dig1:
			break;
		case Dig2:
			break;
		case Dig3:
			break;
		case Dig4:
			break;
		case Dig5:
			break;
		case Dig6:
			break;
		case Dig7:
			break;
		case Dig8:
			break;
		case Dig9:
			break;
		case DigDot:
			break;
	}
}

#endif
