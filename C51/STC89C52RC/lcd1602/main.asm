;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Mac OS X x86_64)
;--------------------------------------------------------
	.module main
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _WriteDate
	.globl _WriteCmd
	.globl _WaitAck
	.globl _GetStatus
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_main_str_65536_7:
	.ds 11
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'GetStatus'
;------------------------------------------------------------
;	main.c:7: unsigned char GetStatus(){
;	-----------------------------------------
;	 function GetStatus
;	-----------------------------------------
_GetStatus:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	main.c:8: Data=0xff;
	mov	_P3,#0xff
;	main.c:9: RS=0;
;	assignBit
	clr	_P1_1
;	main.c:10: RW=1;
;	assignBit
	setb	_P1_2
;	main.c:11: E=1;
;	assignBit
	setb	_P1_3
;	main.c:12: return Data;
	mov	dpl,_P3
;	main.c:13: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'WaitAck'
;------------------------------------------------------------
;	main.c:15: void WaitAck(){
;	-----------------------------------------
;	 function WaitAck
;	-----------------------------------------
_WaitAck:
;	main.c:16: Data=0xff;
	mov	_P3,#0xff
;	main.c:17: RS=0;
;	assignBit
	clr	_P1_1
;	main.c:18: RW=1;
;	assignBit
	setb	_P1_2
;	main.c:19: E=1;
;	assignBit
	setb	_P1_3
;	main.c:20: while(Data&0x80);
00101$:
	mov	a,_P3
	jb	acc.7,00101$
;	main.c:21: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCmd'
;------------------------------------------------------------
;cmd                       Allocated to registers r7 
;------------------------------------------------------------
;	main.c:23: void WriteCmd(unsigned char cmd){
;	-----------------------------------------
;	 function WriteCmd
;	-----------------------------------------
_WriteCmd:
	mov	r7,dpl
;	main.c:24: WaitAck();
	push	ar7
	lcall	_WaitAck
	pop	ar7
;	main.c:25: E=0;
;	assignBit
	clr	_P1_3
;	main.c:26: RS=0;
;	assignBit
	clr	_P1_1
;	main.c:27: RW=0;
;	assignBit
	clr	_P1_2
;	main.c:28: Data=cmd;
	mov	_P3,r7
;	main.c:29: E=1;
;	assignBit
	setb	_P1_3
;	main.c:30: E=0;
;	assignBit
	clr	_P1_3
;	main.c:31: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteDate'
;------------------------------------------------------------
;data                      Allocated to registers r7 
;------------------------------------------------------------
;	main.c:33: void WriteDate(unsigned char data){
;	-----------------------------------------
;	 function WriteDate
;	-----------------------------------------
_WriteDate:
	mov	r7,dpl
;	main.c:34: WaitAck();
	push	ar7
	lcall	_WaitAck
	pop	ar7
;	main.c:35: E=0;
;	assignBit
	clr	_P1_3
;	main.c:36: RS=1;
;	assignBit
	setb	_P1_1
;	main.c:37: RW=0;
;	assignBit
	clr	_P1_2
;	main.c:38: Data=data;
	mov	_P3,r7
;	main.c:39: E=1;
;	assignBit
	setb	_P1_3
;	main.c:40: E=0;
;	assignBit
	clr	_P1_3
;	main.c:41: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;str                       Allocated with name '_main_str_65536_7'
;i                         Allocated to registers r6 r7 
;------------------------------------------------------------
;	main.c:43: void main(){
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c:44: unsigned char str[]="Visual GMQ";	
	mov	_main_str_65536_7,#0x56
	mov	(_main_str_65536_7 + 0x0001),#0x69
	mov	(_main_str_65536_7 + 0x0002),#0x73
	mov	(_main_str_65536_7 + 0x0003),#0x75
	mov	(_main_str_65536_7 + 0x0004),#0x61
	mov	(_main_str_65536_7 + 0x0005),#0x6c
	mov	(_main_str_65536_7 + 0x0006),#0x20
	mov	(_main_str_65536_7 + 0x0007),#0x47
	mov	(_main_str_65536_7 + 0x0008),#0x4d
	mov	(_main_str_65536_7 + 0x0009),#0x51
	mov	(_main_str_65536_7 + 0x000a),#0x00
;	main.c:47: WriteCmd(0x38);
	mov	dpl,#0x38
	lcall	_WriteCmd
;	main.c:48: WriteCmd(0x0C);
	mov	dpl,#0x0c
	lcall	_WriteCmd
;	main.c:49: WriteCmd(0x06);
	mov	dpl,#0x06
	lcall	_WriteCmd
;	main.c:50: WriteCmd(0x01);
	mov	dpl,#0x01
	lcall	_WriteCmd
;	main.c:52: WriteCmd(0x80|0x02);
	mov	dpl,#0x82
	lcall	_WriteCmd
;	main.c:53: while(str[i]!=0){
	mov	r6,#0x00
	mov	r7,#0x00
00101$:
	mov	a,r6
	add	a,#_main_str_65536_7
	mov	r1,a
	mov	a,@r1
	mov	r5,a
	jz	00105$
;	main.c:54: WriteDate(str[i]);
	mov	dpl,r5
	push	ar7
	push	ar6
	lcall	_WriteDate
	pop	ar6
	pop	ar7
;	main.c:55: i++;
	inc	r6
;	main.c:57: while(1);
	cjne	r6,#0x00,00101$
	inc	r7
	sjmp	00101$
00105$:
;	main.c:59: }
	sjmp	00105$
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
