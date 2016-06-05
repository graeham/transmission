   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  47                     ; 48 void UART3_DeInit(void)
  47                     ; 49 {
  49                     	switch	.text
  50  0000               _UART3_DeInit:
  54                     ; 52     (void) UART3->SR;
  56  0000 c65240        	ld	a,21056
  57                     ; 53     (void) UART3->DR;
  59  0003 c65241        	ld	a,21057
  60                     ; 55     UART3->BRR2 = UART3_BRR2_RESET_VALUE; /*Set UART3_BRR2 to reset value 0x00 */
  62  0006 725f5243      	clr	21059
  63                     ; 56     UART3->BRR1 = UART3_BRR1_RESET_VALUE; /*Set UART3_BRR1 to reset value 0x00 */
  65  000a 725f5242      	clr	21058
  66                     ; 58     UART3->CR1 = UART3_CR1_RESET_VALUE;  /*Set UART3_CR1 to reset value 0x00  */
  68  000e 725f5244      	clr	21060
  69                     ; 59     UART3->CR2 = UART3_CR2_RESET_VALUE;  /*Set UART3_CR2 to reset value 0x00  */
  71  0012 725f5245      	clr	21061
  72                     ; 60     UART3->CR3 = UART3_CR3_RESET_VALUE;  /*Set UART3_CR3 to reset value 0x00  */
  74  0016 725f5246      	clr	21062
  75                     ; 61     UART3->CR4 = UART3_CR4_RESET_VALUE;  /*Set UART3_CR4 to reset value 0x00  */
  77  001a 725f5247      	clr	21063
  78                     ; 62     UART3->CR6 = UART3_CR6_RESET_VALUE;  /*Set UART3_CR6 to reset value 0x00  */
  80  001e 725f5249      	clr	21065
  81                     ; 64 }
  84  0022 81            	ret	
 302                     .const:	section	.text
 303  0000               L24:
 304  0000 00098969      	dc.l	625001
 305  0004               L46:
 306  0004 00000064      	dc.l	100
 307                     ; 78 void UART3_Init(uint32_t BaudRate, UART3_WordLength_TypeDef WordLength, 
 307                     ; 79                 UART3_StopBits_TypeDef StopBits, UART3_Parity_TypeDef Parity, 
 307                     ; 80                 UART3_Mode_TypeDef Mode)
 307                     ; 81 {
 308                     	switch	.text
 309  0023               _UART3_Init:
 311  0023 520e          	subw	sp,#14
 312       0000000e      OFST:	set	14
 315                     ; 82     uint8_t BRR2_1 = 0, BRR2_2 = 0;
 319                     ; 83     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 323                     ; 86     assert_param(IS_UART3_WORDLENGTH_OK(WordLength));
 325  0025 7b15          	ld	a,(OFST+7,sp)
 326  0027 2712          	jreq	L41
 327  0029 a110          	cp	a,#16
 328  002b 270e          	jreq	L41
 329  002d ae0056        	ldw	x,#86
 330  0030 89            	pushw	x
 331  0031 5f            	clrw	x
 332  0032 89            	pushw	x
 333  0033 ae0008        	ldw	x,#L531
 334  0036 cd0000        	call	_assert_failed
 336  0039 5b04          	addw	sp,#4
 337  003b               L41:
 338                     ; 87     assert_param(IS_UART3_STOPBITS_OK(StopBits));
 340  003b 7b16          	ld	a,(OFST+8,sp)
 341  003d 2712          	jreq	L42
 342  003f a120          	cp	a,#32
 343  0041 270e          	jreq	L42
 344  0043 ae0057        	ldw	x,#87
 345  0046 89            	pushw	x
 346  0047 5f            	clrw	x
 347  0048 89            	pushw	x
 348  0049 ae0008        	ldw	x,#L531
 349  004c cd0000        	call	_assert_failed
 351  004f 5b04          	addw	sp,#4
 352  0051               L42:
 353                     ; 88     assert_param(IS_UART3_PARITY_OK(Parity));
 355  0051 7b17          	ld	a,(OFST+9,sp)
 356  0053 2716          	jreq	L43
 357  0055 a104          	cp	a,#4
 358  0057 2712          	jreq	L43
 359  0059 a106          	cp	a,#6
 360  005b 270e          	jreq	L43
 361  005d ae0058        	ldw	x,#88
 362  0060 89            	pushw	x
 363  0061 5f            	clrw	x
 364  0062 89            	pushw	x
 365  0063 ae0008        	ldw	x,#L531
 366  0066 cd0000        	call	_assert_failed
 368  0069 5b04          	addw	sp,#4
 369  006b               L43:
 370                     ; 89     assert_param(IS_UART3_BAUDRATE_OK(BaudRate));
 372  006b 96            	ldw	x,sp
 373  006c 1c0011        	addw	x,#OFST+3
 374  006f cd0000        	call	c_ltor
 376  0072 ae0000        	ldw	x,#L24
 377  0075 cd0000        	call	c_lcmp
 379  0078 250e          	jrult	L44
 380  007a ae0059        	ldw	x,#89
 381  007d 89            	pushw	x
 382  007e 5f            	clrw	x
 383  007f 89            	pushw	x
 384  0080 ae0008        	ldw	x,#L531
 385  0083 cd0000        	call	_assert_failed
 387  0086 5b04          	addw	sp,#4
 388  0088               L44:
 389                     ; 90     assert_param(IS_UART3_MODE_OK((uint8_t)Mode));
 391  0088 7b18          	ld	a,(OFST+10,sp)
 392  008a a108          	cp	a,#8
 393  008c 272a          	jreq	L45
 394  008e a140          	cp	a,#64
 395  0090 2726          	jreq	L45
 396  0092 a104          	cp	a,#4
 397  0094 2722          	jreq	L45
 398  0096 a180          	cp	a,#128
 399  0098 271e          	jreq	L45
 400  009a a10c          	cp	a,#12
 401  009c 271a          	jreq	L45
 402  009e a144          	cp	a,#68
 403  00a0 2716          	jreq	L45
 404  00a2 a1c0          	cp	a,#192
 405  00a4 2712          	jreq	L45
 406  00a6 a188          	cp	a,#136
 407  00a8 270e          	jreq	L45
 408  00aa ae005a        	ldw	x,#90
 409  00ad 89            	pushw	x
 410  00ae 5f            	clrw	x
 411  00af 89            	pushw	x
 412  00b0 ae0008        	ldw	x,#L531
 413  00b3 cd0000        	call	_assert_failed
 415  00b6 5b04          	addw	sp,#4
 416  00b8               L45:
 417                     ; 93     UART3->CR1 &= (uint8_t)(~UART3_CR1_M);     
 419  00b8 72195244      	bres	21060,#4
 420                     ; 95     UART3->CR1 |= (uint8_t)WordLength; 
 422  00bc c65244        	ld	a,21060
 423  00bf 1a15          	or	a,(OFST+7,sp)
 424  00c1 c75244        	ld	21060,a
 425                     ; 98     UART3->CR3 &= (uint8_t)(~UART3_CR3_STOP);  
 427  00c4 c65246        	ld	a,21062
 428  00c7 a4cf          	and	a,#207
 429  00c9 c75246        	ld	21062,a
 430                     ; 100     UART3->CR3 |= (uint8_t)StopBits;  
 432  00cc c65246        	ld	a,21062
 433  00cf 1a16          	or	a,(OFST+8,sp)
 434  00d1 c75246        	ld	21062,a
 435                     ; 103     UART3->CR1 &= (uint8_t)(~(UART3_CR1_PCEN | UART3_CR1_PS));  
 437  00d4 c65244        	ld	a,21060
 438  00d7 a4f9          	and	a,#249
 439  00d9 c75244        	ld	21060,a
 440                     ; 105     UART3->CR1 |= (uint8_t)Parity;     
 442  00dc c65244        	ld	a,21060
 443  00df 1a17          	or	a,(OFST+9,sp)
 444  00e1 c75244        	ld	21060,a
 445                     ; 108     UART3->BRR1 &= (uint8_t)(~UART3_BRR1_DIVM);  
 447  00e4 725f5242      	clr	21058
 448                     ; 110     UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVM);  
 450  00e8 c65243        	ld	a,21059
 451  00eb a40f          	and	a,#15
 452  00ed c75243        	ld	21059,a
 453                     ; 112     UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVF);  
 455  00f0 c65243        	ld	a,21059
 456  00f3 a4f0          	and	a,#240
 457  00f5 c75243        	ld	21059,a
 458                     ; 115     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 460  00f8 96            	ldw	x,sp
 461  00f9 1c0011        	addw	x,#OFST+3
 462  00fc cd0000        	call	c_ltor
 464  00ff a604          	ld	a,#4
 465  0101 cd0000        	call	c_llsh
 467  0104 96            	ldw	x,sp
 468  0105 5c            	incw	x
 469  0106 cd0000        	call	c_rtol
 472  0109 cd0000        	call	_CLK_GetClockFreq
 474  010c 96            	ldw	x,sp
 475  010d 5c            	incw	x
 476  010e cd0000        	call	c_ludv
 478  0111 96            	ldw	x,sp
 479  0112 1c000b        	addw	x,#OFST-3
 480  0115 cd0000        	call	c_rtol
 483                     ; 116     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 485  0118 96            	ldw	x,sp
 486  0119 1c0011        	addw	x,#OFST+3
 487  011c cd0000        	call	c_ltor
 489  011f a604          	ld	a,#4
 490  0121 cd0000        	call	c_llsh
 492  0124 96            	ldw	x,sp
 493  0125 5c            	incw	x
 494  0126 cd0000        	call	c_rtol
 497  0129 cd0000        	call	_CLK_GetClockFreq
 499  012c a664          	ld	a,#100
 500  012e cd0000        	call	c_smul
 502  0131 96            	ldw	x,sp
 503  0132 5c            	incw	x
 504  0133 cd0000        	call	c_ludv
 506  0136 96            	ldw	x,sp
 507  0137 1c0007        	addw	x,#OFST-7
 508  013a cd0000        	call	c_rtol
 511                     ; 119     BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 511                     ; 120                         << 4) / 100) & (uint8_t)0x0F); 
 513  013d 96            	ldw	x,sp
 514  013e 1c000b        	addw	x,#OFST-3
 515  0141 cd0000        	call	c_ltor
 517  0144 a664          	ld	a,#100
 518  0146 cd0000        	call	c_smul
 520  0149 96            	ldw	x,sp
 521  014a 5c            	incw	x
 522  014b cd0000        	call	c_rtol
 525  014e 96            	ldw	x,sp
 526  014f 1c0007        	addw	x,#OFST-7
 527  0152 cd0000        	call	c_ltor
 529  0155 96            	ldw	x,sp
 530  0156 5c            	incw	x
 531  0157 cd0000        	call	c_lsub
 533  015a a604          	ld	a,#4
 534  015c cd0000        	call	c_llsh
 536  015f ae0004        	ldw	x,#L46
 537  0162 cd0000        	call	c_ludv
 539  0165 b603          	ld	a,c_lreg+3
 540  0167 a40f          	and	a,#15
 541  0169 6b05          	ld	(OFST-9,sp),a
 543                     ; 121     BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 545  016b 96            	ldw	x,sp
 546  016c 1c000b        	addw	x,#OFST-3
 547  016f cd0000        	call	c_ltor
 549  0172 a604          	ld	a,#4
 550  0174 cd0000        	call	c_lursh
 552  0177 b603          	ld	a,c_lreg+3
 553  0179 a4f0          	and	a,#240
 554  017b b703          	ld	c_lreg+3,a
 555  017d 3f02          	clr	c_lreg+2
 556  017f 3f01          	clr	c_lreg+1
 557  0181 3f00          	clr	c_lreg
 558  0183 6b06          	ld	(OFST-8,sp),a
 560                     ; 123     UART3->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 562  0185 1a05          	or	a,(OFST-9,sp)
 563  0187 c75243        	ld	21059,a
 564                     ; 125     UART3->BRR1 = (uint8_t)BaudRate_Mantissa;           
 566  018a 7b0e          	ld	a,(OFST+0,sp)
 567  018c c75242        	ld	21058,a
 568                     ; 127     if ((uint8_t)(Mode & UART3_MODE_TX_ENABLE))
 570  018f 7b18          	ld	a,(OFST+10,sp)
 571  0191 a504          	bcp	a,#4
 572  0193 2706          	jreq	L731
 573                     ; 130         UART3->CR2 |= UART3_CR2_TEN;  
 575  0195 72165245      	bset	21061,#3
 577  0199 2004          	jra	L141
 578  019b               L731:
 579                     ; 135         UART3->CR2 &= (uint8_t)(~UART3_CR2_TEN);  
 581  019b 72175245      	bres	21061,#3
 582  019f               L141:
 583                     ; 137     if ((uint8_t)(Mode & UART3_MODE_RX_ENABLE))
 585  019f a508          	bcp	a,#8
 586  01a1 2706          	jreq	L341
 587                     ; 140         UART3->CR2 |= UART3_CR2_REN;  
 589  01a3 72145245      	bset	21061,#2
 591  01a7 2004          	jra	L541
 592  01a9               L341:
 593                     ; 145         UART3->CR2 &= (uint8_t)(~UART3_CR2_REN);  
 595  01a9 72155245      	bres	21061,#2
 596  01ad               L541:
 597                     ; 147 }
 600  01ad 5b0e          	addw	sp,#14
 601  01af 81            	ret	
 656                     ; 155 void UART3_Cmd(FunctionalState NewState)
 656                     ; 156 {
 657                     	switch	.text
 658  01b0               _UART3_Cmd:
 662                     ; 158     if (NewState != DISABLE)
 664  01b0 4d            	tnz	a
 665  01b1 2705          	jreq	L571
 666                     ; 161         UART3->CR1 &= (uint8_t)(~UART3_CR1_UARTD); 
 668  01b3 721b5244      	bres	21060,#5
 671  01b7 81            	ret	
 672  01b8               L571:
 673                     ; 166         UART3->CR1 |= UART3_CR1_UARTD;  
 675  01b8 721a5244      	bset	21060,#5
 676                     ; 168 }
 679  01bc 81            	ret	
 808                     ; 185 void UART3_ITConfig(UART3_IT_TypeDef UART3_IT, FunctionalState NewState)
 808                     ; 186 {
 809                     	switch	.text
 810  01bd               _UART3_ITConfig:
 812  01bd 89            	pushw	x
 813  01be 89            	pushw	x
 814       00000002      OFST:	set	2
 817                     ; 187     uint8_t uartreg = 0, itpos = 0x00;
 821                     ; 190     assert_param(IS_UART3_CONFIG_IT_OK(UART3_IT));
 823  01bf a30100        	cpw	x,#256
 824  01c2 272c          	jreq	L67
 825  01c4 a30277        	cpw	x,#631
 826  01c7 2727          	jreq	L67
 827  01c9 a30266        	cpw	x,#614
 828  01cc 2722          	jreq	L67
 829  01ce a30205        	cpw	x,#517
 830  01d1 271d          	jreq	L67
 831  01d3 a30244        	cpw	x,#580
 832  01d6 2718          	jreq	L67
 833  01d8 a30412        	cpw	x,#1042
 834  01db 2713          	jreq	L67
 835  01dd a30346        	cpw	x,#838
 836  01e0 270e          	jreq	L67
 837  01e2 ae00be        	ldw	x,#190
 838  01e5 89            	pushw	x
 839  01e6 5f            	clrw	x
 840  01e7 89            	pushw	x
 841  01e8 ae0008        	ldw	x,#L531
 842  01eb cd0000        	call	_assert_failed
 844  01ee 5b04          	addw	sp,#4
 845  01f0               L67:
 846                     ; 191     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 848  01f0 7b07          	ld	a,(OFST+5,sp)
 849  01f2 2711          	jreq	L601
 850  01f4 4a            	dec	a
 851  01f5 270e          	jreq	L601
 852  01f7 ae00bf        	ldw	x,#191
 853  01fa 89            	pushw	x
 854  01fb 5f            	clrw	x
 855  01fc 89            	pushw	x
 856  01fd ae0008        	ldw	x,#L531
 857  0200 cd0000        	call	_assert_failed
 859  0203 5b04          	addw	sp,#4
 860  0205               L601:
 861                     ; 194     uartreg = (uint8_t)((uint16_t)UART3_IT >> 0x08);
 863  0205 7b03          	ld	a,(OFST+1,sp)
 864  0207 6b01          	ld	(OFST-1,sp),a
 866                     ; 197     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
 868  0209 7b04          	ld	a,(OFST+2,sp)
 869  020b a40f          	and	a,#15
 870  020d 5f            	clrw	x
 871  020e 97            	ld	xl,a
 872  020f a601          	ld	a,#1
 873  0211 5d            	tnzw	x
 874  0212 2704          	jreq	L211
 875  0214               L411:
 876  0214 48            	sll	a
 877  0215 5a            	decw	x
 878  0216 26fc          	jrne	L411
 879  0218               L211:
 880  0218 6b02          	ld	(OFST+0,sp),a
 882                     ; 199     if (NewState != DISABLE)
 884  021a 7b07          	ld	a,(OFST+5,sp)
 885  021c 272a          	jreq	L552
 886                     ; 202         if (uartreg == 0x01)
 888  021e 7b01          	ld	a,(OFST-1,sp)
 889  0220 a101          	cp	a,#1
 890  0222 2607          	jrne	L752
 891                     ; 204             UART3->CR1 |= itpos;
 893  0224 c65244        	ld	a,21060
 894  0227 1a02          	or	a,(OFST+0,sp)
 896  0229 2029          	jp	LC003
 897  022b               L752:
 898                     ; 206         else if (uartreg == 0x02)
 900  022b a102          	cp	a,#2
 901  022d 2607          	jrne	L362
 902                     ; 208             UART3->CR2 |= itpos;
 904  022f c65245        	ld	a,21061
 905  0232 1a02          	or	a,(OFST+0,sp)
 907  0234 202d          	jp	LC002
 908  0236               L362:
 909                     ; 210         else if (uartreg == 0x03)
 911  0236 a103          	cp	a,#3
 912  0238 2607          	jrne	L762
 913                     ; 212             UART3->CR4 |= itpos;
 915  023a c65247        	ld	a,21063
 916  023d 1a02          	or	a,(OFST+0,sp)
 918  023f 2031          	jp	LC004
 919  0241               L762:
 920                     ; 216             UART3->CR6 |= itpos;
 922  0241 c65249        	ld	a,21065
 923  0244 1a02          	or	a,(OFST+0,sp)
 924  0246 2035          	jp	LC001
 925  0248               L552:
 926                     ; 222         if (uartreg == 0x01)
 928  0248 7b01          	ld	a,(OFST-1,sp)
 929  024a a101          	cp	a,#1
 930  024c 260b          	jrne	L572
 931                     ; 224             UART3->CR1 &= (uint8_t)(~itpos);
 933  024e 7b02          	ld	a,(OFST+0,sp)
 934  0250 43            	cpl	a
 935  0251 c45244        	and	a,21060
 936  0254               LC003:
 937  0254 c75244        	ld	21060,a
 939  0257 2027          	jra	L372
 940  0259               L572:
 941                     ; 226         else if (uartreg == 0x02)
 943  0259 a102          	cp	a,#2
 944  025b 260b          	jrne	L103
 945                     ; 228             UART3->CR2 &= (uint8_t)(~itpos);
 947  025d 7b02          	ld	a,(OFST+0,sp)
 948  025f 43            	cpl	a
 949  0260 c45245        	and	a,21061
 950  0263               LC002:
 951  0263 c75245        	ld	21061,a
 953  0266 2018          	jra	L372
 954  0268               L103:
 955                     ; 230         else if (uartreg == 0x03)
 957  0268 a103          	cp	a,#3
 958  026a 260b          	jrne	L503
 959                     ; 232             UART3->CR4 &= (uint8_t)(~itpos);
 961  026c 7b02          	ld	a,(OFST+0,sp)
 962  026e 43            	cpl	a
 963  026f c45247        	and	a,21063
 964  0272               LC004:
 965  0272 c75247        	ld	21063,a
 967  0275 2009          	jra	L372
 968  0277               L503:
 969                     ; 236             UART3->CR6 &= (uint8_t)(~itpos);
 971  0277 7b02          	ld	a,(OFST+0,sp)
 972  0279 43            	cpl	a
 973  027a c45249        	and	a,21065
 974  027d               LC001:
 975  027d c75249        	ld	21065,a
 976  0280               L372:
 977                     ; 239 }
 980  0280 5b04          	addw	sp,#4
 981  0282 81            	ret	
1041                     ; 248 void UART3_LINBreakDetectionConfig(UART3_LINBreakDetectionLength_TypeDef UART3_LINBreakDetectionLength)
1041                     ; 249 {
1042                     	switch	.text
1043  0283               _UART3_LINBreakDetectionConfig:
1045  0283 88            	push	a
1046       00000000      OFST:	set	0
1049                     ; 251     assert_param(IS_UART3_LINBREAKDETECTIONLENGTH_OK(UART3_LINBreakDetectionLength));
1051  0284 4d            	tnz	a
1052  0285 2711          	jreq	L421
1053  0287 4a            	dec	a
1054  0288 270e          	jreq	L421
1055  028a ae00fb        	ldw	x,#251
1056  028d 89            	pushw	x
1057  028e 5f            	clrw	x
1058  028f 89            	pushw	x
1059  0290 ae0008        	ldw	x,#L531
1060  0293 cd0000        	call	_assert_failed
1062  0296 5b04          	addw	sp,#4
1063  0298               L421:
1064                     ; 253     if (UART3_LINBreakDetectionLength != UART3_LINBREAKDETECTIONLENGTH_10BITS)
1066  0298 7b01          	ld	a,(OFST+1,sp)
1067  029a 2706          	jreq	L733
1068                     ; 255         UART3->CR4 |= UART3_CR4_LBDL;
1070  029c 721a5247      	bset	21063,#5
1072  02a0 2004          	jra	L143
1073  02a2               L733:
1074                     ; 259         UART3->CR4 &= ((uint8_t)~UART3_CR4_LBDL);
1076  02a2 721b5247      	bres	21063,#5
1077  02a6               L143:
1078                     ; 261 }
1081  02a6 84            	pop	a
1082  02a7 81            	ret	
1204                     ; 273 void UART3_LINConfig(UART3_LinMode_TypeDef UART3_Mode,
1204                     ; 274                      UART3_LinAutosync_TypeDef UART3_Autosync, 
1204                     ; 275                      UART3_LinDivUp_TypeDef UART3_DivUp)
1204                     ; 276 {
1205                     	switch	.text
1206  02a8               _UART3_LINConfig:
1208  02a8 89            	pushw	x
1209       00000000      OFST:	set	0
1212                     ; 278     assert_param(IS_UART3_SLAVE_OK(UART3_Mode));
1214  02a9 9e            	ld	a,xh
1215  02aa 4d            	tnz	a
1216  02ab 2712          	jreq	L631
1217  02ad 9e            	ld	a,xh
1218  02ae 4a            	dec	a
1219  02af 270e          	jreq	L631
1220  02b1 ae0116        	ldw	x,#278
1221  02b4 89            	pushw	x
1222  02b5 5f            	clrw	x
1223  02b6 89            	pushw	x
1224  02b7 ae0008        	ldw	x,#L531
1225  02ba cd0000        	call	_assert_failed
1227  02bd 5b04          	addw	sp,#4
1228  02bf               L631:
1229                     ; 279     assert_param(IS_UART3_AUTOSYNC_OK(UART3_Autosync));
1231  02bf 7b02          	ld	a,(OFST+2,sp)
1232  02c1 4a            	dec	a
1233  02c2 2712          	jreq	L641
1234  02c4 7b02          	ld	a,(OFST+2,sp)
1235  02c6 270e          	jreq	L641
1236  02c8 ae0117        	ldw	x,#279
1237  02cb 89            	pushw	x
1238  02cc 5f            	clrw	x
1239  02cd 89            	pushw	x
1240  02ce ae0008        	ldw	x,#L531
1241  02d1 cd0000        	call	_assert_failed
1243  02d4 5b04          	addw	sp,#4
1244  02d6               L641:
1245                     ; 280     assert_param(IS_UART3_DIVUP_OK(UART3_DivUp));
1247  02d6 7b05          	ld	a,(OFST+5,sp)
1248  02d8 2711          	jreq	L651
1249  02da 4a            	dec	a
1250  02db 270e          	jreq	L651
1251  02dd ae0118        	ldw	x,#280
1252  02e0 89            	pushw	x
1253  02e1 5f            	clrw	x
1254  02e2 89            	pushw	x
1255  02e3 ae0008        	ldw	x,#L531
1256  02e6 cd0000        	call	_assert_failed
1258  02e9 5b04          	addw	sp,#4
1259  02eb               L651:
1260                     ; 282     if (UART3_Mode != UART3_LIN_MODE_MASTER)
1262  02eb 7b01          	ld	a,(OFST+1,sp)
1263  02ed 2706          	jreq	L124
1264                     ; 284         UART3->CR6 |=  UART3_CR6_LSLV;
1266  02ef 721a5249      	bset	21065,#5
1268  02f3 2004          	jra	L324
1269  02f5               L124:
1270                     ; 288         UART3->CR6 &= ((uint8_t)~UART3_CR6_LSLV);
1272  02f5 721b5249      	bres	21065,#5
1273  02f9               L324:
1274                     ; 291     if (UART3_Autosync != UART3_LIN_AUTOSYNC_DISABLE)
1276  02f9 7b02          	ld	a,(OFST+2,sp)
1277  02fb 2706          	jreq	L524
1278                     ; 293         UART3->CR6 |=  UART3_CR6_LASE ;
1280  02fd 72185249      	bset	21065,#4
1282  0301 2004          	jra	L724
1283  0303               L524:
1284                     ; 297         UART3->CR6 &= ((uint8_t)~ UART3_CR6_LASE );
1286  0303 72195249      	bres	21065,#4
1287  0307               L724:
1288                     ; 300     if (UART3_DivUp != UART3_LIN_DIVUP_LBRR1)
1290  0307 7b05          	ld	a,(OFST+5,sp)
1291  0309 2706          	jreq	L134
1292                     ; 302         UART3->CR6 |=  UART3_CR6_LDUM;
1294  030b 721e5249      	bset	21065,#7
1296  030f 2004          	jra	L334
1297  0311               L134:
1298                     ; 306         UART3->CR6 &= ((uint8_t)~ UART3_CR6_LDUM);
1300  0311 721f5249      	bres	21065,#7
1301  0315               L334:
1302                     ; 308 }
1305  0315 85            	popw	x
1306  0316 81            	ret	
1342                     ; 316 void UART3_LINCmd(FunctionalState NewState)
1342                     ; 317 {
1343                     	switch	.text
1344  0317               _UART3_LINCmd:
1346  0317 88            	push	a
1347       00000000      OFST:	set	0
1350                     ; 319     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1352  0318 4d            	tnz	a
1353  0319 2711          	jreq	L071
1354  031b 4a            	dec	a
1355  031c 270e          	jreq	L071
1356  031e ae013f        	ldw	x,#319
1357  0321 89            	pushw	x
1358  0322 5f            	clrw	x
1359  0323 89            	pushw	x
1360  0324 ae0008        	ldw	x,#L531
1361  0327 cd0000        	call	_assert_failed
1363  032a 5b04          	addw	sp,#4
1364  032c               L071:
1365                     ; 321     if (NewState != DISABLE)
1367  032c 7b01          	ld	a,(OFST+1,sp)
1368  032e 2706          	jreq	L354
1369                     ; 324         UART3->CR3 |= UART3_CR3_LINEN;
1371  0330 721c5246      	bset	21062,#6
1373  0334 2004          	jra	L554
1374  0336               L354:
1375                     ; 329         UART3->CR3 &= ((uint8_t)~UART3_CR3_LINEN);
1377  0336 721d5246      	bres	21062,#6
1378  033a               L554:
1379                     ; 331 }
1382  033a 84            	pop	a
1383  033b 81            	ret	
1441                     ; 339 void UART3_WakeUpConfig(UART3_WakeUp_TypeDef UART3_WakeUp)
1441                     ; 340 {
1442                     	switch	.text
1443  033c               _UART3_WakeUpConfig:
1445  033c 88            	push	a
1446       00000000      OFST:	set	0
1449                     ; 342     assert_param(IS_UART3_WAKEUP_OK(UART3_WakeUp));
1451  033d 4d            	tnz	a
1452  033e 2712          	jreq	L202
1453  0340 a108          	cp	a,#8
1454  0342 270e          	jreq	L202
1455  0344 ae0156        	ldw	x,#342
1456  0347 89            	pushw	x
1457  0348 5f            	clrw	x
1458  0349 89            	pushw	x
1459  034a ae0008        	ldw	x,#L531
1460  034d cd0000        	call	_assert_failed
1462  0350 5b04          	addw	sp,#4
1463  0352               L202:
1464                     ; 344     UART3->CR1 &= ((uint8_t)~UART3_CR1_WAKE);
1466  0352 72175244      	bres	21060,#3
1467                     ; 345     UART3->CR1 |= (uint8_t)UART3_WakeUp;
1469  0356 c65244        	ld	a,21060
1470  0359 1a01          	or	a,(OFST+1,sp)
1471  035b c75244        	ld	21060,a
1472                     ; 346 }
1475  035e 84            	pop	a
1476  035f 81            	ret	
1513                     ; 354 void UART3_ReceiverWakeUpCmd(FunctionalState NewState)
1513                     ; 355 {
1514                     	switch	.text
1515  0360               _UART3_ReceiverWakeUpCmd:
1517  0360 88            	push	a
1518       00000000      OFST:	set	0
1521                     ; 357     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1523  0361 4d            	tnz	a
1524  0362 2711          	jreq	L412
1525  0364 4a            	dec	a
1526  0365 270e          	jreq	L412
1527  0367 ae0165        	ldw	x,#357
1528  036a 89            	pushw	x
1529  036b 5f            	clrw	x
1530  036c 89            	pushw	x
1531  036d ae0008        	ldw	x,#L531
1532  0370 cd0000        	call	_assert_failed
1534  0373 5b04          	addw	sp,#4
1535  0375               L412:
1536                     ; 359     if (NewState != DISABLE)
1538  0375 7b01          	ld	a,(OFST+1,sp)
1539  0377 2706          	jreq	L325
1540                     ; 362         UART3->CR2 |= UART3_CR2_RWU;
1542  0379 72125245      	bset	21061,#1
1544  037d 2004          	jra	L525
1545  037f               L325:
1546                     ; 367         UART3->CR2 &= ((uint8_t)~UART3_CR2_RWU);
1548  037f 72135245      	bres	21061,#1
1549  0383               L525:
1550                     ; 369 }
1553  0383 84            	pop	a
1554  0384 81            	ret	
1577                     ; 376 uint8_t UART3_ReceiveData8(void)
1577                     ; 377 {
1578                     	switch	.text
1579  0385               _UART3_ReceiveData8:
1583                     ; 378     return ((uint8_t)UART3->DR);
1585  0385 c65241        	ld	a,21057
1588  0388 81            	ret	
1620                     ; 386 uint16_t UART3_ReceiveData9(void)
1620                     ; 387 {
1621                     	switch	.text
1622  0389               _UART3_ReceiveData9:
1624  0389 89            	pushw	x
1625       00000002      OFST:	set	2
1628                     ; 388   uint16_t temp = 0;
1630                     ; 390  temp = (uint16_t)(((uint16_t)((uint16_t)UART3->CR1 & (uint16_t)UART3_CR1_R8)) << 1);
1632  038a c65244        	ld	a,21060
1633  038d a480          	and	a,#128
1634  038f 5f            	clrw	x
1635  0390 02            	rlwa	x,a
1636  0391 58            	sllw	x
1637  0392 1f01          	ldw	(OFST-1,sp),x
1639                     ; 391   return (uint16_t)((((uint16_t)UART3->DR) | temp) & ((uint16_t)0x01FF));
1641  0394 c65241        	ld	a,21057
1642  0397 5f            	clrw	x
1643  0398 97            	ld	xl,a
1644  0399 01            	rrwa	x,a
1645  039a 1a02          	or	a,(OFST+0,sp)
1646  039c 01            	rrwa	x,a
1647  039d 1a01          	or	a,(OFST-1,sp)
1648  039f a401          	and	a,#1
1649  03a1 01            	rrwa	x,a
1652  03a2 5b02          	addw	sp,#2
1653  03a4 81            	ret	
1685                     ; 399 void UART3_SendData8(uint8_t Data)
1685                     ; 400 {
1686                     	switch	.text
1687  03a5               _UART3_SendData8:
1691                     ; 402     UART3->DR = Data;
1693  03a5 c75241        	ld	21057,a
1694                     ; 403 }
1697  03a8 81            	ret	
1729                     ; 410 void UART3_SendData9(uint16_t Data)
1729                     ; 411 {
1730                     	switch	.text
1731  03a9               _UART3_SendData9:
1733  03a9 89            	pushw	x
1734       00000000      OFST:	set	0
1737                     ; 413     UART3->CR1 &= ((uint8_t)~UART3_CR1_T8);                  
1739  03aa 721d5244      	bres	21060,#6
1740                     ; 416     UART3->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART3_CR1_T8); 
1742  03ae 54            	srlw	x
1743  03af 54            	srlw	x
1744  03b0 9f            	ld	a,xl
1745  03b1 a440          	and	a,#64
1746  03b3 ca5244        	or	a,21060
1747  03b6 c75244        	ld	21060,a
1748                     ; 419     UART3->DR   = (uint8_t)(Data);                    
1750  03b9 7b02          	ld	a,(OFST+2,sp)
1751  03bb c75241        	ld	21057,a
1752                     ; 420 }
1755  03be 85            	popw	x
1756  03bf 81            	ret	
1779                     ; 427 void UART3_SendBreak(void)
1779                     ; 428 {
1780                     	switch	.text
1781  03c0               _UART3_SendBreak:
1785                     ; 429     UART3->CR2 |= UART3_CR2_SBK;
1787  03c0 72105245      	bset	21061,#0
1788                     ; 430 }
1791  03c4 81            	ret	
1824                     ; 437 void UART3_SetAddress(uint8_t UART3_Address)
1824                     ; 438 {
1825                     	switch	.text
1826  03c5               _UART3_SetAddress:
1828  03c5 88            	push	a
1829       00000000      OFST:	set	0
1832                     ; 440     assert_param(IS_UART3_ADDRESS_OK(UART3_Address));
1834  03c6 a110          	cp	a,#16
1835  03c8 250e          	jrult	L632
1836  03ca ae01b8        	ldw	x,#440
1837  03cd 89            	pushw	x
1838  03ce 5f            	clrw	x
1839  03cf 89            	pushw	x
1840  03d0 ae0008        	ldw	x,#L531
1841  03d3 cd0000        	call	_assert_failed
1843  03d6 5b04          	addw	sp,#4
1844  03d8               L632:
1845                     ; 443     UART3->CR4 &= ((uint8_t)~UART3_CR4_ADD);
1847  03d8 c65247        	ld	a,21063
1848  03db a4f0          	and	a,#240
1849  03dd c75247        	ld	21063,a
1850                     ; 445     UART3->CR4 |= UART3_Address;
1852  03e0 c65247        	ld	a,21063
1853  03e3 1a01          	or	a,(OFST+1,sp)
1854  03e5 c75247        	ld	21063,a
1855                     ; 446 }
1858  03e8 84            	pop	a
1859  03e9 81            	ret	
2017                     ; 454 FlagStatus UART3_GetFlagStatus(UART3_Flag_TypeDef UART3_FLAG)
2017                     ; 455 {
2018                     	switch	.text
2019  03ea               _UART3_GetFlagStatus:
2021  03ea 89            	pushw	x
2022  03eb 88            	push	a
2023       00000001      OFST:	set	1
2026                     ; 456     FlagStatus status = RESET;
2028                     ; 459     assert_param(IS_UART3_FLAG_OK(UART3_FLAG));
2030  03ec a30080        	cpw	x,#128
2031  03ef 2745          	jreq	L052
2032  03f1 a30040        	cpw	x,#64
2033  03f4 2740          	jreq	L052
2034  03f6 a30020        	cpw	x,#32
2035  03f9 273b          	jreq	L052
2036  03fb a30010        	cpw	x,#16
2037  03fe 2736          	jreq	L052
2038  0400 a30008        	cpw	x,#8
2039  0403 2731          	jreq	L052
2040  0405 a30004        	cpw	x,#4
2041  0408 272c          	jreq	L052
2042  040a a30002        	cpw	x,#2
2043  040d 2727          	jreq	L052
2044  040f a30001        	cpw	x,#1
2045  0412 2722          	jreq	L052
2046  0414 a30101        	cpw	x,#257
2047  0417 271d          	jreq	L052
2048  0419 a30301        	cpw	x,#769
2049  041c 2718          	jreq	L052
2050  041e a30302        	cpw	x,#770
2051  0421 2713          	jreq	L052
2052  0423 a30210        	cpw	x,#528
2053  0426 270e          	jreq	L052
2054  0428 ae01cb        	ldw	x,#459
2055  042b 89            	pushw	x
2056  042c 5f            	clrw	x
2057  042d 89            	pushw	x
2058  042e ae0008        	ldw	x,#L531
2059  0431 cd0000        	call	_assert_failed
2061  0434 5b04          	addw	sp,#4
2062  0436               L052:
2063                     ; 462     if (UART3_FLAG == UART3_FLAG_LBDF)
2065  0436 1e02          	ldw	x,(OFST+1,sp)
2066  0438 a30210        	cpw	x,#528
2067  043b 2609          	jrne	L517
2068                     ; 464         if ((UART3->CR4 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2070  043d c65247        	ld	a,21063
2071  0440 1503          	bcp	a,(OFST+2,sp)
2072  0442 2725          	jreq	L147
2073                     ; 467             status = SET;
2075  0444 201f          	jp	LC006
2076                     ; 472             status = RESET;
2077  0446               L517:
2078                     ; 475     else if (UART3_FLAG == UART3_FLAG_SBK)
2080  0446 a30101        	cpw	x,#257
2081  0449 2609          	jrne	L527
2082                     ; 477         if ((UART3->CR2 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2084  044b c65245        	ld	a,21061
2085  044e 1503          	bcp	a,(OFST+2,sp)
2086  0450 2717          	jreq	L147
2087                     ; 480             status = SET;
2089  0452 2011          	jp	LC006
2090                     ; 485             status = RESET;
2091  0454               L527:
2092                     ; 488     else if ((UART3_FLAG == UART3_FLAG_LHDF) || (UART3_FLAG == UART3_FLAG_LSF))
2094  0454 a30302        	cpw	x,#770
2095  0457 2705          	jreq	L737
2097  0459 a30301        	cpw	x,#769
2098  045c 260f          	jrne	L537
2099  045e               L737:
2100                     ; 490         if ((UART3->CR6 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2102  045e c65249        	ld	a,21065
2103  0461 1503          	bcp	a,(OFST+2,sp)
2104  0463 2704          	jreq	L147
2105                     ; 493             status = SET;
2107  0465               LC006:
2111  0465 a601          	ld	a,#1
2114  0467 2001          	jra	L327
2115  0469               L147:
2116                     ; 498             status = RESET;
2121  0469 4f            	clr	a
2123  046a               L327:
2124                     ; 516     return  status;
2128  046a 5b03          	addw	sp,#3
2129  046c 81            	ret	
2130  046d               L537:
2131                     ; 503         if ((UART3->SR & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2133  046d c65240        	ld	a,21056
2134  0470 1503          	bcp	a,(OFST+2,sp)
2135  0472 27f5          	jreq	L147
2136                     ; 506             status = SET;
2138  0474 20ef          	jp	LC006
2139                     ; 511             status = RESET;
2175                     ; 546 void UART3_ClearFlag(UART3_Flag_TypeDef UART3_FLAG)
2175                     ; 547 {
2176                     	switch	.text
2177  0476               _UART3_ClearFlag:
2179  0476 89            	pushw	x
2180       00000000      OFST:	set	0
2183                     ; 549     assert_param(IS_UART3_CLEAR_FLAG_OK(UART3_FLAG));
2185  0477 a30020        	cpw	x,#32
2186  047a 271d          	jreq	L262
2187  047c a30302        	cpw	x,#770
2188  047f 2718          	jreq	L262
2189  0481 a30301        	cpw	x,#769
2190  0484 2713          	jreq	L262
2191  0486 a30210        	cpw	x,#528
2192  0489 270e          	jreq	L262
2193  048b ae0225        	ldw	x,#549
2194  048e 89            	pushw	x
2195  048f 5f            	clrw	x
2196  0490 89            	pushw	x
2197  0491 ae0008        	ldw	x,#L531
2198  0494 cd0000        	call	_assert_failed
2200  0497 5b04          	addw	sp,#4
2201  0499               L262:
2202                     ; 552     if (UART3_FLAG == UART3_FLAG_RXNE)
2204  0499 1e01          	ldw	x,(OFST+1,sp)
2205  049b a30020        	cpw	x,#32
2206  049e 2606          	jrne	L177
2207                     ; 554         UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2209  04a0 35df5240      	mov	21056,#223
2211  04a4 201a          	jra	L377
2212  04a6               L177:
2213                     ; 557     else if (UART3_FLAG == UART3_FLAG_LBDF)
2215  04a6 a30210        	cpw	x,#528
2216  04a9 2606          	jrne	L577
2217                     ; 559         UART3->CR4 &= (uint8_t)(~UART3_CR4_LBDF);
2219  04ab 72195247      	bres	21063,#4
2221  04af 200f          	jra	L377
2222  04b1               L577:
2223                     ; 562     else if (UART3_FLAG == UART3_FLAG_LHDF)
2225  04b1 a30302        	cpw	x,#770
2226  04b4 2606          	jrne	L1001
2227                     ; 564         UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2229  04b6 72135249      	bres	21065,#1
2231  04ba 2004          	jra	L377
2232  04bc               L1001:
2233                     ; 569         UART3->CR6 &= (uint8_t)(~UART3_CR6_LSF);
2235  04bc 72115249      	bres	21065,#0
2236  04c0               L377:
2237                     ; 571 }
2240  04c0 85            	popw	x
2241  04c1 81            	ret	
2316                     ; 586 ITStatus UART3_GetITStatus(UART3_IT_TypeDef UART3_IT)
2316                     ; 587 {
2317                     	switch	.text
2318  04c2               _UART3_GetITStatus:
2320  04c2 89            	pushw	x
2321  04c3 89            	pushw	x
2322       00000002      OFST:	set	2
2325                     ; 588     ITStatus pendingbitstatus = RESET;
2327                     ; 589     uint8_t itpos = 0;
2329                     ; 590     uint8_t itmask1 = 0;
2331                     ; 591     uint8_t itmask2 = 0;
2333                     ; 592     uint8_t enablestatus = 0;
2335                     ; 595     assert_param(IS_UART3_GET_IT_OK(UART3_IT));
2337  04c4 a30277        	cpw	x,#631
2338  04c7 2731          	jreq	L472
2339  04c9 a30266        	cpw	x,#614
2340  04cc 272c          	jreq	L472
2341  04ce a30255        	cpw	x,#597
2342  04d1 2727          	jreq	L472
2343  04d3 a30244        	cpw	x,#580
2344  04d6 2722          	jreq	L472
2345  04d8 a30235        	cpw	x,#565
2346  04db 271d          	jreq	L472
2347  04dd a30346        	cpw	x,#838
2348  04e0 2718          	jreq	L472
2349  04e2 a30412        	cpw	x,#1042
2350  04e5 2713          	jreq	L472
2351  04e7 a30100        	cpw	x,#256
2352  04ea 270e          	jreq	L472
2353  04ec ae0253        	ldw	x,#595
2354  04ef 89            	pushw	x
2355  04f0 5f            	clrw	x
2356  04f1 89            	pushw	x
2357  04f2 ae0008        	ldw	x,#L531
2358  04f5 cd0000        	call	_assert_failed
2360  04f8 5b04          	addw	sp,#4
2361  04fa               L472:
2362                     ; 598     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
2364  04fa 7b04          	ld	a,(OFST+2,sp)
2365  04fc a40f          	and	a,#15
2366  04fe 5f            	clrw	x
2367  04ff 97            	ld	xl,a
2368  0500 a601          	ld	a,#1
2369  0502 5d            	tnzw	x
2370  0503 2704          	jreq	L003
2371  0505               L203:
2372  0505 48            	sll	a
2373  0506 5a            	decw	x
2374  0507 26fc          	jrne	L203
2375  0509               L003:
2376  0509 6b01          	ld	(OFST-1,sp),a
2378                     ; 600     itmask1 = (uint8_t)((uint8_t)UART3_IT >> (uint8_t)4);
2380  050b 7b04          	ld	a,(OFST+2,sp)
2381  050d 4e            	swap	a
2382  050e a40f          	and	a,#15
2383  0510 6b02          	ld	(OFST+0,sp),a
2385                     ; 602     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2387  0512 5f            	clrw	x
2388  0513 97            	ld	xl,a
2389  0514 a601          	ld	a,#1
2390  0516 5d            	tnzw	x
2391  0517 2704          	jreq	L403
2392  0519               L603:
2393  0519 48            	sll	a
2394  051a 5a            	decw	x
2395  051b 26fc          	jrne	L603
2396  051d               L403:
2397  051d 6b02          	ld	(OFST+0,sp),a
2399                     ; 605     if (UART3_IT == UART3_IT_PE)
2401  051f 1e03          	ldw	x,(OFST+1,sp)
2402  0521 a30100        	cpw	x,#256
2403  0524 260c          	jrne	L7301
2404                     ; 608         enablestatus = (uint8_t)((uint8_t)UART3->CR1 & itmask2);
2406  0526 c65244        	ld	a,21060
2407  0529 1402          	and	a,(OFST+0,sp)
2408  052b 6b02          	ld	(OFST+0,sp),a
2410                     ; 611         if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2412  052d c65240        	ld	a,21056
2414                     ; 614             pendingbitstatus = SET;
2416  0530 2020          	jp	LC009
2417                     ; 619             pendingbitstatus = RESET;
2418  0532               L7301:
2419                     ; 622     else if (UART3_IT == UART3_IT_LBDF)
2421  0532 a30346        	cpw	x,#838
2422  0535 260c          	jrne	L7401
2423                     ; 625         enablestatus = (uint8_t)((uint8_t)UART3->CR4 & itmask2);
2425  0537 c65247        	ld	a,21063
2426  053a 1402          	and	a,(OFST+0,sp)
2427  053c 6b02          	ld	(OFST+0,sp),a
2429                     ; 627         if (((UART3->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2431  053e c65247        	ld	a,21063
2433                     ; 630             pendingbitstatus = SET;
2435  0541 200f          	jp	LC009
2436                     ; 635             pendingbitstatus = RESET;
2437  0543               L7401:
2438                     ; 638     else if (UART3_IT == UART3_IT_LHDF)
2440  0543 a30412        	cpw	x,#1042
2441  0546 2616          	jrne	L7501
2442                     ; 641         enablestatus = (uint8_t)((uint8_t)UART3->CR6 & itmask2);
2444  0548 c65249        	ld	a,21065
2445  054b 1402          	and	a,(OFST+0,sp)
2446  054d 6b02          	ld	(OFST+0,sp),a
2448                     ; 643         if (((UART3->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2450  054f c65249        	ld	a,21065
2452  0552               LC009:
2453  0552 1501          	bcp	a,(OFST-1,sp)
2454  0554 271a          	jreq	L7601
2455  0556 7b02          	ld	a,(OFST+0,sp)
2456  0558 2716          	jreq	L7601
2457                     ; 646             pendingbitstatus = SET;
2459  055a               LC008:
2463  055a a601          	ld	a,#1
2466  055c 2013          	jra	L5401
2467                     ; 651             pendingbitstatus = RESET;
2468  055e               L7501:
2469                     ; 657         enablestatus = (uint8_t)((uint8_t)UART3->CR2 & itmask2);
2471  055e c65245        	ld	a,21061
2472  0561 1402          	and	a,(OFST+0,sp)
2473  0563 6b02          	ld	(OFST+0,sp),a
2475                     ; 659         if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2477  0565 c65240        	ld	a,21056
2478  0568 1501          	bcp	a,(OFST-1,sp)
2479  056a 2704          	jreq	L7601
2481  056c 7b02          	ld	a,(OFST+0,sp)
2482                     ; 662             pendingbitstatus = SET;
2484  056e 26ea          	jrne	LC008
2485  0570               L7601:
2486                     ; 667             pendingbitstatus = RESET;
2491  0570 4f            	clr	a
2493  0571               L5401:
2494                     ; 671     return  pendingbitstatus;
2498  0571 5b04          	addw	sp,#4
2499  0573 81            	ret	
2536                     ; 701 void UART3_ClearITPendingBit(UART3_IT_TypeDef UART3_IT)
2536                     ; 702 {
2537                     	switch	.text
2538  0574               _UART3_ClearITPendingBit:
2540  0574 89            	pushw	x
2541       00000000      OFST:	set	0
2544                     ; 704     assert_param(IS_UART3_CLEAR_IT_OK(UART3_IT));
2546  0575 a30255        	cpw	x,#597
2547  0578 2718          	jreq	L613
2548  057a a30412        	cpw	x,#1042
2549  057d 2713          	jreq	L613
2550  057f a30346        	cpw	x,#838
2551  0582 270e          	jreq	L613
2552  0584 ae02c0        	ldw	x,#704
2553  0587 89            	pushw	x
2554  0588 5f            	clrw	x
2555  0589 89            	pushw	x
2556  058a ae0008        	ldw	x,#L531
2557  058d cd0000        	call	_assert_failed
2559  0590 5b04          	addw	sp,#4
2560  0592               L613:
2561                     ; 707     if (UART3_IT == UART3_IT_RXNE)
2563  0592 1e01          	ldw	x,(OFST+1,sp)
2564  0594 a30255        	cpw	x,#597
2565  0597 2606          	jrne	L1111
2566                     ; 709         UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2568  0599 35df5240      	mov	21056,#223
2570  059d 200f          	jra	L3111
2571  059f               L1111:
2572                     ; 712     else if (UART3_IT == UART3_IT_LBDF)
2574  059f a30346        	cpw	x,#838
2575  05a2 2606          	jrne	L5111
2576                     ; 714         UART3->CR4 &= (uint8_t)~(UART3_CR4_LBDF);
2578  05a4 72195247      	bres	21063,#4
2580  05a8 2004          	jra	L3111
2581  05aa               L5111:
2582                     ; 719         UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2584  05aa 72135249      	bres	21065,#1
2585  05ae               L3111:
2586                     ; 721 }
2589  05ae 85            	popw	x
2590  05af 81            	ret	
2603                     	xdef	_UART3_ClearITPendingBit
2604                     	xdef	_UART3_GetITStatus
2605                     	xdef	_UART3_ClearFlag
2606                     	xdef	_UART3_GetFlagStatus
2607                     	xdef	_UART3_SetAddress
2608                     	xdef	_UART3_SendBreak
2609                     	xdef	_UART3_SendData9
2610                     	xdef	_UART3_SendData8
2611                     	xdef	_UART3_ReceiveData9
2612                     	xdef	_UART3_ReceiveData8
2613                     	xdef	_UART3_WakeUpConfig
2614                     	xdef	_UART3_ReceiverWakeUpCmd
2615                     	xdef	_UART3_LINCmd
2616                     	xdef	_UART3_LINConfig
2617                     	xdef	_UART3_LINBreakDetectionConfig
2618                     	xdef	_UART3_ITConfig
2619                     	xdef	_UART3_Cmd
2620                     	xdef	_UART3_Init
2621                     	xdef	_UART3_DeInit
2622                     	xref	_assert_failed
2623                     	xref	_CLK_GetClockFreq
2624                     	switch	.const
2625  0008               L531:
2626  0008 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
2627  001a 6965735c7374  	dc.b	"ies\stm8s_stdperip"
2628  002c 685f64726976  	dc.b	"h_driver\src\stm8s"
2629  003e 5f7561727433  	dc.b	"_uart3.c",0
2630                     	xref.b	c_lreg
2631                     	xref.b	c_x
2651                     	xref	c_lursh
2652                     	xref	c_lsub
2653                     	xref	c_smul
2654                     	xref	c_ludv
2655                     	xref	c_rtol
2656                     	xref	c_llsh
2657                     	xref	c_lcmp
2658                     	xref	c_ltor
2659                     	end
