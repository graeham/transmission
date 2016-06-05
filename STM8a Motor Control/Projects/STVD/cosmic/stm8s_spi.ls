   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  47                     ; 44 void SPI_DeInit(void)
  47                     ; 45 {
  49                     	switch	.text
  50  0000               _SPI_DeInit:
  54                     ; 46     SPI->CR1    = SPI_CR1_RESET_VALUE;
  56  0000 725f5200      	clr	20992
  57                     ; 47     SPI->CR2    = SPI_CR2_RESET_VALUE;
  59  0004 725f5201      	clr	20993
  60                     ; 48     SPI->ICR    = SPI_ICR_RESET_VALUE;
  62  0008 725f5202      	clr	20994
  63                     ; 49     SPI->SR     = SPI_SR_RESET_VALUE;
  65  000c 35025203      	mov	20995,#2
  66                     ; 50     SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  68  0010 35075205      	mov	20997,#7
  69                     ; 51 }
  72  0014 81            	ret	
 387                     ; 72 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 387                     ; 73 {
 388                     	switch	.text
 389  0015               _SPI_Init:
 391  0015 89            	pushw	x
 392  0016 88            	push	a
 393       00000001      OFST:	set	1
 396                     ; 75     assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 398  0017 9e            	ld	a,xh
 399  0018 4d            	tnz	a
 400  0019 2713          	jreq	L41
 401  001b 9e            	ld	a,xh
 402  001c a180          	cp	a,#128
 403  001e 270e          	jreq	L41
 404  0020 ae004b        	ldw	x,#75
 405  0023 89            	pushw	x
 406  0024 5f            	clrw	x
 407  0025 89            	pushw	x
 408  0026 ae0000        	ldw	x,#L102
 409  0029 cd0000        	call	_assert_failed
 411  002c 5b04          	addw	sp,#4
 412  002e               L41:
 413                     ; 76     assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 415  002e 7b03          	ld	a,(OFST+2,sp)
 416  0030 272a          	jreq	L42
 417  0032 a108          	cp	a,#8
 418  0034 2726          	jreq	L42
 419  0036 a110          	cp	a,#16
 420  0038 2722          	jreq	L42
 421  003a a118          	cp	a,#24
 422  003c 271e          	jreq	L42
 423  003e a120          	cp	a,#32
 424  0040 271a          	jreq	L42
 425  0042 a128          	cp	a,#40
 426  0044 2716          	jreq	L42
 427  0046 a130          	cp	a,#48
 428  0048 2712          	jreq	L42
 429  004a a138          	cp	a,#56
 430  004c 270e          	jreq	L42
 431  004e ae004c        	ldw	x,#76
 432  0051 89            	pushw	x
 433  0052 5f            	clrw	x
 434  0053 89            	pushw	x
 435  0054 ae0000        	ldw	x,#L102
 436  0057 cd0000        	call	_assert_failed
 438  005a 5b04          	addw	sp,#4
 439  005c               L42:
 440                     ; 77     assert_param(IS_SPI_MODE_OK(Mode));
 442  005c 7b06          	ld	a,(OFST+5,sp)
 443  005e a104          	cp	a,#4
 444  0060 2712          	jreq	L43
 445  0062 7b06          	ld	a,(OFST+5,sp)
 446  0064 270e          	jreq	L43
 447  0066 ae004d        	ldw	x,#77
 448  0069 89            	pushw	x
 449  006a 5f            	clrw	x
 450  006b 89            	pushw	x
 451  006c ae0000        	ldw	x,#L102
 452  006f cd0000        	call	_assert_failed
 454  0072 5b04          	addw	sp,#4
 455  0074               L43:
 456                     ; 78     assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 458  0074 7b07          	ld	a,(OFST+6,sp)
 459  0076 2712          	jreq	L44
 460  0078 a102          	cp	a,#2
 461  007a 270e          	jreq	L44
 462  007c ae004e        	ldw	x,#78
 463  007f 89            	pushw	x
 464  0080 5f            	clrw	x
 465  0081 89            	pushw	x
 466  0082 ae0000        	ldw	x,#L102
 467  0085 cd0000        	call	_assert_failed
 469  0088 5b04          	addw	sp,#4
 470  008a               L44:
 471                     ; 79     assert_param(IS_SPI_PHASE_OK(ClockPhase));
 473  008a 7b08          	ld	a,(OFST+7,sp)
 474  008c 2711          	jreq	L45
 475  008e 4a            	dec	a
 476  008f 270e          	jreq	L45
 477  0091 ae004f        	ldw	x,#79
 478  0094 89            	pushw	x
 479  0095 5f            	clrw	x
 480  0096 89            	pushw	x
 481  0097 ae0000        	ldw	x,#L102
 482  009a cd0000        	call	_assert_failed
 484  009d 5b04          	addw	sp,#4
 485  009f               L45:
 486                     ; 80     assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 488  009f 7b09          	ld	a,(OFST+8,sp)
 489  00a1 271a          	jreq	L46
 490  00a3 a104          	cp	a,#4
 491  00a5 2716          	jreq	L46
 492  00a7 a180          	cp	a,#128
 493  00a9 2712          	jreq	L46
 494  00ab a1c0          	cp	a,#192
 495  00ad 270e          	jreq	L46
 496  00af ae0050        	ldw	x,#80
 497  00b2 89            	pushw	x
 498  00b3 5f            	clrw	x
 499  00b4 89            	pushw	x
 500  00b5 ae0000        	ldw	x,#L102
 501  00b8 cd0000        	call	_assert_failed
 503  00bb 5b04          	addw	sp,#4
 504  00bd               L46:
 505                     ; 81     assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 507  00bd 7b0a          	ld	a,(OFST+9,sp)
 508  00bf a102          	cp	a,#2
 509  00c1 2712          	jreq	L47
 510  00c3 7b0a          	ld	a,(OFST+9,sp)
 511  00c5 270e          	jreq	L47
 512  00c7 ae0051        	ldw	x,#81
 513  00ca 89            	pushw	x
 514  00cb 5f            	clrw	x
 515  00cc 89            	pushw	x
 516  00cd ae0000        	ldw	x,#L102
 517  00d0 cd0000        	call	_assert_failed
 519  00d3 5b04          	addw	sp,#4
 520  00d5               L47:
 521                     ; 82     assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 523  00d5 7b0b          	ld	a,(OFST+10,sp)
 524  00d7 260e          	jrne	L201
 525  00d9 ae0052        	ldw	x,#82
 526  00dc 89            	pushw	x
 527  00dd 5f            	clrw	x
 528  00de 89            	pushw	x
 529  00df ae0000        	ldw	x,#L102
 530  00e2 cd0000        	call	_assert_failed
 532  00e5 5b04          	addw	sp,#4
 533  00e7               L201:
 534                     ; 85     SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 534                     ; 86                     (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 536  00e7 7b07          	ld	a,(OFST+6,sp)
 537  00e9 1a08          	or	a,(OFST+7,sp)
 538  00eb 6b01          	ld	(OFST+0,sp),a
 540  00ed 7b02          	ld	a,(OFST+1,sp)
 541  00ef 1a03          	or	a,(OFST+2,sp)
 542  00f1 1a01          	or	a,(OFST+0,sp)
 543  00f3 c75200        	ld	20992,a
 544                     ; 89     SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 546  00f6 7b09          	ld	a,(OFST+8,sp)
 547  00f8 1a0a          	or	a,(OFST+9,sp)
 548  00fa c75201        	ld	20993,a
 549                     ; 91     if (Mode == SPI_MODE_MASTER)
 551  00fd 7b06          	ld	a,(OFST+5,sp)
 552  00ff a104          	cp	a,#4
 553  0101 2606          	jrne	L302
 554                     ; 93         SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 556  0103 72105201      	bset	20993,#0
 558  0107 2004          	jra	L502
 559  0109               L302:
 560                     ; 97         SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 562  0109 72115201      	bres	20993,#0
 563  010d               L502:
 564                     ; 101     SPI->CR1 |= (uint8_t)(Mode);
 566  010d c65200        	ld	a,20992
 567  0110 1a06          	or	a,(OFST+5,sp)
 568  0112 c75200        	ld	20992,a
 569                     ; 104     SPI->CRCPR = (uint8_t)CRCPolynomial;
 571  0115 7b0b          	ld	a,(OFST+10,sp)
 572  0117 c75205        	ld	20997,a
 573                     ; 105 }
 576  011a 5b03          	addw	sp,#3
 577  011c 81            	ret	
 633                     ; 113 void SPI_Cmd(FunctionalState NewState)
 633                     ; 114 {
 634                     	switch	.text
 635  011d               _SPI_Cmd:
 637  011d 88            	push	a
 638       00000000      OFST:	set	0
 641                     ; 116     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 643  011e 4d            	tnz	a
 644  011f 2711          	jreq	L411
 645  0121 4a            	dec	a
 646  0122 270e          	jreq	L411
 647  0124 ae0074        	ldw	x,#116
 648  0127 89            	pushw	x
 649  0128 5f            	clrw	x
 650  0129 89            	pushw	x
 651  012a ae0000        	ldw	x,#L102
 652  012d cd0000        	call	_assert_failed
 654  0130 5b04          	addw	sp,#4
 655  0132               L411:
 656                     ; 118     if (NewState != DISABLE)
 658  0132 7b01          	ld	a,(OFST+1,sp)
 659  0134 2706          	jreq	L532
 660                     ; 120         SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 662  0136 721c5200      	bset	20992,#6
 664  013a 2004          	jra	L732
 665  013c               L532:
 666                     ; 124         SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 668  013c 721d5200      	bres	20992,#6
 669  0140               L732:
 670                     ; 126 }
 673  0140 84            	pop	a
 674  0141 81            	ret	
 782                     ; 135 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 782                     ; 136 {
 783                     	switch	.text
 784  0142               _SPI_ITConfig:
 786  0142 89            	pushw	x
 787  0143 88            	push	a
 788       00000001      OFST:	set	1
 791                     ; 137     uint8_t itpos = 0;
 793                     ; 139     assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 795  0144 9e            	ld	a,xh
 796  0145 a117          	cp	a,#23
 797  0147 271d          	jreq	L621
 798  0149 9e            	ld	a,xh
 799  014a a106          	cp	a,#6
 800  014c 2718          	jreq	L621
 801  014e 9e            	ld	a,xh
 802  014f a105          	cp	a,#5
 803  0151 2713          	jreq	L621
 804  0153 9e            	ld	a,xh
 805  0154 a134          	cp	a,#52
 806  0156 270e          	jreq	L621
 807  0158 ae008b        	ldw	x,#139
 808  015b 89            	pushw	x
 809  015c 5f            	clrw	x
 810  015d 89            	pushw	x
 811  015e ae0000        	ldw	x,#L102
 812  0161 cd0000        	call	_assert_failed
 814  0164 5b04          	addw	sp,#4
 815  0166               L621:
 816                     ; 140     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 818  0166 7b03          	ld	a,(OFST+2,sp)
 819  0168 2711          	jreq	L631
 820  016a 4a            	dec	a
 821  016b 270e          	jreq	L631
 822  016d ae008c        	ldw	x,#140
 823  0170 89            	pushw	x
 824  0171 5f            	clrw	x
 825  0172 89            	pushw	x
 826  0173 ae0000        	ldw	x,#L102
 827  0176 cd0000        	call	_assert_failed
 829  0179 5b04          	addw	sp,#4
 830  017b               L631:
 831                     ; 143     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 833  017b 7b02          	ld	a,(OFST+1,sp)
 834  017d a40f          	and	a,#15
 835  017f 5f            	clrw	x
 836  0180 97            	ld	xl,a
 837  0181 a601          	ld	a,#1
 838  0183 5d            	tnzw	x
 839  0184 2704          	jreq	L241
 840  0186               L441:
 841  0186 48            	sll	a
 842  0187 5a            	decw	x
 843  0188 26fc          	jrne	L441
 844  018a               L241:
 845  018a 6b01          	ld	(OFST+0,sp),a
 847                     ; 145     if (NewState != DISABLE)
 849  018c 0d03          	tnz	(OFST+2,sp)
 850  018e 2707          	jreq	L703
 851                     ; 147         SPI->ICR |= itpos; /* Enable interrupt*/
 853  0190 c65202        	ld	a,20994
 854  0193 1a01          	or	a,(OFST+0,sp)
 856  0195 2004          	jra	L113
 857  0197               L703:
 858                     ; 151         SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 860  0197 43            	cpl	a
 861  0198 c45202        	and	a,20994
 862  019b               L113:
 863  019b c75202        	ld	20994,a
 864                     ; 153 }
 867  019e 5b03          	addw	sp,#3
 868  01a0 81            	ret	
 900                     ; 159 void SPI_SendData(uint8_t Data)
 900                     ; 160 {
 901                     	switch	.text
 902  01a1               _SPI_SendData:
 906                     ; 161     SPI->DR = Data; /* Write in the DR register the data to be sent*/
 908  01a1 c75204        	ld	20996,a
 909                     ; 162 }
 912  01a4 81            	ret	
 935                     ; 169 uint8_t SPI_ReceiveData(void)
 935                     ; 170 {
 936                     	switch	.text
 937  01a5               _SPI_ReceiveData:
 941                     ; 171     return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 943  01a5 c65204        	ld	a,20996
 946  01a8 81            	ret	
 983                     ; 180 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 983                     ; 181 {
 984                     	switch	.text
 985  01a9               _SPI_NSSInternalSoftwareCmd:
 987  01a9 88            	push	a
 988       00000000      OFST:	set	0
 991                     ; 183     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 993  01aa 4d            	tnz	a
 994  01ab 2711          	jreq	L061
 995  01ad 4a            	dec	a
 996  01ae 270e          	jreq	L061
 997  01b0 ae00b7        	ldw	x,#183
 998  01b3 89            	pushw	x
 999  01b4 5f            	clrw	x
1000  01b5 89            	pushw	x
1001  01b6 ae0000        	ldw	x,#L102
1002  01b9 cd0000        	call	_assert_failed
1004  01bc 5b04          	addw	sp,#4
1005  01be               L061:
1006                     ; 185     if (NewState != DISABLE)
1008  01be 7b01          	ld	a,(OFST+1,sp)
1009  01c0 2706          	jreq	L553
1010                     ; 187         SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
1012  01c2 72105201      	bset	20993,#0
1014  01c6 2004          	jra	L753
1015  01c8               L553:
1016                     ; 191         SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
1018  01c8 72115201      	bres	20993,#0
1019  01cc               L753:
1020                     ; 193 }
1023  01cc 84            	pop	a
1024  01cd 81            	ret	
1047                     ; 200 void SPI_TransmitCRC(void)
1047                     ; 201 {
1048                     	switch	.text
1049  01ce               _SPI_TransmitCRC:
1053                     ; 202     SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1055  01ce 72185201      	bset	20993,#4
1056                     ; 203 }
1059  01d2 81            	ret	
1096                     ; 211 void SPI_CalculateCRCCmd(FunctionalState NewState)
1096                     ; 212 {
1097                     	switch	.text
1098  01d3               _SPI_CalculateCRCCmd:
1100  01d3 88            	push	a
1101       00000000      OFST:	set	0
1104                     ; 214     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1106  01d4 4d            	tnz	a
1107  01d5 2711          	jreq	L471
1108  01d7 4a            	dec	a
1109  01d8 270e          	jreq	L471
1110  01da ae00d6        	ldw	x,#214
1111  01dd 89            	pushw	x
1112  01de 5f            	clrw	x
1113  01df 89            	pushw	x
1114  01e0 ae0000        	ldw	x,#L102
1115  01e3 cd0000        	call	_assert_failed
1117  01e6 5b04          	addw	sp,#4
1118  01e8               L471:
1119                     ; 216     if (NewState != DISABLE)
1121  01e8 7b01          	ld	a,(OFST+1,sp)
1122  01ea 2706          	jreq	L704
1123                     ; 218         SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1125  01ec 721a5201      	bset	20993,#5
1127  01f0 2004          	jra	L114
1128  01f2               L704:
1129                     ; 222         SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1131  01f2 721b5201      	bres	20993,#5
1132  01f6               L114:
1133                     ; 224 }
1136  01f6 84            	pop	a
1137  01f7 81            	ret	
1200                     ; 231 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
1200                     ; 232 {
1201                     	switch	.text
1202  01f8               _SPI_GetCRC:
1204  01f8 88            	push	a
1205  01f9 88            	push	a
1206       00000001      OFST:	set	1
1209                     ; 233     uint8_t crcreg = 0;
1211                     ; 236     assert_param(IS_SPI_CRC_OK(SPI_CRC));
1213  01fa a101          	cp	a,#1
1214  01fc 2711          	jreq	L602
1215  01fe 4d            	tnz	a
1216  01ff 270e          	jreq	L602
1217  0201 ae00ec        	ldw	x,#236
1218  0204 89            	pushw	x
1219  0205 5f            	clrw	x
1220  0206 89            	pushw	x
1221  0207 ae0000        	ldw	x,#L102
1222  020a cd0000        	call	_assert_failed
1224  020d 5b04          	addw	sp,#4
1225  020f               L602:
1226                     ; 238     if (SPI_CRC != SPI_CRC_RX)
1228  020f 7b02          	ld	a,(OFST+1,sp)
1229  0211 2705          	jreq	L344
1230                     ; 240         crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1232  0213 c65207        	ld	a,20999
1235  0216 2003          	jra	L544
1236  0218               L344:
1237                     ; 244         crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1239  0218 c65206        	ld	a,20998
1241  021b               L544:
1242                     ; 248     return crcreg;
1246  021b 85            	popw	x
1247  021c 81            	ret	
1272                     ; 256 void SPI_ResetCRC(void)
1272                     ; 257 {
1273                     	switch	.text
1274  021d               _SPI_ResetCRC:
1278                     ; 260     SPI_CalculateCRCCmd(ENABLE);
1280  021d a601          	ld	a,#1
1281  021f adb2          	call	_SPI_CalculateCRCCmd
1283                     ; 263     SPI_Cmd(ENABLE);
1285  0221 a601          	ld	a,#1
1287                     ; 264 }
1290  0223 cc011d        	jp	_SPI_Cmd
1314                     ; 271 uint8_t SPI_GetCRCPolynomial(void)
1314                     ; 272 {
1315                     	switch	.text
1316  0226               _SPI_GetCRCPolynomial:
1320                     ; 273     return SPI->CRCPR; /* Return the CRC polynomial register */
1322  0226 c65205        	ld	a,20997
1325  0229 81            	ret	
1382                     ; 281 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1382                     ; 282 {
1383                     	switch	.text
1384  022a               _SPI_BiDirectionalLineConfig:
1386  022a 88            	push	a
1387       00000000      OFST:	set	0
1390                     ; 284     assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1392  022b 4d            	tnz	a
1393  022c 2711          	jreq	L032
1394  022e 4a            	dec	a
1395  022f 270e          	jreq	L032
1396  0231 ae011c        	ldw	x,#284
1397  0234 89            	pushw	x
1398  0235 5f            	clrw	x
1399  0236 89            	pushw	x
1400  0237 ae0000        	ldw	x,#L102
1401  023a cd0000        	call	_assert_failed
1403  023d 5b04          	addw	sp,#4
1404  023f               L032:
1405                     ; 286     if (SPI_Direction != SPI_DIRECTION_RX)
1407  023f 7b01          	ld	a,(OFST+1,sp)
1408  0241 2706          	jreq	L515
1409                     ; 288         SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1411  0243 721c5201      	bset	20993,#6
1413  0247 2004          	jra	L715
1414  0249               L515:
1415                     ; 292         SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1417  0249 721d5201      	bres	20993,#6
1418  024d               L715:
1419                     ; 294 }
1422  024d 84            	pop	a
1423  024e 81            	ret	
1545                     ; 304 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1545                     ; 305 {
1546                     	switch	.text
1547  024f               _SPI_GetFlagStatus:
1549  024f 88            	push	a
1550  0250 88            	push	a
1551       00000001      OFST:	set	1
1554                     ; 306     FlagStatus status = RESET;
1556                     ; 308     assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1558  0251 a140          	cp	a,#64
1559  0253 2726          	jreq	L242
1560  0255 a120          	cp	a,#32
1561  0257 2722          	jreq	L242
1562  0259 a110          	cp	a,#16
1563  025b 271e          	jreq	L242
1564  025d a108          	cp	a,#8
1565  025f 271a          	jreq	L242
1566  0261 a102          	cp	a,#2
1567  0263 2716          	jreq	L242
1568  0265 a101          	cp	a,#1
1569  0267 2712          	jreq	L242
1570  0269 a180          	cp	a,#128
1571  026b 270e          	jreq	L242
1572  026d ae0134        	ldw	x,#308
1573  0270 89            	pushw	x
1574  0271 5f            	clrw	x
1575  0272 89            	pushw	x
1576  0273 ae0000        	ldw	x,#L102
1577  0276 cd0000        	call	_assert_failed
1579  0279 5b04          	addw	sp,#4
1580  027b               L242:
1581                     ; 311     if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1583  027b c65203        	ld	a,20995
1584  027e 1502          	bcp	a,(OFST+1,sp)
1585  0280 2704          	jreq	L575
1586                     ; 313         status = SET; /* SPI_FLAG is set */
1588  0282 a601          	ld	a,#1
1591  0284 2001          	jra	L775
1592  0286               L575:
1593                     ; 317         status = RESET; /* SPI_FLAG is reset*/
1595  0286 4f            	clr	a
1597  0287               L775:
1598                     ; 321     return status;
1602  0287 85            	popw	x
1603  0288 81            	ret	
1639                     ; 339 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1639                     ; 340 {
1640                     	switch	.text
1641  0289               _SPI_ClearFlag:
1643  0289 88            	push	a
1644       00000000      OFST:	set	0
1647                     ; 341     assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1649  028a a110          	cp	a,#16
1650  028c 2712          	jreq	L452
1651  028e a108          	cp	a,#8
1652  0290 270e          	jreq	L452
1653  0292 ae0155        	ldw	x,#341
1654  0295 89            	pushw	x
1655  0296 5f            	clrw	x
1656  0297 89            	pushw	x
1657  0298 ae0000        	ldw	x,#L102
1658  029b cd0000        	call	_assert_failed
1660  029e 5b04          	addw	sp,#4
1661  02a0               L452:
1662                     ; 343     SPI->SR = (uint8_t)(~SPI_FLAG);
1664  02a0 7b01          	ld	a,(OFST+1,sp)
1665  02a2 43            	cpl	a
1666  02a3 c75203        	ld	20995,a
1667                     ; 344 }
1670  02a6 84            	pop	a
1671  02a7 81            	ret	
1746                     ; 359 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1746                     ; 360 {
1747                     	switch	.text
1748  02a8               _SPI_GetITStatus:
1750  02a8 88            	push	a
1751  02a9 89            	pushw	x
1752       00000002      OFST:	set	2
1755                     ; 361     ITStatus pendingbitstatus = RESET;
1757                     ; 362     uint8_t itpos = 0;
1759                     ; 363     uint8_t itmask1 = 0;
1761                     ; 364     uint8_t itmask2 = 0;
1763                     ; 365     uint8_t enablestatus = 0;
1765                     ; 366     assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1767  02aa a165          	cp	a,#101
1768  02ac 2722          	jreq	L662
1769  02ae a155          	cp	a,#85
1770  02b0 271e          	jreq	L662
1771  02b2 a145          	cp	a,#69
1772  02b4 271a          	jreq	L662
1773  02b6 a134          	cp	a,#52
1774  02b8 2716          	jreq	L662
1775  02ba a117          	cp	a,#23
1776  02bc 2712          	jreq	L662
1777  02be a106          	cp	a,#6
1778  02c0 270e          	jreq	L662
1779  02c2 ae016e        	ldw	x,#366
1780  02c5 89            	pushw	x
1781  02c6 5f            	clrw	x
1782  02c7 89            	pushw	x
1783  02c8 ae0000        	ldw	x,#L102
1784  02cb cd0000        	call	_assert_failed
1786  02ce 5b04          	addw	sp,#4
1787  02d0               L662:
1788                     ; 368     itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1790  02d0 7b03          	ld	a,(OFST+1,sp)
1791  02d2 a40f          	and	a,#15
1792  02d4 5f            	clrw	x
1793  02d5 97            	ld	xl,a
1794  02d6 a601          	ld	a,#1
1795  02d8 5d            	tnzw	x
1796  02d9 2704          	jreq	L272
1797  02db               L472:
1798  02db 48            	sll	a
1799  02dc 5a            	decw	x
1800  02dd 26fc          	jrne	L472
1801  02df               L272:
1802  02df 6b01          	ld	(OFST-1,sp),a
1804                     ; 371     itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1806  02e1 7b03          	ld	a,(OFST+1,sp)
1807  02e3 4e            	swap	a
1808  02e4 a40f          	and	a,#15
1809  02e6 6b02          	ld	(OFST+0,sp),a
1811                     ; 373     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1813  02e8 5f            	clrw	x
1814  02e9 97            	ld	xl,a
1815  02ea a601          	ld	a,#1
1816  02ec 5d            	tnzw	x
1817  02ed 2704          	jreq	L672
1818  02ef               L003:
1819  02ef 48            	sll	a
1820  02f0 5a            	decw	x
1821  02f1 26fc          	jrne	L003
1822  02f3               L672:
1824                     ; 375     enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1826  02f3 c45203        	and	a,20995
1827  02f6 6b02          	ld	(OFST+0,sp),a
1829                     ; 377     if (((SPI->ICR & itpos) != RESET) && enablestatus)
1831  02f8 c65202        	ld	a,20994
1832  02fb 1501          	bcp	a,(OFST-1,sp)
1833  02fd 2708          	jreq	L156
1835  02ff 7b02          	ld	a,(OFST+0,sp)
1836  0301 2704          	jreq	L156
1837                     ; 380         pendingbitstatus = SET;
1839  0303 a601          	ld	a,#1
1842  0305 2001          	jra	L356
1843  0307               L156:
1844                     ; 385         pendingbitstatus = RESET;
1846  0307 4f            	clr	a
1848  0308               L356:
1849                     ; 388     return  pendingbitstatus;
1853  0308 5b03          	addw	sp,#3
1854  030a 81            	ret	
1898                     ; 404 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1898                     ; 405 {
1899                     	switch	.text
1900  030b               _SPI_ClearITPendingBit:
1902  030b 88            	push	a
1903  030c 88            	push	a
1904       00000001      OFST:	set	1
1907                     ; 406     uint8_t itpos = 0;
1909                     ; 407     assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1911  030d a145          	cp	a,#69
1912  030f 2712          	jreq	L013
1913  0311 a134          	cp	a,#52
1914  0313 270e          	jreq	L013
1915  0315 ae0197        	ldw	x,#407
1916  0318 89            	pushw	x
1917  0319 5f            	clrw	x
1918  031a 89            	pushw	x
1919  031b ae0000        	ldw	x,#L102
1920  031e cd0000        	call	_assert_failed
1922  0321 5b04          	addw	sp,#4
1923  0323               L013:
1924                     ; 412     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1926  0323 7b02          	ld	a,(OFST+1,sp)
1927  0325 4e            	swap	a
1928  0326 a40f          	and	a,#15
1929  0328 5f            	clrw	x
1930  0329 97            	ld	xl,a
1931  032a a601          	ld	a,#1
1932  032c 5d            	tnzw	x
1933  032d 2704          	jreq	L413
1934  032f               L613:
1935  032f 48            	sll	a
1936  0330 5a            	decw	x
1937  0331 26fc          	jrne	L613
1938  0333               L413:
1940                     ; 414     SPI->SR = (uint8_t)(~itpos);
1942  0333 43            	cpl	a
1943  0334 c75203        	ld	20995,a
1944                     ; 416 }
1947  0337 85            	popw	x
1948  0338 81            	ret	
1961                     	xdef	_SPI_ClearITPendingBit
1962                     	xdef	_SPI_GetITStatus
1963                     	xdef	_SPI_ClearFlag
1964                     	xdef	_SPI_GetFlagStatus
1965                     	xdef	_SPI_BiDirectionalLineConfig
1966                     	xdef	_SPI_GetCRCPolynomial
1967                     	xdef	_SPI_ResetCRC
1968                     	xdef	_SPI_GetCRC
1969                     	xdef	_SPI_CalculateCRCCmd
1970                     	xdef	_SPI_TransmitCRC
1971                     	xdef	_SPI_NSSInternalSoftwareCmd
1972                     	xdef	_SPI_ReceiveData
1973                     	xdef	_SPI_SendData
1974                     	xdef	_SPI_ITConfig
1975                     	xdef	_SPI_Cmd
1976                     	xdef	_SPI_Init
1977                     	xdef	_SPI_DeInit
1978                     	xref	_assert_failed
1979                     .const:	section	.text
1980  0000               L102:
1981  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
1982  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
1983  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
1984  0036 5f7370692e63  	dc.b	"_spi.c",0
2004                     	end
