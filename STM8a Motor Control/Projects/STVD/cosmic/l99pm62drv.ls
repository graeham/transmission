   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  19                     	switch	.data
  20  0000               L74_InitFlag:
  21  0000 00            	dc.b	0
  22  0001               _count:
  23  0001 00            	dc.b	0
  90                     ; 123 bool L99PM62drv_ReportError (u8 ServiceId, u8 ErrorId) {
  92                     	switch	.text
  93  0000               _L99PM62drv_ReportError:
  97                     ; 124     ServiceId = ServiceId;  /* to avoid error message parameter not used */
  99                     ; 125     ErrorId   = ErrorId;    /* to avoid error message parameter not used */
 101                     ; 131     return FALSE;   /*  to stop execution of interrupted function by return; */
 103  0000 4f            	clr	a
 106  0001 81            	ret	
 156                     ; 148 void L99PM62drv_Init (void) {
 157                     	switch	.text
 158  0002               _L99PM62drv_Init:
 160  0002 88            	push	a
 161       00000001      OFST:	set	1
 164                     ; 152     InitFlag = 1U;  /* Flag to notice that L99PM62drv_Init()was already called*/
 166  0003 35010000      	mov	L74_InitFlag,#1
 167                     ; 155 	for (i = 0U; i < 2U; i++){
 169  0007 4f            	clr	a
 170  0008 6b01          	ld	(OFST+0,sp),a
 172  000a               L121:
 173                     ; 156 			CtrlReg1[i] = 0U;   
 175  000a 5f            	clrw	x
 176  000b 97            	ld	xl,a
 177  000c 724f0022      	clr	(L3_CtrlReg1,x)
 178                     ; 157 			CtrlReg2[i] = 0U;
 180  0010 5f            	clrw	x
 181  0011 97            	ld	xl,a
 182  0012 724f001e      	clr	(L7_CtrlReg2,x)
 183                     ; 158 			CtrlReg3[i] = 0U;
 185  0016 5f            	clrw	x
 186  0017 97            	ld	xl,a
 187  0018 724f001a      	clr	(L31_CtrlReg3,x)
 188                     ; 159 			CtrlReg4[i] = 0U;
 190  001c 5f            	clrw	x
 191  001d 97            	ld	xl,a
 192  001e 724f0016      	clr	(L71_CtrlReg4,x)
 193                     ; 160 			CtrlReg5[i] = 0U;
 195  0022 5f            	clrw	x
 196  0023 97            	ld	xl,a
 197  0024 724f0012      	clr	(L32_CtrlReg5,x)
 198                     ; 161 			CtrlReg6[i] = 0U;
 200  0028 5f            	clrw	x
 201  0029 97            	ld	xl,a
 202  002a 724f000e      	clr	(L72_CtrlReg6,x)
 203                     ; 162 			CtrlReg1_old[i] = 0U;
 205  002e 5f            	clrw	x
 206  002f 97            	ld	xl,a
 207  0030 724f0020      	clr	(L5_CtrlReg1_old,x)
 208                     ; 163 			CtrlReg2_old[i] = 0U;
 210  0034 5f            	clrw	x
 211  0035 97            	ld	xl,a
 212  0036 724f001c      	clr	(L11_CtrlReg2_old,x)
 213                     ; 164 			CtrlReg3_old[i] = 0U;
 215  003a 5f            	clrw	x
 216  003b 97            	ld	xl,a
 217  003c 724f0018      	clr	(L51_CtrlReg3_old,x)
 218                     ; 165 			CtrlReg4_old[i] = 0U;
 220  0040 5f            	clrw	x
 221  0041 97            	ld	xl,a
 222  0042 724f0014      	clr	(L12_CtrlReg4_old,x)
 223                     ; 166 			CtrlReg5[i] = 0U;
 225  0046 5f            	clrw	x
 226  0047 97            	ld	xl,a
 227  0048 724f0012      	clr	(L32_CtrlReg5,x)
 228                     ; 167 			CtrlReg5_old[i] = 0U;
 230  004c 5f            	clrw	x
 231  004d 97            	ld	xl,a
 232  004e 724f0010      	clr	(L52_CtrlReg5_old,x)
 233                     ; 168 			CtrlReg6[i] = 0U;
 235  0052 5f            	clrw	x
 236  0053 97            	ld	xl,a
 237  0054 724f000e      	clr	(L72_CtrlReg6,x)
 238                     ; 169 			CtrlReg6_old[i] = 0U;
 240  0058 5f            	clrw	x
 241  0059 97            	ld	xl,a
 242  005a 724f000c      	clr	(L13_CtrlReg6_old,x)
 243                     ; 170 			StatReg1[i] = 0U;
 245  005e 5f            	clrw	x
 246  005f 97            	ld	xl,a
 247  0060 724f000a      	clr	(L33_StatReg1,x)
 248                     ; 171 			StatReg2[i] = 0U;
 250  0064 5f            	clrw	x
 251  0065 97            	ld	xl,a
 252  0066 724f0008      	clr	(L53_StatReg2,x)
 253                     ; 172 			StatReg3[i] = 0U;
 255  006a 5f            	clrw	x
 256  006b 97            	ld	xl,a
 257  006c 724f0006      	clr	(L73_StatReg3,x)
 258                     ; 173 			ConfigReg[i] = 0U;
 260  0070 5f            	clrw	x
 261  0071 97            	ld	xl,a
 262  0072 724f0004      	clr	(L14_ConfigReg,x)
 263                     ; 174 			ConfigReg_old[i] = 0U;
 265  0076 5f            	clrw	x
 266  0077 97            	ld	xl,a
 267  0078 724f0002      	clr	(L34_ConfigReg_old,x)
 268                     ; 155 	for (i = 0U; i < 2U; i++){
 270  007c 0c01          	inc	(OFST+0,sp)
 274  007e 7b01          	ld	a,(OFST+0,sp)
 275  0080 a102          	cp	a,#2
 276  0082 2586          	jrult	L121
 277                     ; 176 	CtrlReg2[0] |= 0x03U;	/* sets the default power on values*/
 279  0084 c6001e        	ld	a,L7_CtrlReg2
 280  0087 aa03          	or	a,#3
 281  0089 c7001e        	ld	L7_CtrlReg2,a
 282                     ; 177 	CtrlReg3[0] |= 0x0CU;
 284  008c c6001a        	ld	a,L31_CtrlReg3
 285  008f aa0c          	or	a,#12
 286  0091 c7001a        	ld	L31_CtrlReg3,a
 287                     ; 178 	CtrlReg4[1] |= 0x14U;
 289  0094 c60017        	ld	a,L71_CtrlReg4+1
 290  0097 aa14          	or	a,#20
 291  0099 c70017        	ld	L71_CtrlReg4+1,a
 292                     ; 179 	CtrlReg4[0] |= 0xF6U;
 294  009c c60016        	ld	a,L71_CtrlReg4
 295  009f aaf6          	or	a,#246
 296  00a1 c70016        	ld	L71_CtrlReg4,a
 297                     ; 180 	CtrlReg5[1] |= 0x7fU;
 299  00a4 c60013        	ld	a,L32_CtrlReg5+1
 300  00a7 aa7f          	or	a,#127
 301  00a9 c70013        	ld	L32_CtrlReg5+1,a
 302                     ; 181 	CtrlReg6[1] |= 0x7fU;
 304  00ac c6000f        	ld	a,L72_CtrlReg6+1
 305  00af aa7f          	or	a,#127
 306  00b1 c7000f        	ld	L72_CtrlReg6+1,a
 307                     ; 182 }
 310  00b4 84            	pop	a
 311  00b5 81            	ret	
 341                     ; 198 void L99PM62drv_WdgTrigger (void) {
 342                     	switch	.text
 343  00b6               _L99PM62drv_WdgTrigger:
 347                     ; 201     if (!InitFlag) {
 349  00b6 c60000        	ld	a,L74_InitFlag
 350  00b9 260a          	jrne	L731
 351                     ; 202         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_WdgTrigger, L99PM62DRV_EID_UNINIT)) {
 353  00bb ae0114        	ldw	x,#276
 354  00be cd0000        	call	_L99PM62drv_ReportError
 356  00c1 4d            	tnz	a
 357  00c2 2601          	jrne	L731
 358                     ; 203             return;
 361  00c4 81            	ret	
 362  00c5               L731:
 363                     ; 207     CtrlReg1[0] ^= 0x01U;           /* refresh WD */ 
 365  00c5 90100022      	bcpl	L3_CtrlReg1,#0
 366                     ; 208     L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR1,
 366                     ; 209 									CtrlReg1, 
 366                     ; 210 									&GlobalStatusRegister,
 366                     ; 211 									CtrlReg1_old);
 368  00c9 ae0020        	ldw	x,#L5_CtrlReg1_old
 369  00cc 89            	pushw	x
 370  00cd ae0001        	ldw	x,#L54_GlobalStatusRegister
 371  00d0 89            	pushw	x
 372  00d1 ae0022        	ldw	x,#L3_CtrlReg1
 373  00d4 89            	pushw	x
 374  00d5 a601          	ld	a,#1
 375  00d7 cd0e5d        	call	_ST_SPI_Send_16
 377  00da 5b06          	addw	sp,#6
 378                     ; 212 }
 381  00dc 81            	ret	
 445                     ; 232 void L99PM62drv_SetStandbyMode (L99PM62drv_StandbyModeType mode) {
 446                     	switch	.text
 447  00dd               _L99PM62drv_SetStandbyMode:
 449  00dd 88            	push	a
 450       00000000      OFST:	set	0
 453                     ; 235     if (!InitFlag) {
 455  00de c60000        	ld	a,L74_InitFlag
 456  00e1 260b          	jrne	L771
 457                     ; 236         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetStandbyMode, L99PM62DRV_EID_UNINIT)) {
 459  00e3 ae0214        	ldw	x,#532
 460  00e6 cd0000        	call	_L99PM62drv_ReportError
 462  00e9 4d            	tnz	a
 463  00ea 2602          	jrne	L771
 464                     ; 237             return;
 467  00ec 84            	pop	a
 468  00ed 81            	ret	
 469  00ee               L771:
 470                     ; 241    switch (mode) {
 472  00ee 7b01          	ld	a,(OFST+1,sp)
 474                     ; 263       return;
 475  00f0 270b          	jreq	L341
 476  00f2 4a            	dec	a
 477  00f3 2729          	jreq	L541
 478                     ; 259    default:
 478                     ; 260 #ifdef  L99PM62DRV_DEV_ERROR_DETECT
 478                     ; 261         L99PM62drv_ReportError (SID_L99PM62drv_SetStandbyMode, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE);
 480  00f5 ae020b        	ldw	x,#523
 481  00f8 cd0000        	call	_L99PM62drv_ReportError
 483                     ; 263       return;
 486  00fb 84            	pop	a
 487  00fc 81            	ret	
 488  00fd               L341:
 489                     ; 242    case L99PM62DRV_STANDBYMODE_V1:
 489                     ; 243 		CtrlReg1[0] |= 0x06U;
 491  00fd c60022        	ld	a,L3_CtrlReg1
 492  0100 aa06          	or	a,#6
 493  0102 c70022        	ld	L3_CtrlReg1,a
 494                     ; 244 		L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR1,
 494                     ; 245 										CtrlReg1, 
 494                     ; 246 										&GlobalStatusRegister,
 494                     ; 247 										CtrlReg1_old);
 496  0105 ae0020        	ldw	x,#L5_CtrlReg1_old
 497  0108 89            	pushw	x
 498  0109 ae0001        	ldw	x,#L54_GlobalStatusRegister
 499  010c 89            	pushw	x
 500  010d ae0022        	ldw	x,#L3_CtrlReg1
 501  0110 89            	pushw	x
 502  0111 a601          	ld	a,#1
 503  0113 cd0e5d        	call	_ST_SPI_Send_16
 505  0116 5b06          	addw	sp,#6
 506                     ; 248 		CtrlReg1[0] &= (u8)~0x02U;
 508  0118 72130022      	bres	L3_CtrlReg1,#1
 509                     ; 249       break;
 511  011c 2022          	jra	L502
 512  011e               L541:
 513                     ; 250    case L99PM62DRV_STANDBYMODE_VBAT:
 513                     ; 251 		CtrlReg1[0] &= ~0x04U;
 515  011e 72150022      	bres	L3_CtrlReg1,#2
 516                     ; 252       CtrlReg1[0] |= 0x02U;
 518                     ; 253       L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR1,
 518                     ; 254 										CtrlReg1, 
 518                     ; 255 										&GlobalStatusRegister,
 518                     ; 256 										CtrlReg1_old);		/* should cause power off */
 520  0122 ae0020        	ldw	x,#L5_CtrlReg1_old
 521  0125 72120022      	bset	L3_CtrlReg1,#1
 522  0129 89            	pushw	x
 523  012a ae0001        	ldw	x,#L54_GlobalStatusRegister
 524  012d 89            	pushw	x
 525  012e ae0022        	ldw	x,#L3_CtrlReg1
 526  0131 89            	pushw	x
 527  0132 4c            	inc	a
 528  0133 cd0e5d        	call	_ST_SPI_Send_16
 530  0136 5b06          	addw	sp,#6
 531                     ; 257       CtrlReg1[0] &= (u8)~0x012;           	/* line should not be reached */
 533  0138 c60022        	ld	a,L3_CtrlReg1
 534  013b a4ed          	and	a,#237
 535  013d c70022        	ld	L3_CtrlReg1,a
 536                     ; 258       break;
 538  0140               L502:
 539                     ; 265 }
 542  0140 84            	pop	a
 543  0141 81            	ret	
 607                     ; 277 void L99PM62drv_SetOut1Mode (L99PM62drv_Out1ModeType mode) {
 608                     	switch	.text
 609  0142               _L99PM62drv_SetOut1Mode:
 611  0142 88            	push	a
 612       00000000      OFST:	set	0
 615                     ; 280    if (!InitFlag) {
 617  0143 c60000        	ld	a,L74_InitFlag
 618  0146 260b          	jrne	L532
 619                     ; 281         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetOut1Mode, L99PM62DRV_EID_UNINIT)) {
 621  0148 ae0314        	ldw	x,#788
 622  014b cd0000        	call	_L99PM62drv_ReportError
 624  014e 4d            	tnz	a
 625  014f 2602          	jrne	L532
 626                     ; 282             return;
 629  0151 84            	pop	a
 630  0152 81            	ret	
 631  0153               L532:
 632                     ; 285    if ((mode != L99PM62DRV_OUT1_MODE_PWM1) && (mode != L99PM62DRV_OUT1_MODE_TIMER1)) {
 634  0153 7b01          	ld	a,(OFST+1,sp)
 635  0155 270e          	jreq	L142
 637  0157 4a            	dec	a
 638  0158 270b          	jreq	L142
 639                     ; 286         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetOut1Mode, L99PM62DRV_EID_PARAMETER2_OUT_OF_RANGE)) {
 641  015a ae030c        	ldw	x,#780
 642  015d cd0000        	call	_L99PM62drv_ReportError
 644  0160 4d            	tnz	a
 645  0161 2602          	jrne	L142
 646                     ; 287             return;
 649  0163 84            	pop	a
 650  0164 81            	ret	
 651  0165               L142:
 652                     ; 291       CtrlReg1[1] &= (u8)~0x01U;
 654  0165 72110023      	bres	L3_CtrlReg1+1,#0
 655                     ; 292 		CtrlReg1[1] |= (u8)mode & 0x01U;
 657  0169 7b01          	ld	a,(OFST+1,sp)
 658  016b a401          	and	a,#1
 659  016d ca0023        	or	a,L3_CtrlReg1+1
 660  0170 c70023        	ld	L3_CtrlReg1+1,a
 661                     ; 293 	   L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR1,
 661                     ; 294 										CtrlReg1, 
 661                     ; 295 										&GlobalStatusRegister,
 661                     ; 296 										CtrlReg1_old);
 663  0173 ae0020        	ldw	x,#L5_CtrlReg1_old
 664  0176 89            	pushw	x
 665  0177 ae0001        	ldw	x,#L54_GlobalStatusRegister
 666  017a 89            	pushw	x
 667  017b ae0022        	ldw	x,#L3_CtrlReg1
 668  017e 89            	pushw	x
 669  017f a601          	ld	a,#1
 670  0181 cd0e5d        	call	_ST_SPI_Send_16
 672  0184 5b06          	addw	sp,#6
 673                     ; 297 }
 676  0186 84            	pop	a
 677  0187 81            	ret	
 741                     ; 309 void L99PM62drv_SetOut2Mode (L99PM62drv_Out2ModeType mode) {
 742                     	switch	.text
 743  0188               _L99PM62drv_SetOut2Mode:
 745  0188 88            	push	a
 746       00000000      OFST:	set	0
 749                     ; 312    if (!InitFlag) {
 751  0189 c60000        	ld	a,L74_InitFlag
 752  018c 260b          	jrne	L372
 753                     ; 313         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetOut2Mode, L99PM62DRV_EID_UNINIT)) {
 755  018e ae0414        	ldw	x,#1044
 756  0191 cd0000        	call	_L99PM62drv_ReportError
 758  0194 4d            	tnz	a
 759  0195 2602          	jrne	L372
 760                     ; 314             return;
 763  0197 84            	pop	a
 764  0198 81            	ret	
 765  0199               L372:
 766                     ; 318    if ((mode != L99PM62DRV_OUT2_MODE_PWM2) && (mode != L99PM62DRV_OUT2_MODE_TIMER2)) {
 768  0199 7b01          	ld	a,(OFST+1,sp)
 769  019b 270e          	jreq	L772
 771  019d 4a            	dec	a
 772  019e 270b          	jreq	L772
 773                     ; 319         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetOut2Mode, L99PM62DRV_EID_PARAMETER2_OUT_OF_RANGE)) {
 775  01a0 ae040c        	ldw	x,#1036
 776  01a3 cd0000        	call	_L99PM62drv_ReportError
 778  01a6 4d            	tnz	a
 779  01a7 2602          	jrne	L772
 780                     ; 320             return;
 783  01a9 84            	pop	a
 784  01aa 81            	ret	
 785  01ab               L772:
 786                     ; 324       CtrlReg1[1] &= (u8)~0x02U;
 788  01ab 72130023      	bres	L3_CtrlReg1+1,#1
 789                     ; 325 		CtrlReg1[1] |= ((u8)mode & 0x01U)<<1;
 791  01af 7b01          	ld	a,(OFST+1,sp)
 792  01b1 a401          	and	a,#1
 793  01b3 48            	sll	a
 794  01b4 ca0023        	or	a,L3_CtrlReg1+1
 795  01b7 c70023        	ld	L3_CtrlReg1+1,a
 796                     ; 326 	   L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR1,
 796                     ; 327 										CtrlReg1, 
 796                     ; 328 										&GlobalStatusRegister,
 796                     ; 329 										CtrlReg1_old);
 798  01ba ae0020        	ldw	x,#L5_CtrlReg1_old
 799  01bd 89            	pushw	x
 800  01be ae0001        	ldw	x,#L54_GlobalStatusRegister
 801  01c1 89            	pushw	x
 802  01c2 ae0022        	ldw	x,#L3_CtrlReg1
 803  01c5 89            	pushw	x
 804  01c6 a601          	ld	a,#1
 805  01c8 cd0e5d        	call	_ST_SPI_Send_16
 807  01cb 5b06          	addw	sp,#6
 808                     ; 330 }
 811  01cd 84            	pop	a
 812  01ce 81            	ret	
 876                     ; 341 void L99PM62drv_SetOut3Mode (L99PM62drv_Out3ModeType mode) {
 877                     	switch	.text
 878  01cf               _L99PM62drv_SetOut3Mode:
 880  01cf 88            	push	a
 881       00000000      OFST:	set	0
 884                     ; 344    if (!InitFlag) {
 886  01d0 c60000        	ld	a,L74_InitFlag
 887  01d3 260b          	jrne	L133
 888                     ; 345         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetOut3Mode, L99PM62DRV_EID_UNINIT)) {
 890  01d5 ae0514        	ldw	x,#1300
 891  01d8 cd0000        	call	_L99PM62drv_ReportError
 893  01db 4d            	tnz	a
 894  01dc 2602          	jrne	L133
 895                     ; 346             return;
 898  01de 84            	pop	a
 899  01df 81            	ret	
 900  01e0               L133:
 901                     ; 349    if ((mode != L99PM62DRV_OUT3_MODE_FSO) && (mode != L99PM62DRV_OUT3_MODE_PWM3)) {
 903  01e0 7b01          	ld	a,(OFST+1,sp)
 904  01e2 270e          	jreq	L533
 906  01e4 4a            	dec	a
 907  01e5 270b          	jreq	L533
 908                     ; 350         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetOut3Mode, L99PM62DRV_EID_PARAMETER2_OUT_OF_RANGE)) {
 910  01e7 ae050c        	ldw	x,#1292
 911  01ea cd0000        	call	_L99PM62drv_ReportError
 913  01ed 4d            	tnz	a
 914  01ee 2602          	jrne	L533
 915                     ; 351             return;
 918  01f0 84            	pop	a
 919  01f1 81            	ret	
 920  01f2               L533:
 921                     ; 355       CtrlReg1[1] &= (u8)~0x04U;
 923  01f2 72150023      	bres	L3_CtrlReg1+1,#2
 924                     ; 356 		CtrlReg1[1] |= ((u8)mode & 0x01U)<<2;
 926  01f6 7b01          	ld	a,(OFST+1,sp)
 927  01f8 a401          	and	a,#1
 928  01fa 48            	sll	a
 929  01fb 48            	sll	a
 930  01fc ca0023        	or	a,L3_CtrlReg1+1
 931  01ff c70023        	ld	L3_CtrlReg1+1,a
 932                     ; 357 	   L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR1,
 932                     ; 358 										CtrlReg1, 
 932                     ; 359 										&GlobalStatusRegister,
 932                     ; 360 										CtrlReg1_old);
 934  0202 ae0020        	ldw	x,#L5_CtrlReg1_old
 935  0205 89            	pushw	x
 936  0206 ae0001        	ldw	x,#L54_GlobalStatusRegister
 937  0209 89            	pushw	x
 938  020a ae0022        	ldw	x,#L3_CtrlReg1
 939  020d 89            	pushw	x
 940  020e a601          	ld	a,#1
 941  0210 cd0e5d        	call	_ST_SPI_Send_16
 943  0213 5b06          	addw	sp,#6
 944                     ; 361 }
 947  0215 84            	pop	a
 948  0216 81            	ret	
1035                     ; 372 void L99PM62drv_SetOut4Mode (L99PM62drv_Out4ModeType mode) {
1036                     	switch	.text
1037  0217               _L99PM62drv_SetOut4Mode:
1039  0217 88            	push	a
1040  0218 88            	push	a
1041       00000001      OFST:	set	1
1044                     ; 377    if (!InitFlag) {
1046  0219 c60000        	ld	a,L74_InitFlag
1047  021c 2609          	jrne	L573
1048                     ; 378         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetOut4Mode, L99PM62DRV_EID_UNINIT)) {
1050  021e ae0614        	ldw	x,#1556
1051  0221 cd0000        	call	_L99PM62drv_ReportError
1053  0224 4d            	tnz	a
1054  0225 2713          	jreq	L07
1055                     ; 379             return;
1057  0227               L573:
1058                     ; 382 	 tmp = (s8)mode;
1060  0227 7b02          	ld	a,(OFST+1,sp)
1061  0229 6b01          	ld	(OFST+0,sp),a
1063                     ; 383    if ((tmp < (s8)L99PM62DRV_OUT4_MODE_OFF) || (tmp > (s8)L99PM62DRV_OUT4_MODE_TIMER2)) {
1065  022b 2b04          	jrmi	L304
1067  022d a104          	cp	a,#4
1068  022f 2f0b          	jrslt	L104
1069  0231               L304:
1070                     ; 384         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetOut4Mode, L99PM62DRV_EID_PARAMETER2_OUT_OF_RANGE)) {
1072  0231 ae060c        	ldw	x,#1548
1073  0234 cd0000        	call	_L99PM62drv_ReportError
1075  0237 4d            	tnz	a
1076  0238 2602          	jrne	L104
1077                     ; 385             return;
1078  023a               L07:
1081  023a 85            	popw	x
1082  023b 81            	ret	
1083  023c               L104:
1084                     ; 389       CtrlReg1[1] &= (u8)~0x30U;
1086  023c c60023        	ld	a,L3_CtrlReg1+1
1087  023f a4cf          	and	a,#207
1088  0241 c70023        	ld	L3_CtrlReg1+1,a
1089                     ; 390 		CtrlReg1[1] |= ((u8)mode & 0x03U)<<4;
1091  0244 7b02          	ld	a,(OFST+1,sp)
1092  0246 a403          	and	a,#3
1093  0248 97            	ld	xl,a
1094  0249 a610          	ld	a,#16
1095  024b 42            	mul	x,a
1096  024c 9f            	ld	a,xl
1097  024d ca0023        	or	a,L3_CtrlReg1+1
1098  0250 c70023        	ld	L3_CtrlReg1+1,a
1099                     ; 391 	   L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR1,
1099                     ; 392 										CtrlReg1, 
1099                     ; 393 										&GlobalStatusRegister,
1099                     ; 394 										CtrlReg1_old);		
1101  0253 ae0020        	ldw	x,#L5_CtrlReg1_old
1102  0256 89            	pushw	x
1103  0257 ae0001        	ldw	x,#L54_GlobalStatusRegister
1104  025a 89            	pushw	x
1105  025b ae0022        	ldw	x,#L3_CtrlReg1
1106  025e 89            	pushw	x
1107  025f a601          	ld	a,#1
1108  0261 cd0e5d        	call	_ST_SPI_Send_16
1110  0264 5b06          	addw	sp,#6
1111                     ; 395 }
1113  0266 20d2          	jra	L07
1216                     ; 406 void L99PM62drv_SetOutHSMode (L99PM62drv_OutHSModeType mode) {
1217                     	switch	.text
1218  0268               _L99PM62drv_SetOutHSMode:
1220  0268 88            	push	a
1221  0269 88            	push	a
1222       00000001      OFST:	set	1
1225                     ; 411    if (!InitFlag) {
1227  026a c60000        	ld	a,L74_InitFlag
1228  026d 2609          	jrne	L754
1229                     ; 412         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetOutHSMode, L99PM62DRV_EID_UNINIT)) {
1231  026f ae0714        	ldw	x,#1812
1232  0272 cd0000        	call	_L99PM62drv_ReportError
1234  0275 4d            	tnz	a
1235  0276 2713          	jreq	L401
1236                     ; 413             return;
1238  0278               L754:
1239                     ; 416 	 tmp = (s8)mode;
1241  0278 7b02          	ld	a,(OFST+1,sp)
1242  027a 6b01          	ld	(OFST+0,sp),a
1244                     ; 417    if ((tmp < (s8)L99PM62DRV_OUTHS_MODE_OFF) || (tmp > (s8)L99PM62DRV_OUTHS_MODE_ON)) {
1246  027c 2b04          	jrmi	L564
1248  027e a106          	cp	a,#6
1249  0280 2f0b          	jrslt	L364
1250  0282               L564:
1251                     ; 418         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetOutHSMode, L99PM62DRV_EID_PARAMETER2_OUT_OF_RANGE)) {
1253  0282 ae070c        	ldw	x,#1804
1254  0285 cd0000        	call	_L99PM62drv_ReportError
1256  0288 4d            	tnz	a
1257  0289 2602          	jrne	L364
1258                     ; 419             return;
1259  028b               L401:
1262  028b 85            	popw	x
1263  028c 81            	ret	
1264  028d               L364:
1265                     ; 423 		switch (mode){
1267  028d 7b02          	ld	a,(OFST+1,sp)
1269                     ; 443             return;                 /* parameter value out of range */
1270  028f 2717          	jreq	L704
1271  0291 4a            	dec	a
1272  0292 2714          	jreq	L704
1273  0294 4a            	dec	a
1274  0295 2711          	jreq	L704
1275  0297 4a            	dec	a
1276  0298 270e          	jreq	L704
1277  029a 4a            	dec	a
1278  029b 2721          	jreq	L114
1279  029d 4a            	dec	a
1280  029e 2727          	jreq	L314
1281                     ; 439 			default :
1281                     ; 440 			    #ifdef  L99PM62DRV_DEV_ERROR_DETECT
1281                     ; 441             L99PM62drv_ReportError (SID_L99PM62drv_SetOutHSAutorecovery, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE);
1283  02a0 ae080b        	ldw	x,#2059
1284  02a3 cd0000        	call	_L99PM62drv_ReportError
1286                     ; 443             return;                 /* parameter value out of range */
1288  02a6 20e3          	jra	L401
1289  02a8               L704:
1290                     ; 424 			case L99PM62DRV_OUTHS_MODE_OFF:
1290                     ; 425 			case L99PM62DRV_OUTHS_MODE_TIMER1:
1290                     ; 426 			case L99PM62DRV_OUTHS_MODE_PWM4:
1290                     ; 427 			case L99PM62DRV_OUTHS_MODE_TIMER2:
1290                     ; 428 					CtrlReg1[1] &= (u8)~0xC8U;
1292  02a8 c60023        	ld	a,L3_CtrlReg1+1
1293  02ab a437          	and	a,#55
1294  02ad c70023        	ld	L3_CtrlReg1+1,a
1295                     ; 429 					CtrlReg1[1] |= ((u8)mode & 0x03U)<<6;			
1297  02b0 7b02          	ld	a,(OFST+1,sp)
1298  02b2 a403          	and	a,#3
1299  02b4 97            	ld	xl,a
1300  02b5 a640          	ld	a,#64
1301  02b7 42            	mul	x,a
1302  02b8 9f            	ld	a,xl
1303  02b9 ca0023        	or	a,L3_CtrlReg1+1
1304                     ; 430 			break;
1306  02bc 2010          	jra	L374
1307  02be               L114:
1308                     ; 431 			case L99PM62DRV_OUTHS_MODE_PWM3:
1308                     ; 432 					CtrlReg1[1] &= (u8)~0xC8U;
1310  02be c60023        	ld	a,L3_CtrlReg1+1
1311  02c1 a437          	and	a,#55
1312  02c3 aa08          	or	a,#8
1313                     ; 433 					CtrlReg1[1] |= 0x08;					
1315                     ; 434 			break;
1317  02c5 2007          	jra	L374
1318  02c7               L314:
1319                     ; 435 			case L99PM62DRV_OUTHS_MODE_ON:
1319                     ; 436 					CtrlReg1[1] &= (u8)~0xC8U;
1321  02c7 c60023        	ld	a,L3_CtrlReg1+1
1322  02ca a437          	and	a,#55
1323                     ; 437 					CtrlReg1[1] |= 0x48;					
1325  02cc aa48          	or	a,#72
1326                     ; 438 			break;
1328  02ce               L374:
1329  02ce c70023        	ld	L3_CtrlReg1+1,a
1330                     ; 446 	   L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR1,
1330                     ; 447 										CtrlReg1, 
1330                     ; 448 										&GlobalStatusRegister,
1330                     ; 449 										CtrlReg1_old);
1332  02d1 ae0020        	ldw	x,#L5_CtrlReg1_old
1333  02d4 89            	pushw	x
1334  02d5 ae0001        	ldw	x,#L54_GlobalStatusRegister
1335  02d8 89            	pushw	x
1336  02d9 ae0022        	ldw	x,#L3_CtrlReg1
1337  02dc 89            	pushw	x
1338  02dd a601          	ld	a,#1
1339  02df cd0e5d        	call	_ST_SPI_Send_16
1341  02e2 5b06          	addw	sp,#6
1342                     ; 450 }
1344  02e4 20a5          	jra	L401
1406                     ; 464 void L99PM62drv_SetOutHSAutorecovery (L99PM62drv_EnableType autorecoveryMode) {
1407                     	switch	.text
1408  02e6               _L99PM62drv_SetOutHSAutorecovery:
1410  02e6 88            	push	a
1411       00000000      OFST:	set	0
1414                     ; 467     if (!InitFlag) {
1416  02e7 c60000        	ld	a,L74_InitFlag
1417  02ea 260b          	jrne	L135
1418                     ; 468         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetOutHSAutorecovery, L99PM62DRV_EID_UNINIT)) {
1420  02ec ae0814        	ldw	x,#2068
1421  02ef cd0000        	call	_L99PM62drv_ReportError
1423  02f2 4d            	tnz	a
1424  02f3 2602          	jrne	L135
1425                     ; 469             return;
1428  02f5 84            	pop	a
1429  02f6 81            	ret	
1430  02f7               L135:
1431                     ; 473     switch (autorecoveryMode) {
1433  02f7 7b01          	ld	a,(OFST+1,sp)
1435                     ; 484             return;                 /* parameter value out of range */
1436  02f9 270b          	jreq	L574
1437  02fb 4a            	dec	a
1438  02fc 270e          	jreq	L774
1439                     ; 480         default:
1439                     ; 481     #ifdef  L99PM62DRV_DEV_ERROR_DETECT
1439                     ; 482             L99PM62drv_ReportError (SID_L99PM62drv_SetOutHSAutorecovery, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE);
1441  02fe ae080b        	ldw	x,#2059
1442  0301 cd0000        	call	_L99PM62drv_ReportError
1444                     ; 484             return;                 /* parameter value out of range */
1447  0304 84            	pop	a
1448  0305 81            	ret	
1449  0306               L574:
1450                     ; 474         case L99PM62DRV_DISABLE:    
1450                     ; 475             CtrlReg4[1] &= (u8)~0x20U;
1452  0306 721b0017      	bres	L71_CtrlReg4+1,#5
1453                     ; 476             break;
1455  030a 2004          	jra	L735
1456  030c               L774:
1457                     ; 477         case L99PM62DRV_ENABLE:
1457                     ; 478             CtrlReg4[1] |= 0x20U;
1459  030c 721a0017      	bset	L71_CtrlReg4+1,#5
1460                     ; 479             break;
1462  0310               L735:
1463                     ; 486    L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR4,
1463                     ; 487 									CtrlReg4, 
1463                     ; 488 									&GlobalStatusRegister,
1463                     ; 489 									CtrlReg4_old);
1465  0310 ae0014        	ldw	x,#L12_CtrlReg4_old
1466  0313 89            	pushw	x
1467  0314 ae0001        	ldw	x,#L54_GlobalStatusRegister
1468  0317 89            	pushw	x
1469  0318 ae0016        	ldw	x,#L71_CtrlReg4
1470  031b 89            	pushw	x
1471  031c a604          	ld	a,#4
1472  031e cd0e5d        	call	_ST_SPI_Send_16
1474  0321 5b06          	addw	sp,#6
1475                     ; 490 }
1478  0323 84            	pop	a
1479  0324 81            	ret	
1584                     ; 518 void L99PM62drv_SetRelayOutput (L99PM62drv_RelayOutputType value) {
1585                     	switch	.text
1586  0325               _L99PM62drv_SetRelayOutput:
1588  0325 88            	push	a
1589       00000000      OFST:	set	0
1592                     ; 521     if (!InitFlag) {
1594  0326 c60000        	ld	a,L74_InitFlag
1595  0329 260b          	jrne	L526
1596                     ; 522         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetRelayOutput, L99PM62DRV_EID_UNINIT)) {
1598  032b ae0914        	ldw	x,#2324
1599  032e cd0000        	call	_L99PM62drv_ReportError
1601  0331 4d            	tnz	a
1602  0332 2602          	jrne	L526
1603                     ; 523             return;
1606  0334 84            	pop	a
1607  0335 81            	ret	
1608  0336               L526:
1609                     ; 527     switch (value) {
1611  0336 7b01          	ld	a,(OFST+1,sp)
1613                     ; 564             return;                 /* parameter value out of range */
1614  0338 271d          	jreq	L145
1615  033a 4a            	dec	a
1616  033b 2724          	jreq	L345
1617  033d 4a            	dec	a
1618  033e 272b          	jreq	L545
1619  0340 4a            	dec	a
1620  0341 272e          	jreq	L745
1621  0343 4a            	dec	a
1622  0344 2731          	jreq	L155
1623  0346 4a            	dec	a
1624  0347 2734          	jreq	L355
1625  0349 4a            	dec	a
1626  034a 2737          	jreq	L555
1627  034c 4a            	dec	a
1628  034d 273a          	jreq	L755
1629                     ; 560         default:
1629                     ; 561 #ifdef  L99PM62DRV_DEV_ERROR_DETECT
1629                     ; 562             L99PM62drv_ReportError (SID_L99PM62drv_SetRelayOutput, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE);
1631  034f ae090b        	ldw	x,#2315
1632  0352 cd0000        	call	_L99PM62drv_ReportError
1634                     ; 564             return;                 /* parameter value out of range */
1637  0355 84            	pop	a
1638  0356 81            	ret	
1639  0357               L145:
1640                     ; 528         case RELAYOUTPUT_OFF_OFF:   /* Switch both relays off. */
1640                     ; 529             REL1_OFF;
1642  0357 721d0022      	bres	L3_CtrlReg1,#6
1643                     ; 530             REL2_OFF;
1645  035b 721f0022      	bres	L3_CtrlReg1,#7
1646                     ; 531             break;
1648  035f 202c          	jra	L336
1649  0361               L345:
1650                     ; 532         case RELAYOUTPUT_ON_OFF:    /* Switch relay REL1 on and REL2 off.*/
1650                     ; 533             REL1_ON;
1652  0361 721c0022      	bset	L3_CtrlReg1,#6
1653                     ; 534             REL2_OFF;
1655  0365 721f0022      	bres	L3_CtrlReg1,#7
1656                     ; 535             break;
1658  0369 2022          	jra	L336
1659  036b               L545:
1660                     ; 536         case RELAYOUTPUT_OFF_ON:    /* Switch relay REL1 off and REL2 on.*/
1660                     ; 537             REL1_OFF;
1662  036b 721d0022      	bres	L3_CtrlReg1,#6
1663                     ; 538             REL2_ON;
1664                     ; 539             break;
1666  036f 2018          	jp	L755
1667  0371               L745:
1668                     ; 540         case RELAYOUTPUT_ON_ON:     /* Switch both relays on.*/
1668                     ; 541             REL1_ON;
1670  0371 721c0022      	bset	L3_CtrlReg1,#6
1671                     ; 542             REL2_ON;
1672                     ; 543             break;
1674  0375 2012          	jp	L755
1675  0377               L155:
1676                     ; 544         case RELAYOUTPUT_OFF_X:     /* Switch relay REL1 off and refresh 
1676                     ; 545                                         previous state of REL2 (don’t change).*/
1676                     ; 546             REL1_OFF;
1678  0377 721d0022      	bres	L3_CtrlReg1,#6
1679                     ; 547             break;
1681  037b 2010          	jra	L336
1682  037d               L355:
1683                     ; 548         case RELAYOUTPUT_ON_X:      /* Switch relay REL1 on and refresh 
1683                     ; 549                                         previous stateof REL2 (don’t change).*/
1683                     ; 550             REL1_ON;
1685  037d 721c0022      	bset	L3_CtrlReg1,#6
1686                     ; 551             break;
1688  0381 200a          	jra	L336
1689  0383               L555:
1690                     ; 552         case RELAYOUTPUT_X_OFF:     /* Switch relay REL2 off and refresh 
1690                     ; 553                                         previous state of REL1 (don’t change).*/
1690                     ; 554             REL2_OFF;
1692  0383 721f0022      	bres	L3_CtrlReg1,#7
1693                     ; 555             break;
1695  0387 2004          	jra	L336
1696  0389               L755:
1697                     ; 556         case RELAYOUTPUT_X_ON:      /* Switch relay REL2 on and refresh
1697                     ; 557                                         previous state of REL1 (don’t change).*/
1697                     ; 558             REL2_ON;
1701  0389 721e0022      	bset	L3_CtrlReg1,#7
1702                     ; 559             break;
1704  038d               L336:
1705                     ; 566 		L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR1,
1705                     ; 567 										CtrlReg1, 
1705                     ; 568 										&GlobalStatusRegister,
1705                     ; 569 										CtrlReg1_old);
1707  038d ae0020        	ldw	x,#L5_CtrlReg1_old
1708  0390 89            	pushw	x
1709  0391 ae0001        	ldw	x,#L54_GlobalStatusRegister
1710  0394 89            	pushw	x
1711  0395 ae0022        	ldw	x,#L3_CtrlReg1
1712  0398 89            	pushw	x
1713  0399 a601          	ld	a,#1
1714  039b cd0e5d        	call	_ST_SPI_Send_16
1716  039e 5b06          	addw	sp,#6
1717                     ; 571 }
1720  03a0 84            	pop	a
1721  03a1 81            	ret	
1808                     ; 584 void L99PM62drv_SetVoltageReg2Mode (L99PM62drv_VoltageReg2ModeType mode) {
1809                     	switch	.text
1810  03a2               _L99PM62drv_SetVoltageReg2Mode:
1812  03a2 88            	push	a
1813  03a3 88            	push	a
1814       00000001      OFST:	set	1
1817                     ; 589     if (!InitFlag) {
1819  03a4 c60000        	ld	a,L74_InitFlag
1820  03a7 2609          	jrne	L176
1821                     ; 590         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetVoltageReg2Mode, L99PM62DRV_EID_UNINIT)) {
1823  03a9 ae0a14        	ldw	x,#2580
1824  03ac cd0000        	call	_L99PM62drv_ReportError
1826  03af 4d            	tnz	a
1827  03b0 2713          	jreq	L631
1828                     ; 591             return;
1830  03b2               L176:
1831                     ; 594     tmp = (s8)mode;
1833  03b2 7b02          	ld	a,(OFST+1,sp)
1834  03b4 6b01          	ld	(OFST+0,sp),a
1836                     ; 595     if ((tmp < (s8)L99PM62DRV_VOLTAGE_REG2_OFF) || (tmp > (s8)L99PM62DRV_VOLTAGE_REG2_ON)) {
1838  03b6 2b04          	jrmi	L776
1840  03b8 a104          	cp	a,#4
1841  03ba 2f0b          	jrslt	L576
1842  03bc               L776:
1843                     ; 596         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetVoltageReg2Mode, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE)) {
1845  03bc ae0a0b        	ldw	x,#2571
1846  03bf cd0000        	call	_L99PM62drv_ReportError
1848  03c2 4d            	tnz	a
1849  03c3 2602          	jrne	L576
1850                     ; 597             return;
1851  03c5               L631:
1854  03c5 85            	popw	x
1855  03c6 81            	ret	
1856  03c7               L576:
1857                     ; 602    CtrlReg1[0] &= (u8)~0x30U;
1859  03c7 c60022        	ld	a,L3_CtrlReg1
1860  03ca a4cf          	and	a,#207
1861  03cc c70022        	ld	L3_CtrlReg1,a
1862                     ; 603    CtrlReg1[0] |= (u8)((mode & 0x03) << 4);
1864  03cf 7b02          	ld	a,(OFST+1,sp)
1865  03d1 a403          	and	a,#3
1866  03d3 97            	ld	xl,a
1867  03d4 a610          	ld	a,#16
1868  03d6 42            	mul	x,a
1869  03d7 9f            	ld	a,xl
1870  03d8 ca0022        	or	a,L3_CtrlReg1
1871  03db c70022        	ld	L3_CtrlReg1,a
1872                     ; 604 	L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR1,
1872                     ; 605 										CtrlReg1, 
1872                     ; 606 										&GlobalStatusRegister,
1872                     ; 607 										CtrlReg1_old);
1874  03de ae0020        	ldw	x,#L5_CtrlReg1_old
1875  03e1 89            	pushw	x
1876  03e2 ae0001        	ldw	x,#L54_GlobalStatusRegister
1877  03e5 89            	pushw	x
1878  03e6 ae0022        	ldw	x,#L3_CtrlReg1
1879  03e9 89            	pushw	x
1880  03ea a601          	ld	a,#1
1881  03ec cd0e5d        	call	_ST_SPI_Send_16
1883  03ef 5b06          	addw	sp,#6
1884                     ; 608 }
1886  03f1 20d2          	jra	L631
2005                     ; 624 void L99PM62drv_SetTimer1 (L99PM62drv_Timer1PeriodType period, L99PM62drv_Timer1ONTimeType ontime) {
2006                     	switch	.text
2007  03f3               _L99PM62drv_SetTimer1:
2009  03f3 89            	pushw	x
2010  03f4 88            	push	a
2011       00000001      OFST:	set	1
2014                     ; 629     if (!InitFlag) {
2016  03f5 c60000        	ld	a,L74_InitFlag
2017  03f8 2609          	jrne	L357
2018                     ; 630         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetTimer1, L99PM62DRV_EID_UNINIT)) {
2020  03fa ae0b14        	ldw	x,#2836
2021  03fd cd0000        	call	_L99PM62drv_ReportError
2023  0400 4d            	tnz	a
2024  0401 2713          	jreq	L251
2025                     ; 631             return;
2027  0403               L357:
2028                     ; 634     tmp = (s8)period;
2030  0403 7b02          	ld	a,(OFST+1,sp)
2031  0405 6b01          	ld	(OFST+0,sp),a
2033                     ; 635     if ((tmp < (s8)L99PM62DRV_TIMER1PERIOD_1) || (tmp > (s8)L99PM62DRV_TIMER1PERIOD_4)) {
2035  0407 2b04          	jrmi	L167
2037  0409 a104          	cp	a,#4
2038  040b 2f0c          	jrslt	L757
2039  040d               L167:
2040                     ; 636         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetTimer1, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE)) {
2042  040d ae0b0b        	ldw	x,#2827
2043  0410 cd0000        	call	_L99PM62drv_ReportError
2045  0413 4d            	tnz	a
2046  0414 2603          	jrne	L757
2047                     ; 637             return;
2048  0416               L251:
2051  0416 5b03          	addw	sp,#3
2052  0418 81            	ret	
2053  0419               L757:
2054                     ; 640     if ((ontime != L99PM62DRV_TIMER1ONTIME_10) && (ontime != L99PM62DRV_TIMER1ONTIME_20)) {
2056  0419 7b03          	ld	a,(OFST+2,sp)
2057  041b 270c          	jreq	L567
2059  041d 4a            	dec	a
2060  041e 2709          	jreq	L567
2061                     ; 641         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetTimer1, L99PM62DRV_EID_PARAMETER2_OUT_OF_RANGE)) {
2063  0420 ae0b0c        	ldw	x,#2828
2064  0423 cd0000        	call	_L99PM62drv_ReportError
2066  0426 4d            	tnz	a
2067  0427 27ed          	jreq	L251
2068                     ; 642             return;
2070  0429               L567:
2071                     ; 647    CtrlReg3[1] &= (u8)~0x70U;
2073  0429 c6001b        	ld	a,L31_CtrlReg3+1
2074  042c a48f          	and	a,#143
2075  042e c7001b        	ld	L31_CtrlReg3+1,a
2076                     ; 648    CtrlReg3[1] |= (u8)((u8)ontime << 6) & 0x40U;
2078  0431 7b03          	ld	a,(OFST+2,sp)
2079  0433 97            	ld	xl,a
2080  0434 a640          	ld	a,#64
2081  0436 42            	mul	x,a
2082  0437 9f            	ld	a,xl
2083  0438 a440          	and	a,#64
2084  043a ca001b        	or	a,L31_CtrlReg3+1
2085  043d c7001b        	ld	L31_CtrlReg3+1,a
2086                     ; 649    CtrlReg3[1] |= (u8)((u8)period << 4) & 0x30U;
2088  0440 7b02          	ld	a,(OFST+1,sp)
2089  0442 97            	ld	xl,a
2090  0443 a610          	ld	a,#16
2091  0445 42            	mul	x,a
2092  0446 9f            	ld	a,xl
2093  0447 a430          	and	a,#48
2094  0449 ca001b        	or	a,L31_CtrlReg3+1
2095  044c c7001b        	ld	L31_CtrlReg3+1,a
2096                     ; 650    L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR3,
2096                     ; 651 									CtrlReg3, 
2096                     ; 652 									&GlobalStatusRegister,
2096                     ; 653 									CtrlReg3_old);		
2098  044f ae0018        	ldw	x,#L51_CtrlReg3_old
2099  0452 89            	pushw	x
2100  0453 ae0001        	ldw	x,#L54_GlobalStatusRegister
2101  0456 89            	pushw	x
2102  0457 ae001a        	ldw	x,#L31_CtrlReg3
2103  045a 89            	pushw	x
2104  045b a603          	ld	a,#3
2105  045d cd0e5d        	call	_ST_SPI_Send_16
2107  0460 5b06          	addw	sp,#6
2108                     ; 654 }
2110  0462 20b2          	jra	L251
2229                     ; 670 void L99PM62drv_SetTimer2 (L99PM62drv_Timer2PeriodType period,L99PM62drv_Timer2ONTimeType ontime) {
2230                     	switch	.text
2231  0464               _L99PM62drv_SetTimer2:
2233  0464 89            	pushw	x
2234  0465 88            	push	a
2235       00000001      OFST:	set	1
2238                     ; 674     if (!InitFlag) {
2240  0466 c60000        	ld	a,L74_InitFlag
2241  0469 2609          	jrne	L1401
2242                     ; 675         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetTimer2, L99PM62DRV_EID_UNINIT)) {
2244  046b ae0c14        	ldw	x,#3092
2245  046e cd0000        	call	_L99PM62drv_ReportError
2247  0471 4d            	tnz	a
2248  0472 2713          	jreq	L661
2249                     ; 676             return;
2251  0474               L1401:
2252                     ; 679     tmp = (s8)period;
2254  0474 7b02          	ld	a,(OFST+1,sp)
2255  0476 6b01          	ld	(OFST+0,sp),a
2257                     ; 680     if ((tmp < (s8)L99PM62DRV_TIMER2PERIOD_10) || (tmp > (s8)L99PM62DRV_TIMER2PERIOD_200)) {
2259  0478 2b04          	jrmi	L7401
2261  047a a104          	cp	a,#4
2262  047c 2f0c          	jrslt	L5401
2263  047e               L7401:
2264                     ; 681         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetTimer2, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE)){
2266  047e ae0c0b        	ldw	x,#3083
2267  0481 cd0000        	call	_L99PM62drv_ReportError
2269  0484 4d            	tnz	a
2270  0485 2603          	jrne	L5401
2271                     ; 682             return;
2272  0487               L661:
2275  0487 5b03          	addw	sp,#3
2276  0489 81            	ret	
2277  048a               L5401:
2278                     ; 685     if ((ontime != L99PM62DRV_TIMER2ONTIME_01) && (ontime != L99PM62DRV_TIMER2ONTIME_1)) {
2280  048a 7b03          	ld	a,(OFST+2,sp)
2281  048c 270c          	jreq	L3501
2283  048e 4a            	dec	a
2284  048f 2709          	jreq	L3501
2285                     ; 686         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetTimer2, L99PM62DRV_EID_PARAMETER2_OUT_OF_RANGE)){
2287  0491 ae0c0c        	ldw	x,#3084
2288  0494 cd0000        	call	_L99PM62drv_ReportError
2290  0497 4d            	tnz	a
2291  0498 27ed          	jreq	L661
2292                     ; 687             return;
2294  049a               L3501:
2295                     ; 691    CtrlReg3[1] &= (u8)~0x07U;
2297  049a c6001b        	ld	a,L31_CtrlReg3+1
2298  049d a4f8          	and	a,#248
2299  049f c7001b        	ld	L31_CtrlReg3+1,a
2300                     ; 692    CtrlReg3[1] |= (u8)((u8)ontime << 2) & 0x04U;
2302  04a2 7b03          	ld	a,(OFST+2,sp)
2303  04a4 48            	sll	a
2304  04a5 48            	sll	a
2305  04a6 a404          	and	a,#4
2306  04a8 ca001b        	or	a,L31_CtrlReg3+1
2307  04ab c7001b        	ld	L31_CtrlReg3+1,a
2308                     ; 693    CtrlReg3[1] |= (u8)((u8)period ) & 0x03U;
2310  04ae 7b02          	ld	a,(OFST+1,sp)
2311  04b0 a403          	and	a,#3
2312  04b2 ca001b        	or	a,L31_CtrlReg3+1
2313  04b5 c7001b        	ld	L31_CtrlReg3+1,a
2314                     ; 694    L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR3,
2314                     ; 695 									CtrlReg3, 
2314                     ; 696 									&GlobalStatusRegister,
2314                     ; 697 									CtrlReg3_old);
2316  04b8 ae0018        	ldw	x,#L51_CtrlReg3_old
2317  04bb 89            	pushw	x
2318  04bc ae0001        	ldw	x,#L54_GlobalStatusRegister
2319  04bf 89            	pushw	x
2320  04c0 ae001a        	ldw	x,#L31_CtrlReg3
2321  04c3 89            	pushw	x
2322  04c4 a603          	ld	a,#3
2323  04c6 cd0e5d        	call	_ST_SPI_Send_16
2325  04c9 5b06          	addw	sp,#6
2326                     ; 698 }
2328  04cb 20ba          	jra	L661
2399                     ; 726 void L99PM62drv_SetWUInputMode (u8 mask, L99PM62drv_WUInputModeType mode) {
2400                     	switch	.text
2401  04cd               _L99PM62drv_SetWUInputMode:
2403  04cd 89            	pushw	x
2404       00000000      OFST:	set	0
2407                     ; 729     if (!InitFlag) {
2409  04ce c60000        	ld	a,L74_InitFlag
2410  04d1 2609          	jrne	L7011
2411                     ; 730         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetWUInputMode, L99PM62DRV_EID_UNINIT)) {
2413  04d3 ae0d14        	ldw	x,#3348
2414  04d6 cd0000        	call	_L99PM62drv_ReportError
2416  04d9 4d            	tnz	a
2417  04da 270f          	jreq	L202
2418                     ; 731             return;
2420  04dc               L7011:
2421                     ; 734     if (mask & (u8)~0x0FU) {
2423  04dc 7b01          	ld	a,(OFST+1,sp)
2424  04de a5f0          	bcp	a,#240
2425  04e0 270b          	jreq	L3111
2426                     ; 735         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetWUInputMode, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE)) {
2428  04e2 ae0d0b        	ldw	x,#3339
2429  04e5 cd0000        	call	_L99PM62drv_ReportError
2431  04e8 4d            	tnz	a
2432  04e9 2602          	jrne	L3111
2433                     ; 736             return;
2434  04eb               L202:
2437  04eb 85            	popw	x
2438  04ec 81            	ret	
2439  04ed               L3111:
2440                     ; 739     if ((mode != L99PM62DRV_WU_INPUT_MODE_CUR_SINK) && (mode != L99PM62DRV_WU_INPUT_MODE_CUR_SOURCE)) {
2442  04ed 7b02          	ld	a,(OFST+2,sp)
2443  04ef 270c          	jreq	L7111
2445  04f1 4a            	dec	a
2446  04f2 2709          	jreq	L7111
2447                     ; 740         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetWUInputMode, L99PM62DRV_EID_PARAMETER2_OUT_OF_RANGE)) {
2449  04f4 ae0d0c        	ldw	x,#3340
2450  04f7 cd0000        	call	_L99PM62drv_ReportError
2452  04fa 4d            	tnz	a
2453  04fb 27ee          	jreq	L202
2454                     ; 741             return;
2456  04fd               L7111:
2457                     ; 746     if (mask & L99PM62DRV_MASK_WU1) {
2459  04fd 7b01          	ld	a,(OFST+1,sp)
2460  04ff a501          	bcp	a,#1
2461  0501 270e          	jreq	L3211
2462                     ; 747         if (mode == L99PM62DRV_WU_INPUT_MODE_CUR_SINK) {
2464  0503 0d02          	tnz	(OFST+2,sp)
2465  0505 2606          	jrne	L5211
2466                     ; 748             CtrlReg2[0] &= (u8)~0x10U;
2468  0507 7219001e      	bres	L7_CtrlReg2,#4
2470  050b 2004          	jra	L3211
2471  050d               L5211:
2472                     ; 751             CtrlReg2[0] |= 0x10U;
2474  050d 7218001e      	bset	L7_CtrlReg2,#4
2475  0511               L3211:
2476                     ; 754     if (mask & L99PM62DRV_MASK_WU2) {
2478  0511 a502          	bcp	a,#2
2479  0513 270e          	jreq	L1311
2480                     ; 755         if (mode == L99PM62DRV_WU_INPUT_MODE_CUR_SINK) {
2482  0515 7b02          	ld	a,(OFST+2,sp)
2483  0517 2606          	jrne	L3311
2484                     ; 756             CtrlReg2[0] &= (u8)~0x20U;
2486  0519 721b001e      	bres	L7_CtrlReg2,#5
2488  051d 2004          	jra	L1311
2489  051f               L3311:
2490                     ; 759             CtrlReg2[0] |= 0x20U;
2492  051f 721a001e      	bset	L7_CtrlReg2,#5
2493  0523               L1311:
2494                     ; 762     if (mask & L99PM62DRV_MASK_WU3) {
2496  0523 7b01          	ld	a,(OFST+1,sp)
2497  0525 a504          	bcp	a,#4
2498  0527 270e          	jreq	L7311
2499                     ; 763         if (mode == L99PM62DRV_WU_INPUT_MODE_CUR_SINK) {
2501  0529 7b02          	ld	a,(OFST+2,sp)
2502  052b 2606          	jrne	L1411
2503                     ; 764             CtrlReg2[0] &= (u8)~0x40U;
2505  052d 721d001e      	bres	L7_CtrlReg2,#6
2507  0531 2004          	jra	L7311
2508  0533               L1411:
2509                     ; 767             CtrlReg2[0] |= 0x40U;
2511  0533 721c001e      	bset	L7_CtrlReg2,#6
2512  0537               L7311:
2513                     ; 770    L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR2,
2513                     ; 771 									CtrlReg2, 
2513                     ; 772 									&GlobalStatusRegister,
2513                     ; 773 									CtrlReg2_old);
2515  0537 ae001c        	ldw	x,#L11_CtrlReg2_old
2516  053a 89            	pushw	x
2517  053b ae0001        	ldw	x,#L54_GlobalStatusRegister
2518  053e 89            	pushw	x
2519  053f ae001e        	ldw	x,#L7_CtrlReg2
2520  0542 89            	pushw	x
2521  0543 a602          	ld	a,#2
2522  0545 cd0e5d        	call	_ST_SPI_Send_16
2524  0548 5b06          	addw	sp,#6
2525                     ; 774 }
2527  054a 209f          	jra	L202
2573                     ; 798 void L99PM62drv_EnableWakeupSource (u8 mask, u8 bitpattern) {
2574                     	switch	.text
2575  054c               _L99PM62drv_EnableWakeupSource:
2577  054c 89            	pushw	x
2578       00000000      OFST:	set	0
2581                     ; 801     if (!InitFlag) {
2583  054d c60000        	ld	a,L74_InitFlag
2584  0550 2609          	jrne	L3611
2585                     ; 802         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_EnableWakeupSource, L99PM62DRV_EID_UNINIT)) {
2587  0552 ae0e14        	ldw	x,#3604
2588  0555 cd0000        	call	_L99PM62drv_ReportError
2590  0558 4d            	tnz	a
2591  0559 272a          	jreq	L212
2592                     ; 803             return;
2594  055b               L3611:
2595                     ; 807     CtrlReg2[0] &= (u8)~(mask & 0x07U);
2597  055b 7b01          	ld	a,(OFST+1,sp)
2598  055d a407          	and	a,#7
2599  055f 43            	cpl	a
2600  0560 c4001e        	and	a,L7_CtrlReg2
2601  0563 c7001e        	ld	L7_CtrlReg2,a
2602                     ; 808     CtrlReg2[0] |= (bitpattern & mask)& 0x07U;
2604  0566 7b02          	ld	a,(OFST+2,sp)
2605  0568 1401          	and	a,(OFST+1,sp)
2606  056a a407          	and	a,#7
2607  056c ca001e        	or	a,L7_CtrlReg2
2608  056f c7001e        	ld	L7_CtrlReg2,a
2609                     ; 809    L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR2,
2609                     ; 810 									CtrlReg2, 
2609                     ; 811 									&GlobalStatusRegister,
2609                     ; 812 									CtrlReg2_old);
2611  0572 ae001c        	ldw	x,#L11_CtrlReg2_old
2612  0575 89            	pushw	x
2613  0576 ae0001        	ldw	x,#L54_GlobalStatusRegister
2614  0579 89            	pushw	x
2615  057a ae001e        	ldw	x,#L7_CtrlReg2
2616  057d 89            	pushw	x
2617  057e a602          	ld	a,#2
2618  0580 cd0e5d        	call	_ST_SPI_Send_16
2620  0583 5b06          	addw	sp,#6
2621                     ; 813 }
2622  0585               L212:
2625  0585 85            	popw	x
2626  0586 81            	ret	
2706                     ; 826 void L99PM62drv_SetResetThresholdLevel (L99PM62drv_ResetThresholdLevelType level) {
2707                     	switch	.text
2708  0587               _L99PM62drv_SetResetThresholdLevel:
2710  0587 88            	push	a
2711       00000000      OFST:	set	0
2714                     ; 829     if (!InitFlag) {
2716  0588 c60000        	ld	a,L74_InitFlag
2717  058b 260b          	jrne	L3321
2718                     ; 830         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetResetThresholdLevel, L99PM62DRV_EID_UNINIT)) {
2720  058d ae0f14        	ldw	x,#3860
2721  0590 cd0000        	call	_L99PM62drv_ReportError
2723  0593 4d            	tnz	a
2724  0594 2602          	jrne	L3321
2725                     ; 831             return;
2728  0596 84            	pop	a
2729  0597 81            	ret	
2730  0598               L3321:
2731                     ; 835    switch (level) {
2733  0598 7b01          	ld	a,(OFST+1,sp)
2735                     ; 854         return;
2736  059a 272a          	jreq	L5711
2737  059c 4a            	dec	a
2738  059d 271e          	jreq	L3711
2739  059f 4a            	dec	a
2740  05a0 2712          	jreq	L1711
2741  05a2 4a            	dec	a
2742  05a3 2708          	jreq	L7611
2743                     ; 850     default:
2743                     ; 851 #ifdef  L99PM62DRV_DEV_ERROR_DETECT
2743                     ; 852         L99PM62drv_ReportError (SID_L99PM62drv_SetResetThresholdLevel, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE);
2745  05a5 ae0f0b        	ldw	x,#3851
2746  05a8 cd0000        	call	_L99PM62drv_ReportError
2748                     ; 854         return;
2751  05ab 84            	pop	a
2752  05ac 81            	ret	
2753  05ad               L7611:
2754                     ; 836    case 	L99PM62DRV_RESET_THRESHOLD_3800:
2754                     ; 837 			CtrlReg4[1] |= (u8)0x03U;
2756  05ad c60017        	ld	a,L71_CtrlReg4+1
2757  05b0 aa03          	or	a,#3
2758                     ; 838 			break;
2760  05b2 2017          	jra	L1421
2761  05b4               L1711:
2762                     ; 839    case 	L99PM62DRV_RESET_THRESHOLD_4100:
2762                     ; 840          CtrlReg4[1] &= (u8)~0x03U;
2764  05b4 c60017        	ld	a,L71_CtrlReg4+1
2765  05b7 a4fc          	and	a,#252
2766  05b9 aa02          	or	a,#2
2767                     ; 841 			CtrlReg4[1] |= 0x02U;
2769                     ; 842 			break;
2771  05bb 200e          	jra	L1421
2772  05bd               L3711:
2773                     ; 843 	case 	L99PM62DRV_RESET_THRESHOLD_4350:
2773                     ; 844 		   CtrlReg4[1] &= (u8)~0x03U;
2775  05bd c60017        	ld	a,L71_CtrlReg4+1
2776  05c0 a4fc          	and	a,#252
2777  05c2 aa01          	or	a,#1
2778                     ; 845 			CtrlReg4[1] |= 0x01U;
2780                     ; 846 			break;
2782  05c4 2005          	jra	L1421
2783  05c6               L5711:
2784                     ; 847 	case 	L99PM62DRV_RESET_THRESHOLD_4600:
2784                     ; 848          CtrlReg4[1] &= (u8)~0x03U;        
2786  05c6 c60017        	ld	a,L71_CtrlReg4+1
2787  05c9 a4fc          	and	a,#252
2788                     ; 849 			break;		  
2790  05cb               L1421:
2791  05cb c70017        	ld	L71_CtrlReg4+1,a
2792                     ; 856    L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR4,
2792                     ; 857 									CtrlReg4, 
2792                     ; 858 									&GlobalStatusRegister,
2792                     ; 859 									CtrlReg4_old);
2794  05ce ae0014        	ldw	x,#L12_CtrlReg4_old
2795  05d1 89            	pushw	x
2796  05d2 ae0001        	ldw	x,#L54_GlobalStatusRegister
2797  05d5 89            	pushw	x
2798  05d6 ae0016        	ldw	x,#L71_CtrlReg4
2799  05d9 89            	pushw	x
2800  05da a604          	ld	a,#4
2801  05dc cd0e5d        	call	_ST_SPI_Send_16
2803  05df 5b06          	addw	sp,#6
2804                     ; 860 }
2807  05e1 84            	pop	a
2808  05e2 81            	ret	
2902                     ; 886 void L99PM62drv_SetInputFilterMode (u8 mask, L99PM62drv_InputFilterModeType mode) {
2903                     	switch	.text
2904  05e3               _L99PM62drv_SetInputFilterMode:
2906  05e3 89            	pushw	x
2907  05e4 88            	push	a
2908       00000001      OFST:	set	1
2911                     ; 891     if (!InitFlag) {
2913  05e5 c60000        	ld	a,L74_InitFlag
2914  05e8 2609          	jrne	L1031
2915                     ; 892         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetInputFilterMode, L99PM62DRV_EID_UNINIT)) {
2917  05ea ae1014        	ldw	x,#4116
2918  05ed cd0000        	call	_L99PM62drv_ReportError
2920  05f0 4d            	tnz	a
2921  05f1 270f          	jreq	L632
2922                     ; 893             return;
2924  05f3               L1031:
2925                     ; 896     if (mask & (u8)~0x0FU) {
2927  05f3 7b02          	ld	a,(OFST+1,sp)
2928  05f5 a5f0          	bcp	a,#240
2929  05f7 270c          	jreq	L5031
2930                     ; 897         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetInputFilterMode, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE)) {
2932  05f9 ae100b        	ldw	x,#4107
2933  05fc cd0000        	call	_L99PM62drv_ReportError
2935  05ff 4d            	tnz	a
2936  0600 2603          	jrne	L5031
2937                     ; 898             return;
2938  0602               L632:
2941  0602 5b03          	addw	sp,#3
2942  0604 81            	ret	
2943  0605               L5031:
2944                     ; 901     tmp = (s8)mode;
2946  0605 7b03          	ld	a,(OFST+2,sp)
2947  0607 6b01          	ld	(OFST+0,sp),a
2949                     ; 902     if ((tmp < (s8)L99PM62DRV_IN_FILTER_64) || (tmp > (s8)L99PM62DRV_IN_FILTER_800_TIMER1)) {
2951  0609 2b04          	jrmi	L3131
2953  060b a104          	cp	a,#4
2954  060d 2f09          	jrslt	L1131
2955  060f               L3131:
2956                     ; 903         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetInputFilterMode, L99PM62DRV_EID_PARAMETER2_OUT_OF_RANGE)) {
2958  060f ae100c        	ldw	x,#4108
2959  0612 cd0000        	call	_L99PM62drv_ReportError
2961  0615 4d            	tnz	a
2962  0616 27ea          	jreq	L632
2963                     ; 904             return;
2965  0618               L1131:
2966                     ; 909     if (mask & L99PM62DRV_MASK_WU1) {
2968  0618 7b02          	ld	a,(OFST+1,sp)
2969  061a a501          	bcp	a,#1
2970  061c 2714          	jreq	L7131
2971                     ; 910         CtrlReg2[1] &= (u8)~0x03U;
2973  061e c6001f        	ld	a,L7_CtrlReg2+1
2974  0621 a4fc          	and	a,#252
2975  0623 c7001f        	ld	L7_CtrlReg2+1,a
2976                     ; 911         CtrlReg2[1] |= (u8)((u8)mode) & 0x03U;
2978  0626 7b03          	ld	a,(OFST+2,sp)
2979  0628 a403          	and	a,#3
2980  062a ca001f        	or	a,L7_CtrlReg2+1
2981  062d c7001f        	ld	L7_CtrlReg2+1,a
2982  0630 7b02          	ld	a,(OFST+1,sp)
2983  0632               L7131:
2984                     ; 913     if (mask & L99PM62DRV_MASK_WU2) {
2986  0632 a502          	bcp	a,#2
2987  0634 2716          	jreq	L1231
2988                     ; 914         CtrlReg2[1] &= (u8)~0x0CU;
2990  0636 c6001f        	ld	a,L7_CtrlReg2+1
2991  0639 a4f3          	and	a,#243
2992  063b c7001f        	ld	L7_CtrlReg2+1,a
2993                     ; 915         CtrlReg2[1] |= (u8)((u8)mode << 2) & 0x0CU;
2995  063e 7b03          	ld	a,(OFST+2,sp)
2996  0640 48            	sll	a
2997  0641 48            	sll	a
2998  0642 a40c          	and	a,#12
2999  0644 ca001f        	or	a,L7_CtrlReg2+1
3000  0647 c7001f        	ld	L7_CtrlReg2+1,a
3001  064a 7b02          	ld	a,(OFST+1,sp)
3002  064c               L1231:
3003                     ; 917     if (mask & L99PM62DRV_MASK_WU3) {
3005  064c a504          	bcp	a,#4
3006  064e 2717          	jreq	L3231
3007                     ; 918         CtrlReg2[1] &= (u8)~0x30U;
3009  0650 c6001f        	ld	a,L7_CtrlReg2+1
3010  0653 a4cf          	and	a,#207
3011  0655 c7001f        	ld	L7_CtrlReg2+1,a
3012                     ; 919         CtrlReg2[1] |= (u8)((u8)mode << 4) & 0x30U;
3014  0658 7b03          	ld	a,(OFST+2,sp)
3015  065a 97            	ld	xl,a
3016  065b a610          	ld	a,#16
3017  065d 42            	mul	x,a
3018  065e 9f            	ld	a,xl
3019  065f a430          	and	a,#48
3020  0661 ca001f        	or	a,L7_CtrlReg2+1
3021  0664 c7001f        	ld	L7_CtrlReg2+1,a
3022  0667               L3231:
3023                     ; 922 	L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR2,
3023                     ; 923 									CtrlReg2, 
3023                     ; 924 									&GlobalStatusRegister,
3023                     ; 925 									CtrlReg2_old);
3025  0667 ae001c        	ldw	x,#L11_CtrlReg2_old
3026  066a 89            	pushw	x
3027  066b ae0001        	ldw	x,#L54_GlobalStatusRegister
3028  066e 89            	pushw	x
3029  066f ae001e        	ldw	x,#L7_CtrlReg2
3030  0672 89            	pushw	x
3031  0673 a602          	ld	a,#2
3032  0675 cd0e5d        	call	_ST_SPI_Send_16
3034  0678 5b06          	addw	sp,#6
3035                     ; 926 }
3037  067a 2086          	jra	L632
3089                     ; 942 void L99PM62drv_LinSetup (L99PM62drv_EnableType pullUpMode, L99PM62drv_EnableType TxDToutMode) {
3090                     	switch	.text
3091  067c               _L99PM62drv_LinSetup:
3093  067c 89            	pushw	x
3094       00000000      OFST:	set	0
3097                     ; 945     if (!InitFlag) {
3099  067d c60000        	ld	a,L74_InitFlag
3100  0680 2609          	jrne	L7431
3101                     ; 946         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_LinSetup, L99PM62DRV_EID_UNINIT)) {
3103  0682 ae1114        	ldw	x,#4372
3104  0685 cd0000        	call	_L99PM62drv_ReportError
3106  0688 4d            	tnz	a
3107  0689 2710          	jreq	L252
3108                     ; 947             return;
3110  068b               L7431:
3111                     ; 950 	   if (pullUpMode != L99PM62DRV_DISABLE && pullUpMode != L99PM62DRV_ENABLE ) {
3113  068b 7b01          	ld	a,(OFST+1,sp)
3114  068d 270e          	jreq	L3531
3116  068f 4a            	dec	a
3117  0690 270b          	jreq	L3531
3118                     ; 951         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_LinSetup, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE)) {
3120  0692 ae110b        	ldw	x,#4363
3121  0695 cd0000        	call	_L99PM62drv_ReportError
3123  0698 4d            	tnz	a
3124  0699 2602          	jrne	L3531
3125                     ; 952             return;
3126  069b               L252:
3129  069b 85            	popw	x
3130  069c 81            	ret	
3131  069d               L3531:
3132                     ; 955     if (TxDToutMode != L99PM62DRV_DISABLE && TxDToutMode != L99PM62DRV_ENABLE ) {
3134  069d 7b02          	ld	a,(OFST+2,sp)
3135  069f 270c          	jreq	L7531
3137  06a1 4a            	dec	a
3138  06a2 2709          	jreq	L7531
3139                     ; 956         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_LinSetup, L99PM62DRV_EID_PARAMETER2_OUT_OF_RANGE)) {
3141  06a4 ae110c        	ldw	x,#4364
3142  06a7 cd0000        	call	_L99PM62drv_ReportError
3144  06aa 4d            	tnz	a
3145  06ab 27ee          	jreq	L252
3146                     ; 957             return;
3148  06ad               L7531:
3149                     ; 962 	if (pullUpMode == L99PM62DRV_DISABLE){
3151  06ad 7b01          	ld	a,(OFST+1,sp)
3152  06af 2606          	jrne	L3631
3153                     ; 963 			CtrlReg4[0] &= (u8)~0x80U;
3155  06b1 721f0016      	bres	L71_CtrlReg4,#7
3157  06b5 2007          	jra	L5631
3158  06b7               L3631:
3159                     ; 964 	}else if (pullUpMode == L99PM62DRV_ENABLE){
3161  06b7 4a            	dec	a
3162  06b8 2604          	jrne	L5631
3163                     ; 965 		CtrlReg4[0] |= 0x80U;
3165  06ba 721e0016      	bset	L71_CtrlReg4,#7
3166  06be               L5631:
3167                     ; 968 	if (TxDToutMode == L99PM62DRV_DISABLE){
3169  06be 7b02          	ld	a,(OFST+2,sp)
3170  06c0 2606          	jrne	L1731
3171                     ; 969 			CtrlReg4[0] &= (u8)~0x20U;
3173  06c2 721b0016      	bres	L71_CtrlReg4,#5
3175  06c6 2007          	jra	L3731
3176  06c8               L1731:
3177                     ; 970 	}else if (TxDToutMode == L99PM62DRV_ENABLE){
3179  06c8 4a            	dec	a
3180  06c9 2604          	jrne	L3731
3181                     ; 971 		CtrlReg4[0] |= 0x20U;
3183  06cb 721a0016      	bset	L71_CtrlReg4,#5
3184  06cf               L3731:
3185                     ; 974    L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR4,
3185                     ; 975 									CtrlReg4, 
3185                     ; 976 									&GlobalStatusRegister,
3185                     ; 977 									CtrlReg4_old);
3187  06cf ae0014        	ldw	x,#L12_CtrlReg4_old
3188  06d2 89            	pushw	x
3189  06d3 ae0001        	ldw	x,#L54_GlobalStatusRegister
3190  06d6 89            	pushw	x
3191  06d7 ae0016        	ldw	x,#L71_CtrlReg4
3192  06da 89            	pushw	x
3193  06db a604          	ld	a,#4
3194  06dd cd0e5d        	call	_ST_SPI_Send_16
3196  06e0 5b06          	addw	sp,#6
3197                     ; 978 }
3199  06e2 20b7          	jra	L252
3241                     ; 992 void L99PM62drv_SetVsLockoutMode (L99PM62drv_EnableType VsLockoutMode) {
3242                     	switch	.text
3243  06e4               _L99PM62drv_SetVsLockoutMode:
3245  06e4 88            	push	a
3246       00000000      OFST:	set	0
3249                     ; 995     if (!InitFlag) {
3251  06e5 c60000        	ld	a,L74_InitFlag
3252  06e8 260b          	jrne	L3241
3253                     ; 996         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetVsLockoutMode, L99PM62DRV_EID_UNINIT)) {
3255  06ea ae1214        	ldw	x,#4628
3256  06ed cd0000        	call	_L99PM62drv_ReportError
3258  06f0 4d            	tnz	a
3259  06f1 2602          	jrne	L3241
3260                     ; 997             return;
3263  06f3 84            	pop	a
3264  06f4 81            	ret	
3265  06f5               L3241:
3266                     ; 1001     switch (VsLockoutMode) {
3268  06f5 7b01          	ld	a,(OFST+1,sp)
3270                     ; 1012             return;
3271  06f7 270b          	jreq	L7731
3272  06f9 4a            	dec	a
3273  06fa 270e          	jreq	L1041
3274                     ; 1008         default:
3274                     ; 1009 #ifdef  L99PM62DRV_DEV_ERROR_DETECT
3274                     ; 1010             L99PM62drv_ReportError (SID_L99PM62drv_SetVsLockoutMode, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE);
3276  06fc ae120b        	ldw	x,#4619
3277  06ff cd0000        	call	_L99PM62drv_ReportError
3279                     ; 1012             return;
3282  0702 84            	pop	a
3283  0703 81            	ret	
3284  0704               L7731:
3285                     ; 1002         case L99PM62DRV_DISABLE:
3285                     ; 1003             CtrlReg4[1] &= (u8)~0x10U;
3287  0704 72190017      	bres	L71_CtrlReg4+1,#4
3288                     ; 1004             break;
3290  0708 2004          	jra	L1341
3291  070a               L1041:
3292                     ; 1005         case L99PM62DRV_ENABLE:
3292                     ; 1006             CtrlReg4[1] |= 0x10U;
3294  070a 72180017      	bset	L71_CtrlReg4+1,#4
3295                     ; 1007             break;
3297  070e               L1341:
3298                     ; 1014 	L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR4,
3298                     ; 1015 									CtrlReg4, 
3298                     ; 1016 									&GlobalStatusRegister,
3298                     ; 1017 									CtrlReg4_old);
3300  070e ae0014        	ldw	x,#L12_CtrlReg4_old
3301  0711 89            	pushw	x
3302  0712 ae0001        	ldw	x,#L54_GlobalStatusRegister
3303  0715 89            	pushw	x
3304  0716 ae0016        	ldw	x,#L71_CtrlReg4
3305  0719 89            	pushw	x
3306  071a a604          	ld	a,#4
3307  071c cd0e5d        	call	_ST_SPI_Send_16
3309  071f 5b06          	addw	sp,#6
3310                     ; 1018 }
3313  0721 84            	pop	a
3314  0722 81            	ret	
3356                     ; 1034 void L99PM62drv_SetRelayShutdownMode (L99PM62drv_EnableType relayShutdownMode) {
3357                     	switch	.text
3358  0723               _L99PM62drv_SetRelayShutdownMode:
3360  0723 88            	push	a
3361       00000000      OFST:	set	0
3364                     ; 1037     if (!InitFlag) {
3366  0724 c60000        	ld	a,L74_InitFlag
3367  0727 260b          	jrne	L7541
3368                     ; 1038         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetRelayShutdownMode, L99PM62DRV_EID_UNINIT)) {
3370  0729 ae1314        	ldw	x,#4884
3371  072c cd0000        	call	_L99PM62drv_ReportError
3373  072f 4d            	tnz	a
3374  0730 2602          	jrne	L7541
3375                     ; 1039             return;
3378  0732 84            	pop	a
3379  0733 81            	ret	
3380  0734               L7541:
3381                     ; 1044     switch (relayShutdownMode) {
3383  0734 7b01          	ld	a,(OFST+1,sp)
3385                     ; 1055             return;
3386  0736 270b          	jreq	L3341
3387  0738 4a            	dec	a
3388  0739 270e          	jreq	L5341
3389                     ; 1051         default:
3389                     ; 1052 #ifdef  L99PM62DRV_DEV_ERROR_DETECT
3389                     ; 1053             L99PM62drv_ReportError (SID_L99PM62drv_SetRelayShutdownMode, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE);
3391  073b ae130b        	ldw	x,#4875
3392  073e cd0000        	call	_L99PM62drv_ReportError
3394                     ; 1055             return;
3397  0741 84            	pop	a
3398  0742 81            	ret	
3399  0743               L3341:
3400                     ; 1045         case L99PM62DRV_DISABLE:
3400                     ; 1046             CtrlReg4[1] &= (u8)~0x04U;
3402  0743 72150017      	bres	L71_CtrlReg4+1,#2
3403                     ; 1047             break;
3405  0747 2004          	jra	L5641
3406  0749               L5341:
3407                     ; 1048         case L99PM62DRV_ENABLE:
3407                     ; 1049             CtrlReg4[1] |= 0x04U;
3409  0749 72140017      	bset	L71_CtrlReg4+1,#2
3410                     ; 1050             break;
3412  074d               L5641:
3413                     ; 1057 	L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR4,
3413                     ; 1058 									CtrlReg4, 
3413                     ; 1059 									&GlobalStatusRegister,
3413                     ; 1060 									CtrlReg4_old);
3415  074d ae0014        	ldw	x,#L12_CtrlReg4_old
3416  0750 89            	pushw	x
3417  0751 ae0001        	ldw	x,#L54_GlobalStatusRegister
3418  0754 89            	pushw	x
3419  0755 ae0016        	ldw	x,#L71_CtrlReg4
3420  0758 89            	pushw	x
3421  0759 a604          	ld	a,#4
3422  075b cd0e5d        	call	_ST_SPI_Send_16
3424  075e 5b06          	addw	sp,#6
3425                     ; 1061 }
3428  0760 84            	pop	a
3429  0761 81            	ret	
3472                     ; 1075 void L99PM62drv_SetVReg1CurrentMonitorMode (L99PM62drv_EnableType IcmpMode) {
3473                     	switch	.text
3474  0762               _L99PM62drv_SetVReg1CurrentMonitorMode:
3476  0762 88            	push	a
3477       00000000      OFST:	set	0
3480                     ; 1078     if (!InitFlag) {
3482  0763 c60000        	ld	a,L74_InitFlag
3483  0766 260b          	jrne	L3151
3484                     ; 1079         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetVReg1CurrentMonitorMode, L99PM62DRV_EID_UNINIT)) {
3486  0768 ae1414        	ldw	x,#5140
3487  076b cd0000        	call	_L99PM62drv_ReportError
3489  076e 4d            	tnz	a
3490  076f 2602          	jrne	L3151
3491                     ; 1080             return;
3494  0771 84            	pop	a
3495  0772 81            	ret	
3496  0773               L3151:
3497                     ; 1085     switch (IcmpMode) {
3499  0773 7b01          	ld	a,(OFST+1,sp)
3501                     ; 1096 				return;
3502  0775 2711          	jreq	L1741
3503  0777 4a            	dec	a
3504  0778 2708          	jreq	L7641
3505                     ; 1092         default:
3505                     ; 1093 #ifdef  L99PM62DRV_DEV_ERROR_DETECT
3505                     ; 1094             L99PM62drv_ReportError (SID_L99PM62drv_SetVReg1CurrentMonitorMode, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE);
3507  077a ae140b        	ldw	x,#5131
3508  077d cd0000        	call	_L99PM62drv_ReportError
3510                     ; 1096 				return;
3513  0780 84            	pop	a
3514  0781 81            	ret	
3515  0782               L7641:
3516                     ; 1086         case L99PM62DRV_ENABLE:
3516                     ; 1087 				CtrlReg4[1] &= (u8)~0x40U;            
3518  0782 721d0017      	bres	L71_CtrlReg4+1,#6
3519                     ; 1088             break;
3521  0786 2004          	jra	L1251
3522  0788               L1741:
3523                     ; 1089         case L99PM62DRV_DISABLE:            
3523                     ; 1090 				CtrlReg4[1] |= 0x40U;
3525  0788 721c0017      	bset	L71_CtrlReg4+1,#6
3526                     ; 1091             break;
3528  078c               L1251:
3529                     ; 1098 	L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR4,
3529                     ; 1099 									CtrlReg4, 
3529                     ; 1100 									&GlobalStatusRegister,
3529                     ; 1101 									CtrlReg4_old);
3531  078c ae0014        	ldw	x,#L12_CtrlReg4_old
3532  078f 89            	pushw	x
3533  0790 ae0001        	ldw	x,#L54_GlobalStatusRegister
3534  0793 89            	pushw	x
3535  0794 ae0016        	ldw	x,#L71_CtrlReg4
3536  0797 89            	pushw	x
3537  0798 a604          	ld	a,#4
3538  079a cd0e5d        	call	_ST_SPI_Send_16
3540  079d 5b06          	addw	sp,#6
3541                     ; 1102 }
3544  079f 84            	pop	a
3545  07a0 81            	ret	
3609                     ; 1115 void L99PM62drv_SetPWMFrequ (L99PM62drv_PWMFrequType value ) {
3610                     	switch	.text
3611  07a1               _L99PM62drv_SetPWMFrequ:
3613  07a1 88            	push	a
3614       00000000      OFST:	set	0
3617                     ; 1118     if (!InitFlag) {
3619  07a2 c60000        	ld	a,L74_InitFlag
3620  07a5 260b          	jrne	L7551
3621                     ; 1119         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetPWMFrequ, L99PM62DRV_EID_UNINIT)) {
3623  07a7 ae1514        	ldw	x,#5396
3624  07aa cd0000        	call	_L99PM62drv_ReportError
3626  07ad 4d            	tnz	a
3627  07ae 2602          	jrne	L7551
3628                     ; 1120             return;
3631  07b0 84            	pop	a
3632  07b1 81            	ret	
3633  07b2               L7551:
3634                     ; 1124     switch (value) {
3636  07b2 7b01          	ld	a,(OFST+1,sp)
3638                     ; 1135             return;
3639  07b4 270b          	jreq	L3251
3640  07b6 4a            	dec	a
3641  07b7 270e          	jreq	L5251
3642                     ; 1131         default:		  
3642                     ; 1132 #ifdef  L99PM62DRV_DEV_ERROR_DETECT
3642                     ; 1133             L99PM62drv_ReportError (SID_L99PM62drv_SetPWMFrequ, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE);
3644  07b9 ae150b        	ldw	x,#5387
3645  07bc cd0000        	call	_L99PM62drv_ReportError
3647                     ; 1135             return;
3650  07bf 84            	pop	a
3651  07c0 81            	ret	
3652  07c1               L3251:
3653                     ; 1125         case L99PM62DRV_PWMFREQU_100HZ:
3653                     ; 1126             CtrlReg5[0] &= (u8)~0x80U;
3655  07c1 721f0012      	bres	L32_CtrlReg5,#7
3656                     ; 1127             break;
3658  07c5 2004          	jra	L5651
3659  07c7               L5251:
3660                     ; 1128         case L99PM62DRV_PWMFREQU_200HZ:
3660                     ; 1129             CtrlReg5[0] |= 0x80U;
3662  07c7 721e0012      	bset	L32_CtrlReg5,#7
3663                     ; 1130             break;
3665  07cb               L5651:
3666                     ; 1137 	L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR5,
3666                     ; 1138 									CtrlReg5, 
3666                     ; 1139 									&GlobalStatusRegister,
3666                     ; 1140 									CtrlReg5_old);
3668  07cb ae0010        	ldw	x,#L52_CtrlReg5_old
3669  07ce 89            	pushw	x
3670  07cf ae0001        	ldw	x,#L54_GlobalStatusRegister
3671  07d2 89            	pushw	x
3672  07d3 ae0012        	ldw	x,#L32_CtrlReg5
3673  07d6 89            	pushw	x
3674  07d7 a605          	ld	a,#5
3675  07d9 cd0e5d        	call	_ST_SPI_Send_16
3677  07dc 5b06          	addw	sp,#6
3678                     ; 1141 }
3681  07de 84            	pop	a
3682  07df 81            	ret	
3750                     ; 1175 void L99PM62drv_SetPWMDutyCycle (u8 mask, u8 dutyCycle) {
3751                     	switch	.text
3752  07e0               _L99PM62drv_SetPWMDutyCycle:
3754  07e0 89            	pushw	x
3755  07e1 89            	pushw	x
3756       00000002      OFST:	set	2
3759                     ; 1179     if (!InitFlag) {
3761  07e2 c60000        	ld	a,L74_InitFlag
3762  07e5 2609          	jrne	L5161
3763                     ; 1180         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetPWMDutyCycle, L99PM62DRV_EID_UNINIT)) {
3765  07e7 ae1614        	ldw	x,#5652
3766  07ea cd0000        	call	_L99PM62drv_ReportError
3768  07ed 4d            	tnz	a
3769  07ee 270f          	jreq	L033
3770                     ; 1181             return;
3772  07f0               L5161:
3773                     ; 1184     if (mask & (u8)~0x0FU) {
3775  07f0 7b03          	ld	a,(OFST+1,sp)
3776  07f2 a5f0          	bcp	a,#240
3777  07f4 270c          	jreq	L1261
3778                     ; 1185         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetPWMDutyCycle, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE)) {
3780  07f6 ae160b        	ldw	x,#5643
3781  07f9 cd0000        	call	_L99PM62drv_ReportError
3783  07fc 4d            	tnz	a
3784  07fd 2603          	jrne	L1261
3785                     ; 1186             return;
3786  07ff               L033:
3789  07ff 5b04          	addw	sp,#4
3790  0801 81            	ret	
3791  0802               L1261:
3792                     ; 1189     if (dutyCycle & (u8)0x80){
3794  0802 7b04          	ld	a,(OFST+2,sp)
3795  0804 2a09          	jrpl	L5261
3796                     ; 1190         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetPWMDutyCycle, L99PM62DRV_EID_PARAMETER2_OUT_OF_RANGE)) {
3798  0806 ae160c        	ldw	x,#5644
3799  0809 cd0000        	call	_L99PM62drv_ReportError
3801  080c 4d            	tnz	a
3802  080d 27f0          	jreq	L033
3803                     ; 1191             return;
3805  080f               L5261:
3806                     ; 1195 	send5 = FALSE;
3808  080f 0f01          	clr	(OFST-1,sp)
3810                     ; 1196 	send6 = FALSE;
3812  0811 0f02          	clr	(OFST+0,sp)
3814                     ; 1197    if (mask & L99PM62DRV_MASK_PWM1) {
3816  0813 7b03          	ld	a,(OFST+1,sp)
3817  0815 a501          	bcp	a,#1
3818  0817 2718          	jreq	L1361
3819                     ; 1198 		CtrlReg5[0] &= 0x80U;
3821  0819 c60012        	ld	a,L32_CtrlReg5
3822  081c a480          	and	a,#128
3823  081e c70012        	ld	L32_CtrlReg5,a
3824                     ; 1199       CtrlReg5[0] |= dutyCycle & 0x7FU;
3826  0821 7b04          	ld	a,(OFST+2,sp)
3827  0823 a47f          	and	a,#127
3828  0825 ca0012        	or	a,L32_CtrlReg5
3829  0828 c70012        	ld	L32_CtrlReg5,a
3830                     ; 1200 		send5 = TRUE;
3832  082b a601          	ld	a,#1
3833  082d 6b01          	ld	(OFST-1,sp),a
3835  082f 7b03          	ld	a,(OFST+1,sp)
3836  0831               L1361:
3837                     ; 1202 	if (mask & L99PM62DRV_MASK_PWM2) {
3839  0831 a502          	bcp	a,#2
3840  0833 270e          	jreq	L3361
3841                     ; 1203       CtrlReg5[1] = ((u8)~dutyCycle) & 0x7FU;     
3843  0835 7b04          	ld	a,(OFST+2,sp)
3844  0837 43            	cpl	a
3845  0838 a47f          	and	a,#127
3846  083a c70013        	ld	L32_CtrlReg5+1,a
3847                     ; 1204 		send5 = TRUE;
3849  083d a601          	ld	a,#1
3850  083f 6b01          	ld	(OFST-1,sp),a
3852  0841 7b03          	ld	a,(OFST+1,sp)
3853  0843               L3361:
3854                     ; 1206    if (mask & L99PM62DRV_MASK_PWM3) {
3856  0843 a504          	bcp	a,#4
3857  0845 270d          	jreq	L5361
3858                     ; 1207       CtrlReg6[0] = dutyCycle & 0x7fU;
3860  0847 7b04          	ld	a,(OFST+2,sp)
3861  0849 a47f          	and	a,#127
3862  084b c7000e        	ld	L72_CtrlReg6,a
3863                     ; 1208 		send6 = TRUE;
3865  084e a601          	ld	a,#1
3866  0850 6b02          	ld	(OFST+0,sp),a
3868  0852 7b03          	ld	a,(OFST+1,sp)
3869  0854               L5361:
3870                     ; 1210 	if (mask & L99PM62DRV_MASK_PWM4) {
3872  0854 a508          	bcp	a,#8
3873  0856 270c          	jreq	L7361
3874                     ; 1211       CtrlReg6[1] = ((u8)~dutyCycle) & 0x7FU;     
3876  0858 7b04          	ld	a,(OFST+2,sp)
3877  085a 43            	cpl	a
3878  085b a47f          	and	a,#127
3879  085d c7000f        	ld	L72_CtrlReg6+1,a
3880                     ; 1212 		send6 = TRUE;
3882  0860 a601          	ld	a,#1
3883  0862 6b02          	ld	(OFST+0,sp),a
3885  0864               L7361:
3886                     ; 1214 	if (send5)  {
3888  0864 7b01          	ld	a,(OFST-1,sp)
3889  0866 2713          	jreq	L1461
3890                     ; 1215    	L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR5,
3890                     ; 1216 										CtrlReg5, 
3890                     ; 1217 										&GlobalStatusRegister,
3890                     ; 1218 										CtrlReg5_old);
3892  0868 ae0010        	ldw	x,#L52_CtrlReg5_old
3893  086b 89            	pushw	x
3894  086c ae0001        	ldw	x,#L54_GlobalStatusRegister
3895  086f 89            	pushw	x
3896  0870 ae0012        	ldw	x,#L32_CtrlReg5
3897  0873 89            	pushw	x
3898  0874 a605          	ld	a,#5
3899  0876 cd0e5d        	call	_ST_SPI_Send_16
3901  0879 5b06          	addw	sp,#6
3902  087b               L1461:
3903                     ; 1220 	if (send6){
3905  087b 7b02          	ld	a,(OFST+0,sp)
3906  087d 2780          	jreq	L033
3907                     ; 1221 		L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR6,
3907                     ; 1222 										CtrlReg6, 
3907                     ; 1223 										&GlobalStatusRegister,
3907                     ; 1224 										CtrlReg6_old);
3909  087f ae000c        	ldw	x,#L13_CtrlReg6_old
3910  0882 89            	pushw	x
3911  0883 ae0001        	ldw	x,#L54_GlobalStatusRegister
3912  0886 89            	pushw	x
3913  0887 ae000e        	ldw	x,#L72_CtrlReg6
3914  088a 89            	pushw	x
3915  088b a606          	ld	a,#6
3916  088d cd0e5d        	call	_ST_SPI_Send_16
3918  0890 5b06          	addw	sp,#6
3919                     ; 1226 }
3921  0892 cc07ff        	jra	L033
4014                     ; 1240 void L99PM62drv_SetWDTiming (L99PM62drv_WDTimingType value, L99PM62drv_WDTimingType* oldValue  ){
4015                     	switch	.text
4016  0895               _L99PM62drv_SetWDTiming:
4018  0895 88            	push	a
4019       00000000      OFST:	set	0
4022                     ; 1243    if (!InitFlag) {
4024  0896 c60000        	ld	a,L74_InitFlag
4025  0899 260b          	jrne	L7271
4026                     ; 1244         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetWDTiming, L99PM62DRV_EID_UNINIT)) {
4028  089b ae1714        	ldw	x,#5908
4029  089e cd0000        	call	_L99PM62drv_ReportError
4031  08a1 4d            	tnz	a
4032  08a2 2602          	jrne	L7271
4033                     ; 1245             return;
4036  08a4 84            	pop	a
4037  08a5 81            	ret	
4038  08a6               L7271:
4039                     ; 1250    switch (value) {
4041  08a6 7b01          	ld	a,(OFST+1,sp)
4043                     ; 1269 			return;
4044  08a8 2711          	jreq	L5461
4045  08aa 4a            	dec	a
4046  08ab 2715          	jreq	L7461
4047  08ad 4a            	dec	a
4048  08ae 271c          	jreq	L1561
4049  08b0 4a            	dec	a
4050  08b1 2723          	jreq	L3561
4051                     ; 1265       default:
4051                     ; 1266 #ifdef  L99PM62DRV_DEV_ERROR_DETECT
4051                     ; 1267             L99PM62drv_ReportError (SID_L99PM62drv_SetWDTiming, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE);
4053  08b3 ae170b        	ldw	x,#5899
4054  08b6 cd0000        	call	_L99PM62drv_ReportError
4056                     ; 1269 			return;
4059  08b9 84            	pop	a
4060  08ba 81            	ret	
4061  08bb               L5461:
4062                     ; 1251       case L99PM62DRV_WDC_TRIG_10:
4062                     ; 1252          CtrlReg3[0] &= (u8)~0x30U;
4064  08bb c6001a        	ld	a,L31_CtrlReg3
4065  08be a4cf          	and	a,#207
4066                     ; 1253          break;
4068  08c0 2019          	jp	LC002
4069  08c2               L7461:
4070                     ; 1254       case L99PM62DRV_WDC_TRIG_50:         
4070                     ; 1255 			CtrlReg3[0] &= (u8)~0x20U;
4072  08c2 721b001a      	bres	L31_CtrlReg3,#5
4073                     ; 1256 			CtrlReg3[0] |= 0x10U;
4075  08c6 7218001a      	bset	L31_CtrlReg3,#4
4076                     ; 1257          break;
4078  08ca 2012          	jra	L5371
4079  08cc               L1561:
4080                     ; 1258       case L99PM62DRV_WDC_TRIG_100:
4080                     ; 1259          CtrlReg3[0] &= (u8)~0x10U;
4082  08cc 7219001a      	bres	L31_CtrlReg3,#4
4083                     ; 1260 			CtrlReg3[0] |= 0x20U;
4085  08d0 721a001a      	bset	L31_CtrlReg3,#5
4086                     ; 1261          break;
4088  08d4 2008          	jra	L5371
4089  08d6               L3561:
4090                     ; 1262       case L99PM62DRV_WDC_TRIG_200:         
4090                     ; 1263 			CtrlReg3[0] |= 0x30U;
4092  08d6 c6001a        	ld	a,L31_CtrlReg3
4093  08d9 aa30          	or	a,#48
4094  08db               LC002:
4095  08db c7001a        	ld	L31_CtrlReg3,a
4096                     ; 1264          break;
4098  08de               L5371:
4099                     ; 1271 	L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR3,
4099                     ; 1272 									CtrlReg3, 
4099                     ; 1273 									&GlobalStatusRegister,
4099                     ; 1274 									CtrlReg3_old);
4101  08de ae0018        	ldw	x,#L51_CtrlReg3_old
4102  08e1 89            	pushw	x
4103  08e2 ae0001        	ldw	x,#L54_GlobalStatusRegister
4104  08e5 89            	pushw	x
4105  08e6 ae001a        	ldw	x,#L31_CtrlReg3
4106  08e9 89            	pushw	x
4107  08ea a603          	ld	a,#3
4108  08ec cd0e5d        	call	_ST_SPI_Send_16
4110  08ef 5b06          	addw	sp,#6
4111                     ; 1275 	trap();
4114  08f1 83            	trap	
4116                     ; 1276 	switch ((u8)CtrlReg3_old[0] & 0x30U){
4119  08f2 c60018        	ld	a,L51_CtrlReg3_old
4120  08f5 a430          	and	a,#48
4122                     ; 1288 		break;
4123  08f7 270e          	jreq	L7561
4124  08f9 a010          	sub	a,#16
4125  08fb 270e          	jreq	L1661
4126  08fd a010          	sub	a,#16
4127  08ff 270f          	jreq	L3661
4128  0901 a010          	sub	a,#16
4129  0903 2711          	jreq	L5661
4130  0905 2014          	jra	L1471
4131  0907               L7561:
4132                     ; 1277 		case 0x00U:
4132                     ; 1278 			*oldValue = L99PM62DRV_WDC_TRIG_10;
4134  0907 1e04          	ldw	x,(OFST+4,sp)
4135                     ; 1279 		break;
4137  0909 200f          	jp	LC003
4138  090b               L1661:
4139                     ; 1280 		case 0x10U:
4139                     ; 1281 			*oldValue = L99PM62DRV_WDC_TRIG_50;
4141  090b 1e04          	ldw	x,(OFST+4,sp)
4142  090d 4c            	inc	a
4143                     ; 1282 		break;
4145  090e 200a          	jp	LC003
4146  0910               L3661:
4147                     ; 1283 		case 0x20U:
4147                     ; 1284 			*oldValue = L99PM62DRV_WDC_TRIG_100;
4149  0910 1e04          	ldw	x,(OFST+4,sp)
4150  0912 a602          	ld	a,#2
4151                     ; 1285 		break;
4153  0914 2004          	jp	LC003
4154  0916               L5661:
4155                     ; 1286 		case 0x30U:
4155                     ; 1287 			*oldValue = L99PM62DRV_WDC_TRIG_200;
4157  0916 1e04          	ldw	x,(OFST+4,sp)
4158  0918 a603          	ld	a,#3
4159  091a               LC003:
4160  091a f7            	ld	(x),a
4161                     ; 1288 		break;
4163  091b               L1471:
4164                     ; 1290 }
4167  091b 84            	pop	a
4168  091c 81            	ret	
4242                     ; 1311 void L99PM62drv_SetCyclicWakeUp (L99PM62drv_EnableType cyclicWakeMode, L99PM62drv_CyclicWakeUpTimerType timer) {
4243                     	switch	.text
4244  091d               _L99PM62drv_SetCyclicWakeUp:
4246  091d 89            	pushw	x
4247       00000000      OFST:	set	0
4250                     ; 1314      if (!InitFlag) {
4252  091e c60000        	ld	a,L74_InitFlag
4253  0921 2609          	jrne	L5771
4254                     ; 1315         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetTimer1, L99PM62DRV_EID_UNINIT)) {
4256  0923 ae0b14        	ldw	x,#2836
4257  0926 cd0000        	call	_L99PM62drv_ReportError
4259  0929 4d            	tnz	a
4260  092a 2712          	jreq	L453
4261                     ; 1316             return;
4263  092c               L5771:
4264                     ; 1319    if ((cyclicWakeMode !=  L99PM62DRV_ENABLE) &&(cyclicWakeMode !=  L99PM62DRV_DISABLE) ) {
4266  092c 7b01          	ld	a,(OFST+1,sp)
4267  092e 4a            	dec	a
4268  092f 270f          	jreq	L1002
4270  0931 7b01          	ld	a,(OFST+1,sp)
4271  0933 270b          	jreq	L1002
4272                     ; 1320         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetCyclicWakeUp, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE)) {
4274  0935 ae180b        	ldw	x,#6155
4275  0938 cd0000        	call	_L99PM62drv_ReportError
4277  093b 4d            	tnz	a
4278  093c 2602          	jrne	L1002
4279                     ; 1321             return;
4280  093e               L453:
4283  093e 85            	popw	x
4284  093f 81            	ret	
4285  0940               L1002:
4286                     ; 1324     if ((timer != L99PM62DRV_CYCLIC_WAKEUP_TIMER1) && (timer != L99PM62DRV_CYCLIC_WAKEUP_TIMER2)) {
4288  0940 7b02          	ld	a,(OFST+2,sp)
4289  0942 4a            	dec	a
4290  0943 270d          	jreq	L5002
4292  0945 7b02          	ld	a,(OFST+2,sp)
4293  0947 2709          	jreq	L5002
4294                     ; 1325         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetCyclicWakeUp, L99PM62DRV_EID_PARAMETER2_OUT_OF_RANGE)) {
4296  0949 ae180c        	ldw	x,#6156
4297  094c cd0000        	call	_L99PM62drv_ReportError
4299  094f 4d            	tnz	a
4300  0950 27ec          	jreq	L453
4301                     ; 1326             return;
4303  0952               L5002:
4304                     ; 1332 	if (cyclicWakeMode ==  L99PM62DRV_ENABLE){
4306  0952 7b01          	ld	a,(OFST+1,sp)
4307  0954 4a            	dec	a
4308  0955 2606          	jrne	L1102
4309                     ; 1333 		CtrlReg3[0] |= 0x02U;
4311  0957 7212001a      	bset	L31_CtrlReg3,#1
4313  095b 2008          	jra	L3102
4314  095d               L1102:
4315                     ; 1334 	}else if (cyclicWakeMode == L99PM62DRV_DISABLE){
4317  095d 7b01          	ld	a,(OFST+1,sp)
4318  095f 26dd          	jrne	L453
4319                     ; 1335 		CtrlReg3[0] &= (u8)~0x02U;		
4321  0961 7213001a      	bres	L31_CtrlReg3,#1
4323  0965               L3102:
4324                     ; 1338 	if (timer == L99PM62DRV_CYCLIC_WAKEUP_TIMER1){
4326  0965 7b02          	ld	a,(OFST+2,sp)
4327  0967 4a            	dec	a
4328  0968 2606          	jrne	L1202
4329                     ; 1339 		CtrlReg3[0] |= 0x01U;
4331  096a 7210001a      	bset	L31_CtrlReg3,#0
4333  096e 2008          	jra	L3202
4334                     ; 1336 	}else return;
4336  0970               L1202:
4337                     ; 1340 	}else if (timer == L99PM62DRV_CYCLIC_WAKEUP_TIMER2){
4339  0970 7b02          	ld	a,(OFST+2,sp)
4340  0972 26ca          	jrne	L453
4341                     ; 1341 		CtrlReg3[0] &= (u8)~0x01U;
4343  0974 7211001a      	bres	L31_CtrlReg3,#0
4345  0978               L3202:
4346                     ; 1344 	L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR3,
4346                     ; 1345 									CtrlReg3, 
4346                     ; 1346 									&GlobalStatusRegister,
4346                     ; 1347 									CtrlReg3_old);
4348  0978 ae0018        	ldw	x,#L51_CtrlReg3_old
4349  097b 89            	pushw	x
4350  097c ae0001        	ldw	x,#L54_GlobalStatusRegister
4351  097f 89            	pushw	x
4352  0980 ae001a        	ldw	x,#L31_CtrlReg3
4353  0983 89            	pushw	x
4354  0984 a603          	ld	a,#3
4355  0986 cd0e5d        	call	_ST_SPI_Send_16
4357  0989 5b06          	addw	sp,#6
4358                     ; 1348 }
4360  098b 20b1          	jra	L453
4361                     ; 1342 	}else return;	
4414                     ; 1364 void L99PM62drv_EnableBusWakeUp (L99PM62drv_EnableType LINWakeUp, L99PM62drv_EnableType CANWakeUp) {
4415                     	switch	.text
4416  098d               _L99PM62drv_EnableBusWakeUp:
4418  098d 89            	pushw	x
4419       00000000      OFST:	set	0
4422                     ; 1368    if (!InitFlag) {
4424  098e c60000        	ld	a,L74_InitFlag
4425  0991 2609          	jrne	L3502
4426                     ; 1369         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_EnableBusWakeUp, L99PM62DRV_EID_UNINIT)) {
4428  0993 ae1914        	ldw	x,#6420
4429  0996 cd0000        	call	_L99PM62drv_ReportError
4431  0999 4d            	tnz	a
4432  099a 2712          	jreq	L073
4433                     ; 1370             return;
4435  099c               L3502:
4436                     ; 1373    if ((LINWakeUp !=  L99PM62DRV_ENABLE) &&(LINWakeUp !=  L99PM62DRV_DISABLE) ) {
4438  099c 7b01          	ld	a,(OFST+1,sp)
4439  099e 4a            	dec	a
4440  099f 270f          	jreq	L7502
4442  09a1 7b01          	ld	a,(OFST+1,sp)
4443  09a3 270b          	jreq	L7502
4444                     ; 1374       if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_EnableBusWakeUp, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE)) {
4446  09a5 ae190b        	ldw	x,#6411
4447  09a8 cd0000        	call	_L99PM62drv_ReportError
4449  09ab 4d            	tnz	a
4450  09ac 2602          	jrne	L7502
4451                     ; 1375          return;
4452  09ae               L073:
4455  09ae 85            	popw	x
4456  09af 81            	ret	
4457  09b0               L7502:
4458                     ; 1378 	if ((CANWakeUp !=  L99PM62DRV_ENABLE) &&(CANWakeUp !=  L99PM62DRV_DISABLE) ) {
4460  09b0 7b02          	ld	a,(OFST+2,sp)
4461  09b2 4a            	dec	a
4462  09b3 270d          	jreq	L3602
4464  09b5 7b02          	ld	a,(OFST+2,sp)
4465  09b7 2709          	jreq	L3602
4466                     ; 1379       if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_EnableBusWakeUp, L99PM62DRV_EID_PARAMETER2_OUT_OF_RANGE)) {
4468  09b9 ae190c        	ldw	x,#6412
4469  09bc cd0000        	call	_L99PM62drv_ReportError
4471  09bf 4d            	tnz	a
4472  09c0 27ec          	jreq	L073
4473                     ; 1380          return;
4475  09c2               L3602:
4476                     ; 1387 	if (LINWakeUp ==  L99PM62DRV_DISABLE){
4478  09c2 7b01          	ld	a,(OFST+1,sp)
4479  09c4 2606          	jrne	L7602
4480                     ; 1388 		CtrlReg3[0] &= (u8)~0x08U;		
4482  09c6 7217001a      	bres	L31_CtrlReg3,#3
4484  09ca 2004          	jra	L1702
4485  09cc               L7602:
4486                     ; 1390 		CtrlReg3[0] |= 0x08U;		
4488  09cc 7216001a      	bset	L31_CtrlReg3,#3
4489  09d0               L1702:
4490                     ; 1392 	if (CANWakeUp ==  L99PM62DRV_DISABLE){
4492  09d0 7b02          	ld	a,(OFST+2,sp)
4493  09d2 2606          	jrne	L3702
4494                     ; 1393 		CtrlReg3[0] &= (u8)~0x04U;		
4496  09d4 7215001a      	bres	L31_CtrlReg3,#2
4498  09d8 2004          	jra	L5702
4499  09da               L3702:
4500                     ; 1395 		CtrlReg3[0] |= 0x04U;		
4502  09da 7214001a      	bset	L31_CtrlReg3,#2
4503  09de               L5702:
4504                     ; 1397 	L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR3,
4504                     ; 1398 									CtrlReg3, 
4504                     ; 1399 									&GlobalStatusRegister,
4504                     ; 1400 									CtrlReg3_old);	
4506  09de ae0018        	ldw	x,#L51_CtrlReg3_old
4507  09e1 89            	pushw	x
4508  09e2 ae0001        	ldw	x,#L54_GlobalStatusRegister
4509  09e5 89            	pushw	x
4510  09e6 ae001a        	ldw	x,#L31_CtrlReg3
4511  09e9 89            	pushw	x
4512  09ea a603          	ld	a,#3
4513  09ec cd0e5d        	call	_ST_SPI_Send_16
4515  09ef 5b06          	addw	sp,#6
4516                     ; 1401 }
4518  09f1 20bb          	jra	L073
4560                     ; 1415 void L99PM62drv_SetCanStandbyMode (L99PM62drv_EnableType CanSleep)
4560                     ; 1416 {
4561                     	switch	.text
4562  09f3               _L99PM62drv_SetCanStandbyMode:
4564  09f3 88            	push	a
4565       00000000      OFST:	set	0
4568                     ; 1419    if (!InitFlag) {
4570  09f4 c60000        	ld	a,L74_InitFlag
4571  09f7 260b          	jrne	L5112
4572                     ; 1420         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetCanStandbyMode, L99PM62DRV_EID_UNINIT)) {
4574  09f9 ae2014        	ldw	x,#8212
4575  09fc cd0000        	call	_L99PM62drv_ReportError
4577  09ff 4d            	tnz	a
4578  0a00 2602          	jrne	L5112
4579                     ; 1421             return;
4582  0a02 84            	pop	a
4583  0a03 81            	ret	
4584  0a04               L5112:
4585                     ; 1424    if ((CanSleep !=  L99PM62DRV_ENABLE) &&(CanSleep !=  L99PM62DRV_DISABLE) ) {
4587  0a04 7b01          	ld	a,(OFST+1,sp)
4588  0a06 4a            	dec	a
4589  0a07 270f          	jreq	L1212
4591  0a09 7b01          	ld	a,(OFST+1,sp)
4592  0a0b 270b          	jreq	L1212
4593                     ; 1425       if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_SetCanStandbyMode, L99PM62DRV_EID_PARAMETER1_OUT_OF_RANGE)) {
4595  0a0d ae200b        	ldw	x,#8203
4596  0a10 cd0000        	call	_L99PM62drv_ReportError
4598  0a13 4d            	tnz	a
4599  0a14 2602          	jrne	L1212
4600                     ; 1426          return;
4603  0a16 84            	pop	a
4604  0a17 81            	ret	
4605  0a18               L1212:
4606                     ; 1433 	if (CanSleep ==  L99PM62DRV_DISABLE){
4608  0a18 7b01          	ld	a,(OFST+1,sp)
4609  0a1a 2606          	jrne	L5212
4610                     ; 1434 		CtrlReg4[0] &= (u8)~0x10U;		
4612  0a1c 72190016      	bres	L71_CtrlReg4,#4
4614  0a20 2004          	jra	L7212
4615  0a22               L5212:
4616                     ; 1436 		CtrlReg4[0] |= 0x10U;		
4618  0a22 72180016      	bset	L71_CtrlReg4,#4
4619  0a26               L7212:
4620                     ; 1439 	L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR4,
4620                     ; 1440 									CtrlReg4, 
4620                     ; 1441 									&GlobalStatusRegister,
4620                     ; 1442 									CtrlReg4_old);	
4622  0a26 ae0014        	ldw	x,#L12_CtrlReg4_old
4623  0a29 89            	pushw	x
4624  0a2a ae0001        	ldw	x,#L54_GlobalStatusRegister
4625  0a2d 89            	pushw	x
4626  0a2e ae0016        	ldw	x,#L71_CtrlReg4
4627  0a31 89            	pushw	x
4628  0a32 a604          	ld	a,#4
4629  0a34 cd0e5d        	call	_ST_SPI_Send_16
4631  0a37 5b06          	addw	sp,#6
4632                     ; 1444 }
4635  0a39 84            	pop	a
4636  0a3a 81            	ret	
4663                     ; 1460 u8 L99PM62drv_GetGlobalStatusRegister (void) {
4664                     	switch	.text
4665  0a3b               _L99PM62drv_GetGlobalStatusRegister:
4669                     ; 1463     if (!InitFlag) {
4671  0a3b c60000        	ld	a,L74_InitFlag
4672  0a3e 260b          	jrne	L1412
4673                     ; 1464         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_GetGlobalStatusRegister, L99PM62DRV_EID_UNINIT)) {
4675  0a40 ae1a14        	ldw	x,#6676
4676  0a43 cd0000        	call	_L99PM62drv_ReportError
4678  0a46 4d            	tnz	a
4679  0a47 2602          	jrne	L1412
4680                     ; 1465             return (TRUE);          /* return Global error to upper function */
4682  0a49 4c            	inc	a
4685  0a4a 81            	ret	
4686  0a4b               L1412:
4687                     ; 1469 	return (GlobalStatusRegister);
4689  0a4b c60001        	ld	a,L54_GlobalStatusRegister
4692  0a4e 81            	ret	
4821                     ; 1485 void L99PM62drv_ReadStatus (L99PM62drv_RegIDType regID,L99PM62drv_RegType *DataPtr) {
4822                     	switch	.text
4823  0a4f               _L99PM62drv_ReadStatus:
4825  0a4f 88            	push	a
4826  0a50 89            	pushw	x
4827       00000002      OFST:	set	2
4830                     ; 1488    if (!InitFlag) {
4832  0a51 c60000        	ld	a,L74_InitFlag
4833  0a54 2609          	jrne	L7222
4834                     ; 1489       if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_ReadStatus, L99PM62DRV_EID_UNINIT)) {
4836  0a56 ae1b14        	ldw	x,#6932
4837  0a59 cd0000        	call	_L99PM62drv_ReportError
4839  0a5c 4d            	tnz	a
4840  0a5d 2712          	jreq	L224
4841                     ; 1490          return;
4843  0a5f               L7222:
4844                     ; 1495 	switch(regID){
4846  0a5f 7b03          	ld	a,(OFST+1,sp)
4848                     ; 1521 			return;
4849  0a61 a011          	sub	a,#17
4850  0a63 270f          	jreq	L5412
4851  0a65 4a            	dec	a
4852  0a66 272b          	jreq	L7412
4853  0a68 4a            	dec	a
4854  0a69 2751          	jreq	L1512
4855                     ; 1517 		default:
4855                     ; 1518 #ifdef  L99PM62DRV_DEV_ERROR_DETECT
4855                     ; 1519             L99PM62drv_ReportError (SID_L99PM62drv_ReadStatus, L99PM62DRV_EID_PARAMETER2_OUT_OF_RANGE);
4857  0a6b ae1b0c        	ldw	x,#6924
4858  0a6e cd0000        	call	_L99PM62drv_ReportError
4860                     ; 1521 			return;
4861  0a71               L224:
4864  0a71 5b03          	addw	sp,#3
4865  0a73 81            	ret	
4866  0a74               L5412:
4867                     ; 1496 		case L99PM62DRV_SR1:
4867                     ; 1497 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_READ |L99PM62DRV_SR1,
4867                     ; 1498 											StatReg1, 
4867                     ; 1499 											&GlobalStatusRegister,
4867                     ; 1500 											StatReg1);
4869  0a74 ae000a        	ldw	x,#L33_StatReg1
4870  0a77 89            	pushw	x
4871  0a78 ae0001        	ldw	x,#L54_GlobalStatusRegister
4872  0a7b 89            	pushw	x
4873  0a7c ae000a        	ldw	x,#L33_StatReg1
4874  0a7f 89            	pushw	x
4875  0a80 a651          	ld	a,#81
4876  0a82 cd0e5d        	call	_ST_SPI_Send_16
4878  0a85 5b06          	addw	sp,#6
4879                     ; 1501 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)StatReg1[1]<<8 )+ (L99PM62drv_RegType)StatReg1[0] ;
4881  0a87 c6000a        	ld	a,L33_StatReg1
4882  0a8a 5f            	clrw	x
4883  0a8b 97            	ld	xl,a
4884  0a8c 1f01          	ldw	(OFST-1,sp),x
4886  0a8e c6000b        	ld	a,L33_StatReg1+1
4887                     ; 1502 		break;
4889  0a91 201d          	jp	LC004
4890  0a93               L7412:
4891                     ; 1503 		case L99PM62DRV_SR2:
4891                     ; 1504 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_READ |L99PM62DRV_SR2,
4891                     ; 1505 											StatReg2, 
4891                     ; 1506 											&GlobalStatusRegister,
4891                     ; 1507 											StatReg2);
4893  0a93 ae0008        	ldw	x,#L53_StatReg2
4894  0a96 89            	pushw	x
4895  0a97 ae0001        	ldw	x,#L54_GlobalStatusRegister
4896  0a9a 89            	pushw	x
4897  0a9b ae0008        	ldw	x,#L53_StatReg2
4898  0a9e 89            	pushw	x
4899  0a9f a652          	ld	a,#82
4900  0aa1 cd0e5d        	call	_ST_SPI_Send_16
4902  0aa4 5b06          	addw	sp,#6
4903                     ; 1508 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)StatReg2[1]<<8) + (L99PM62drv_RegType)StatReg2[0] ;
4905  0aa6 c60008        	ld	a,L53_StatReg2
4906  0aa9 5f            	clrw	x
4907  0aaa 97            	ld	xl,a
4908  0aab 1f01          	ldw	(OFST-1,sp),x
4910  0aad c60009        	ld	a,L53_StatReg2+1
4911  0ab0               LC004:
4912  0ab0 97            	ld	xl,a
4913  0ab1 4f            	clr	a
4914  0ab2 02            	rlwa	x,a
4915  0ab3 1606          	ldw	y,(OFST+4,sp)
4916  0ab5 72fb01        	addw	x,(OFST-1,sp)
4917  0ab8 90ff          	ldw	(y),x
4918                     ; 1509 		break;
4920  0aba 20b5          	jra	L224
4921  0abc               L1512:
4922                     ; 1510 		case L99PM62DRV_SR3:
4922                     ; 1511 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_READ |L99PM62DRV_SR3,
4922                     ; 1512 											StatReg3, 
4922                     ; 1513 											&GlobalStatusRegister,
4922                     ; 1514 											StatReg3);
4924  0abc ae0006        	ldw	x,#L73_StatReg3
4925  0abf 89            	pushw	x
4926  0ac0 ae0001        	ldw	x,#L54_GlobalStatusRegister
4927  0ac3 89            	pushw	x
4928  0ac4 ae0006        	ldw	x,#L73_StatReg3
4929  0ac7 89            	pushw	x
4930  0ac8 a653          	ld	a,#83
4931  0aca cd0e5d        	call	_ST_SPI_Send_16
4933  0acd 5b06          	addw	sp,#6
4934                     ; 1515 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)StatReg3[1]<<8) + (L99PM62drv_RegType)StatReg3[0] ;
4936  0acf c60006        	ld	a,L73_StatReg3
4937  0ad2 5f            	clrw	x
4938  0ad3 97            	ld	xl,a
4939  0ad4 1f01          	ldw	(OFST-1,sp),x
4941  0ad6 c60007        	ld	a,L73_StatReg3+1
4942                     ; 1516 		break;
4944                     ; 1523 }
4946  0ad9 20d5          	jp	LC004
4999                     ; 1539 void L99PM62drv_ReadClearStatus (L99PM62drv_RegIDType regID,L99PM62drv_RegType *DataPtr) {
5000                     	switch	.text
5001  0adb               _L99PM62drv_ReadClearStatus:
5003  0adb 88            	push	a
5004  0adc 89            	pushw	x
5005       00000002      OFST:	set	2
5008                     ; 1542    if (!InitFlag) {
5010  0add c60000        	ld	a,L74_InitFlag
5011  0ae0 2609          	jrne	L1722
5012                     ; 1543       if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_ReadClearStatus, L99PM62DRV_EID_UNINIT)) {
5014  0ae2 ae1c14        	ldw	x,#7188
5015  0ae5 cd0000        	call	_L99PM62drv_ReportError
5017  0ae8 4d            	tnz	a
5018  0ae9 2712          	jreq	L044
5019                     ; 1544          return;
5021  0aeb               L1722:
5022                     ; 1549 	switch(regID){
5024  0aeb 7b03          	ld	a,(OFST+1,sp)
5026                     ; 1575 			return;
5027  0aed a011          	sub	a,#17
5028  0aef 270f          	jreq	L7322
5029  0af1 4a            	dec	a
5030  0af2 272b          	jreq	L1422
5031  0af4 4a            	dec	a
5032  0af5 2751          	jreq	L3422
5033                     ; 1571 		default:
5033                     ; 1572 #ifdef  L99PM62DRV_DEV_ERROR_DETECT
5033                     ; 1573             L99PM62drv_ReportError (SID_L99PM62drv_ReadClearStatus, L99PM62DRV_EID_PARAMETER2_OUT_OF_RANGE);
5035  0af7 ae1c0c        	ldw	x,#7180
5036  0afa cd0000        	call	_L99PM62drv_ReportError
5038                     ; 1575 			return;
5039  0afd               L044:
5042  0afd 5b03          	addw	sp,#3
5043  0aff 81            	ret	
5044  0b00               L7322:
5045                     ; 1550 		case L99PM62DRV_SR1:
5045                     ; 1551 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_READ_CLEAR |L99PM62DRV_SR1,
5045                     ; 1552 											StatReg1, 
5045                     ; 1553 											&GlobalStatusRegister,
5045                     ; 1554 											StatReg1);
5047  0b00 ae000a        	ldw	x,#L33_StatReg1
5048  0b03 89            	pushw	x
5049  0b04 ae0001        	ldw	x,#L54_GlobalStatusRegister
5050  0b07 89            	pushw	x
5051  0b08 ae000a        	ldw	x,#L33_StatReg1
5052  0b0b 89            	pushw	x
5053  0b0c a691          	ld	a,#145
5054  0b0e cd0e5d        	call	_ST_SPI_Send_16
5056  0b11 5b06          	addw	sp,#6
5057                     ; 1555 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)StatReg1[1]<<8) + (L99PM62drv_RegType)StatReg1[0] ;
5059  0b13 c6000a        	ld	a,L33_StatReg1
5060  0b16 5f            	clrw	x
5061  0b17 97            	ld	xl,a
5062  0b18 1f01          	ldw	(OFST-1,sp),x
5064  0b1a c6000b        	ld	a,L33_StatReg1+1
5065                     ; 1556 		break;
5067  0b1d 201d          	jp	LC005
5068  0b1f               L1422:
5069                     ; 1557 		case L99PM62DRV_SR2:
5069                     ; 1558 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_READ_CLEAR |L99PM62DRV_SR2,
5069                     ; 1559 											StatReg2, 
5069                     ; 1560 											&GlobalStatusRegister,
5069                     ; 1561 											StatReg2);
5071  0b1f ae0008        	ldw	x,#L53_StatReg2
5072  0b22 89            	pushw	x
5073  0b23 ae0001        	ldw	x,#L54_GlobalStatusRegister
5074  0b26 89            	pushw	x
5075  0b27 ae0008        	ldw	x,#L53_StatReg2
5076  0b2a 89            	pushw	x
5077  0b2b a692          	ld	a,#146
5078  0b2d cd0e5d        	call	_ST_SPI_Send_16
5080  0b30 5b06          	addw	sp,#6
5081                     ; 1562 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)StatReg2[1]<<8) + (L99PM62drv_RegType)StatReg2[0] ;
5083  0b32 c60008        	ld	a,L53_StatReg2
5084  0b35 5f            	clrw	x
5085  0b36 97            	ld	xl,a
5086  0b37 1f01          	ldw	(OFST-1,sp),x
5088  0b39 c60009        	ld	a,L53_StatReg2+1
5089  0b3c               LC005:
5090  0b3c 97            	ld	xl,a
5091  0b3d 4f            	clr	a
5092  0b3e 02            	rlwa	x,a
5093  0b3f 1606          	ldw	y,(OFST+4,sp)
5094  0b41 72fb01        	addw	x,(OFST-1,sp)
5095  0b44 90ff          	ldw	(y),x
5096                     ; 1563 		break;
5098  0b46 20b5          	jra	L044
5099  0b48               L3422:
5100                     ; 1564 		case L99PM62DRV_SR3:
5100                     ; 1565 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_READ_CLEAR |L99PM62DRV_SR3,
5100                     ; 1566 											StatReg3, 
5100                     ; 1567 											&GlobalStatusRegister,
5100                     ; 1568 											StatReg3);
5102  0b48 ae0006        	ldw	x,#L73_StatReg3
5103  0b4b 89            	pushw	x
5104  0b4c ae0001        	ldw	x,#L54_GlobalStatusRegister
5105  0b4f 89            	pushw	x
5106  0b50 ae0006        	ldw	x,#L73_StatReg3
5107  0b53 89            	pushw	x
5108  0b54 a693          	ld	a,#147
5109  0b56 cd0e5d        	call	_ST_SPI_Send_16
5111  0b59 5b06          	addw	sp,#6
5112                     ; 1569 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)StatReg3[1]<<8) + (L99PM62drv_RegType)StatReg3[0] ;
5114  0b5b c60006        	ld	a,L73_StatReg3
5115  0b5e 5f            	clrw	x
5116  0b5f 97            	ld	xl,a
5117  0b60 1f01          	ldw	(OFST-1,sp),x
5119  0b62 c60007        	ld	a,L73_StatReg3+1
5120                     ; 1570 		break;
5122                     ; 1577 }
5124  0b65 20d5          	jp	LC005
5181                     ; 1591 void L99PM62drv_ReadControl (L99PM62drv_RegIDType regID,L99PM62drv_RegType *DataPtr) {
5182                     	switch	.text
5183  0b67               _L99PM62drv_ReadControl:
5185  0b67 88            	push	a
5186  0b68 89            	pushw	x
5187       00000002      OFST:	set	2
5190                     ; 1594    if (!InitFlag) {
5192  0b69 c60000        	ld	a,L74_InitFlag
5193  0b6c 2609          	jrne	L3432
5194                     ; 1595       if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_ReadControl, L99PM62DRV_EID_UNINIT)) {
5196  0b6e ae1d14        	ldw	x,#7444
5197  0b71 cd0000        	call	_L99PM62drv_ReportError
5199  0b74 4d            	tnz	a
5200  0b75 2727          	jreq	L664
5201                     ; 1596          return;
5203  0b77               L3432:
5204                     ; 1601 	switch(regID){
5206  0b77 7b03          	ld	a,(OFST+1,sp)
5208                     ; 1655 			return;
5209  0b79 4a            	dec	a
5210  0b7a 2725          	jreq	L1032
5211  0b7c 4a            	dec	a
5212  0b7d 2742          	jreq	L3032
5213  0b7f 4a            	dec	a
5214  0b80 275e          	jreq	L5032
5215  0b82 4a            	dec	a
5216  0b83 277a          	jreq	L7032
5217  0b85 4a            	dec	a
5218  0b86 2603cc0c1e    	jreq	L1132
5219  0b8b 4a            	dec	a
5220  0b8c 2603cc0c3d    	jreq	L3132
5221  0b91 a039          	sub	a,#57
5222  0b93 2603cc0c67    	jreq	L5132
5223                     ; 1651 		default:
5223                     ; 1652 #ifdef  L99PM62DRV_DEV_ERROR_DETECT
5223                     ; 1653             L99PM62drv_ReportError (SID_L99PM62drv_ReadControl, L99PM62DRV_EID_PARAMETER2_OUT_OF_RANGE);
5225  0b98 ae1d0c        	ldw	x,#7436
5226  0b9b cd0000        	call	_L99PM62drv_ReportError
5228                     ; 1655 			return;
5229  0b9e               L664:
5232  0b9e 5b03          	addw	sp,#3
5233  0ba0 81            	ret	
5234  0ba1               L1032:
5235                     ; 1602 		case L99PM62DRV_CR1:
5235                     ; 1603 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_READ |L99PM62DRV_CR1,
5235                     ; 1604 											CtrlReg1, 
5235                     ; 1605 											&GlobalStatusRegister,
5235                     ; 1606 											CtrlReg1);
5237  0ba1 ae0022        	ldw	x,#L3_CtrlReg1
5238  0ba4 89            	pushw	x
5239  0ba5 ae0001        	ldw	x,#L54_GlobalStatusRegister
5240  0ba8 89            	pushw	x
5241  0ba9 ae0022        	ldw	x,#L3_CtrlReg1
5242  0bac 89            	pushw	x
5243  0bad a641          	ld	a,#65
5244  0baf cd0e5d        	call	_ST_SPI_Send_16
5246  0bb2 5b06          	addw	sp,#6
5247                     ; 1607 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)CtrlReg1[1]<<8 )+ (L99PM62drv_RegType)CtrlReg1[0] ;
5249  0bb4 c60022        	ld	a,L3_CtrlReg1
5250  0bb7 5f            	clrw	x
5251  0bb8 97            	ld	xl,a
5252  0bb9 1f01          	ldw	(OFST-1,sp),x
5254  0bbb c60023        	ld	a,L3_CtrlReg1+1
5255                     ; 1608 		break;
5257  0bbe cc0c5a        	jp	LC006
5258  0bc1               L3032:
5259                     ; 1609 		case L99PM62DRV_CR2:
5259                     ; 1610 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_READ |L99PM62DRV_CR2,
5259                     ; 1611 											CtrlReg2, 
5259                     ; 1612 											&GlobalStatusRegister,
5259                     ; 1613 											CtrlReg2);
5261  0bc1 ae001e        	ldw	x,#L7_CtrlReg2
5262  0bc4 89            	pushw	x
5263  0bc5 ae0001        	ldw	x,#L54_GlobalStatusRegister
5264  0bc8 89            	pushw	x
5265  0bc9 ae001e        	ldw	x,#L7_CtrlReg2
5266  0bcc 89            	pushw	x
5267  0bcd a642          	ld	a,#66
5268  0bcf cd0e5d        	call	_ST_SPI_Send_16
5270  0bd2 5b06          	addw	sp,#6
5271                     ; 1614 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)CtrlReg2[1]<<8 )+ (L99PM62drv_RegType)CtrlReg2[0] ;
5273  0bd4 c6001e        	ld	a,L7_CtrlReg2
5274  0bd7 5f            	clrw	x
5275  0bd8 97            	ld	xl,a
5276  0bd9 1f01          	ldw	(OFST-1,sp),x
5278  0bdb c6001f        	ld	a,L7_CtrlReg2+1
5279                     ; 1615 		break;
5281  0bde 207a          	jp	LC006
5282  0be0               L5032:
5283                     ; 1616 		case L99PM62DRV_CR3:
5283                     ; 1617 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_READ |L99PM62DRV_CR3,
5283                     ; 1618 											CtrlReg3, 
5283                     ; 1619 											&GlobalStatusRegister,
5283                     ; 1620 											CtrlReg3);
5285  0be0 ae001a        	ldw	x,#L31_CtrlReg3
5286  0be3 89            	pushw	x
5287  0be4 ae0001        	ldw	x,#L54_GlobalStatusRegister
5288  0be7 89            	pushw	x
5289  0be8 ae001a        	ldw	x,#L31_CtrlReg3
5290  0beb 89            	pushw	x
5291  0bec a643          	ld	a,#67
5292  0bee cd0e5d        	call	_ST_SPI_Send_16
5294  0bf1 5b06          	addw	sp,#6
5295                     ; 1621 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)CtrlReg3[1]<<8) + (L99PM62drv_RegType)CtrlReg3[0] ;
5297  0bf3 c6001a        	ld	a,L31_CtrlReg3
5298  0bf6 5f            	clrw	x
5299  0bf7 97            	ld	xl,a
5300  0bf8 1f01          	ldw	(OFST-1,sp),x
5302  0bfa c6001b        	ld	a,L31_CtrlReg3+1
5303                     ; 1622 		break;
5305  0bfd 205b          	jp	LC006
5306  0bff               L7032:
5307                     ; 1623 		case L99PM62DRV_CR4:
5307                     ; 1624 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_READ |L99PM62DRV_CR4,
5307                     ; 1625 											CtrlReg4, 
5307                     ; 1626 											&GlobalStatusRegister,
5307                     ; 1627 											CtrlReg4);
5309  0bff ae0016        	ldw	x,#L71_CtrlReg4
5310  0c02 89            	pushw	x
5311  0c03 ae0001        	ldw	x,#L54_GlobalStatusRegister
5312  0c06 89            	pushw	x
5313  0c07 ae0016        	ldw	x,#L71_CtrlReg4
5314  0c0a 89            	pushw	x
5315  0c0b a644          	ld	a,#68
5316  0c0d cd0e5d        	call	_ST_SPI_Send_16
5318  0c10 5b06          	addw	sp,#6
5319                     ; 1628 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)CtrlReg4[1]<<8) + (L99PM62drv_RegType)CtrlReg4[0] ;
5321  0c12 c60016        	ld	a,L71_CtrlReg4
5322  0c15 5f            	clrw	x
5323  0c16 97            	ld	xl,a
5324  0c17 1f01          	ldw	(OFST-1,sp),x
5326  0c19 c60017        	ld	a,L71_CtrlReg4+1
5327                     ; 1629 		break;
5329  0c1c 203c          	jp	LC006
5330  0c1e               L1132:
5331                     ; 1630 		case L99PM62DRV_CR5:
5331                     ; 1631 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_READ |L99PM62DRV_CR5,
5331                     ; 1632 											CtrlReg5, 
5331                     ; 1633 											&GlobalStatusRegister,
5331                     ; 1634 											CtrlReg5);
5333  0c1e ae0012        	ldw	x,#L32_CtrlReg5
5334  0c21 89            	pushw	x
5335  0c22 ae0001        	ldw	x,#L54_GlobalStatusRegister
5336  0c25 89            	pushw	x
5337  0c26 ae0012        	ldw	x,#L32_CtrlReg5
5338  0c29 89            	pushw	x
5339  0c2a a645          	ld	a,#69
5340  0c2c cd0e5d        	call	_ST_SPI_Send_16
5342  0c2f 5b06          	addw	sp,#6
5343                     ; 1635 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)CtrlReg5[1]<<8) + (L99PM62drv_RegType)CtrlReg5[0] ;
5345  0c31 c60012        	ld	a,L32_CtrlReg5
5346  0c34 5f            	clrw	x
5347  0c35 97            	ld	xl,a
5348  0c36 1f01          	ldw	(OFST-1,sp),x
5350  0c38 c60013        	ld	a,L32_CtrlReg5+1
5351                     ; 1636 		break;
5353  0c3b 201d          	jp	LC006
5354  0c3d               L3132:
5355                     ; 1637 		case L99PM62DRV_CR6:
5355                     ; 1638 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_READ |L99PM62DRV_CR6,
5355                     ; 1639 											CtrlReg6, 
5355                     ; 1640 											&GlobalStatusRegister,
5355                     ; 1641 											CtrlReg6);
5357  0c3d ae000e        	ldw	x,#L72_CtrlReg6
5358  0c40 89            	pushw	x
5359  0c41 ae0001        	ldw	x,#L54_GlobalStatusRegister
5360  0c44 89            	pushw	x
5361  0c45 ae000e        	ldw	x,#L72_CtrlReg6
5362  0c48 89            	pushw	x
5363  0c49 a646          	ld	a,#70
5364  0c4b cd0e5d        	call	_ST_SPI_Send_16
5366  0c4e 5b06          	addw	sp,#6
5367                     ; 1642 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)CtrlReg6[1]<<8) + (L99PM62drv_RegType)CtrlReg6[0] ;
5369  0c50 c6000e        	ld	a,L72_CtrlReg6
5370  0c53 5f            	clrw	x
5371  0c54 97            	ld	xl,a
5372  0c55 1f01          	ldw	(OFST-1,sp),x
5374  0c57 c6000f        	ld	a,L72_CtrlReg6+1
5375  0c5a               LC006:
5376  0c5a 97            	ld	xl,a
5377  0c5b 4f            	clr	a
5378  0c5c 02            	rlwa	x,a
5379  0c5d 1606          	ldw	y,(OFST+4,sp)
5380  0c5f 72fb01        	addw	x,(OFST-1,sp)
5381  0c62 90ff          	ldw	(y),x
5382                     ; 1643 		break;
5384  0c64 cc0b9e        	jra	L664
5385  0c67               L5132:
5386                     ; 1644 		case L99PM62DRV_CFR:
5386                     ; 1645 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_READ |L99PM62DRV_CFR,
5386                     ; 1646 											ConfigReg, 
5386                     ; 1647 											&GlobalStatusRegister,
5386                     ; 1648 											ConfigReg);
5388  0c67 ae0004        	ldw	x,#L14_ConfigReg
5389  0c6a 89            	pushw	x
5390  0c6b ae0001        	ldw	x,#L54_GlobalStatusRegister
5391  0c6e 89            	pushw	x
5392  0c6f ae0004        	ldw	x,#L14_ConfigReg
5393  0c72 89            	pushw	x
5394  0c73 a67f          	ld	a,#127
5395  0c75 cd0e5d        	call	_ST_SPI_Send_16
5397  0c78 5b06          	addw	sp,#6
5398                     ; 1649 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)ConfigReg[1]<<8) + (L99PM62drv_RegType)ConfigReg[0] ;
5400  0c7a c60004        	ld	a,L14_ConfigReg
5401  0c7d 5f            	clrw	x
5402  0c7e 97            	ld	xl,a
5403  0c7f 1f01          	ldw	(OFST-1,sp),x
5405  0c81 c60005        	ld	a,L14_ConfigReg+1
5406                     ; 1650 		break;
5408                     ; 1657 }
5410  0c84 20d4          	jp	LC006
5465                     ; 1671 void L99PM62drv_GetControl (L99PM62drv_RegIDType regID,L99PM62drv_RegType *DataPtr ) {
5466                     	switch	.text
5467  0c86               _L99PM62drv_GetControl:
5469  0c86 88            	push	a
5470  0c87 89            	pushw	x
5471       00000002      OFST:	set	2
5474                     ; 1674    if (!InitFlag) {
5476  0c88 c60000        	ld	a,L74_InitFlag
5477  0c8b 2609          	jrne	L5142
5478                     ; 1675       if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_GetControl, L99PM62DRV_EID_UNINIT)) {
5480  0c8d ae1f14        	ldw	x,#7956
5481  0c90 cd0000        	call	_L99PM62drv_ReportError
5483  0c93 4d            	tnz	a
5484  0c94 271e          	jreq	L674
5485                     ; 1676          return;
5487  0c96               L5142:
5488                     ; 1681 	switch(regID){
5490  0c96 7b03          	ld	a,(OFST+1,sp)
5492                     ; 1707 			return;
5493  0c98 4a            	dec	a
5494  0c99 271c          	jreq	L3532
5495  0c9b 4a            	dec	a
5496  0c9c 2725          	jreq	L5532
5497  0c9e 4a            	dec	a
5498  0c9f 272e          	jreq	L7532
5499  0ca1 4a            	dec	a
5500  0ca2 2737          	jreq	L1632
5501  0ca4 4a            	dec	a
5502  0ca5 2740          	jreq	L3632
5503  0ca7 4a            	dec	a
5504  0ca8 2749          	jreq	L5632
5505  0caa a039          	sub	a,#57
5506  0cac 275b          	jreq	L7632
5507                     ; 1703 		default:
5507                     ; 1704 #ifdef  L99PM62DRV_DEV_ERROR_DETECT
5507                     ; 1705             L99PM62drv_ReportError (SID_L99PM62drv_GetControl, L99PM62DRV_EID_PARAMETER2_OUT_OF_RANGE);
5509  0cae ae1f0c        	ldw	x,#7948
5510  0cb1 cd0000        	call	_L99PM62drv_ReportError
5512                     ; 1707 			return;
5513  0cb4               L674:
5516  0cb4 5b03          	addw	sp,#3
5517  0cb6 81            	ret	
5518  0cb7               L3532:
5519                     ; 1682 		case L99PM62DRV_CR1:
5519                     ; 1683 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)CtrlReg1_old[1] << 8) + (L99PM62drv_RegType)CtrlReg1_old[0] ;
5521  0cb7 c60020        	ld	a,L5_CtrlReg1_old
5522  0cba 5f            	clrw	x
5523  0cbb 97            	ld	xl,a
5524  0cbc 1f01          	ldw	(OFST-1,sp),x
5526  0cbe c60021        	ld	a,L5_CtrlReg1_old+1
5527                     ; 1684 		break;
5529  0cc1 203a          	jp	LC007
5530  0cc3               L5532:
5531                     ; 1685 		case L99PM62DRV_CR2:
5531                     ; 1686 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)CtrlReg2_old[1]<<8) + (L99PM62drv_RegType)CtrlReg2_old[0] ;
5533  0cc3 c6001c        	ld	a,L11_CtrlReg2_old
5534  0cc6 5f            	clrw	x
5535  0cc7 97            	ld	xl,a
5536  0cc8 1f01          	ldw	(OFST-1,sp),x
5538  0cca c6001d        	ld	a,L11_CtrlReg2_old+1
5539                     ; 1687 		break;
5541  0ccd 202e          	jp	LC007
5542  0ccf               L7532:
5543                     ; 1688 		case L99PM62DRV_CR3:
5543                     ; 1689 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)CtrlReg3_old[1]<<8) + (L99PM62drv_RegType)CtrlReg3_old[0] ;
5545  0ccf c60018        	ld	a,L51_CtrlReg3_old
5546  0cd2 5f            	clrw	x
5547  0cd3 97            	ld	xl,a
5548  0cd4 1f01          	ldw	(OFST-1,sp),x
5550  0cd6 c60019        	ld	a,L51_CtrlReg3_old+1
5551                     ; 1690 		break;
5553  0cd9 2022          	jp	LC007
5554  0cdb               L1632:
5555                     ; 1691 		case L99PM62DRV_CR4:
5555                     ; 1692 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)CtrlReg4_old[1]<<8) + (L99PM62drv_RegType)CtrlReg4_old[0] ;
5557  0cdb c60014        	ld	a,L12_CtrlReg4_old
5558  0cde 5f            	clrw	x
5559  0cdf 97            	ld	xl,a
5560  0ce0 1f01          	ldw	(OFST-1,sp),x
5562  0ce2 c60015        	ld	a,L12_CtrlReg4_old+1
5563                     ; 1693 		break;
5565  0ce5 2016          	jp	LC007
5566  0ce7               L3632:
5567                     ; 1694 		case L99PM62DRV_CR5:
5567                     ; 1695 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)CtrlReg5_old[1]<<8) + (L99PM62drv_RegType)CtrlReg5_old[0] ;
5569  0ce7 c60010        	ld	a,L52_CtrlReg5_old
5570  0cea 5f            	clrw	x
5571  0ceb 97            	ld	xl,a
5572  0cec 1f01          	ldw	(OFST-1,sp),x
5574  0cee c60011        	ld	a,L52_CtrlReg5_old+1
5575                     ; 1696 		break;
5577  0cf1 200a          	jp	LC007
5578  0cf3               L5632:
5579                     ; 1697 		case L99PM62DRV_CR6:
5579                     ; 1698 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)CtrlReg6_old[1]<<8) + (L99PM62drv_RegType)CtrlReg6_old[0] ;
5581  0cf3 c6000c        	ld	a,L13_CtrlReg6_old
5582  0cf6 5f            	clrw	x
5583  0cf7 97            	ld	xl,a
5584  0cf8 1f01          	ldw	(OFST-1,sp),x
5586  0cfa c6000d        	ld	a,L13_CtrlReg6_old+1
5587  0cfd               LC007:
5588  0cfd 97            	ld	xl,a
5589  0cfe 4f            	clr	a
5590  0cff 02            	rlwa	x,a
5591  0d00 1606          	ldw	y,(OFST+4,sp)
5592  0d02 72fb01        	addw	x,(OFST-1,sp)
5593  0d05 90ff          	ldw	(y),x
5594                     ; 1699 		break;
5596  0d07 20ab          	jra	L674
5597  0d09               L7632:
5598                     ; 1700 		case L99PM62DRV_CFR:
5598                     ; 1701 			*DataPtr =(L99PM62drv_RegType)((L99PM62drv_RegType)ConfigReg_old[1]<<8) + (L99PM62drv_RegType)ConfigReg_old[0] ;
5600  0d09 c60002        	ld	a,L34_ConfigReg_old
5601  0d0c 5f            	clrw	x
5602  0d0d 97            	ld	xl,a
5603  0d0e 1f01          	ldw	(OFST-1,sp),x
5605  0d10 c60003        	ld	a,L34_ConfigReg_old+1
5606                     ; 1702 		break;
5608                     ; 1709 }
5610  0d13 20e8          	jp	LC007
5674                     ; 1723 void L99PM62drv_WriteControl (L99PM62drv_RegIDType regID,L99PM62drv_RegType *DataPtr) {
5675                     	switch	.text
5676  0d15               _L99PM62drv_WriteControl:
5678  0d15 88            	push	a
5679  0d16 88            	push	a
5680       00000001      OFST:	set	1
5683                     ; 1726    if (!InitFlag) {
5685  0d17 c60000        	ld	a,L74_InitFlag
5686  0d1a 2609          	jrne	L7642
5687                     ; 1727       if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_WriteControl, L99PM62DRV_EID_UNINIT)) {
5689  0d1c ae4014        	ldw	x,#16404
5690  0d1f cd0000        	call	_L99PM62drv_ReportError
5692  0d22 4d            	tnz	a
5693  0d23 272a          	jreq	L425
5694                     ; 1728          return;
5696  0d25               L7642:
5697                     ; 1733 	switch(regID){
5699  0d25 7b02          	ld	a,(OFST+1,sp)
5701                     ; 1801 			return;
5702  0d27 4a            	dec	a
5703  0d28 2727          	jreq	L5242
5704  0d2a 4a            	dec	a
5705  0d2b 274f          	jreq	L7242
5706  0d2d 4a            	dec	a
5707  0d2e 276c          	jreq	L1342
5708  0d30 4a            	dec	a
5709  0d31 2603cc0dbb    	jreq	L3342
5710  0d36 4a            	dec	a
5711  0d37 2603cc0dda    	jreq	L5342
5712  0d3c 4a            	dec	a
5713  0d3d 2603cc0df9    	jreq	L7342
5714  0d42 a039          	sub	a,#57
5715  0d44 2603cc0e18    	jreq	L1442
5716                     ; 1797 		default:
5716                     ; 1798 #ifdef  L99PM62DRV_DEV_ERROR_DETECT
5716                     ; 1799             L99PM62drv_ReportError (SID_L99PM62drv_WriteControl, L99PM62DRV_EID_PARAMETER2_OUT_OF_RANGE);
5718  0d49 ae400c        	ldw	x,#16396
5719  0d4c cd0000        	call	_L99PM62drv_ReportError
5721                     ; 1801 			return;
5722  0d4f               L425:
5725  0d4f 85            	popw	x
5726  0d50 81            	ret	
5727  0d51               L5242:
5728                     ; 1734 		case L99PM62DRV_CR1:
5728                     ; 1735 			CtrlReg1[1] = (u8)(*DataPtr >> 8);
5730  0d51 1e05          	ldw	x,(OFST+4,sp)
5731  0d53 fe            	ldw	x,(x)
5732  0d54 01            	rrwa	x,a
5733  0d55 9f            	ld	a,xl
5734  0d56 c70023        	ld	L3_CtrlReg1+1,a
5735                     ; 1736 			CtrlReg1[0] = (CtrlReg1[0] & 0x01U) | ((u8)(*DataPtr) & ~0x01U);			   
5737  0d59 1e05          	ldw	x,(OFST+4,sp)
5738  0d5b e601          	ld	a,(1,x)
5739  0d5d a4fe          	and	a,#254
5740  0d5f 6b01          	ld	(OFST+0,sp),a
5742  0d61 c60022        	ld	a,L3_CtrlReg1
5743  0d64 a401          	and	a,#1
5744  0d66 1a01          	or	a,(OFST+0,sp)
5745  0d68 c70022        	ld	L3_CtrlReg1,a
5746                     ; 1737 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR1,
5746                     ; 1738 											CtrlReg1, 
5746                     ; 1739 											&GlobalStatusRegister,
5746                     ; 1740 											CtrlReg1_old);
5748  0d6b ae0020        	ldw	x,#L5_CtrlReg1_old
5749  0d6e 89            	pushw	x
5750  0d6f ae0001        	ldw	x,#L54_GlobalStatusRegister
5751  0d72 89            	pushw	x
5752  0d73 ae0022        	ldw	x,#L3_CtrlReg1
5753  0d76 89            	pushw	x
5754  0d77 a601          	ld	a,#1
5756                     ; 1742 		break;
5758  0d79 cc0e35        	jra	L5742
5759  0d7c               L7242:
5760                     ; 1743 		case L99PM62DRV_CR2:
5760                     ; 1744 			CtrlReg2[1] = (u8)(*DataPtr >> 8);
5762  0d7c 1e05          	ldw	x,(OFST+4,sp)
5763  0d7e fe            	ldw	x,(x)
5764  0d7f 01            	rrwa	x,a
5765  0d80 9f            	ld	a,xl
5766  0d81 c7001f        	ld	L7_CtrlReg2+1,a
5767                     ; 1745 			CtrlReg2[0] = (u8)(*DataPtr);
5769  0d84 1e05          	ldw	x,(OFST+4,sp)
5770  0d86 e601          	ld	a,(1,x)
5771  0d88 c7001e        	ld	L7_CtrlReg2,a
5772                     ; 1746 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR2,
5772                     ; 1747 											CtrlReg2, 
5772                     ; 1748 											&GlobalStatusRegister,
5772                     ; 1749 											CtrlReg2_old);
5774  0d8b ae001c        	ldw	x,#L11_CtrlReg2_old
5775  0d8e 89            	pushw	x
5776  0d8f ae0001        	ldw	x,#L54_GlobalStatusRegister
5777  0d92 89            	pushw	x
5778  0d93 ae001e        	ldw	x,#L7_CtrlReg2
5779  0d96 89            	pushw	x
5780  0d97 a602          	ld	a,#2
5782                     ; 1751 		break;
5784  0d99 cc0e35        	jra	L5742
5785  0d9c               L1342:
5786                     ; 1752 		case L99PM62DRV_CR3:
5786                     ; 1753 			CtrlReg3[1] = (u8)(*DataPtr >> 8);
5788  0d9c 1e05          	ldw	x,(OFST+4,sp)
5789  0d9e fe            	ldw	x,(x)
5790  0d9f 01            	rrwa	x,a
5791  0da0 9f            	ld	a,xl
5792  0da1 c7001b        	ld	L31_CtrlReg3+1,a
5793                     ; 1754 			CtrlReg3[0] = (u8)(*DataPtr);
5795  0da4 1e05          	ldw	x,(OFST+4,sp)
5796  0da6 e601          	ld	a,(1,x)
5797  0da8 c7001a        	ld	L31_CtrlReg3,a
5798                     ; 1755 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR3,
5798                     ; 1756 											CtrlReg3, 
5798                     ; 1757 											&GlobalStatusRegister,
5798                     ; 1758 											CtrlReg3_old);
5800  0dab ae0018        	ldw	x,#L51_CtrlReg3_old
5801  0dae 89            	pushw	x
5802  0daf ae0001        	ldw	x,#L54_GlobalStatusRegister
5803  0db2 89            	pushw	x
5804  0db3 ae001a        	ldw	x,#L31_CtrlReg3
5805  0db6 89            	pushw	x
5806  0db7 a603          	ld	a,#3
5808                     ; 1760 		break;
5810  0db9 207a          	jra	L5742
5811  0dbb               L3342:
5812                     ; 1761 		case L99PM62DRV_CR4:
5812                     ; 1762 			CtrlReg4[1] = (u8)(*DataPtr >> 8);
5814  0dbb 1e05          	ldw	x,(OFST+4,sp)
5815  0dbd fe            	ldw	x,(x)
5816  0dbe 01            	rrwa	x,a
5817  0dbf 9f            	ld	a,xl
5818  0dc0 c70017        	ld	L71_CtrlReg4+1,a
5819                     ; 1763 			CtrlReg4[0] = (u8)(*DataPtr);
5821  0dc3 1e05          	ldw	x,(OFST+4,sp)
5822  0dc5 e601          	ld	a,(1,x)
5823  0dc7 c70016        	ld	L71_CtrlReg4,a
5824                     ; 1764 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR4,
5824                     ; 1765 											CtrlReg4, 
5824                     ; 1766 											&GlobalStatusRegister,
5824                     ; 1767 											CtrlReg4_old);
5826  0dca ae0014        	ldw	x,#L12_CtrlReg4_old
5827  0dcd 89            	pushw	x
5828  0dce ae0001        	ldw	x,#L54_GlobalStatusRegister
5829  0dd1 89            	pushw	x
5830  0dd2 ae0016        	ldw	x,#L71_CtrlReg4
5831  0dd5 89            	pushw	x
5832  0dd6 a604          	ld	a,#4
5834                     ; 1769 		break;
5836  0dd8 205b          	jra	L5742
5837  0dda               L5342:
5838                     ; 1770 		case L99PM62DRV_CR5:
5838                     ; 1771 			CtrlReg5[1] = (u8)(*DataPtr >> 8);
5840  0dda 1e05          	ldw	x,(OFST+4,sp)
5841  0ddc fe            	ldw	x,(x)
5842  0ddd 01            	rrwa	x,a
5843  0dde 9f            	ld	a,xl
5844  0ddf c70013        	ld	L32_CtrlReg5+1,a
5845                     ; 1772 			CtrlReg5[0] = (u8)(*DataPtr);
5847  0de2 1e05          	ldw	x,(OFST+4,sp)
5848  0de4 e601          	ld	a,(1,x)
5849  0de6 c70012        	ld	L32_CtrlReg5,a
5850                     ; 1773 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR5,
5850                     ; 1774 											CtrlReg5, 
5850                     ; 1775 											&GlobalStatusRegister,
5850                     ; 1776 											CtrlReg5_old);
5852  0de9 ae0010        	ldw	x,#L52_CtrlReg5_old
5853  0dec 89            	pushw	x
5854  0ded ae0001        	ldw	x,#L54_GlobalStatusRegister
5855  0df0 89            	pushw	x
5856  0df1 ae0012        	ldw	x,#L32_CtrlReg5
5857  0df4 89            	pushw	x
5858  0df5 a605          	ld	a,#5
5860                     ; 1778 		break;
5862  0df7 203c          	jra	L5742
5863  0df9               L7342:
5864                     ; 1779 		case L99PM62DRV_CR6:
5864                     ; 1780 			CtrlReg6[1] = (u8)(*DataPtr >> 8);
5866  0df9 1e05          	ldw	x,(OFST+4,sp)
5867  0dfb fe            	ldw	x,(x)
5868  0dfc 01            	rrwa	x,a
5869  0dfd 9f            	ld	a,xl
5870  0dfe c7000f        	ld	L72_CtrlReg6+1,a
5871                     ; 1781 			CtrlReg6[0] = (u8)(*DataPtr);
5873  0e01 1e05          	ldw	x,(OFST+4,sp)
5874  0e03 e601          	ld	a,(1,x)
5875  0e05 c7000e        	ld	L72_CtrlReg6,a
5876                     ; 1782 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR6,
5876                     ; 1783 											CtrlReg6, 
5876                     ; 1784 											&GlobalStatusRegister,
5876                     ; 1785 											CtrlReg6_old);
5878  0e08 ae000c        	ldw	x,#L13_CtrlReg6_old
5879  0e0b 89            	pushw	x
5880  0e0c ae0001        	ldw	x,#L54_GlobalStatusRegister
5881  0e0f 89            	pushw	x
5882  0e10 ae000e        	ldw	x,#L72_CtrlReg6
5883  0e13 89            	pushw	x
5884  0e14 a606          	ld	a,#6
5886                     ; 1787 		break;
5888  0e16 201d          	jra	L5742
5889  0e18               L1442:
5890                     ; 1788 		case L99PM62DRV_CFR:
5890                     ; 1789 			ConfigReg[1] = (u8)(*DataPtr >> 8);
5892  0e18 1e05          	ldw	x,(OFST+4,sp)
5893  0e1a fe            	ldw	x,(x)
5894  0e1b 01            	rrwa	x,a
5895  0e1c 9f            	ld	a,xl
5896  0e1d c70005        	ld	L14_ConfigReg+1,a
5897                     ; 1790 			ConfigReg[0] = (u8)(*DataPtr);
5899  0e20 1e05          	ldw	x,(OFST+4,sp)
5900  0e22 e601          	ld	a,(1,x)
5901  0e24 c70004        	ld	L14_ConfigReg,a
5902                     ; 1791 			L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CFR,
5902                     ; 1792 											ConfigReg, 
5902                     ; 1793 											&GlobalStatusRegister,
5902                     ; 1794 											ConfigReg_old);
5904  0e27 ae0002        	ldw	x,#L34_ConfigReg_old
5905  0e2a 89            	pushw	x
5906  0e2b ae0001        	ldw	x,#L54_GlobalStatusRegister
5907  0e2e 89            	pushw	x
5908  0e2f ae0004        	ldw	x,#L14_ConfigReg
5909  0e32 89            	pushw	x
5910  0e33 a63f          	ld	a,#63
5912                     ; 1796 		break;
5914  0e35               L5742:
5915  0e35 ad26          	call	_ST_SPI_Send_16
5916  0e37 5b06          	addw	sp,#6
5917                     ; 1803 }
5920  0e39 85            	popw	x
5921  0e3a 81            	ret	
5951                     ; 1816 void L99PM62drv_ClearStatusRegisters (void) {
5952                     	switch	.text
5953  0e3b               _L99PM62drv_ClearStatusRegisters:
5957                     ; 1819    if (!InitFlag) {
5959  0e3b c60000        	ld	a,L74_InitFlag
5960  0e3e 260a          	jrne	L7052
5961                     ; 1820         if (FALSE == L99PM62drv_ReportError (SID_L99PM62drv_ClearStatusRegisters, L99PM62DRV_EID_UNINIT)) {
5963  0e40 ae1e14        	ldw	x,#7700
5964  0e43 cd0000        	call	_L99PM62drv_ReportError
5966  0e46 4d            	tnz	a
5967  0e47 2601          	jrne	L7052
5968                     ; 1821             return;
5971  0e49 81            	ret	
5972  0e4a               L7052:
5973                     ; 1825 	L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_READ_CLEAR |L99PM62DRV_CFR,
5973                     ; 1826 											ConfigReg, 
5973                     ; 1827 											&GlobalStatusRegister,
5973                     ; 1828 											ConfigReg_old);
5975  0e4a ae0002        	ldw	x,#L34_ConfigReg_old
5976  0e4d 89            	pushw	x
5977  0e4e ae0001        	ldw	x,#L54_GlobalStatusRegister
5978  0e51 89            	pushw	x
5979  0e52 ae0004        	ldw	x,#L14_ConfigReg
5980  0e55 89            	pushw	x
5981  0e56 a6bf          	ld	a,#191
5982  0e58 ad03          	call	_ST_SPI_Send_16
5984  0e5a 5b06          	addw	sp,#6
5985                     ; 1829 }
5988  0e5c 81            	ret	
6063                     ; 1842 void L99PM62DRV_AL_SPI_WR(	u8 	commandByte, 	u8* 	dataIn, 
6063                     ; 1843 						u8* 	globalStatus, 	u8* 	dataOut){
6064                     	switch	.text
6065  0e5d               _ST_SPI_Send_16:
6067  0e5d 88            	push	a
6068  0e5e 88            	push	a
6069       00000001      OFST:	set	1
6072                     ; 1847 	temp = GPIOE->ODR;
6074  0e5f c65014        	ld	a,20500
6076                     ; 1848 	temp &= 0xDF;
6078  0e62 a4df          	and	a,#223
6079  0e64 6b01          	ld	(OFST+0,sp),a
6081                     ; 1849 	GPIOE->ODR=temp;
6083  0e66 c75014        	ld	20500,a
6084                     ; 1851 	SPI_SendData(commandByte);
6086  0e69 7b02          	ld	a,(OFST+1,sp)
6087  0e6b cd0000        	call	_SPI_SendData
6090  0e6e               L7552:
6091                     ; 1852 	while (!SPI_GetFlagStatus(SPI_FLAG_TXE));
6093  0e6e a602          	ld	a,#2
6094  0e70 cd0000        	call	_SPI_GetFlagStatus
6096  0e73 4d            	tnz	a
6097  0e74 27f8          	jreq	L7552
6099  0e76               L5652:
6100                     ; 1854 	while (!SPI_GetFlagStatus(SPI_FLAG_RXNE));
6102  0e76 a601          	ld	a,#1
6103  0e78 cd0000        	call	_SPI_GetFlagStatus
6105  0e7b 4d            	tnz	a
6106  0e7c 27f8          	jreq	L5652
6107                     ; 1855 	globalStatus[0] = SPI_ReceiveData();
6109  0e7e cd0000        	call	_SPI_ReceiveData
6111  0e81 1e07          	ldw	x,(OFST+6,sp)
6112  0e83 f7            	ld	(x),a
6113                     ; 1858 	if (globalStatus[0] != L99PM62_NoError)
6115  0e84 a120          	cp	a,#32
6116  0e86 2770          	jreq	L1752
6117                     ; 1860 			ErrorState = TRUE;
6119  0e88 35010000      	mov	_ErrorState,#1
6120                     ; 1861 			if (StartupCompleted==TRUE) /* To allow leds display at startup */
6122  0e8c c60000        	ld	a,_StartupCompleted
6123  0e8f 4a            	dec	a
6124  0e90 266a          	jrne	L3062
6125                     ; 1863 				count ++;
6127  0e92 725c0001      	inc	_count
6128                     ; 1864 				if (count>20)
6130  0e96 c60001        	ld	a,_count
6131  0e99 a115          	cp	a,#21
6132  0e9b 2508          	jrult	L5752
6133                     ; 1866 					GPIO_TOGGLE(GPIOA,GPIO_PIN_3);	
6135  0e9d 90165000      	bcpl	20480,#3
6136                     ; 1867 					count = 0;
6138  0ea1 725f0001      	clr	_count
6139  0ea5               L5752:
6140                     ; 1869 				switch(globalStatus[0])
6142  0ea5 f6            	ld	a,(x)
6144                     ; 1903 						break;			
6145  0ea6 a0a1          	sub	a,#161
6146  0ea8 2724          	jreq	L3152
6147  0eaa 4a            	dec	a
6148  0eab 272b          	jreq	L5152
6149  0ead 4a            	dec	a
6150  0eae 2728          	jreq	L5152
6151  0eb0 a005          	sub	a,#5
6152  0eb2 2732          	jreq	L7152
6153  0eb4 a011          	sub	a,#17
6154  0eb6 272e          	jreq	L7152
6155  0eb8 a007          	sub	a,#7
6156  0eba 2712          	jreq	L3152
6157                     ; 1898 					default:
6157                     ; 1899 					GPIO_LOW(GPIOD,GPIO_PIN_3);			
6159  0ebc 7217500f      	bres	20495,#3
6160                     ; 1900 					GPIO_LOW(GPIOD,GPIO_PIN_0);	
6162  0ec0 7211500f      	bres	20495,#0
6163                     ; 1901 					GPIO_LOW(GPIOE,GPIO_PIN_3);
6165  0ec4 72175014      	bres	20500,#3
6166                     ; 1902 					GPIO_HIGH(GPIOC,GPIO_PIN_3);				
6168  0ec8 7216500a      	bset	20490,#3
6169                     ; 1903 						break;			
6171  0ecc 202e          	jra	L3062
6172  0ece               L3152:
6173                     ; 1871 					case (L99PM62_CommError):
6173                     ; 1872 					case (L99PM62_WD_SPI_Error):
6173                     ; 1873 					/* LD4 ON Invalid clock count*/
6173                     ; 1874 					GPIO_HIGH(GPIOD,GPIO_PIN_3);
6175  0ece 7216500f      	bset	20495,#3
6176                     ; 1875 					GPIO_LOW(GPIOD,GPIO_PIN_0);	
6178  0ed2 7211500f      	bres	20495,#0
6179                     ; 1876 					GPIO_LOW(GPIOE,GPIO_PIN_3);	
6180                     ; 1877 					GPIO_LOW(GPIOC,GPIO_PIN_3);				
6181                     ; 1878 						break;
6183  0ed6 2008          	jp	LC009
6184  0ed8               L5152:
6185                     ; 1880 					case (L99PM62_VsOverVUnderV):
6185                     ; 1881 					case (L99PM62_VsOverVUnderVFS):
6185                     ; 1882 					/* LD5 ON Vs out of range */
6185                     ; 1883 					GPIO_LOW(GPIOD,GPIO_PIN_3);			
6187  0ed8 7217500f      	bres	20495,#3
6188                     ; 1884 					GPIO_HIGH(GPIOD,GPIO_PIN_0);	
6190  0edc 7210500f      	bset	20495,#0
6191                     ; 1885 					GPIO_LOW(GPIOE,GPIO_PIN_3);	
6193  0ee0               LC009:
6195  0ee0 72175014      	bres	20500,#3
6196                     ; 1886 					GPIO_LOW(GPIOC,GPIO_PIN_3);				
6197                     ; 1887 						break;
6199  0ee4 200c          	jp	LC008
6200  0ee6               L7152:
6201                     ; 1889 					case (L99PM62_TSD1):
6201                     ; 1890 					case (L99PM62_TSD2):
6201                     ; 1891 					/* LD7 ON Thermal shutdown */
6201                     ; 1892 					GPIO_LOW(GPIOD,GPIO_PIN_3);			
6203  0ee6 7217500f      	bres	20495,#3
6204                     ; 1893 					GPIO_LOW(GPIOD,GPIO_PIN_0);					
6206  0eea 7211500f      	bres	20495,#0
6207                     ; 1894 					GPIO_HIGH(GPIOE,GPIO_PIN_3);
6209  0eee 72165014      	bset	20500,#3
6210                     ; 1895 					GPIO_LOW(GPIOC,GPIO_PIN_3);
6212  0ef2               LC008:
6215  0ef2 7217500a      	bres	20490,#3
6216                     ; 1896 						break;
6218  0ef6 2004          	jra	L3062
6219  0ef8               L1752:
6220                     ; 1909 		ErrorState = FALSE;
6222  0ef8 725f0000      	clr	_ErrorState
6223  0efc               L3062:
6224                     ; 1912 	SPI_SendData(dataIn[1]);	
6226  0efc 1e05          	ldw	x,(OFST+4,sp)
6227  0efe e601          	ld	a,(1,x)
6228  0f00 cd0000        	call	_SPI_SendData
6231  0f03               L7062:
6232                     ; 1913 	while (!SPI_GetFlagStatus(SPI_FLAG_TXE));
6234  0f03 a602          	ld	a,#2
6235  0f05 cd0000        	call	_SPI_GetFlagStatus
6237  0f08 4d            	tnz	a
6238  0f09 27f8          	jreq	L7062
6240  0f0b               L5162:
6241                     ; 1915 	while (!SPI_GetFlagStatus(SPI_FLAG_RXNE));
6243  0f0b a601          	ld	a,#1
6244  0f0d cd0000        	call	_SPI_GetFlagStatus
6246  0f10 4d            	tnz	a
6247  0f11 27f8          	jreq	L5162
6248                     ; 1916 	dataOut[1] = SPI_ReceiveData();
6250  0f13 cd0000        	call	_SPI_ReceiveData
6252  0f16 1e09          	ldw	x,(OFST+8,sp)
6253  0f18 e701          	ld	(1,x),a
6254                     ; 1918 	SPI_SendData(dataIn[0]);	
6256  0f1a 1e05          	ldw	x,(OFST+4,sp)
6257  0f1c f6            	ld	a,(x)
6258  0f1d cd0000        	call	_SPI_SendData
6261  0f20               L3262:
6262                     ; 1919 	while (!SPI_GetFlagStatus(SPI_FLAG_TXE));
6264  0f20 a602          	ld	a,#2
6265  0f22 cd0000        	call	_SPI_GetFlagStatus
6267  0f25 4d            	tnz	a
6268  0f26 27f8          	jreq	L3262
6270  0f28               L1362:
6271                     ; 1921 	while (!SPI_GetFlagStatus(SPI_FLAG_RXNE));
6273  0f28 a601          	ld	a,#1
6274  0f2a cd0000        	call	_SPI_GetFlagStatus
6276  0f2d 4d            	tnz	a
6277  0f2e 27f8          	jreq	L1362
6278                     ; 1922 	dataOut[0] = SPI_ReceiveData();	
6280  0f30 cd0000        	call	_SPI_ReceiveData
6282  0f33 1e09          	ldw	x,(OFST+8,sp)
6283  0f35 f7            	ld	(x),a
6284                     ; 1925 	temp = GPIOE->ODR;
6286  0f36 c65014        	ld	a,20500
6288                     ; 1926 	temp |= 0x20;
6290  0f39 aa20          	or	a,#32
6292                     ; 1927 	GPIOE->ODR=(uint8_t)temp;
6294  0f3b c75014        	ld	20500,a
6295                     ; 1928 }
6298  0f3e 85            	popw	x
6299  0f3f 81            	ret	
6339                     ; 1941 void L99PM62drv_SetCanLoopBackMode (L99PM62drv_EnableType CanLoop)
6339                     ; 1942 {
6340                     	switch	.text
6341  0f40               _L99PM62drv_SetCanLoopBackMode:
6345                     ; 1944 	if (CanLoop ==  L99PM62DRV_DISABLE){
6347  0f40 4d            	tnz	a
6348  0f41 2606          	jrne	L3562
6349                     ; 1945 		CtrlReg4[0] &= (u8)~0x08U;		
6351  0f43 72170016      	bres	L71_CtrlReg4,#3
6353  0f47 2004          	jra	L5562
6354  0f49               L3562:
6355                     ; 1947 		CtrlReg4[0] |= 0x08U;		
6357  0f49 72160016      	bset	L71_CtrlReg4,#3
6358  0f4d               L5562:
6359                     ; 1950 	L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR4,
6359                     ; 1951 									CtrlReg4, 
6359                     ; 1952 									&GlobalStatusRegister,
6359                     ; 1953 									CtrlReg4_old);	
6361  0f4d ae0014        	ldw	x,#L12_CtrlReg4_old
6362  0f50 89            	pushw	x
6363  0f51 ae0001        	ldw	x,#L54_GlobalStatusRegister
6364  0f54 89            	pushw	x
6365  0f55 ae0016        	ldw	x,#L71_CtrlReg4
6366  0f58 89            	pushw	x
6367  0f59 a604          	ld	a,#4
6368  0f5b cd0e5d        	call	_ST_SPI_Send_16
6370  0f5e 5b06          	addw	sp,#6
6371                     ; 1955 }
6374  0f60 81            	ret	
6414                     ; 1967 void L99PM62drv_SetCanPatternWakeUp (L99PM62drv_EnableType CanPattern)
6414                     ; 1968 {
6415                     	switch	.text
6416  0f61               _L99PM62drv_SetCanPatternWakeUp:
6420                     ; 1970 	if (CanPattern ==  L99PM62DRV_DISABLE){
6422  0f61 4d            	tnz	a
6423  0f62 2606          	jrne	L5762
6424                     ; 1971 		CtrlReg4[0] &= (u8)~0x04U;		
6426  0f64 72150016      	bres	L71_CtrlReg4,#2
6428  0f68 2004          	jra	L7762
6429  0f6a               L5762:
6430                     ; 1973 		CtrlReg4[0] |= 0x04U;		
6432  0f6a 72140016      	bset	L71_CtrlReg4,#2
6433  0f6e               L7762:
6434                     ; 1976 	L99PM62DRV_AL_SPI_WR(	L99PM62DRV_ST_SPI_WRITE |L99PM62DRV_CR4,
6434                     ; 1977 									CtrlReg4, 
6434                     ; 1978 									&GlobalStatusRegister,
6434                     ; 1979 									CtrlReg4_old);	
6436  0f6e ae0014        	ldw	x,#L12_CtrlReg4_old
6437  0f71 89            	pushw	x
6438  0f72 ae0001        	ldw	x,#L54_GlobalStatusRegister
6439  0f75 89            	pushw	x
6440  0f76 ae0016        	ldw	x,#L71_CtrlReg4
6441  0f79 89            	pushw	x
6442  0f7a a604          	ld	a,#4
6443  0f7c cd0e5d        	call	_ST_SPI_Send_16
6445  0f7f 5b06          	addw	sp,#6
6446                     ; 1981 }
6449  0f81 81            	ret	
6666                     	xref	_StartupCompleted
6667                     	switch	.bss
6668  0000               _ErrorState:
6669  0000 00            	ds.b	1
6670                     	xdef	_ErrorState
6671                     	xdef	_count
6672  0001               L54_GlobalStatusRegister:
6673  0001 00            	ds.b	1
6674  0002               L34_ConfigReg_old:
6675  0002 0000          	ds.b	2
6676  0004               L14_ConfigReg:
6677  0004 0000          	ds.b	2
6678  0006               L73_StatReg3:
6679  0006 0000          	ds.b	2
6680  0008               L53_StatReg2:
6681  0008 0000          	ds.b	2
6682  000a               L33_StatReg1:
6683  000a 0000          	ds.b	2
6684  000c               L13_CtrlReg6_old:
6685  000c 0000          	ds.b	2
6686  000e               L72_CtrlReg6:
6687  000e 0000          	ds.b	2
6688  0010               L52_CtrlReg5_old:
6689  0010 0000          	ds.b	2
6690  0012               L32_CtrlReg5:
6691  0012 0000          	ds.b	2
6692  0014               L12_CtrlReg4_old:
6693  0014 0000          	ds.b	2
6694  0016               L71_CtrlReg4:
6695  0016 0000          	ds.b	2
6696  0018               L51_CtrlReg3_old:
6697  0018 0000          	ds.b	2
6698  001a               L31_CtrlReg3:
6699  001a 0000          	ds.b	2
6700  001c               L11_CtrlReg2_old:
6701  001c 0000          	ds.b	2
6702  001e               L7_CtrlReg2:
6703  001e 0000          	ds.b	2
6704  0020               L5_CtrlReg1_old:
6705  0020 0000          	ds.b	2
6706  0022               L3_CtrlReg1:
6707  0022 0000          	ds.b	2
6708                     	xdef	_L99PM62drv_SetCanPatternWakeUp
6709                     	xdef	_L99PM62drv_SetCanLoopBackMode
6710                     	xdef	_ST_SPI_Send_16
6711                     	xdef	_L99PM62drv_ClearStatusRegisters
6712                     	xdef	_L99PM62drv_WriteControl
6713                     	xdef	_L99PM62drv_GetControl
6714                     	xdef	_L99PM62drv_ReadControl
6715                     	xdef	_L99PM62drv_ReadClearStatus
6716                     	xdef	_L99PM62drv_ReadStatus
6717                     	xdef	_L99PM62drv_GetGlobalStatusRegister
6718                     	xdef	_L99PM62drv_SetCanStandbyMode
6719                     	xdef	_L99PM62drv_EnableBusWakeUp
6720                     	xdef	_L99PM62drv_SetCyclicWakeUp
6721                     	xdef	_L99PM62drv_SetWDTiming
6722                     	xdef	_L99PM62drv_SetPWMDutyCycle
6723                     	xdef	_L99PM62drv_SetPWMFrequ
6724                     	xdef	_L99PM62drv_SetVReg1CurrentMonitorMode
6725                     	xdef	_L99PM62drv_SetRelayShutdownMode
6726                     	xdef	_L99PM62drv_SetVsLockoutMode
6727                     	xdef	_L99PM62drv_LinSetup
6728                     	xdef	_L99PM62drv_SetInputFilterMode
6729                     	xdef	_L99PM62drv_SetResetThresholdLevel
6730                     	xdef	_L99PM62drv_EnableWakeupSource
6731                     	xdef	_L99PM62drv_SetWUInputMode
6732                     	xdef	_L99PM62drv_SetTimer2
6733                     	xdef	_L99PM62drv_SetTimer1
6734                     	xdef	_L99PM62drv_SetVoltageReg2Mode
6735                     	xdef	_L99PM62drv_SetRelayOutput
6736                     	xdef	_L99PM62drv_SetOutHSAutorecovery
6737                     	xdef	_L99PM62drv_SetOutHSMode
6738                     	xdef	_L99PM62drv_SetOut4Mode
6739                     	xdef	_L99PM62drv_SetOut3Mode
6740                     	xdef	_L99PM62drv_SetOut2Mode
6741                     	xdef	_L99PM62drv_SetOut1Mode
6742                     	xdef	_L99PM62drv_SetStandbyMode
6743                     	xdef	_L99PM62drv_WdgTrigger
6744                     	xdef	_L99PM62drv_Init
6745                     	xdef	_L99PM62drv_ReportError
6746                     	xref	_SPI_GetFlagStatus
6747                     	xref	_SPI_ReceiveData
6748                     	xref	_SPI_SendData
6768                     	end
