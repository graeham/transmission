   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  47                     ; 47 void EXTI_DeInit(void)
  47                     ; 48 {
  49                     	switch	.text
  50  0000               _EXTI_DeInit:
  54                     ; 49     EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  56  0000 725f50a0      	clr	20640
  57                     ; 50     EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  59  0004 725f50a1      	clr	20641
  60                     ; 51 }
  63  0008 81            	ret	
 189                     ; 64 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 189                     ; 65 {
 190                     	switch	.text
 191  0009               _EXTI_SetExtIntSensitivity:
 193  0009 89            	pushw	x
 194       00000000      OFST:	set	0
 197                     ; 68     assert_param(IS_EXTI_PORT_OK(Port));
 199  000a 9e            	ld	a,xh
 200  000b 4d            	tnz	a
 201  000c 2721          	jreq	L41
 202  000e 9e            	ld	a,xh
 203  000f 4a            	dec	a
 204  0010 271d          	jreq	L41
 205  0012 9e            	ld	a,xh
 206  0013 a102          	cp	a,#2
 207  0015 2718          	jreq	L41
 208  0017 9e            	ld	a,xh
 209  0018 a103          	cp	a,#3
 210  001a 2713          	jreq	L41
 211  001c 9e            	ld	a,xh
 212  001d a104          	cp	a,#4
 213  001f 270e          	jreq	L41
 214  0021 ae0044        	ldw	x,#68
 215  0024 89            	pushw	x
 216  0025 5f            	clrw	x
 217  0026 89            	pushw	x
 218  0027 ae0000        	ldw	x,#L111
 219  002a cd0000        	call	_assert_failed
 221  002d 5b04          	addw	sp,#4
 222  002f               L41:
 223                     ; 69     assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 225  002f 7b02          	ld	a,(OFST+2,sp)
 226  0031 271a          	jreq	L42
 227  0033 a101          	cp	a,#1
 228  0035 2716          	jreq	L42
 229  0037 a102          	cp	a,#2
 230  0039 2712          	jreq	L42
 231  003b a103          	cp	a,#3
 232  003d 270e          	jreq	L42
 233  003f ae0045        	ldw	x,#69
 234  0042 89            	pushw	x
 235  0043 5f            	clrw	x
 236  0044 89            	pushw	x
 237  0045 ae0000        	ldw	x,#L111
 238  0048 cd0000        	call	_assert_failed
 240  004b 5b04          	addw	sp,#4
 241  004d               L42:
 242                     ; 72     switch (Port)
 244  004d 7b01          	ld	a,(OFST+1,sp)
 246                     ; 94     default:
 246                     ; 95         break;
 247  004f 270e          	jreq	L12
 248  0051 4a            	dec	a
 249  0052 271a          	jreq	L32
 250  0054 4a            	dec	a
 251  0055 2725          	jreq	L52
 252  0057 4a            	dec	a
 253  0058 2731          	jreq	L72
 254  005a 4a            	dec	a
 255  005b 2745          	jreq	L13
 256  005d 2053          	jra	L511
 257  005f               L12:
 258                     ; 74     case EXTI_PORT_GPIOA:
 258                     ; 75         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 260  005f c650a0        	ld	a,20640
 261  0062 a4fc          	and	a,#252
 262  0064 c750a0        	ld	20640,a
 263                     ; 76         EXTI->CR1 |= (uint8_t)(SensitivityValue);
 265  0067 c650a0        	ld	a,20640
 266  006a 1a02          	or	a,(OFST+2,sp)
 267                     ; 77         break;
 269  006c 202f          	jp	LC001
 270  006e               L32:
 271                     ; 78     case EXTI_PORT_GPIOB:
 271                     ; 79         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 273  006e c650a0        	ld	a,20640
 274  0071 a4f3          	and	a,#243
 275  0073 c750a0        	ld	20640,a
 276                     ; 80         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 278  0076 7b02          	ld	a,(OFST+2,sp)
 279  0078 48            	sll	a
 280  0079 48            	sll	a
 281                     ; 81         break;
 283  007a 201e          	jp	LC002
 284  007c               L52:
 285                     ; 82     case EXTI_PORT_GPIOC:
 285                     ; 83         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 287  007c c650a0        	ld	a,20640
 288  007f a4cf          	and	a,#207
 289  0081 c750a0        	ld	20640,a
 290                     ; 84         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 292  0084 7b02          	ld	a,(OFST+2,sp)
 293  0086 97            	ld	xl,a
 294  0087 a610          	ld	a,#16
 295                     ; 85         break;
 297  0089 200d          	jp	LC003
 298  008b               L72:
 299                     ; 86     case EXTI_PORT_GPIOD:
 299                     ; 87         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 301  008b c650a0        	ld	a,20640
 302  008e a43f          	and	a,#63
 303  0090 c750a0        	ld	20640,a
 304                     ; 88         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 306  0093 7b02          	ld	a,(OFST+2,sp)
 307  0095 97            	ld	xl,a
 308  0096 a640          	ld	a,#64
 309  0098               LC003:
 310  0098 42            	mul	x,a
 311  0099 9f            	ld	a,xl
 312  009a               LC002:
 313  009a ca50a0        	or	a,20640
 314  009d               LC001:
 315  009d c750a0        	ld	20640,a
 316                     ; 89         break;
 318  00a0 2010          	jra	L511
 319  00a2               L13:
 320                     ; 90     case EXTI_PORT_GPIOE:
 320                     ; 91         EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 322  00a2 c650a1        	ld	a,20641
 323  00a5 a4fc          	and	a,#252
 324  00a7 c750a1        	ld	20641,a
 325                     ; 92         EXTI->CR2 |= (uint8_t)(SensitivityValue);
 327  00aa c650a1        	ld	a,20641
 328  00ad 1a02          	or	a,(OFST+2,sp)
 329  00af c750a1        	ld	20641,a
 330                     ; 93         break;
 332                     ; 94     default:
 332                     ; 95         break;
 334  00b2               L511:
 335                     ; 97 }
 338  00b2 85            	popw	x
 339  00b3 81            	ret	
 398                     ; 106 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 398                     ; 107 {
 399                     	switch	.text
 400  00b4               _EXTI_SetTLISensitivity:
 402  00b4 88            	push	a
 403       00000000      OFST:	set	0
 406                     ; 109     assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 408  00b5 4d            	tnz	a
 409  00b6 2712          	jreq	L63
 410  00b8 a104          	cp	a,#4
 411  00ba 270e          	jreq	L63
 412  00bc ae006d        	ldw	x,#109
 413  00bf 89            	pushw	x
 414  00c0 5f            	clrw	x
 415  00c1 89            	pushw	x
 416  00c2 ae0000        	ldw	x,#L111
 417  00c5 cd0000        	call	_assert_failed
 419  00c8 5b04          	addw	sp,#4
 420  00ca               L63:
 421                     ; 112     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 423  00ca 721550a1      	bres	20641,#2
 424                     ; 113     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 426  00ce c650a1        	ld	a,20641
 427  00d1 1a01          	or	a,(OFST+1,sp)
 428  00d3 c750a1        	ld	20641,a
 429                     ; 114 }
 432  00d6 84            	pop	a
 433  00d7 81            	ret	
 478                     ; 121 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 478                     ; 122 {
 479                     	switch	.text
 480  00d8               _EXTI_GetExtIntSensitivity:
 482  00d8 88            	push	a
 483  00d9 88            	push	a
 484       00000001      OFST:	set	1
 487                     ; 123     uint8_t value = 0;
 489  00da 0f01          	clr	(OFST+0,sp)
 491                     ; 126     assert_param(IS_EXTI_PORT_OK(Port));
 493  00dc 4d            	tnz	a
 494  00dd 271e          	jreq	L05
 495  00df a101          	cp	a,#1
 496  00e1 271a          	jreq	L05
 497  00e3 a102          	cp	a,#2
 498  00e5 2716          	jreq	L05
 499  00e7 a103          	cp	a,#3
 500  00e9 2712          	jreq	L05
 501  00eb a104          	cp	a,#4
 502  00ed 270e          	jreq	L05
 503  00ef ae007e        	ldw	x,#126
 504  00f2 89            	pushw	x
 505  00f3 5f            	clrw	x
 506  00f4 89            	pushw	x
 507  00f5 ae0000        	ldw	x,#L111
 508  00f8 cd0000        	call	_assert_failed
 510  00fb 5b04          	addw	sp,#4
 511  00fd               L05:
 512                     ; 128     switch (Port)
 514  00fd 7b02          	ld	a,(OFST+1,sp)
 516                     ; 145     default:
 516                     ; 146         break;
 517  00ff 2710          	jreq	L541
 518  0101 4a            	dec	a
 519  0102 2712          	jreq	L741
 520  0104 4a            	dec	a
 521  0105 2718          	jreq	L151
 522  0107 4a            	dec	a
 523  0108 271b          	jreq	L351
 524  010a 4a            	dec	a
 525  010b 2722          	jreq	L551
 526  010d 7b01          	ld	a,(OFST+0,sp)
 527  010f 2023          	jra	LC004
 528  0111               L541:
 529                     ; 130     case EXTI_PORT_GPIOA:
 529                     ; 131         value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 531  0111 c650a0        	ld	a,20640
 532                     ; 132         break;
 534  0114 201c          	jp	LC005
 535  0116               L741:
 536                     ; 133     case EXTI_PORT_GPIOB:
 536                     ; 134         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 538  0116 c650a0        	ld	a,20640
 539  0119 a40c          	and	a,#12
 540  011b 44            	srl	a
 541  011c 44            	srl	a
 542                     ; 135         break;
 544  011d 2015          	jp	LC004
 545  011f               L151:
 546                     ; 136     case EXTI_PORT_GPIOC:
 546                     ; 137         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 548  011f c650a0        	ld	a,20640
 549  0122 4e            	swap	a
 550                     ; 138         break;
 552  0123 200d          	jp	LC005
 553  0125               L351:
 554                     ; 139     case EXTI_PORT_GPIOD:
 554                     ; 140         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 556  0125 c650a0        	ld	a,20640
 557  0128 4e            	swap	a
 558  0129 a40c          	and	a,#12
 559  012b 44            	srl	a
 560  012c 44            	srl	a
 561                     ; 141         break;
 563  012d 2003          	jp	LC005
 564  012f               L551:
 565                     ; 142     case EXTI_PORT_GPIOE:
 565                     ; 143         value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 567  012f c650a1        	ld	a,20641
 568  0132               LC005:
 569  0132 a403          	and	a,#3
 570  0134               LC004:
 572                     ; 144         break;
 574                     ; 145     default:
 574                     ; 146         break;
 576                     ; 149     return((EXTI_Sensitivity_TypeDef)value);
 580  0134 85            	popw	x
 581  0135 81            	ret	
 615                     ; 157 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 615                     ; 158 {
 616                     	switch	.text
 617  0136               _EXTI_GetTLISensitivity:
 619  0136 88            	push	a
 620       00000001      OFST:	set	1
 623                     ; 160     uint8_t value = 0;
 625                     ; 163     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 627  0137 c650a1        	ld	a,20641
 628  013a a404          	and	a,#4
 630                     ; 165     return((EXTI_TLISensitivity_TypeDef)value);
 634  013c 5b01          	addw	sp,#1
 635  013e 81            	ret	
 648                     	xdef	_EXTI_GetTLISensitivity
 649                     	xdef	_EXTI_GetExtIntSensitivity
 650                     	xdef	_EXTI_SetTLISensitivity
 651                     	xdef	_EXTI_SetExtIntSensitivity
 652                     	xdef	_EXTI_DeInit
 653                     	xref	_assert_failed
 654                     .const:	section	.text
 655  0000               L111:
 656  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
 657  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
 658  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
 659  0036 5f657874692e  	dc.b	"_exti.c",0
 679                     	end