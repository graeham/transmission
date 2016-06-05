   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  19                     .const:	section	.text
  20  0000               _HSIDivFactor:
  21  0000 01            	dc.b	1
  22  0001 02            	dc.b	2
  23  0002 04            	dc.b	4
  24  0003 08            	dc.b	8
  25  0004               _CLKPrescTable:
  26  0004 01            	dc.b	1
  27  0005 02            	dc.b	2
  28  0006 04            	dc.b	4
  29  0007 08            	dc.b	8
  30  0008 0a            	dc.b	10
  31  0009 10            	dc.b	16
  32  000a 14            	dc.b	20
  33  000b 28            	dc.b	40
  62                     ; 66 void CLK_DeInit(void)
  62                     ; 67 {
  64                     	switch	.text
  65  0000               _CLK_DeInit:
  69                     ; 69     CLK->ICKR = CLK_ICKR_RESET_VALUE;
  71  0000 350150c0      	mov	20672,#1
  72                     ; 70     CLK->ECKR = CLK_ECKR_RESET_VALUE;
  74  0004 725f50c1      	clr	20673
  75                     ; 71     CLK->SWR  = CLK_SWR_RESET_VALUE;
  77  0008 35e150c4      	mov	20676,#225
  78                     ; 72     CLK->SWCR = CLK_SWCR_RESET_VALUE;
  80  000c 725f50c5      	clr	20677
  81                     ; 73     CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  83  0010 351850c6      	mov	20678,#24
  84                     ; 74     CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  86  0014 35ff50c7      	mov	20679,#255
  87                     ; 75     CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  89  0018 35ff50ca      	mov	20682,#255
  90                     ; 76     CLK->CSSR = CLK_CSSR_RESET_VALUE;
  92  001c 725f50c8      	clr	20680
  93                     ; 77     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  95  0020 725f50c9      	clr	20681
  97  0024               L52:
  98                     ; 78     while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
 100  0024 720050c9fb    	btjt	20681,#0,L52
 101                     ; 80     CLK->CCOR = CLK_CCOR_RESET_VALUE;
 103  0029 725f50c9      	clr	20681
 104                     ; 81     CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 106  002d 725f50cc      	clr	20684
 107                     ; 82     CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 109  0031 725f50cd      	clr	20685
 110                     ; 84 }
 113  0035 81            	ret	
 170                     ; 95 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 170                     ; 96 {
 171                     	switch	.text
 172  0036               _CLK_FastHaltWakeUpCmd:
 174  0036 88            	push	a
 175       00000000      OFST:	set	0
 178                     ; 99     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 180  0037 4d            	tnz	a
 181  0038 2711          	jreq	L41
 182  003a 4a            	dec	a
 183  003b 270e          	jreq	L41
 184  003d ae0063        	ldw	x,#99
 185  0040 89            	pushw	x
 186  0041 5f            	clrw	x
 187  0042 89            	pushw	x
 188  0043 ae000c        	ldw	x,#L75
 189  0046 cd0000        	call	_assert_failed
 191  0049 5b04          	addw	sp,#4
 192  004b               L41:
 193                     ; 101     if (NewState != DISABLE)
 195  004b 7b01          	ld	a,(OFST+1,sp)
 196  004d 2706          	jreq	L16
 197                     ; 104         CLK->ICKR |= CLK_ICKR_FHWU;
 199  004f 721450c0      	bset	20672,#2
 201  0053 2004          	jra	L36
 202  0055               L16:
 203                     ; 109         CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 205  0055 721550c0      	bres	20672,#2
 206  0059               L36:
 207                     ; 112 }
 210  0059 84            	pop	a
 211  005a 81            	ret	
 247                     ; 119 void CLK_HSECmd(FunctionalState NewState)
 247                     ; 120 {
 248                     	switch	.text
 249  005b               _CLK_HSECmd:
 251  005b 88            	push	a
 252       00000000      OFST:	set	0
 255                     ; 123     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 257  005c 4d            	tnz	a
 258  005d 2711          	jreq	L62
 259  005f 4a            	dec	a
 260  0060 270e          	jreq	L62
 261  0062 ae007b        	ldw	x,#123
 262  0065 89            	pushw	x
 263  0066 5f            	clrw	x
 264  0067 89            	pushw	x
 265  0068 ae000c        	ldw	x,#L75
 266  006b cd0000        	call	_assert_failed
 268  006e 5b04          	addw	sp,#4
 269  0070               L62:
 270                     ; 125     if (NewState != DISABLE)
 272  0070 7b01          	ld	a,(OFST+1,sp)
 273  0072 2706          	jreq	L301
 274                     ; 128         CLK->ECKR |= CLK_ECKR_HSEEN;
 276  0074 721050c1      	bset	20673,#0
 278  0078 2004          	jra	L501
 279  007a               L301:
 280                     ; 133         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 282  007a 721150c1      	bres	20673,#0
 283  007e               L501:
 284                     ; 136 }
 287  007e 84            	pop	a
 288  007f 81            	ret	
 324                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 324                     ; 144 {
 325                     	switch	.text
 326  0080               _CLK_HSICmd:
 328  0080 88            	push	a
 329       00000000      OFST:	set	0
 332                     ; 147     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 334  0081 4d            	tnz	a
 335  0082 2711          	jreq	L04
 336  0084 4a            	dec	a
 337  0085 270e          	jreq	L04
 338  0087 ae0093        	ldw	x,#147
 339  008a 89            	pushw	x
 340  008b 5f            	clrw	x
 341  008c 89            	pushw	x
 342  008d ae000c        	ldw	x,#L75
 343  0090 cd0000        	call	_assert_failed
 345  0093 5b04          	addw	sp,#4
 346  0095               L04:
 347                     ; 149     if (NewState != DISABLE)
 349  0095 7b01          	ld	a,(OFST+1,sp)
 350  0097 2706          	jreq	L521
 351                     ; 152         CLK->ICKR |= CLK_ICKR_HSIEN;
 353  0099 721050c0      	bset	20672,#0
 355  009d 2004          	jra	L721
 356  009f               L521:
 357                     ; 157         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 359  009f 721150c0      	bres	20672,#0
 360  00a3               L721:
 361                     ; 160 }
 364  00a3 84            	pop	a
 365  00a4 81            	ret	
 401                     ; 167 void CLK_LSICmd(FunctionalState NewState)
 401                     ; 168 {
 402                     	switch	.text
 403  00a5               _CLK_LSICmd:
 405  00a5 88            	push	a
 406       00000000      OFST:	set	0
 409                     ; 171     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 411  00a6 4d            	tnz	a
 412  00a7 2711          	jreq	L25
 413  00a9 4a            	dec	a
 414  00aa 270e          	jreq	L25
 415  00ac ae00ab        	ldw	x,#171
 416  00af 89            	pushw	x
 417  00b0 5f            	clrw	x
 418  00b1 89            	pushw	x
 419  00b2 ae000c        	ldw	x,#L75
 420  00b5 cd0000        	call	_assert_failed
 422  00b8 5b04          	addw	sp,#4
 423  00ba               L25:
 424                     ; 173     if (NewState != DISABLE)
 426  00ba 7b01          	ld	a,(OFST+1,sp)
 427  00bc 2706          	jreq	L741
 428                     ; 176         CLK->ICKR |= CLK_ICKR_LSIEN;
 430  00be 721650c0      	bset	20672,#3
 432  00c2 2004          	jra	L151
 433  00c4               L741:
 434                     ; 181         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 436  00c4 721750c0      	bres	20672,#3
 437  00c8               L151:
 438                     ; 184 }
 441  00c8 84            	pop	a
 442  00c9 81            	ret	
 478                     ; 192 void CLK_CCOCmd(FunctionalState NewState)
 478                     ; 193 {
 479                     	switch	.text
 480  00ca               _CLK_CCOCmd:
 482  00ca 88            	push	a
 483       00000000      OFST:	set	0
 486                     ; 196     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 488  00cb 4d            	tnz	a
 489  00cc 2711          	jreq	L46
 490  00ce 4a            	dec	a
 491  00cf 270e          	jreq	L46
 492  00d1 ae00c4        	ldw	x,#196
 493  00d4 89            	pushw	x
 494  00d5 5f            	clrw	x
 495  00d6 89            	pushw	x
 496  00d7 ae000c        	ldw	x,#L75
 497  00da cd0000        	call	_assert_failed
 499  00dd 5b04          	addw	sp,#4
 500  00df               L46:
 501                     ; 198     if (NewState != DISABLE)
 503  00df 7b01          	ld	a,(OFST+1,sp)
 504  00e1 2706          	jreq	L171
 505                     ; 201         CLK->CCOR |= CLK_CCOR_CCOEN;
 507  00e3 721050c9      	bset	20681,#0
 509  00e7 2004          	jra	L371
 510  00e9               L171:
 511                     ; 206         CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 513  00e9 721150c9      	bres	20681,#0
 514  00ed               L371:
 515                     ; 209 }
 518  00ed 84            	pop	a
 519  00ee 81            	ret	
 555                     ; 218 void CLK_ClockSwitchCmd(FunctionalState NewState)
 555                     ; 219 {
 556                     	switch	.text
 557  00ef               _CLK_ClockSwitchCmd:
 559  00ef 88            	push	a
 560       00000000      OFST:	set	0
 563                     ; 222     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 565  00f0 4d            	tnz	a
 566  00f1 2711          	jreq	L67
 567  00f3 4a            	dec	a
 568  00f4 270e          	jreq	L67
 569  00f6 ae00de        	ldw	x,#222
 570  00f9 89            	pushw	x
 571  00fa 5f            	clrw	x
 572  00fb 89            	pushw	x
 573  00fc ae000c        	ldw	x,#L75
 574  00ff cd0000        	call	_assert_failed
 576  0102 5b04          	addw	sp,#4
 577  0104               L67:
 578                     ; 224     if (NewState != DISABLE )
 580  0104 7b01          	ld	a,(OFST+1,sp)
 581  0106 2706          	jreq	L312
 582                     ; 227         CLK->SWCR |= CLK_SWCR_SWEN;
 584  0108 721250c5      	bset	20677,#1
 586  010c 2004          	jra	L512
 587  010e               L312:
 588                     ; 232         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 590  010e 721350c5      	bres	20677,#1
 591  0112               L512:
 592                     ; 235 }
 595  0112 84            	pop	a
 596  0113 81            	ret	
 633                     ; 245 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 633                     ; 246 {
 634                     	switch	.text
 635  0114               _CLK_SlowActiveHaltWakeUpCmd:
 637  0114 88            	push	a
 638       00000000      OFST:	set	0
 641                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 643  0115 4d            	tnz	a
 644  0116 2711          	jreq	L011
 645  0118 4a            	dec	a
 646  0119 270e          	jreq	L011
 647  011b ae00f9        	ldw	x,#249
 648  011e 89            	pushw	x
 649  011f 5f            	clrw	x
 650  0120 89            	pushw	x
 651  0121 ae000c        	ldw	x,#L75
 652  0124 cd0000        	call	_assert_failed
 654  0127 5b04          	addw	sp,#4
 655  0129               L011:
 656                     ; 251     if (NewState != DISABLE)
 658  0129 7b01          	ld	a,(OFST+1,sp)
 659  012b 2706          	jreq	L532
 660                     ; 254         CLK->ICKR |= CLK_ICKR_SWUAH;
 662  012d 721a50c0      	bset	20672,#5
 664  0131 2004          	jra	L732
 665  0133               L532:
 666                     ; 259         CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 668  0133 721b50c0      	bres	20672,#5
 669  0137               L732:
 670                     ; 262 }
 673  0137 84            	pop	a
 674  0138 81            	ret	
 834                     ; 272 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 834                     ; 273 {
 835                     	switch	.text
 836  0139               _CLK_PeripheralClockConfig:
 838  0139 89            	pushw	x
 839       00000000      OFST:	set	0
 842                     ; 276     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 844  013a 9f            	ld	a,xl
 845  013b 4d            	tnz	a
 846  013c 2712          	jreq	L221
 847  013e 9f            	ld	a,xl
 848  013f 4a            	dec	a
 849  0140 270e          	jreq	L221
 850  0142 ae0114        	ldw	x,#276
 851  0145 89            	pushw	x
 852  0146 5f            	clrw	x
 853  0147 89            	pushw	x
 854  0148 ae000c        	ldw	x,#L75
 855  014b cd0000        	call	_assert_failed
 857  014e 5b04          	addw	sp,#4
 858  0150               L221:
 859                     ; 277     assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 861  0150 7b01          	ld	a,(OFST+1,sp)
 862  0152 273c          	jreq	L231
 863  0154 a101          	cp	a,#1
 864  0156 2738          	jreq	L231
 865  0158 a103          	cp	a,#3
 866  015a 2734          	jreq	L231
 867  015c a102          	cp	a,#2
 868  015e 2730          	jreq	L231
 869  0160 a104          	cp	a,#4
 870  0162 272c          	jreq	L231
 871  0164 a105          	cp	a,#5
 872  0166 2728          	jreq	L231
 873  0168 a104          	cp	a,#4
 874  016a 2724          	jreq	L231
 875  016c a106          	cp	a,#6
 876  016e 2720          	jreq	L231
 877  0170 a107          	cp	a,#7
 878  0172 271c          	jreq	L231
 879  0174 a117          	cp	a,#23
 880  0176 2718          	jreq	L231
 881  0178 a113          	cp	a,#19
 882  017a 2714          	jreq	L231
 883  017c a112          	cp	a,#18
 884  017e 2710          	jreq	L231
 885  0180 ae0115        	ldw	x,#277
 886  0183 89            	pushw	x
 887  0184 5f            	clrw	x
 888  0185 89            	pushw	x
 889  0186 ae000c        	ldw	x,#L75
 890  0189 cd0000        	call	_assert_failed
 892  018c 5b04          	addw	sp,#4
 893  018e 7b01          	ld	a,(OFST+1,sp)
 894  0190               L231:
 895                     ; 279     if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 897  0190 a510          	bcp	a,#16
 898  0192 262c          	jrne	L323
 899                     ; 281         if (NewState != DISABLE)
 901  0194 0d02          	tnz	(OFST+2,sp)
 902  0196 2712          	jreq	L523
 903                     ; 284             CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 905  0198 a40f          	and	a,#15
 906  019a 5f            	clrw	x
 907  019b 97            	ld	xl,a
 908  019c a601          	ld	a,#1
 909  019e 5d            	tnzw	x
 910  019f 2704          	jreq	L631
 911  01a1               L041:
 912  01a1 48            	sll	a
 913  01a2 5a            	decw	x
 914  01a3 26fc          	jrne	L041
 915  01a5               L631:
 916  01a5 ca50c7        	or	a,20679
 918  01a8 2011          	jp	LC002
 919  01aa               L523:
 920                     ; 289             CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 922  01aa a40f          	and	a,#15
 923  01ac 5f            	clrw	x
 924  01ad 97            	ld	xl,a
 925  01ae a601          	ld	a,#1
 926  01b0 5d            	tnzw	x
 927  01b1 2704          	jreq	L241
 928  01b3               L441:
 929  01b3 48            	sll	a
 930  01b4 5a            	decw	x
 931  01b5 26fc          	jrne	L441
 932  01b7               L241:
 933  01b7 43            	cpl	a
 934  01b8 c450c7        	and	a,20679
 935  01bb               LC002:
 936  01bb c750c7        	ld	20679,a
 937  01be 202a          	jra	L133
 938  01c0               L323:
 939                     ; 294         if (NewState != DISABLE)
 941  01c0 0d02          	tnz	(OFST+2,sp)
 942  01c2 2712          	jreq	L333
 943                     ; 297             CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 945  01c4 a40f          	and	a,#15
 946  01c6 5f            	clrw	x
 947  01c7 97            	ld	xl,a
 948  01c8 a601          	ld	a,#1
 949  01ca 5d            	tnzw	x
 950  01cb 2704          	jreq	L641
 951  01cd               L051:
 952  01cd 48            	sll	a
 953  01ce 5a            	decw	x
 954  01cf 26fc          	jrne	L051
 955  01d1               L641:
 956  01d1 ca50ca        	or	a,20682
 958  01d4 2011          	jp	LC001
 959  01d6               L333:
 960                     ; 302             CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 962  01d6 a40f          	and	a,#15
 963  01d8 5f            	clrw	x
 964  01d9 97            	ld	xl,a
 965  01da a601          	ld	a,#1
 966  01dc 5d            	tnzw	x
 967  01dd 2704          	jreq	L251
 968  01df               L451:
 969  01df 48            	sll	a
 970  01e0 5a            	decw	x
 971  01e1 26fc          	jrne	L451
 972  01e3               L251:
 973  01e3 43            	cpl	a
 974  01e4 c450ca        	and	a,20682
 975  01e7               LC001:
 976  01e7 c750ca        	ld	20682,a
 977  01ea               L133:
 978                     ; 306 }
 981  01ea 85            	popw	x
 982  01eb 81            	ret	
1169                     ; 319 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1169                     ; 320 {
1170                     	switch	.text
1171  01ec               _CLK_ClockSwitchConfig:
1173  01ec 89            	pushw	x
1174  01ed 5204          	subw	sp,#4
1175       00000004      OFST:	set	4
1178                     ; 323     uint16_t DownCounter = CLK_TIMEOUT;
1180  01ef ae0491        	ldw	x,#1169
1181  01f2 1f03          	ldw	(OFST-1,sp),x
1183                     ; 324     ErrorStatus Swif = ERROR;
1185                     ; 327     assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1187  01f4 7b06          	ld	a,(OFST+2,sp)
1188  01f6 a1e1          	cp	a,#225
1189  01f8 2716          	jreq	L461
1190  01fa a1d2          	cp	a,#210
1191  01fc 2712          	jreq	L461
1192  01fe a1b4          	cp	a,#180
1193  0200 270e          	jreq	L461
1194  0202 ae0147        	ldw	x,#327
1195  0205 89            	pushw	x
1196  0206 5f            	clrw	x
1197  0207 89            	pushw	x
1198  0208 ae000c        	ldw	x,#L75
1199  020b cd0000        	call	_assert_failed
1201  020e 5b04          	addw	sp,#4
1202  0210               L461:
1203                     ; 328     assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1205  0210 7b05          	ld	a,(OFST+1,sp)
1206  0212 2711          	jreq	L471
1207  0214 4a            	dec	a
1208  0215 270e          	jreq	L471
1209  0217 ae0148        	ldw	x,#328
1210  021a 89            	pushw	x
1211  021b 5f            	clrw	x
1212  021c 89            	pushw	x
1213  021d ae000c        	ldw	x,#L75
1214  0220 cd0000        	call	_assert_failed
1216  0223 5b04          	addw	sp,#4
1217  0225               L471:
1218                     ; 329     assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1220  0225 7b09          	ld	a,(OFST+5,sp)
1221  0227 2711          	jreq	L402
1222  0229 4a            	dec	a
1223  022a 270e          	jreq	L402
1224  022c ae0149        	ldw	x,#329
1225  022f 89            	pushw	x
1226  0230 5f            	clrw	x
1227  0231 89            	pushw	x
1228  0232 ae000c        	ldw	x,#L75
1229  0235 cd0000        	call	_assert_failed
1231  0238 5b04          	addw	sp,#4
1232  023a               L402:
1233                     ; 330     assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1235  023a 7b0a          	ld	a,(OFST+6,sp)
1236  023c 2711          	jreq	L412
1237  023e 4a            	dec	a
1238  023f 270e          	jreq	L412
1239  0241 ae014a        	ldw	x,#330
1240  0244 89            	pushw	x
1241  0245 5f            	clrw	x
1242  0246 89            	pushw	x
1243  0247 ae000c        	ldw	x,#L75
1244  024a cd0000        	call	_assert_failed
1246  024d 5b04          	addw	sp,#4
1247  024f               L412:
1248                     ; 333     clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1250  024f c650c3        	ld	a,20675
1251  0252 6b01          	ld	(OFST-3,sp),a
1253                     ; 336     if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1255  0254 7b05          	ld	a,(OFST+1,sp)
1256  0256 4a            	dec	a
1257  0257 262d          	jrne	L544
1258                     ; 340         CLK->SWCR |= CLK_SWCR_SWEN;
1260  0259 721250c5      	bset	20677,#1
1261                     ; 343         if (ITState != DISABLE)
1263  025d 7b09          	ld	a,(OFST+5,sp)
1264  025f 2706          	jreq	L744
1265                     ; 345             CLK->SWCR |= CLK_SWCR_SWIEN;
1267  0261 721450c5      	bset	20677,#2
1269  0265 2004          	jra	L154
1270  0267               L744:
1271                     ; 349             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1273  0267 721550c5      	bres	20677,#2
1274  026b               L154:
1275                     ; 353         CLK->SWR = (uint8_t)CLK_NewClock;
1277  026b 7b06          	ld	a,(OFST+2,sp)
1278  026d c750c4        	ld	20676,a
1280  0270 2003          	jra	L754
1281  0272               L354:
1282                     ; 357             DownCounter--;
1284  0272 5a            	decw	x
1285  0273 1f03          	ldw	(OFST-1,sp),x
1287  0275               L754:
1288                     ; 355         while ((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1290  0275 720150c504    	btjf	20677,#0,L364
1292  027a 1e03          	ldw	x,(OFST-1,sp)
1293  027c 26f4          	jrne	L354
1294  027e               L364:
1295                     ; 360         if (DownCounter != 0)
1297  027e 1e03          	ldw	x,(OFST-1,sp)
1298                     ; 362             Swif = SUCCESS;
1300  0280 2617          	jrne	LC003
1301                     ; 366             Swif = ERROR;
1303  0282 0f02          	clr	(OFST-2,sp)
1305  0284 2017          	jra	L174
1306  0286               L544:
1307                     ; 374         if (ITState != DISABLE)
1309  0286 7b09          	ld	a,(OFST+5,sp)
1310  0288 2706          	jreq	L374
1311                     ; 376             CLK->SWCR |= CLK_SWCR_SWIEN;
1313  028a 721450c5      	bset	20677,#2
1315  028e 2004          	jra	L574
1316  0290               L374:
1317                     ; 380             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1319  0290 721550c5      	bres	20677,#2
1320  0294               L574:
1321                     ; 384         CLK->SWR = (uint8_t)CLK_NewClock;
1323  0294 7b06          	ld	a,(OFST+2,sp)
1324  0296 c750c4        	ld	20676,a
1325                     ; 388         Swif = SUCCESS;
1327  0299               LC003:
1329  0299 a601          	ld	a,#1
1330  029b 6b02          	ld	(OFST-2,sp),a
1332  029d               L174:
1333                     ; 393     if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1335  029d 7b0a          	ld	a,(OFST+6,sp)
1336  029f 260c          	jrne	L774
1338  02a1 7b01          	ld	a,(OFST-3,sp)
1339  02a3 a1e1          	cp	a,#225
1340  02a5 2606          	jrne	L774
1341                     ; 395         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1343  02a7 721150c0      	bres	20672,#0
1345  02ab 201e          	jra	L105
1346  02ad               L774:
1347                     ; 397     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1349  02ad 7b0a          	ld	a,(OFST+6,sp)
1350  02af 260c          	jrne	L305
1352  02b1 7b01          	ld	a,(OFST-3,sp)
1353  02b3 a1d2          	cp	a,#210
1354  02b5 2606          	jrne	L305
1355                     ; 399         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1357  02b7 721750c0      	bres	20672,#3
1359  02bb 200e          	jra	L105
1360  02bd               L305:
1361                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1363  02bd 7b0a          	ld	a,(OFST+6,sp)
1364  02bf 260a          	jrne	L105
1366  02c1 7b01          	ld	a,(OFST-3,sp)
1367  02c3 a1b4          	cp	a,#180
1368  02c5 2604          	jrne	L105
1369                     ; 403         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1371  02c7 721150c1      	bres	20673,#0
1372  02cb               L105:
1373                     ; 406     return(Swif);
1375  02cb 7b02          	ld	a,(OFST-2,sp)
1378  02cd 5b06          	addw	sp,#6
1379  02cf 81            	ret	
1518                     ; 416 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1518                     ; 417 {
1519                     	switch	.text
1520  02d0               _CLK_HSIPrescalerConfig:
1522  02d0 88            	push	a
1523       00000000      OFST:	set	0
1526                     ; 420     assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1528  02d1 4d            	tnz	a
1529  02d2 271a          	jreq	L622
1530  02d4 a108          	cp	a,#8
1531  02d6 2716          	jreq	L622
1532  02d8 a110          	cp	a,#16
1533  02da 2712          	jreq	L622
1534  02dc a118          	cp	a,#24
1535  02de 270e          	jreq	L622
1536  02e0 ae01a4        	ldw	x,#420
1537  02e3 89            	pushw	x
1538  02e4 5f            	clrw	x
1539  02e5 89            	pushw	x
1540  02e6 ae000c        	ldw	x,#L75
1541  02e9 cd0000        	call	_assert_failed
1543  02ec 5b04          	addw	sp,#4
1544  02ee               L622:
1545                     ; 423     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1547  02ee c650c6        	ld	a,20678
1548  02f1 a4e7          	and	a,#231
1549  02f3 c750c6        	ld	20678,a
1550                     ; 426     CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1552  02f6 c650c6        	ld	a,20678
1553  02f9 1a01          	or	a,(OFST+1,sp)
1554  02fb c750c6        	ld	20678,a
1555                     ; 428 }
1558  02fe 84            	pop	a
1559  02ff 81            	ret	
1695                     ; 439 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1695                     ; 440 {
1696                     	switch	.text
1697  0300               _CLK_CCOConfig:
1699  0300 88            	push	a
1700       00000000      OFST:	set	0
1703                     ; 443     assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1705  0301 4d            	tnz	a
1706  0302 273e          	jreq	L042
1707  0304 a104          	cp	a,#4
1708  0306 273a          	jreq	L042
1709  0308 a102          	cp	a,#2
1710  030a 2736          	jreq	L042
1711  030c a108          	cp	a,#8
1712  030e 2732          	jreq	L042
1713  0310 a10a          	cp	a,#10
1714  0312 272e          	jreq	L042
1715  0314 a10c          	cp	a,#12
1716  0316 272a          	jreq	L042
1717  0318 a10e          	cp	a,#14
1718  031a 2726          	jreq	L042
1719  031c a110          	cp	a,#16
1720  031e 2722          	jreq	L042
1721  0320 a112          	cp	a,#18
1722  0322 271e          	jreq	L042
1723  0324 a114          	cp	a,#20
1724  0326 271a          	jreq	L042
1725  0328 a116          	cp	a,#22
1726  032a 2716          	jreq	L042
1727  032c a118          	cp	a,#24
1728  032e 2712          	jreq	L042
1729  0330 a11a          	cp	a,#26
1730  0332 270e          	jreq	L042
1731  0334 ae01bb        	ldw	x,#443
1732  0337 89            	pushw	x
1733  0338 5f            	clrw	x
1734  0339 89            	pushw	x
1735  033a ae000c        	ldw	x,#L75
1736  033d cd0000        	call	_assert_failed
1738  0340 5b04          	addw	sp,#4
1739  0342               L042:
1740                     ; 446     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1742  0342 c650c9        	ld	a,20681
1743  0345 a4e1          	and	a,#225
1744  0347 c750c9        	ld	20681,a
1745                     ; 449     CLK->CCOR |= (uint8_t)CLK_CCO;
1747  034a c650c9        	ld	a,20681
1748  034d 1a01          	or	a,(OFST+1,sp)
1749  034f c750c9        	ld	20681,a
1750                     ; 452     CLK->CCOR |= CLK_CCOR_CCOEN;
1752  0352 721050c9      	bset	20681,#0
1753                     ; 454 }
1756  0356 84            	pop	a
1757  0357 81            	ret	
1823                     ; 464 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1823                     ; 465 {
1824                     	switch	.text
1825  0358               _CLK_ITConfig:
1827  0358 89            	pushw	x
1828       00000000      OFST:	set	0
1831                     ; 468     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1833  0359 9f            	ld	a,xl
1834  035a 4d            	tnz	a
1835  035b 2712          	jreq	L252
1836  035d 9f            	ld	a,xl
1837  035e 4a            	dec	a
1838  035f 270e          	jreq	L252
1839  0361 ae01d4        	ldw	x,#468
1840  0364 89            	pushw	x
1841  0365 5f            	clrw	x
1842  0366 89            	pushw	x
1843  0367 ae000c        	ldw	x,#L75
1844  036a cd0000        	call	_assert_failed
1846  036d 5b04          	addw	sp,#4
1847  036f               L252:
1848                     ; 469     assert_param(IS_CLK_IT_OK(CLK_IT));
1850  036f 7b01          	ld	a,(OFST+1,sp)
1851  0371 a10c          	cp	a,#12
1852  0373 2712          	jreq	L262
1853  0375 a11c          	cp	a,#28
1854  0377 270e          	jreq	L262
1855  0379 ae01d5        	ldw	x,#469
1856  037c 89            	pushw	x
1857  037d 5f            	clrw	x
1858  037e 89            	pushw	x
1859  037f ae000c        	ldw	x,#L75
1860  0382 cd0000        	call	_assert_failed
1862  0385 5b04          	addw	sp,#4
1863  0387               L262:
1864                     ; 471     if (NewState != DISABLE)
1866  0387 7b02          	ld	a,(OFST+2,sp)
1867  0389 2716          	jreq	L507
1868                     ; 473         switch (CLK_IT)
1870  038b 7b01          	ld	a,(OFST+1,sp)
1872                     ; 481         default:
1872                     ; 482             break;
1873  038d a00c          	sub	a,#12
1874  038f 270a          	jreq	L146
1875  0391 a010          	sub	a,#16
1876  0393 2620          	jrne	L317
1877                     ; 475         case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1877                     ; 476             CLK->SWCR |= CLK_SWCR_SWIEN;
1879  0395 721450c5      	bset	20677,#2
1880                     ; 477             break;
1882  0399 201a          	jra	L317
1883  039b               L146:
1884                     ; 478         case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1884                     ; 479             CLK->CSSR |= CLK_CSSR_CSSDIE;
1886  039b 721450c8      	bset	20680,#2
1887                     ; 480             break;
1889  039f 2014          	jra	L317
1890                     ; 481         default:
1890                     ; 482             break;
1893  03a1               L507:
1894                     ; 487         switch (CLK_IT)
1896  03a1 7b01          	ld	a,(OFST+1,sp)
1898                     ; 495         default:
1898                     ; 496             break;
1899  03a3 a00c          	sub	a,#12
1900  03a5 270a          	jreq	L746
1901  03a7 a010          	sub	a,#16
1902  03a9 260a          	jrne	L317
1903                     ; 489         case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1903                     ; 490             CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1905  03ab 721550c5      	bres	20677,#2
1906                     ; 491             break;
1908  03af 2004          	jra	L317
1909  03b1               L746:
1910                     ; 492         case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1910                     ; 493             CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1912  03b1 721550c8      	bres	20680,#2
1913                     ; 494             break;
1914  03b5               L317:
1915                     ; 500 }
1918  03b5 85            	popw	x
1919  03b6 81            	ret	
1920                     ; 495         default:
1920                     ; 496             break;
1957                     ; 507 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1957                     ; 508 {
1958                     	switch	.text
1959  03b7               _CLK_SYSCLKConfig:
1961  03b7 88            	push	a
1962       00000000      OFST:	set	0
1965                     ; 511     assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1967  03b8 4d            	tnz	a
1968  03b9 273a          	jreq	L472
1969  03bb a108          	cp	a,#8
1970  03bd 2736          	jreq	L472
1971  03bf a110          	cp	a,#16
1972  03c1 2732          	jreq	L472
1973  03c3 a118          	cp	a,#24
1974  03c5 272e          	jreq	L472
1975  03c7 a180          	cp	a,#128
1976  03c9 272a          	jreq	L472
1977  03cb a181          	cp	a,#129
1978  03cd 2726          	jreq	L472
1979  03cf a182          	cp	a,#130
1980  03d1 2722          	jreq	L472
1981  03d3 a183          	cp	a,#131
1982  03d5 271e          	jreq	L472
1983  03d7 a184          	cp	a,#132
1984  03d9 271a          	jreq	L472
1985  03db a185          	cp	a,#133
1986  03dd 2716          	jreq	L472
1987  03df a186          	cp	a,#134
1988  03e1 2712          	jreq	L472
1989  03e3 a187          	cp	a,#135
1990  03e5 270e          	jreq	L472
1991  03e7 ae01ff        	ldw	x,#511
1992  03ea 89            	pushw	x
1993  03eb 5f            	clrw	x
1994  03ec 89            	pushw	x
1995  03ed ae000c        	ldw	x,#L75
1996  03f0 cd0000        	call	_assert_failed
1998  03f3 5b04          	addw	sp,#4
1999  03f5               L472:
2000                     ; 513     if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
2002  03f5 7b01          	ld	a,(OFST+1,sp)
2003  03f7 2b0e          	jrmi	L737
2004                     ; 515         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
2006  03f9 c650c6        	ld	a,20678
2007  03fc a4e7          	and	a,#231
2008  03fe c750c6        	ld	20678,a
2009                     ; 516         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
2011  0401 7b01          	ld	a,(OFST+1,sp)
2012  0403 a418          	and	a,#24
2014  0405 200c          	jra	L147
2015  0407               L737:
2016                     ; 520         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
2018  0407 c650c6        	ld	a,20678
2019  040a a4f8          	and	a,#248
2020  040c c750c6        	ld	20678,a
2021                     ; 521         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
2023  040f 7b01          	ld	a,(OFST+1,sp)
2024  0411 a407          	and	a,#7
2025  0413               L147:
2026  0413 ca50c6        	or	a,20678
2027  0416 c750c6        	ld	20678,a
2028                     ; 524 }
2031  0419 84            	pop	a
2032  041a 81            	ret	
2089                     ; 531 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
2089                     ; 532 {
2090                     	switch	.text
2091  041b               _CLK_SWIMConfig:
2093  041b 88            	push	a
2094       00000000      OFST:	set	0
2097                     ; 535     assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
2099  041c 4d            	tnz	a
2100  041d 2711          	jreq	L603
2101  041f 4a            	dec	a
2102  0420 270e          	jreq	L603
2103  0422 ae0217        	ldw	x,#535
2104  0425 89            	pushw	x
2105  0426 5f            	clrw	x
2106  0427 89            	pushw	x
2107  0428 ae000c        	ldw	x,#L75
2108  042b cd0000        	call	_assert_failed
2110  042e 5b04          	addw	sp,#4
2111  0430               L603:
2112                     ; 537     if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
2114  0430 7b01          	ld	a,(OFST+1,sp)
2115  0432 2706          	jreq	L177
2116                     ; 540         CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
2118  0434 721050cd      	bset	20685,#0
2120  0438 2004          	jra	L377
2121  043a               L177:
2122                     ; 545         CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
2124  043a 721150cd      	bres	20685,#0
2125  043e               L377:
2126                     ; 548 }
2129  043e 84            	pop	a
2130  043f 81            	ret	
2154                     ; 557 void CLK_ClockSecuritySystemEnable(void)
2154                     ; 558 {
2155                     	switch	.text
2156  0440               _CLK_ClockSecuritySystemEnable:
2160                     ; 560     CLK->CSSR |= CLK_CSSR_CSSEN;
2162  0440 721050c8      	bset	20680,#0
2163                     ; 561 }
2166  0444 81            	ret	
2191                     ; 569 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
2191                     ; 570 {
2192                     	switch	.text
2193  0445               _CLK_GetSYSCLKSource:
2197                     ; 571     return((CLK_Source_TypeDef)CLK->CMSR);
2199  0445 c650c3        	ld	a,20675
2202  0448 81            	ret	
2259                     ; 579 uint32_t CLK_GetClockFreq(void)
2259                     ; 580 {
2260                     	switch	.text
2261  0449               _CLK_GetClockFreq:
2263  0449 5209          	subw	sp,#9
2264       00000009      OFST:	set	9
2267                     ; 582     uint32_t clockfrequency = 0;
2269                     ; 583     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2271                     ; 584     uint8_t tmp = 0, presc = 0;
2275                     ; 587     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2277  044b c650c3        	ld	a,20675
2278  044e 6b09          	ld	(OFST+0,sp),a
2280                     ; 589     if (clocksource == CLK_SOURCE_HSI)
2282  0450 a1e1          	cp	a,#225
2283  0452 2634          	jrne	L1401
2284                     ; 591         tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2286  0454 c650c6        	ld	a,20678
2287  0457 a418          	and	a,#24
2288  0459 44            	srl	a
2289  045a 44            	srl	a
2290  045b 44            	srl	a
2292                     ; 592         tmp = (uint8_t)(tmp >> 3);
2295                     ; 593         presc = HSIDivFactor[tmp];
2297  045c 5f            	clrw	x
2298  045d 97            	ld	xl,a
2299  045e d60000        	ld	a,(_HSIDivFactor,x)
2300  0461 6b09          	ld	(OFST+0,sp),a
2302                     ; 594         clockfrequency = HSI_VALUE / presc;
2304  0463 b703          	ld	c_lreg+3,a
2305  0465 3f02          	clr	c_lreg+2
2306  0467 3f01          	clr	c_lreg+1
2307  0469 3f00          	clr	c_lreg
2308  046b 96            	ldw	x,sp
2309  046c 5c            	incw	x
2310  046d cd0000        	call	c_rtol
2313  0470 ae2400        	ldw	x,#9216
2314  0473 bf02          	ldw	c_lreg+2,x
2315  0475 ae00f4        	ldw	x,#244
2316  0478 bf00          	ldw	c_lreg,x
2317  047a 96            	ldw	x,sp
2318  047b 5c            	incw	x
2319  047c cd0000        	call	c_ludv
2321  047f 96            	ldw	x,sp
2322  0480 1c0005        	addw	x,#OFST-4
2323  0483 cd0000        	call	c_rtol
2327  0486 2018          	jra	L3401
2328  0488               L1401:
2329                     ; 596     else if ( clocksource == CLK_SOURCE_LSI)
2331  0488 a1d2          	cp	a,#210
2332  048a 260a          	jrne	L5401
2333                     ; 598         clockfrequency = LSI_VALUE;
2335  048c aef400        	ldw	x,#62464
2336  048f 1f07          	ldw	(OFST-2,sp),x
2337  0491 ae0001        	ldw	x,#1
2339  0494 2008          	jp	LC004
2340  0496               L5401:
2341                     ; 602         clockfrequency = HSE_VALUE;
2343  0496 ae2400        	ldw	x,#9216
2344  0499 1f07          	ldw	(OFST-2,sp),x
2345  049b ae00f4        	ldw	x,#244
2346  049e               LC004:
2347  049e 1f05          	ldw	(OFST-4,sp),x
2349  04a0               L3401:
2350                     ; 605     return((uint32_t)clockfrequency);
2352  04a0 96            	ldw	x,sp
2353  04a1 1c0005        	addw	x,#OFST-4
2354  04a4 cd0000        	call	c_ltor
2358  04a7 5b09          	addw	sp,#9
2359  04a9 81            	ret	
2459                     ; 616 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2459                     ; 617 {
2460                     	switch	.text
2461  04aa               _CLK_AdjustHSICalibrationValue:
2463  04aa 88            	push	a
2464       00000000      OFST:	set	0
2467                     ; 620     assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2469  04ab 4d            	tnz	a
2470  04ac 272a          	jreq	L623
2471  04ae a101          	cp	a,#1
2472  04b0 2726          	jreq	L623
2473  04b2 a102          	cp	a,#2
2474  04b4 2722          	jreq	L623
2475  04b6 a103          	cp	a,#3
2476  04b8 271e          	jreq	L623
2477  04ba a104          	cp	a,#4
2478  04bc 271a          	jreq	L623
2479  04be a105          	cp	a,#5
2480  04c0 2716          	jreq	L623
2481  04c2 a106          	cp	a,#6
2482  04c4 2712          	jreq	L623
2483  04c6 a107          	cp	a,#7
2484  04c8 270e          	jreq	L623
2485  04ca ae026c        	ldw	x,#620
2486  04cd 89            	pushw	x
2487  04ce 5f            	clrw	x
2488  04cf 89            	pushw	x
2489  04d0 ae000c        	ldw	x,#L75
2490  04d3 cd0000        	call	_assert_failed
2492  04d6 5b04          	addw	sp,#4
2493  04d8               L623:
2494                     ; 623     CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2496  04d8 c650cc        	ld	a,20684
2497  04db a4f8          	and	a,#248
2498  04dd 1a01          	or	a,(OFST+1,sp)
2499  04df c750cc        	ld	20684,a
2500                     ; 625 }
2503  04e2 84            	pop	a
2504  04e3 81            	ret	
2528                     ; 636 void CLK_SYSCLKEmergencyClear(void)
2528                     ; 637 {
2529                     	switch	.text
2530  04e4               _CLK_SYSCLKEmergencyClear:
2534                     ; 638     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2536  04e4 721150c5      	bres	20677,#0
2537                     ; 639 }
2540  04e8 81            	ret	
2690                     ; 648 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2690                     ; 649 {
2691                     	switch	.text
2692  04e9               _CLK_GetFlagStatus:
2694  04e9 89            	pushw	x
2695  04ea 5203          	subw	sp,#3
2696       00000003      OFST:	set	3
2699                     ; 651     uint16_t statusreg = 0;
2701                     ; 652     uint8_t tmpreg = 0;
2703                     ; 653     FlagStatus bitstatus = RESET;
2705                     ; 656     assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2707  04ec a30110        	cpw	x,#272
2708  04ef 2736          	jreq	L243
2709  04f1 a30102        	cpw	x,#258
2710  04f4 2731          	jreq	L243
2711  04f6 a30202        	cpw	x,#514
2712  04f9 272c          	jreq	L243
2713  04fb a30308        	cpw	x,#776
2714  04fe 2727          	jreq	L243
2715  0500 a30301        	cpw	x,#769
2716  0503 2722          	jreq	L243
2717  0505 a30408        	cpw	x,#1032
2718  0508 271d          	jreq	L243
2719  050a a30402        	cpw	x,#1026
2720  050d 2718          	jreq	L243
2721  050f a30504        	cpw	x,#1284
2722  0512 2713          	jreq	L243
2723  0514 a30502        	cpw	x,#1282
2724  0517 270e          	jreq	L243
2725  0519 ae0290        	ldw	x,#656
2726  051c 89            	pushw	x
2727  051d 5f            	clrw	x
2728  051e 89            	pushw	x
2729  051f ae000c        	ldw	x,#L75
2730  0522 cd0000        	call	_assert_failed
2732  0525 5b04          	addw	sp,#4
2733  0527               L243:
2734                     ; 659     statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2736  0527 7b04          	ld	a,(OFST+1,sp)
2737  0529 97            	ld	xl,a
2738  052a 4f            	clr	a
2739  052b 02            	rlwa	x,a
2740  052c 1f01          	ldw	(OFST-2,sp),x
2742                     ; 662     if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2744  052e a30100        	cpw	x,#256
2745  0531 2605          	jrne	L7021
2746                     ; 664         tmpreg = CLK->ICKR;
2748  0533 c650c0        	ld	a,20672
2750  0536 2021          	jra	L1121
2751  0538               L7021:
2752                     ; 666     else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2754  0538 a30200        	cpw	x,#512
2755  053b 2605          	jrne	L3121
2756                     ; 668         tmpreg = CLK->ECKR;
2758  053d c650c1        	ld	a,20673
2760  0540 2017          	jra	L1121
2761  0542               L3121:
2762                     ; 670     else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2764  0542 a30300        	cpw	x,#768
2765  0545 2605          	jrne	L7121
2766                     ; 672         tmpreg = CLK->SWCR;
2768  0547 c650c5        	ld	a,20677
2770  054a 200d          	jra	L1121
2771  054c               L7121:
2772                     ; 674     else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2774  054c a30400        	cpw	x,#1024
2775  054f 2605          	jrne	L3221
2776                     ; 676         tmpreg = CLK->CSSR;
2778  0551 c650c8        	ld	a,20680
2780  0554 2003          	jra	L1121
2781  0556               L3221:
2782                     ; 680         tmpreg = CLK->CCOR;
2784  0556 c650c9        	ld	a,20681
2785  0559               L1121:
2786  0559 6b03          	ld	(OFST+0,sp),a
2788                     ; 683     if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2790  055b 7b05          	ld	a,(OFST+2,sp)
2791  055d 1503          	bcp	a,(OFST+0,sp)
2792  055f 2704          	jreq	L7221
2793                     ; 685         bitstatus = SET;
2795  0561 a601          	ld	a,#1
2798  0563 2001          	jra	L1321
2799  0565               L7221:
2800                     ; 689         bitstatus = RESET;
2802  0565 4f            	clr	a
2804  0566               L1321:
2805                     ; 693     return((FlagStatus)bitstatus);
2809  0566 5b05          	addw	sp,#5
2810  0568 81            	ret	
2857                     ; 703 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2857                     ; 704 {
2858                     	switch	.text
2859  0569               _CLK_GetITStatus:
2861  0569 88            	push	a
2862  056a 88            	push	a
2863       00000001      OFST:	set	1
2866                     ; 706     ITStatus bitstatus = RESET;
2868                     ; 709     assert_param(IS_CLK_IT_OK(CLK_IT));
2870  056b a10c          	cp	a,#12
2871  056d 2712          	jreq	L453
2872  056f a11c          	cp	a,#28
2873  0571 270e          	jreq	L453
2874  0573 ae02c5        	ldw	x,#709
2875  0576 89            	pushw	x
2876  0577 5f            	clrw	x
2877  0578 89            	pushw	x
2878  0579 ae000c        	ldw	x,#L75
2879  057c cd0000        	call	_assert_failed
2881  057f 5b04          	addw	sp,#4
2882  0581               L453:
2883                     ; 711     if (CLK_IT == CLK_IT_SWIF)
2885  0581 7b02          	ld	a,(OFST+1,sp)
2886  0583 a11c          	cp	a,#28
2887  0585 260b          	jrne	L5521
2888                     ; 714         if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2890  0587 c650c5        	ld	a,20677
2891  058a 1402          	and	a,(OFST+1,sp)
2892  058c a10c          	cp	a,#12
2893  058e 260f          	jrne	L5621
2894                     ; 716             bitstatus = SET;
2896  0590 2009          	jp	LC006
2897                     ; 720             bitstatus = RESET;
2898  0592               L5521:
2899                     ; 726         if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2901  0592 c650c8        	ld	a,20680
2902  0595 1402          	and	a,(OFST+1,sp)
2903  0597 a10c          	cp	a,#12
2904  0599 2604          	jrne	L5621
2905                     ; 728             bitstatus = SET;
2907  059b               LC006:
2909  059b a601          	ld	a,#1
2912  059d 2001          	jra	L3621
2913  059f               L5621:
2914                     ; 732             bitstatus = RESET;
2917  059f 4f            	clr	a
2919  05a0               L3621:
2920                     ; 737     return bitstatus;
2924  05a0 85            	popw	x
2925  05a1 81            	ret	
2962                     ; 747 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2962                     ; 748 {
2963                     	switch	.text
2964  05a2               _CLK_ClearITPendingBit:
2966  05a2 88            	push	a
2967       00000000      OFST:	set	0
2970                     ; 751     assert_param(IS_CLK_IT_OK(CLK_IT));
2972  05a3 a10c          	cp	a,#12
2973  05a5 2712          	jreq	L663
2974  05a7 a11c          	cp	a,#28
2975  05a9 270e          	jreq	L663
2976  05ab ae02ef        	ldw	x,#751
2977  05ae 89            	pushw	x
2978  05af 5f            	clrw	x
2979  05b0 89            	pushw	x
2980  05b1 ae000c        	ldw	x,#L75
2981  05b4 cd0000        	call	_assert_failed
2983  05b7 5b04          	addw	sp,#4
2984  05b9               L663:
2985                     ; 753     if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2987  05b9 7b01          	ld	a,(OFST+1,sp)
2988  05bb a10c          	cp	a,#12
2989  05bd 2606          	jrne	L7031
2990                     ; 756         CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2992  05bf 721750c8      	bres	20680,#3
2994  05c3 2004          	jra	L1131
2995  05c5               L7031:
2996                     ; 761         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2998  05c5 721750c5      	bres	20677,#3
2999  05c9               L1131:
3000                     ; 764 }
3003  05c9 84            	pop	a
3004  05ca 81            	ret	
3039                     	xdef	_CLKPrescTable
3040                     	xdef	_HSIDivFactor
3041                     	xdef	_CLK_ClearITPendingBit
3042                     	xdef	_CLK_GetITStatus
3043                     	xdef	_CLK_GetFlagStatus
3044                     	xdef	_CLK_GetSYSCLKSource
3045                     	xdef	_CLK_GetClockFreq
3046                     	xdef	_CLK_AdjustHSICalibrationValue
3047                     	xdef	_CLK_SYSCLKEmergencyClear
3048                     	xdef	_CLK_ClockSecuritySystemEnable
3049                     	xdef	_CLK_SWIMConfig
3050                     	xdef	_CLK_SYSCLKConfig
3051                     	xdef	_CLK_ITConfig
3052                     	xdef	_CLK_CCOConfig
3053                     	xdef	_CLK_HSIPrescalerConfig
3054                     	xdef	_CLK_ClockSwitchConfig
3055                     	xdef	_CLK_PeripheralClockConfig
3056                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
3057                     	xdef	_CLK_FastHaltWakeUpCmd
3058                     	xdef	_CLK_ClockSwitchCmd
3059                     	xdef	_CLK_CCOCmd
3060                     	xdef	_CLK_LSICmd
3061                     	xdef	_CLK_HSICmd
3062                     	xdef	_CLK_HSECmd
3063                     	xdef	_CLK_DeInit
3064                     	xref	_assert_failed
3065                     	switch	.const
3066  000c               L75:
3067  000c 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
3068  001e 6965735c7374  	dc.b	"ies\stm8s_stdperip"
3069  0030 685f64726976  	dc.b	"h_driver\src\stm8s"
3070  0042 5f636c6b2e63  	dc.b	"_clk.c",0
3071                     	xref.b	c_lreg
3072                     	xref.b	c_x
3092                     	xref	c_ltor
3093                     	xref	c_ludv
3094                     	xref	c_rtol
3095                     	end
