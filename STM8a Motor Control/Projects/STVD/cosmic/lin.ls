   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  19                     	switch	.data
  20  0000               L3_DataToSend:
  21  0000 00            	dc.b	0
  22  0001 00            	dc.b	0
  23  0002 00            	dc.b	0
  24  0003 00            	dc.b	0
  25  0004 00            	dc.b	0
  26  0005 00            	dc.b	0
  27  0006 00            	dc.b	0
  28  0007 00            	dc.b	0
  29  0008 00            	dc.b	0
  30  0009               L5_DataBuffer:
  31  0009 00            	dc.b	0
  32  000a 000000000000  	ds.b	31
  33  0029               L7_LINChecksumBuffer:
  34  0029 00            	dc.b	0
  35  002a 000000000000  	ds.b	9
  36  0033               L11_LINScheduleTableNumberOfFrame:
  37  0033 04            	dc.b	4
  38  0034               L31_ScheduleTableIndex:
  39  0034 ff            	dc.b	255
  40  0035               L51_ResponseDataByteIndex:
  41  0035 00            	dc.b	0
  42  0036               L71_ScheduleTableTick:
  43  0036 00            	dc.b	0
  44  0037               L52_DataCheck:
  45  0037 00            	dc.b	0
  46  0038               L13_ChecksumError:
  47  0038 00            	dc.b	0
  48  0039               L33_Index:
  49  0039 00            	dc.b	0
  50  003a               L53_LINTick:
  51  003a 00            	dc.b	0
  52  003b               _DataReceived:
  53  003b 00            	dc.b	0
  54  003c               _HeaderReceived:
  55  003c 00            	dc.b	0
  56  003d               _BreakReceived:
  57  003d 00            	dc.b	0
  58  003e               _IdentifierParityError:
  59  003e 00            	dc.b	0
  60  003f               _LINReceptionTimeoutValue:
  61  003f 00            	dc.b	0
  62  0040               _LINReceptionTimeout:
  63  0040 00            	dc.b	0
  64  0041               _LINSlave:
  65  0041 00            	dc.b	0
  66  0042               _UART3_SR_Buf:
  67  0042 00            	dc.b	0
  68  0043               _UART3Data:
  69  0043 00            	dc.b	0
  70  0044               _ReceptionError:
  71  0044 00            	dc.b	0
 106                     ; 137 void LIN_MasterConfig(void)
 106                     ; 138 {
 108                     	switch	.text
 109  0000               _LIN_MasterConfig:
 113                     ; 140     UART3_DeInit();
 115  0000 cd0000        	call	_UART3_DeInit
 117                     ; 143  	UART3_Init((uint32_t)19200, UART3_WORDLENGTH_8D, UART3_STOPBITS_1, UART3_PARITY_NO,
 117                     ; 144                 UART3_MODE_TXRX_ENABLE);
 119  0003 4b0c          	push	#12
 120  0005 4b00          	push	#0
 121  0007 4b00          	push	#0
 122  0009 4b00          	push	#0
 123  000b ae4b00        	ldw	x,#19200
 124  000e 89            	pushw	x
 125  000f 5f            	clrw	x
 126  0010 89            	pushw	x
 127  0011 cd0000        	call	_UART3_Init
 129  0014 5b08          	addw	sp,#8
 130                     ; 146 	UART3_LINConfig(UART3_LIN_MODE_MASTER, UART3_LIN_AUTOSYNC_DISABLE, 
 130                     ; 147                      UART3_LIN_DIVUP_LBRR1);
 132  0016 4b00          	push	#0
 133  0018 5f            	clrw	x
 134  0019 cd0000        	call	_UART3_LINConfig
 136  001c 84            	pop	a
 137                     ; 149 	UART3_LINBreakDetectionConfig(UART3_LINBREAKDETECTIONLENGTH_11BITS);
 139  001d a601          	ld	a,#1
 140  001f cd0000        	call	_UART3_LINBreakDetectionConfig
 142                     ; 151 	UART3_LINCmd(ENABLE); /* Enable LIN mode */
 144  0022 a601          	ld	a,#1
 145  0024 cd0000        	call	_UART3_LINCmd
 147                     ; 154     UART3_ITConfig(UART3_IT_RXNE_OR, ENABLE);
 149  0027 4b01          	push	#1
 150  0029 ae0205        	ldw	x,#517
 151  002c cd0000        	call	_UART3_ITConfig
 153  002f 84            	pop	a
 154                     ; 155 	UART3_ITConfig(UART3_IT_LBDF, DISABLE);
 156  0030 4b00          	push	#0
 157  0032 ae0346        	ldw	x,#838
 158  0035 cd0000        	call	_UART3_ITConfig
 160  0038 84            	pop	a
 161                     ; 156 }
 164  0039 81            	ret	
 188                     ; 164 void InitScheduleTable(void)
 188                     ; 165 {
 189                     	switch	.text
 190  003a               _InitScheduleTable:
 194                     ; 166 	LINScheduleTable[0].LINScheduleTableFrame.LINFrameIdentifier=MS0ID;
 196  003a 35c10013      	mov	_LINScheduleTable,#193
 197                     ; 167 	LINScheduleTable[0].LINScheduleTableFrame.LINFrameDirection=TRANSMIT;
 199  003e 35010014      	mov	_LINScheduleTable+1,#1
 200                     ; 168 	LINScheduleTable[0].LINScheduleTableFrame.LINFrameDataLength=8;  
 202  0042 35080015      	mov	_LINScheduleTable+2,#8
 203                     ; 169 	LINScheduleTable[0].LINScheduleTableFrame.LINFrameBuffer[0]=0;
 205  0046 725f0016      	clr	_LINScheduleTable+3
 206                     ; 170 	LINScheduleTable[0].LINScheduleTableFrame.LINFrameBuffer[1]=0;
 208  004a 725f0017      	clr	_LINScheduleTable+4
 209                     ; 171 	LINScheduleTable[0].LINScheduleTableFrame.LINFrameBuffer[2]=0;
 211  004e 725f0018      	clr	_LINScheduleTable+5
 212                     ; 172 	LINScheduleTable[0].LINScheduleTableFrame.LINFrameBuffer[3]=0;
 214  0052 725f0019      	clr	_LINScheduleTable+6
 215                     ; 173 	LINScheduleTable[0].LINScheduleTableFrame.LINFrameBuffer[4]=0;
 217  0056 725f001a      	clr	_LINScheduleTable+7
 218                     ; 174 	LINScheduleTable[0].LINScheduleTableFrame.LINFrameBuffer[5]=0;
 220  005a 725f001b      	clr	_LINScheduleTable+8
 221                     ; 175 	LINScheduleTable[0].LINScheduleTableFrame.LINFrameBuffer[6]=0;
 223  005e 725f001c      	clr	_LINScheduleTable+9
 224                     ; 176 	LINScheduleTable[0].LINScheduleTableFrame.LINFrameBuffer[7]=0;
 226  0062 725f001d      	clr	_LINScheduleTable+10
 227                     ; 178 	LINScheduleTable[1].LINScheduleTableFrame.LINFrameIdentifier=MS2ID;
 229  0066 35030020      	mov	_LINScheduleTable+13,#3
 230                     ; 179 	LINScheduleTable[1].LINScheduleTableFrame.LINFrameDirection=RECEIVE;
 232  006a 725f0021      	clr	_LINScheduleTable+14
 233                     ; 180 	LINScheduleTable[1].LINScheduleTableFrame.LINFrameDataLength=8;  
 235  006e 35080022      	mov	_LINScheduleTable+15,#8
 236                     ; 182 	LINScheduleTable[2].LINScheduleTableFrame.LINFrameIdentifier=SM1ID;
 238  0072 3542002d      	mov	_LINScheduleTable+26,#66
 239                     ; 183 	LINScheduleTable[2].LINScheduleTableFrame.LINFrameDirection=TRANSMIT;
 241  0076 3501002e      	mov	_LINScheduleTable+27,#1
 242                     ; 184 	LINScheduleTable[2].LINScheduleTableFrame.LINFrameDataLength=4;  
 244  007a 3504002f      	mov	_LINScheduleTable+28,#4
 245                     ; 185 	LINScheduleTable[2].LINScheduleTableFrame.LINFrameBuffer[0]=0;
 247  007e 725f0030      	clr	_LINScheduleTable+29
 248                     ; 186 	LINScheduleTable[2].LINScheduleTableFrame.LINFrameBuffer[1]=0;
 250  0082 725f0031      	clr	_LINScheduleTable+30
 251                     ; 187 	LINScheduleTable[2].LINScheduleTableFrame.LINFrameBuffer[2]=0;
 253  0086 725f0032      	clr	_LINScheduleTable+31
 254                     ; 188 	LINScheduleTable[2].LINScheduleTableFrame.LINFrameBuffer[3]=0;
 256  008a 725f0033      	clr	_LINScheduleTable+32
 257                     ; 190 	LINScheduleTable[3].LINScheduleTableFrame.LINFrameIdentifier=SM3ID;
 259  008e 35c4003a      	mov	_LINScheduleTable+39,#196
 260                     ; 191 	LINScheduleTable[3].LINScheduleTableFrame.LINFrameDirection=RECEIVE;
 262  0092 725f003b      	clr	_LINScheduleTable+40
 263                     ; 192 	LINScheduleTable[3].LINScheduleTableFrame.LINFrameDataLength=4;  
 265  0096 3504003c      	mov	_LINScheduleTable+41,#4
 266                     ; 194 	LINScheduleTable[0].LINScheduleTableFrameDelay = DELAY_10MS;
 268  009a 350a001f      	mov	_LINScheduleTable+12,#10
 269                     ; 195 	LINScheduleTable[1].LINScheduleTableFrameDelay = DELAY_10MS;
 271  009e 350a002c      	mov	_LINScheduleTable+25,#10
 272                     ; 196 	LINScheduleTable[2].LINScheduleTableFrameDelay = DELAY_10MS;
 274  00a2 350a0039      	mov	_LINScheduleTable+38,#10
 275                     ; 197 	LINScheduleTable[3].LINScheduleTableFrameDelay = DELAY_20MS;
 277  00a6 35140046      	mov	_LINScheduleTable+51,#20
 278                     ; 198 }
 281  00aa 81            	ret	
 310                     ; 206 void LIN_SlaveConfig(void)
 310                     ; 207 {
 311                     	switch	.text
 312  00ab               _LIN_SlaveConfig:
 316                     ; 209     UART3_DeInit();
 318  00ab cd0000        	call	_UART3_DeInit
 320                     ; 212  	UART3_Init((uint32_t)19200, UART3_WORDLENGTH_8D, UART3_STOPBITS_1, UART3_PARITY_NO,
 320                     ; 213                 UART3_MODE_TXRX_ENABLE);
 322  00ae 4b0c          	push	#12
 323  00b0 4b00          	push	#0
 324  00b2 4b00          	push	#0
 325  00b4 4b00          	push	#0
 326  00b6 ae4b00        	ldw	x,#19200
 327  00b9 89            	pushw	x
 328  00ba 5f            	clrw	x
 329  00bb 89            	pushw	x
 330  00bc cd0000        	call	_UART3_Init
 332  00bf 5b08          	addw	sp,#8
 333                     ; 215 	UART3_LINBreakDetectionConfig(UART3_LINBREAKDETECTIONLENGTH_11BITS);
 335  00c1 a601          	ld	a,#1
 336  00c3 cd0000        	call	_UART3_LINBreakDetectionConfig
 338                     ; 218 	UART3_LINConfig(UART3_LIN_MODE_SLAVE, UART3_LIN_AUTOSYNC_ENABLE, 
 338                     ; 219                      UART3_LIN_DIVUP_NEXTRXNE);
 340  00c6 4b01          	push	#1
 341  00c8 ae0101        	ldw	x,#257
 342  00cb cd0000        	call	_UART3_LINConfig
 344  00ce 84            	pop	a
 345                     ; 225 	UART3_LINCmd(ENABLE); /* Enable LIN mode */
 347  00cf a601          	ld	a,#1
 348  00d1 cd0000        	call	_UART3_LINCmd
 350                     ; 228     UART3_ITConfig(UART3_IT_RXNE_OR, ENABLE);
 352  00d4 4b01          	push	#1
 353  00d6 ae0205        	ldw	x,#517
 354  00d9 cd0000        	call	_UART3_ITConfig
 356  00dc 84            	pop	a
 357                     ; 229 }
 360  00dd 81            	ret	
 442                     ; 237 void LIN_Task(void)
 442                     ; 238 {
 443                     	switch	.text
 444  00de               _LIN_Task:
 446  00de 5205          	subw	sp,#5
 447       00000005      OFST:	set	5
 450                     ; 241   if (LINSlave==FALSE)
 452  00e0 c60041        	ld	a,_LINSlave
 453  00e3 2703cc02da    	jrne	L571
 454                     ; 248 	if (ErrorState) LIN_FSM = Idle;
 456  00e8 725d0000      	tnz	_ErrorState
 457  00ec 2703          	jreq	L771
 460  00ee c70047        	ld	_LIN_FSM,a
 461  00f1               L771:
 462                     ; 250 	if (TestLINTimebaseTick())
 464  00f1 cd069e        	call	L15_TestLINTimebaseTick
 466  00f4 4d            	tnz	a
 467  00f5 2707          	jreq	L102
 468                     ; 252 	ClearLINTimebaseTick();
 470  00f7 cd0699        	call	L35_ClearLINTimebaseTick
 472                     ; 253 	IncrementScheduleTableTick();		
 474  00fa 725c0036      	inc	L71_ScheduleTableTick
 476  00fe               L102:
 477                     ; 256 	if (LINReceptionTimeoutElapsed())
 479  00fe cd0669        	call	L74_LINReceptionTimeoutElapsed
 481  0101 4d            	tnz	a
 482  0102 2707          	jreq	L302
 483                     ; 258 	StopLINReceptionTimeout();
 485  0104 cd0660        	call	L54_StopLINReceptionTimeout
 487                     ; 259 	LIN_FSM = Idle;
 489  0107 725f0047      	clr	_LIN_FSM
 490  010b               L302:
 491                     ; 262 	switch ( (LIN_FSM_state)LIN_FSM )
 493  010b c60047        	ld	a,_LIN_FSM
 495                     ; 415 		default:
 495                     ; 416 			break;
 496  010e 271e          	jreq	L511
 497  0110 4a            	dec	a
 498  0111 2749          	jreq	L711
 499  0113 4a            	dec	a
 500  0114 2603cc0198    	jreq	L121
 501  0119 4a            	dec	a
 502  011a 2603cc01b0    	jreq	L321
 503  011f 4a            	dec	a
 504  0120 2603cc01f2    	jreq	L521
 505  0125 4a            	dec	a
 506  0126 2603cc0257    	jreq	L721
 507  012b cc030a        	jra	L772
 508  012e               L511:
 509                     ; 268 	case Idle:
 509                     ; 269 
 509                     ; 270 	  if ( ScheduleTableTick >= LINScheduleTable[ScheduleTableIndex].LINScheduleTableFrameDelay )
 511  012e c60034        	ld	a,L31_ScheduleTableIndex
 512  0131 97            	ld	xl,a
 513  0132 a60d          	ld	a,#13
 514  0134 42            	mul	x,a
 515  0135 d6001f        	ld	a,(_LINScheduleTable+12,x)
 516  0138 c10036        	cp	a,L71_ScheduleTableTick
 517  013b 22ee          	jrugt	L772
 518                     ; 273 		ClearScheduleTableTick();
 521  013d 725f0036      	clr	L71_ScheduleTableTick
 522                     ; 274 		ResponseDataByteIndex=0;
 525  0141 725f0035      	clr	L51_ResponseDataByteIndex
 526                     ; 275 		ScheduleTableIndex++;
 528  0145 725c0034      	inc	L31_ScheduleTableIndex
 529                     ; 276 		if (ScheduleTableIndex>=LINScheduleTableNumberOfFrame) ScheduleTableIndex=0;
 531  0149 c60034        	ld	a,L31_ScheduleTableIndex
 532  014c c10033        	cp	a,L11_LINScheduleTableNumberOfFrame
 533  014f 2504          	jrult	L312
 536  0151 725f0034      	clr	L31_ScheduleTableIndex
 537  0155               L312:
 538                     ; 277 		LIN_FSM = Break;
 540  0155 35010047      	mov	_LIN_FSM,#1
 542  0159 cc030a        	jra	L772
 543  015c               L711:
 544                     ; 285 	case Break:
 544                     ; 286 
 544                     ; 287 	UART3_BDIE(); 
 546  015c cd05ee        	call	_UART3_BDIE
 548                     ; 288 	  UART3_SendBreak();
 550  015f cd0000        	call	_UART3_SendBreak
 552                     ; 291 			for (Index=0;Index<LINScheduleTable[ScheduleTableIndex].LINScheduleTableFrame.LINFrameDataLength;Index++)
 554  0162 0f05          	clr	(OFST+0,sp)
 557  0164 201d          	jra	L122
 558  0166               L512:
 559                     ; 293 				LINTransmitBuffer[Index]=LINScheduleTable[ScheduleTableIndex].LINScheduleTableFrame.LINFrameBuffer[ScheduleTableIndex];
 561  0166 7b05          	ld	a,(OFST+0,sp)
 562  0168 5f            	clrw	x
 563  0169 97            	ld	xl,a
 564  016a 89            	pushw	x
 565  016b c60034        	ld	a,L31_ScheduleTableIndex
 566  016e 97            	ld	xl,a
 567  016f a60d          	ld	a,#13
 568  0171 42            	mul	x,a
 569  0172 01            	rrwa	x,a
 570  0173 cb0034        	add	a,L31_ScheduleTableIndex
 571  0176 2401          	jrnc	L26
 572  0178 5c            	incw	x
 573  0179               L26:
 574  0179 02            	rlwa	x,a
 575  017a d60016        	ld	a,(_LINScheduleTable+3,x)
 576  017d 85            	popw	x
 577  017e d7000a        	ld	(L12_LINTransmitBuffer,x),a
 578                     ; 291 			for (Index=0;Index<LINScheduleTable[ScheduleTableIndex].LINScheduleTableFrame.LINFrameDataLength;Index++)
 580  0181 0c05          	inc	(OFST+0,sp)
 582  0183               L122:
 585  0183 c60034        	ld	a,L31_ScheduleTableIndex
 586  0186 97            	ld	xl,a
 587  0187 a60d          	ld	a,#13
 588  0189 42            	mul	x,a
 589  018a d60015        	ld	a,(_LINScheduleTable+2,x)
 590  018d 1105          	cp	a,(OFST+0,sp)
 591  018f 22d5          	jrugt	L512
 592                     ; 296 		LIN_FSM = SynchField;	
 594  0191 35020047      	mov	_LIN_FSM,#2
 595                     ; 297 	  break;
 597  0195 cc030a        	jra	L772
 598  0198               L121:
 599                     ; 302 	case SynchField:			
 599                     ; 303 
 599                     ; 304 	if (BreakReceived)
 601  0198 725d003d      	tnz	_BreakReceived
 602  019c 27f7          	jreq	L772
 603                     ; 306 			BreakReceived=0;
 605  019e c7003d        	ld	_BreakReceived,a
 606                     ; 307 			UART3_RIE();
 608  01a1 cd05db        	call	L14_UART3_RIE
 610                     ; 308 			UART3_SendData8(0x55);
 612  01a4 a655          	ld	a,#85
 613  01a6 cd0000        	call	_UART3_SendData8
 615                     ; 309 			DataCheck=0x55; // this could be done in UART3_SendData8 funtion
 617  01a9 35550037      	mov	L52_DataCheck,#85
 618                     ; 310 			LIN_FSM = Identifier;					
 619  01ad cc03e5        	jp	LC002
 620  01b0               L321:
 621                     ; 317 	case Identifier:
 621                     ; 318 				
 621                     ; 319 		if (DataReceived)
 623  01b0 725d003b      	tnz	_DataReceived
 624  01b4 27df          	jreq	L772
 625                     ; 321 			DataReceived=0;
 627  01b6 c7003b        	ld	_DataReceived,a
 628                     ; 322 			if (UART3Data==DataCheck)
 630  01b9 c60043        	ld	a,_UART3Data
 631  01bc c10037        	cp	a,L52_DataCheck
 632  01bf 26d4          	jrne	L772
 633                     ; 324 				DataCheck=LINScheduleTable[ScheduleTableIndex].LINScheduleTableFrame.LINFrameIdentifier;
 635  01c1 c60034        	ld	a,L31_ScheduleTableIndex
 636  01c4 97            	ld	xl,a
 637  01c5 a60d          	ld	a,#13
 638  01c7 42            	mul	x,a
 639  01c8 d60013        	ld	a,(_LINScheduleTable,x)
 640  01cb c70037        	ld	L52_DataCheck,a
 641                     ; 325 				LINChecksumBuffer[0]=DataCheck;
 643  01ce c70029        	ld	L7_LINChecksumBuffer,a
 644                     ; 326 				UART3_SendData8(DataCheck);
 646  01d1 cd0000        	call	_UART3_SendData8
 648                     ; 328 				if (LINScheduleTable[ScheduleTableIndex].LINScheduleTableFrame.LINFrameDirection==TRANSMIT)
 650  01d4 c60034        	ld	a,L31_ScheduleTableIndex
 651  01d7 97            	ld	xl,a
 652  01d8 a60d          	ld	a,#13
 653  01da 42            	mul	x,a
 654  01db d60014        	ld	a,(_LINScheduleTable+1,x)
 655  01de 4a            	dec	a
 656  01df 2607          	jrne	L332
 657                     ; 330 					LIN_FSM = DataTransmission;
 659  01e1 35040047      	mov	_LIN_FSM,#4
 661  01e5 cc030a        	jra	L772
 662  01e8               L332:
 663                     ; 334 					LIN_FSM = DataReception;
 665  01e8 35050047      	mov	_LIN_FSM,#5
 666                     ; 335 					StartLINReceptionTimeout();
 668  01ec cd0657        	call	L34_StartLINReceptionTimeout
 670  01ef cc030a        	jra	L772
 671  01f2               L521:
 672                     ; 348 	case DataTransmission:
 672                     ; 349 				
 672                     ; 350 		if (DataReceived)
 674  01f2 725d003b      	tnz	_DataReceived
 675  01f6 27f7          	jreq	L772
 676                     ; 352 			DataReceived=0;
 678  01f8 c7003b        	ld	_DataReceived,a
 679                     ; 353 			if (UART3Data==DataCheck)
 681  01fb c60043        	ld	a,_UART3Data
 682  01fe c10037        	cp	a,L52_DataCheck
 683  0201 26ec          	jrne	L772
 684                     ; 355 				if (ResponseDataByteIndex<LINScheduleTable[ScheduleTableIndex].LINScheduleTableFrame.LINFrameDataLength)
 686  0203 c60034        	ld	a,L31_ScheduleTableIndex
 687  0206 97            	ld	xl,a
 688  0207 a60d          	ld	a,#13
 689  0209 42            	mul	x,a
 690  020a d60015        	ld	a,(_LINScheduleTable+2,x)
 691  020d c10035        	cp	a,L51_ResponseDataByteIndex
 692  0210 2323          	jrule	L542
 693                     ; 357 					DataCheck = LINScheduleTable[ScheduleTableIndex].LINScheduleTableFrame.LINFrameBuffer[ResponseDataByteIndex];
 695  0212 01            	rrwa	x,a
 696  0213 cb0035        	add	a,L51_ResponseDataByteIndex
 697  0216 2401          	jrnc	L47
 698  0218 5c            	incw	x
 699  0219               L47:
 700  0219 02            	rlwa	x,a
 701  021a d60016        	ld	a,(_LINScheduleTable+3,x)
 702  021d c70037        	ld	L52_DataCheck,a
 703                     ; 358 					LINChecksumBuffer[ResponseDataByteIndex+1]=DataCheck;
 705  0220 5f            	clrw	x
 706  0221 c60035        	ld	a,L51_ResponseDataByteIndex
 707  0224 97            	ld	xl,a
 708  0225 c60037        	ld	a,L52_DataCheck
 709  0228 d7002a        	ld	(L7_LINChecksumBuffer+1,x),a
 710                     ; 359 					UART3_SendData8(DataCheck);
 712  022b cd0000        	call	_UART3_SendData8
 714                     ; 360 					ResponseDataByteIndex++;
 716  022e 725c0035      	inc	L51_ResponseDataByteIndex
 718  0232 cc030a        	jra	L772
 719  0235               L542:
 720                     ; 362 				else if (ResponseDataByteIndex==LINScheduleTable[ScheduleTableIndex].LINScheduleTableFrame.LINFrameDataLength)
 722  0235 c10035        	cp	a,L51_ResponseDataByteIndex
 723  0238 2703cc0572    	jrne	LC001
 724                     ; 364 					DataCheck=LINChecksum(LINChecksumBuffer,ResponseDataByteIndex+1);					
 726  023d c60035        	ld	a,L51_ResponseDataByteIndex
 727  0240 4c            	inc	a
 728  0241 88            	push	a
 729  0242 ae0029        	ldw	x,#L7_LINChecksumBuffer
 730  0245 cd059c        	call	L73_LINChecksum
 732  0248 5b01          	addw	sp,#1
 733  024a c70037        	ld	L52_DataCheck,a
 734                     ; 365 					UART3_SendData8(DataCheck);
 736  024d cd0000        	call	_UART3_SendData8
 738                     ; 366 					ResponseDataByteIndex++;						
 740  0250 725c0035      	inc	L51_ResponseDataByteIndex
 742  0254 cc030a        	jra	L772
 743                     ; 370 					LIN_FSM = Idle;		
 744  0257               L721:
 745                     ; 383 	case DataReception:
 745                     ; 384 		
 745                     ; 385 		if (DataReceived)
 747  0257 725d003b      	tnz	_DataReceived
 748  025b 27f7          	jreq	L772
 749                     ; 387 					DataReceived=0;					
 751  025d c7003b        	ld	_DataReceived,a
 752                     ; 389 						if(ResponseDataByteIndex<LINScheduleTable[ScheduleTableIndex].LINScheduleTableFrame.LINFrameDataLength)
 754  0260 c60034        	ld	a,L31_ScheduleTableIndex
 755  0263 97            	ld	xl,a
 756  0264 a60d          	ld	a,#13
 757  0266 42            	mul	x,a
 758  0267 d60015        	ld	a,(_LINScheduleTable+2,x)
 759  026a c10035        	cp	a,L51_ResponseDataByteIndex
 760  026d 231f          	jrule	L162
 761                     ; 391 							StartLINReceptionTimeout();							
 763  026f cd0657        	call	L34_StartLINReceptionTimeout
 765                     ; 392 							LINReceiveBuffer[ResponseDataByteIndex] = UART3Data;
 767  0272 c60035        	ld	a,L51_ResponseDataByteIndex
 768  0275 5f            	clrw	x
 769  0276 97            	ld	xl,a
 770  0277 c60043        	ld	a,_UART3Data
 771  027a d70001        	ld	(L32_LINReceiveBuffer,x),a
 772                     ; 393 							LINChecksumBuffer[ResponseDataByteIndex+1] = UART3Data;
 774  027d 5f            	clrw	x
 775  027e c60035        	ld	a,L51_ResponseDataByteIndex
 776  0281 97            	ld	xl,a
 777  0282 c60043        	ld	a,_UART3Data
 778  0285 d7002a        	ld	(L7_LINChecksumBuffer+1,x),a
 779                     ; 394 							ResponseDataByteIndex++;
 781  0288 725c0035      	inc	L51_ResponseDataByteIndex
 783  028c 207c          	jra	L772
 784  028e               L162:
 785                     ; 398 							StopLINReceptionTimeout();
 787  028e cd0660        	call	L54_StopLINReceptionTimeout
 789                     ; 399 							if(!ErrorState) GPIO_WriteLow(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3); /* LD3 red LED OFF */
 791  0291 c60000        	ld	a,_ErrorState
 792  0294 2609          	jrne	L562
 795  0296 4b08          	push	#8
 796  0298 ae5000        	ldw	x,#20480
 797  029b cd0000        	call	_GPIO_WriteLow
 799  029e 84            	pop	a
 800  029f               L562:
 801                     ; 400 							LINChecksum(LINChecksumBuffer,ResponseDataByteIndex+1);
 803  029f c60035        	ld	a,L51_ResponseDataByteIndex
 804  02a2 4c            	inc	a
 805  02a3 88            	push	a
 806  02a4 ae0029        	ldw	x,#L7_LINChecksumBuffer
 807  02a7 cd059c        	call	L73_LINChecksum
 809  02aa 84            	pop	a
 810                     ; 402 								for (Index=0;Index<ResponseDataByteIndex;Index++)
 812  02ab 0f05          	clr	(OFST+0,sp)
 815  02ad 201d          	jra	L372
 816  02af               L762:
 817                     ; 404 									LINScheduleTable[ScheduleTableIndex].LINScheduleTableFrame.LINFrameBuffer[Index]=LINReceiveBuffer[Index+1];
 819  02af c60034        	ld	a,L31_ScheduleTableIndex
 820  02b2 97            	ld	xl,a
 821  02b3 a60d          	ld	a,#13
 822  02b5 42            	mul	x,a
 823  02b6 01            	rrwa	x,a
 824  02b7 1b05          	add	a,(OFST+0,sp)
 825  02b9 2401          	jrnc	L411
 826  02bb 5c            	incw	x
 827  02bc               L411:
 828  02bc 02            	rlwa	x,a
 829  02bd 7b05          	ld	a,(OFST+0,sp)
 830  02bf 905f          	clrw	y
 831  02c1 9097          	ld	yl,a
 832  02c3 90d60002      	ld	a,(L32_LINReceiveBuffer+1,y)
 833  02c7 d70016        	ld	(_LINScheduleTable+3,x),a
 834                     ; 402 								for (Index=0;Index<ResponseDataByteIndex;Index++)
 836  02ca 0c05          	inc	(OFST+0,sp)
 838  02cc               L372:
 841  02cc 7b05          	ld	a,(OFST+0,sp)
 842  02ce c10035        	cp	a,L51_ResponseDataByteIndex
 843  02d1 25dc          	jrult	L762
 844                     ; 407 							ResponseDataByteIndex++;	
 846  02d3 725c0035      	inc	L51_ResponseDataByteIndex
 847                     ; 408 							LIN_FSM = Idle;		
 848  02d7 cc0572        	jp	LC001
 849                     ; 415 		default:
 849                     ; 416 			break;
 852  02da               L571:
 853                     ; 428     if (LINReceptionTimeoutElapsed())
 855  02da cd0669        	call	L74_LINReceptionTimeoutElapsed
 857  02dd 4d            	tnz	a
 858  02de 2707          	jreq	L103
 859                     ; 430 		StopLINReceptionTimeout();
 861  02e0 cd0660        	call	L54_StopLINReceptionTimeout
 863                     ; 431 		LIN_FSM = Idle;
 865  02e3 725f0047      	clr	_LIN_FSM
 866  02e7               L103:
 867                     ; 434 	switch ((LIN_FSM_state)LIN_FSM)
 869  02e7 c60047        	ld	a,_LIN_FSM
 871                     ; 720 				break;
 872  02ea 2712          	jreq	L331
 873  02ec a003          	sub	a,#3
 874  02ee 271d          	jreq	L531
 875  02f0 4a            	dec	a
 876  02f1 2603cc04a2    	jreq	L351
 877  02f6 4a            	dec	a
 878  02f7 2603cc03c8    	jreq	L151
 879  02fc 200c          	jra	L772
 880  02fe               L331:
 881                     ; 440 			case Idle:
 881                     ; 441 		
 881                     ; 442 				/* Set mute mode */								
 881                     ; 443 				#ifdef LINUART				
 881                     ; 444 				#ifdef MUTE_MODE
 881                     ; 445 				UART3_ReceiverWakeUpCmd(ENABLE); /* set LINUART mute mode */
 883  02fe 4c            	inc	a
 884  02ff cd0000        	call	_UART3_ReceiverWakeUpCmd
 886                     ; 447 				LIN_FSM = Identifier;
 888  0302 35030047      	mov	_LIN_FSM,#3
 889                     ; 454 				ResponseDataByteIndex=0;
 891  0306 725f0035      	clr	L51_ResponseDataByteIndex
 892                     ; 456 				break;
 893  030a               L772:
 894                     ; 724 }
 897  030a 5b05          	addw	sp,#5
 898  030c 81            	ret	
 899  030d               L531:
 900                     ; 512 			case Identifier:
 900                     ; 513 			
 900                     ; 514 				#ifdef LINUART
 900                     ; 515 				if (HeaderReceived&!ReceptionError&!IdentifierParityError)
 902  030d c6003e        	ld	a,_IdentifierParityError
 903  0310 2605          	jrne	L421
 904  0312 ae0001        	ldw	x,#1
 905  0315 2001          	jra	L621
 906  0317               L421:
 907  0317 5f            	clrw	x
 908  0318               L621:
 909  0318 1f03          	ldw	(OFST-2,sp),x
 911  031a 5f            	clrw	x
 912  031b c6003c        	ld	a,_HeaderReceived
 913  031e 97            	ld	xl,a
 914  031f 1f01          	ldw	(OFST-4,sp),x
 916  0321 725d0044      	tnz	_ReceptionError
 917  0325 2605          	jrne	L031
 918  0327 ae0001        	ldw	x,#1
 919  032a 2001          	jra	L231
 920  032c               L031:
 921  032c 5f            	clrw	x
 922  032d               L231:
 923  032d 01            	rrwa	x,a
 924  032e 1402          	and	a,(OFST-3,sp)
 925  0330 01            	rrwa	x,a
 926  0331 1401          	and	a,(OFST-4,sp)
 927  0333 02            	rlwa	x,a
 928  0334 1404          	and	a,(OFST-1,sp)
 929  0336 01            	rrwa	x,a
 930  0337 1403          	and	a,(OFST-2,sp)
 931  0339 01            	rrwa	x,a
 932  033a 5d            	tnzw	x
 933  033b 2778          	jreq	L703
 934                     ; 517 					HeaderReceived=0;
 936  033d 725f003c      	clr	_HeaderReceived
 937                     ; 524 					LINChecksumBuffer[0]=UART3Data;		
 939  0341 5500430029    	mov	L7_LINChecksumBuffer,_UART3Data
 940                     ; 525 					ResponseDataByteIndex=1; /* index for 1st data */
 942  0346 35010035      	mov	L51_ResponseDataByteIndex,#1
 943                     ; 526 					StartLINReceptionTimeout();
 945  034a cd0657        	call	L34_StartLINReceptionTimeout
 947                     ; 527 					switch (UART3Data)
 949  034d c60043        	ld	a,_UART3Data
 951                     ; 560 							break;
 952  0350 a003          	sub	a,#3
 953  0352 2719          	jreq	L141
 954  0354 a03f          	sub	a,#63
 955  0356 2736          	jreq	L341
 956  0358 a07f          	sub	a,#127
 957  035a 2707          	jreq	L731
 958  035c a003          	sub	a,#3
 959  035e 2734          	jreq	L541
 960                     ; 558 						default: /* Discard response */					
 960                     ; 559 							LIN_FSM = Idle;									
 961                     ; 560 							break;
 963  0360 cc0572        	jp	LC001
 964  0363               L731:
 965                     ; 530 						case MS0ID:
 965                     ; 531 							LIN_FSM = DataReception;						
 967  0363 35050047      	mov	_LIN_FSM,#5
 968                     ; 532 							DLC=8;
 970  0367 35080000      	mov	L72_DLC,#8
 971                     ; 533 							break;
 973  036b 209d          	jra	L772
 974  036d               L141:
 975                     ; 535 						case MS2ID:
 975                     ; 536 							for (Index=0;Index<8;Index++)
 977  036d c70039        	ld	L33_Index,a
 978  0370               L513:
 979                     ; 538 								DataToSend[Index]=DataBuffer[1][Index];					
 981  0370 5f            	clrw	x
 982  0371 97            	ld	xl,a
 983  0372 d60011        	ld	a,(L5_DataBuffer+8,x)
 984  0375 d70000        	ld	(L3_DataToSend,x),a
 985                     ; 536 							for (Index=0;Index<8;Index++)
 987  0378 725c0039      	inc	L33_Index
 990  037c c60039        	ld	a,L33_Index
 991  037f a108          	cp	a,#8
 992  0381 25ed          	jrult	L513
 993                     ; 540 							LIN_FSM = DataTransmission;				
 995  0383 35040047      	mov	_LIN_FSM,#4
 996                     ; 541 							DLC=8;
 998  0387 35080000      	mov	L72_DLC,#8
 999                     ; 542 							break;
1001  038b cc030a        	jra	L772
1002  038e               L341:
1003                     ; 544 						case SM1ID:		
1003                     ; 545 							LIN_FSM = DataReception;											
1005  038e 35050047      	mov	_LIN_FSM,#5
1006                     ; 546 							DLC=4;
1007                     ; 547 							break;
1009  0392 201a          	jp	LC003
1010  0394               L541:
1011                     ; 549 						case SM3ID:
1011                     ; 550 							for (Index=0;Index<8;Index++)
1013  0394 c70039        	ld	L33_Index,a
1014  0397               L323:
1015                     ; 552 								DataToSend[Index]=DataBuffer[3][Index];					
1017  0397 5f            	clrw	x
1018  0398 97            	ld	xl,a
1019  0399 d60021        	ld	a,(L5_DataBuffer+24,x)
1020  039c d70000        	ld	(L3_DataToSend,x),a
1021                     ; 550 							for (Index=0;Index<8;Index++)
1023  039f 725c0039      	inc	L33_Index
1026  03a3 c60039        	ld	a,L33_Index
1027  03a6 a108          	cp	a,#8
1028  03a8 25ed          	jrult	L323
1029                     ; 554 							LIN_FSM = DataTransmission;						
1031  03aa 35040047      	mov	_LIN_FSM,#4
1032                     ; 555 							DLC=4;
1034  03ae               LC003:
1036  03ae 35040000      	mov	L72_DLC,#4
1037                     ; 556 							break;
1039  03b2 cc030a        	jra	L772
1040                     ; 560 							break;
1041  03b5               L703:
1042                     ; 565 				else if (ReceptionError|IdentifierParityError)
1044  03b5 c60044        	ld	a,_ReceptionError
1045  03b8 ca003e        	or	a,_IdentifierParityError
1046  03bb 27f5          	jreq	L772
1047                     ; 567 					ReceptionError=0;			
1049  03bd 725f0044      	clr	_ReceptionError
1050                     ; 568 					IdentifierParityError=0;
1052  03c1 725f003e      	clr	_IdentifierParityError
1053                     ; 569 					LINError();
1055                     ; 570 					LIN_FSM = Idle;
1056  03c5 cc056f        	jp	L314
1057  03c8               L151:
1058                     ; 586 			case DataReception:			
1058                     ; 587 				
1058                     ; 588 				#ifdef LINUART
1058                     ; 589 				if (HeaderReceived&!ReceptionError)
1060  03c8 c6003c        	ld	a,_HeaderReceived
1061  03cb 5f            	clrw	x
1062  03cc 97            	ld	xl,a
1063  03cd 1f03          	ldw	(OFST-2,sp),x
1065  03cf 725d0044      	tnz	_ReceptionError
1066  03d3 2605          	jrne	L041
1067  03d5 ae0001        	ldw	x,#1
1068  03d8 2001          	jra	L241
1069  03da               L041:
1070  03da 5f            	clrw	x
1071  03db               L241:
1072  03db 01            	rrwa	x,a
1073  03dc 1404          	and	a,(OFST-1,sp)
1074  03de 01            	rrwa	x,a
1075  03df 1403          	and	a,(OFST-2,sp)
1076  03e1 01            	rrwa	x,a
1077  03e2 5d            	tnzw	x
1078  03e3 2707          	jreq	L533
1079                     ; 591 					LIN_FSM = Identifier;				
1081  03e5               LC002:
1084  03e5 35030047      	mov	_LIN_FSM,#3
1086  03e9 cc030a        	jra	L772
1087  03ec               L533:
1088                     ; 593 				else if (DataReceived&!ReceptionError)				
1090  03ec c6003b        	ld	a,_DataReceived
1091  03ef 5f            	clrw	x
1092  03f0 97            	ld	xl,a
1093  03f1 1f03          	ldw	(OFST-2,sp),x
1095  03f3 725d0044      	tnz	_ReceptionError
1096  03f7 2605          	jrne	L441
1097  03f9 ae0001        	ldw	x,#1
1098  03fc 2001          	jra	L641
1099  03fe               L441:
1100  03fe 5f            	clrw	x
1101  03ff               L641:
1102  03ff 01            	rrwa	x,a
1103  0400 1404          	and	a,(OFST-1,sp)
1104  0402 01            	rrwa	x,a
1105  0403 1403          	and	a,(OFST-2,sp)
1106  0405 01            	rrwa	x,a
1107  0406 5d            	tnzw	x
1108  0407 2603cc0491    	jreq	L143
1109                     ; 598 					DataReceived=0;
1111  040c 725f003b      	clr	_DataReceived
1112                     ; 600 					if (ResponseDataByteIndex<=DLC)
1114  0410 c60035        	ld	a,L51_ResponseDataByteIndex
1115  0413 c10000        	cp	a,L72_DLC
1116  0416 221b          	jrugt	L343
1117                     ; 603 						LINChecksumBuffer[ResponseDataByteIndex]=UART3Data;						
1119  0418 5f            	clrw	x
1120  0419 97            	ld	xl,a
1121  041a c60043        	ld	a,_UART3Data
1122  041d d70029        	ld	(L7_LINChecksumBuffer,x),a
1123                     ; 605 						if (ResponseDataByteIndex==DLC)
1125  0420 c60035        	ld	a,L51_ResponseDataByteIndex
1126  0423 c10000        	cp	a,L72_DLC
1127  0426 2604          	jrne	L543
1128                     ; 607 							UART3->CR6 |=  UART3_CR6_LDUM;	/* set LDUM bit */							
1130  0428 721e5249      	bset	21065,#7
1131  042c               L543:
1132                     ; 610 						ResponseDataByteIndex++;
1134  042c 725c0035      	inc	L51_ResponseDataByteIndex
1136  0430 cc030a        	jra	L772
1137  0433               L343:
1138                     ; 615 						LINChecksumBuffer[ResponseDataByteIndex]=UART3Data;
1140  0433 5f            	clrw	x
1141  0434 97            	ld	xl,a
1142  0435 c60043        	ld	a,_UART3Data
1143  0438 d70029        	ld	(L7_LINChecksumBuffer,x),a
1144                     ; 617 						if (LINChecksum(LINChecksumBuffer,(DLC+1))==LINChecksumBuffer[ResponseDataByteIndex])
1146  043b 5f            	clrw	x
1147  043c c60035        	ld	a,L51_ResponseDataByteIndex
1148  043f 97            	ld	xl,a
1149  0440 d60029        	ld	a,(L7_LINChecksumBuffer,x)
1150  0443 6b04          	ld	(OFST-1,sp),a
1152  0445 c60000        	ld	a,L72_DLC
1153  0448 4c            	inc	a
1154  0449 88            	push	a
1155  044a ae0029        	ldw	x,#L7_LINChecksumBuffer
1156  044d cd059c        	call	L73_LINChecksum
1158  0450 5b01          	addw	sp,#1
1159  0452 1104          	cp	a,(OFST-1,sp)
1160  0454 2631          	jrne	L153
1161                     ; 621 								for (i=0;i<DLC;i++)
1163  0456 0f05          	clr	(OFST+0,sp)
1166  0458 2023          	jra	L753
1167  045a               L353:
1168                     ; 623 									if (LINChecksumBuffer[0]==MS0ID)
1170  045a c60029        	ld	a,L7_LINChecksumBuffer
1171  045d a1c1          	cp	a,#193
1172  045f 260c          	jrne	L363
1173                     ; 625 										DataBuffer[0][i]=LINChecksumBuffer[i+1]; // Store Response
1175  0461 7b05          	ld	a,(OFST+0,sp)
1176  0463 5f            	clrw	x
1177  0464 97            	ld	xl,a
1178  0465 d6002a        	ld	a,(L7_LINChecksumBuffer+1,x)
1179  0468 d70009        	ld	(L5_DataBuffer,x),a
1181  046b 200e          	jra	L563
1182  046d               L363:
1183                     ; 627 									else if (LINChecksumBuffer[0]==SM1ID)
1185  046d a142          	cp	a,#66
1186  046f 260a          	jrne	L563
1187                     ; 629 										DataBuffer[2][i]=LINChecksumBuffer[i+1]; // Store Response
1189  0471 7b05          	ld	a,(OFST+0,sp)
1190  0473 5f            	clrw	x
1191  0474 97            	ld	xl,a
1192  0475 d6002a        	ld	a,(L7_LINChecksumBuffer+1,x)
1193  0478 d70019        	ld	(L5_DataBuffer+16,x),a
1194  047b               L563:
1195                     ; 621 								for (i=0;i<DLC;i++)
1197  047b 0c05          	inc	(OFST+0,sp)
1199  047d               L753:
1202  047d 7b05          	ld	a,(OFST+0,sp)
1203  047f c10000        	cp	a,L72_DLC
1204  0482 25d6          	jrult	L353
1206  0484 cc0572        	jra	LC001
1207  0487               L153:
1208                     ; 636 							LINError();
1211                     ; 637 							ChecksumError=1;
1214  0487 cd06a6        	call	L55_LINError
1216  048a 35010038      	mov	L13_ChecksumError,#1
1217                     ; 640 						LIN_FSM = Idle;
1218  048e cc0572        	jp	LC001
1219  0491               L143:
1220                     ; 644 				else if (ReceptionError)
1222  0491 725d0044      	tnz	_ReceptionError
1223  0495 2799          	jreq	L772
1224                     ; 646 					DataReceived=0;
1226  0497 725f003b      	clr	_DataReceived
1227                     ; 647 					ReceptionError=0;
1229  049b 725f0044      	clr	_ReceptionError
1230                     ; 648 					LINError();
1232                     ; 649 					LIN_FSM = Idle;
1233  049f cc056f        	jp	L314
1234  04a2               L351:
1235                     ; 657 			case DataTransmission:				
1235                     ; 658 				
1235                     ; 659 				#ifdef LINUART
1235                     ; 660 				if (HeaderReceived&!ReceptionError)
1237  04a2 c6003c        	ld	a,_HeaderReceived
1238  04a5 5f            	clrw	x
1239  04a6 97            	ld	xl,a
1240  04a7 1f03          	ldw	(OFST-2,sp),x
1242  04a9 725d0044      	tnz	_ReceptionError
1243  04ad 2605          	jrne	L651
1244  04af ae0001        	ldw	x,#1
1245  04b2 2001          	jra	L061
1246  04b4               L651:
1247  04b4 5f            	clrw	x
1248  04b5               L061:
1249  04b5 01            	rrwa	x,a
1250  04b6 1404          	and	a,(OFST-1,sp)
1251  04b8 01            	rrwa	x,a
1252  04b9 1403          	and	a,(OFST-2,sp)
1253  04bb 01            	rrwa	x,a
1254  04bc 5d            	tnzw	x
1255                     ; 662 					LIN_FSM = Identifier;				
1257  04bd 2703cc03e5    	jrne	LC002
1258                     ; 664 				else if (ResponseDataByteIndex==1)				
1260  04c2 c60035        	ld	a,L51_ResponseDataByteIndex
1261  04c5 4a            	dec	a
1262  04c6 260d          	jrne	L304
1263                     ; 669 					UART3_SendData8(DataToSend[0]); /* Send 1st data */
1265  04c8 c60000        	ld	a,L3_DataToSend
1266  04cb cd0000        	call	_UART3_SendData8
1268                     ; 670 					ResponseDataByteIndex++;
1270  04ce 725c0035      	inc	L51_ResponseDataByteIndex
1272  04d2 cc030a        	jra	L772
1273  04d5               L304:
1274                     ; 674 					if (DataReceived&!ReceptionError)
1276  04d5 c6003b        	ld	a,_DataReceived
1277  04d8 5f            	clrw	x
1278  04d9 97            	ld	xl,a
1279  04da 1f03          	ldw	(OFST-2,sp),x
1281  04dc 725d0044      	tnz	_ReceptionError
1282  04e0 2605          	jrne	L461
1283  04e2 ae0001        	ldw	x,#1
1284  04e5 2001          	jra	L661
1285  04e7               L461:
1286  04e7 5f            	clrw	x
1287  04e8               L661:
1288  04e8 01            	rrwa	x,a
1289  04e9 1404          	and	a,(OFST-1,sp)
1290  04eb 01            	rrwa	x,a
1291  04ec 1403          	and	a,(OFST-2,sp)
1292  04ee 01            	rrwa	x,a
1293  04ef 5d            	tnzw	x
1294  04f0 2603cc058c    	jreq	L704
1295                     ; 676 						DataReceived=0;
1297  04f5 725f003b      	clr	_DataReceived
1298                     ; 678 						if (ResponseDataByteIndex<(DLC+2))
1300  04f9 5f            	clrw	x
1301  04fa c60035        	ld	a,L51_ResponseDataByteIndex
1302  04fd 97            	ld	xl,a
1303  04fe c60000        	ld	a,L72_DLC
1304  0501 905f          	clrw	y
1305  0503 9097          	ld	yl,a
1306  0505 bf00          	ldw	c_x,x
1307  0507 72a90002      	addw	y,#2
1308  050b 90b300        	cpw	y,c_x
1309  050e 2d69          	jrsle	L114
1310                     ; 680 							if (UART3Data==DataToSend[ResponseDataByteIndex-2]) /* Check possible bit error */
1312  0510 c60035        	ld	a,L51_ResponseDataByteIndex
1313  0513 5f            	clrw	x
1314  0514 97            	ld	xl,a
1315  0515 1d0002        	subw	x,#2
1316  0518 d60000        	ld	a,(L3_DataToSend,x)
1317  051b c10043        	cp	a,_UART3Data
1318  051e 264f          	jrne	L314
1319                     ; 682 								LINChecksumBuffer[ResponseDataByteIndex-1]=UART3Data;
1321  0520 c60035        	ld	a,L51_ResponseDataByteIndex
1322  0523 5f            	clrw	x
1323  0524 97            	ld	xl,a
1324  0525 5a            	decw	x
1325  0526 c60043        	ld	a,_UART3Data
1326  0529 d70029        	ld	(L7_LINChecksumBuffer,x),a
1327                     ; 683 								if (ResponseDataByteIndex==(DLC+1))
1329  052c 5f            	clrw	x
1330  052d c60035        	ld	a,L51_ResponseDataByteIndex
1331  0530 97            	ld	xl,a
1332  0531 c60000        	ld	a,L72_DLC
1333  0534 905f          	clrw	y
1334  0536 9097          	ld	yl,a
1335  0538 bf00          	ldw	c_x,x
1336  053a 905c          	incw	y
1337  053c 90b300        	cpw	y,c_x
1338  053f 261b          	jrne	L514
1339                     ; 685 									DataToSend[ResponseDataByteIndex-1]=LINChecksum(LINChecksumBuffer,(DLC+1));
1341  0541 c60035        	ld	a,L51_ResponseDataByteIndex
1342  0544 5f            	clrw	x
1343  0545 97            	ld	xl,a
1344  0546 5a            	decw	x
1345  0547 89            	pushw	x
1346  0548 c60000        	ld	a,L72_DLC
1347  054b 4c            	inc	a
1348  054c 88            	push	a
1349  054d ae0029        	ldw	x,#L7_LINChecksumBuffer
1350  0550 ad4a          	call	L73_LINChecksum
1352  0552 5b01          	addw	sp,#1
1353  0554 85            	popw	x
1354  0555 d70000        	ld	(L3_DataToSend,x),a
1355                     ; 687 									UART3->CR6 |=  UART3_CR6_LDUM;	/* set LDUM bit */
1357  0558 721e5249      	bset	21065,#7
1358  055c               L514:
1359                     ; 690 								UART3_SendData8(DataToSend[ResponseDataByteIndex-1]); /* Send data */
1361  055c c60035        	ld	a,L51_ResponseDataByteIndex
1362  055f 5f            	clrw	x
1363  0560 97            	ld	xl,a
1364  0561 5a            	decw	x
1365  0562 d60000        	ld	a,(L3_DataToSend,x)
1366  0565 cd0000        	call	_UART3_SendData8
1368                     ; 691 								ResponseDataByteIndex++;
1370  0568 725c0035      	inc	L51_ResponseDataByteIndex
1372  056c cc030a        	jra	L772
1373  056f               L314:
1374                     ; 695 								LINError();
1379  056f cd06a6        	call	L55_LINError
1381                     ; 696 								LIN_FSM = Idle;
1383  0572               LC001:
1392  0572 725f0047      	clr	_LIN_FSM
1393  0576 cc030a        	jra	L772
1394  0579               L114:
1395                     ; 703 							if (UART3Data!=DataToSend[ResponseDataByteIndex-2])
1397  0579 c60035        	ld	a,L51_ResponseDataByteIndex
1398  057c 5f            	clrw	x
1399  057d 97            	ld	xl,a
1400  057e 1d0002        	subw	x,#2
1401  0581 d60000        	ld	a,(L3_DataToSend,x)
1402  0584 c10043        	cp	a,_UART3Data
1403  0587 27e9          	jreq	LC001
1404                     ; 705 								LINError();
1406                     ; 706 								ChecksumError=1;
1407                     ; 708 							LIN_FSM = Idle;
1408  0589 cc0487        	jp	L153
1409  058c               L704:
1410                     ; 711 					else if (ReceptionError)
1412  058c 725d0044      	tnz	_ReceptionError
1413  0590 27e4          	jreq	L772
1414                     ; 713 						DataReceived=0;
1416  0592 725f003b      	clr	_DataReceived
1417                     ; 714 						ReceptionError=0;
1419  0596 725f0044      	clr	_ReceptionError
1420                     ; 715 						LINError();
1422                     ; 716 						LIN_FSM = Idle;						
1423  059a 20d3          	jp	L314
1486                     ; 737 uint8_t LINChecksum (uint8_t* Checksum_Buffer, uint8_t Data_Number)
1486                     ; 738 {
1487                     	switch	.text
1488  059c               L73_LINChecksum:
1490  059c 89            	pushw	x
1491  059d 5205          	subw	sp,#5
1492       00000005      OFST:	set	5
1495                     ; 739 	uint8_t i=0;
1497                     ; 740 	uint16_t Sum=0;
1499  059f 5f            	clrw	x
1500  05a0 1f04          	ldw	(OFST-1,sp),x
1502                     ; 741 	uint16_t Sum1=0;
1504                     ; 743 	for(i=0;i<Data_Number;i++)
1506  05a2 0f03          	clr	(OFST-2,sp)
1509  05a4 2029          	jra	L364
1510  05a6               L754:
1511                     ; 745 		Sum = Sum + *(Checksum_Buffer+i);
1513  05a6 7b06          	ld	a,(OFST+1,sp)
1514  05a8 97            	ld	xl,a
1515  05a9 7b07          	ld	a,(OFST+2,sp)
1516  05ab 1b03          	add	a,(OFST-2,sp)
1517  05ad 2401          	jrnc	L402
1518  05af 5c            	incw	x
1519  05b0               L402:
1520  05b0 02            	rlwa	x,a
1521  05b1 f6            	ld	a,(x)
1522  05b2 1b05          	add	a,(OFST+0,sp)
1523  05b4 6b05          	ld	(OFST+0,sp),a
1524  05b6 2402          	jrnc	L602
1525  05b8 0c04          	inc	(OFST-1,sp)
1526  05ba               L602:
1528                     ; 747 		Sum1 = Sum>>8;
1530  05ba 1e04          	ldw	x,(OFST-1,sp)
1531  05bc 4f            	clr	a
1532  05bd 01            	rrwa	x,a
1533  05be 1f01          	ldw	(OFST-4,sp),x
1535                     ; 748 		if( Sum1 > 0 )
1537  05c0 270b          	jreq	L764
1538                     ; 750 			Sum++;
1540  05c2 1e04          	ldw	x,(OFST-1,sp)
1541  05c4 5c            	incw	x
1542  05c5 1f04          	ldw	(OFST-1,sp),x
1544                     ; 751 			Sum &= ~0x0100;
1546  05c7 7b04          	ld	a,(OFST-1,sp)
1547  05c9 a4fe          	and	a,#254
1548  05cb 6b04          	ld	(OFST-1,sp),a
1550  05cd               L764:
1551                     ; 743 	for(i=0;i<Data_Number;i++)
1553  05cd 0c03          	inc	(OFST-2,sp)
1555  05cf               L364:
1558  05cf 7b03          	ld	a,(OFST-2,sp)
1559  05d1 110a          	cp	a,(OFST+5,sp)
1560  05d3 25d1          	jrult	L754
1561                     ; 755 	return (uint8_t)(~Sum);	
1563  05d5 7b05          	ld	a,(OFST+0,sp)
1564  05d7 43            	cpl	a
1567  05d8 5b07          	addw	sp,#7
1568  05da 81            	ret	
1592                     ; 764 void UART3_RIE (void)
1592                     ; 765 {
1593                     	switch	.text
1594  05db               L14_UART3_RIE:
1598                     ; 768 		UART3_ITConfig(UART3_IT_LBDF, DISABLE);
1600  05db 4b00          	push	#0
1601  05dd ae0346        	ldw	x,#838
1602  05e0 cd0000        	call	_UART3_ITConfig
1604  05e3 84            	pop	a
1605                     ; 769 	    UART3_ITConfig(UART3_IT_RXNE_OR, ENABLE);				
1607  05e4 4b01          	push	#1
1608  05e6 ae0205        	ldw	x,#517
1609  05e9 cd0000        	call	_UART3_ITConfig
1611  05ec 84            	pop	a
1612                     ; 770 }
1615  05ed 81            	ret	
1639                     ; 778 void UART3_BDIE (void)
1639                     ; 779 {
1640                     	switch	.text
1641  05ee               _UART3_BDIE:
1645                     ; 782 	UART3_ITConfig(UART3_IT_RXNE_OR, DISABLE);
1647  05ee 4b00          	push	#0
1648  05f0 ae0205        	ldw	x,#517
1649  05f3 cd0000        	call	_UART3_ITConfig
1651  05f6 84            	pop	a
1652                     ; 783 	UART3_ITConfig(UART3_IT_LBDF, ENABLE);
1654  05f7 4b01          	push	#1
1655  05f9 ae0346        	ldw	x,#838
1656  05fc cd0000        	call	_UART3_ITConfig
1658  05ff 84            	pop	a
1659                     ; 785 }
1662  0600 81            	ret	
1704                     ; 796 uint8_t LIN_ReadData(uint8_t FrameNumber, uint8_t BytePosition)
1704                     ; 797 {
1705                     	switch	.text
1706  0601               _LIN_ReadData:
1708  0601 89            	pushw	x
1709       00000000      OFST:	set	0
1712                     ; 798 	if (LINSlave==FALSE)
1714  0602 c60041        	ld	a,_LINSlave
1715  0605 2611          	jrne	L725
1716                     ; 800 		return (LINScheduleTable[FrameNumber].LINScheduleTableFrame.LINFrameBuffer[BytePosition]);
1718  0607 9e            	ld	a,xh
1719  0608 97            	ld	xl,a
1720  0609 a60d          	ld	a,#13
1721  060b 42            	mul	x,a
1722  060c 01            	rrwa	x,a
1723  060d 1b02          	add	a,(OFST+2,sp)
1724  060f 2401          	jrnc	L622
1725  0611 5c            	incw	x
1726  0612               L622:
1727  0612 02            	rlwa	x,a
1728  0613 d60016        	ld	a,(_LINScheduleTable+3,x)
1730  0616 2010          	jra	L232
1731  0618               L725:
1732                     ; 804 		return (DataBuffer[FrameNumber][BytePosition]);
1734  0618 7b01          	ld	a,(OFST+1,sp)
1735  061a 97            	ld	xl,a
1736  061b a608          	ld	a,#8
1737  061d 42            	mul	x,a
1738  061e 01            	rrwa	x,a
1739  061f 1b02          	add	a,(OFST+2,sp)
1740  0621 2401          	jrnc	L032
1741  0623 5c            	incw	x
1742  0624               L032:
1743  0624 02            	rlwa	x,a
1744  0625 d60009        	ld	a,(L5_DataBuffer,x)
1746  0628               L232:
1748  0628 85            	popw	x
1749  0629 81            	ret	
1798                     ; 817 void LIN_WriteData(uint8_t FrameNumber, uint8_t BytePosition, uint8_t Value)
1798                     ; 818 {
1799                     	switch	.text
1800  062a               _LIN_WriteData:
1802  062a 89            	pushw	x
1803       00000000      OFST:	set	0
1806                     ; 819 	if (LINSlave==FALSE)
1808  062b c60041        	ld	a,_LINSlave
1809  062e 2613          	jrne	L355
1810                     ; 821 		LINScheduleTable[FrameNumber].LINScheduleTableFrame.LINFrameBuffer[BytePosition]=Value;
1812  0630 9e            	ld	a,xh
1813  0631 97            	ld	xl,a
1814  0632 a60d          	ld	a,#13
1815  0634 42            	mul	x,a
1816  0635 01            	rrwa	x,a
1817  0636 1b02          	add	a,(OFST+2,sp)
1818  0638 2401          	jrnc	L632
1819  063a 5c            	incw	x
1820  063b               L632:
1821  063b 02            	rlwa	x,a
1822  063c 7b05          	ld	a,(OFST+5,sp)
1823  063e d70016        	ld	(_LINScheduleTable+3,x),a
1825  0641 2012          	jra	L555
1826  0643               L355:
1827                     ; 825 		DataBuffer[FrameNumber][BytePosition]=Value;
1829  0643 7b01          	ld	a,(OFST+1,sp)
1830  0645 97            	ld	xl,a
1831  0646 a608          	ld	a,#8
1832  0648 42            	mul	x,a
1833  0649 01            	rrwa	x,a
1834  064a 1b02          	add	a,(OFST+2,sp)
1835  064c 2401          	jrnc	L042
1836  064e 5c            	incw	x
1837  064f               L042:
1838  064f 02            	rlwa	x,a
1839  0650 7b05          	ld	a,(OFST+5,sp)
1840  0652 d70009        	ld	(L5_DataBuffer,x),a
1841  0655               L555:
1842                     ; 828 }
1845  0655 85            	popw	x
1846  0656 81            	ret	
1872                     ; 836 void StartLINReceptionTimeout(void)
1872                     ; 837 {
1873                     	switch	.text
1874  0657               L34_StartLINReceptionTimeout:
1878                     ; 838 	LINReceptionTimeout=TRUE;	
1880  0657 35010040      	mov	_LINReceptionTimeout,#1
1881                     ; 839 	LINReceptionTimeoutValue=0;	
1883  065b 725f003f      	clr	_LINReceptionTimeoutValue
1884                     ; 840 }
1887  065f 81            	ret	
1913                     ; 848 void StopLINReceptionTimeout(void)
1913                     ; 849 {
1914                     	switch	.text
1915  0660               L54_StopLINReceptionTimeout:
1919                     ; 850 	LINReceptionTimeout=FALSE;	
1921  0660 725f0040      	clr	_LINReceptionTimeout
1922                     ; 851 	LINReceptionTimeoutValue=0;	
1924  0664 725f003f      	clr	_LINReceptionTimeoutValue
1925                     ; 852 }
1928  0668 81            	ret	
1977                     ; 864 bool LINReceptionTimeoutElapsed(void)
1977                     ; 865 {
1978                     	switch	.text
1979  0669               L74_LINReceptionTimeoutElapsed:
1983                     ; 866 	if (LINSlave==FALSE)
1985  0669 c60041        	ld	a,_LINSlave
1986  066c 2613          	jrne	L716
1987                     ; 868 		if (LINReceptionTimeoutValue>LIN_MASTER_RECEPTION_TIMEOUT)
1989  066e c6003f        	ld	a,_LINReceptionTimeoutValue
1990  0671 a105          	cp	a,#5
1991  0673 250a          	jrult	L126
1992                     ; 870 			if(!ErrorState) LINError();
1994  0675 c60000        	ld	a,_ErrorState
1995  0678 2602          	jrne	L326
1998  067a ad2a          	call	L55_LINError
2000  067c               L326:
2001                     ; 871 			return(TRUE);
2003  067c a601          	ld	a,#1
2006  067e 81            	ret	
2007  067f               L126:
2008                     ; 873 		else return (FALSE);
2010  067f 4f            	clr	a
2013  0680 81            	ret	
2014  0681               L716:
2015                     ; 877 		if (LINReceptionTimeoutValue>LIN_SLAVE_RECEPTION_TIMEOUT)
2017  0681 c6003f        	ld	a,_LINReceptionTimeoutValue
2018  0684 a165          	cp	a,#101
2019  0686 250a          	jrult	L136
2020                     ; 879 			if(!ErrorState) LINError();
2022  0688 c60000        	ld	a,_ErrorState
2023  068b 2602          	jrne	L336
2026  068d ad17          	call	L55_LINError
2028  068f               L336:
2029                     ; 880 			return(TRUE);
2031  068f a601          	ld	a,#1
2034  0691 81            	ret	
2035  0692               L136:
2036                     ; 882 		else return (FALSE);
2038  0692 4f            	clr	a
2041  0693 81            	ret	
2065                     ; 892 void SetLINTimebaseTick(void)
2065                     ; 893 {
2066                     	switch	.text
2067  0694               _SetLINTimebaseTick:
2071                     ; 894 	LINTick=TRUE;
2073  0694 3501003a      	mov	L53_LINTick,#1
2074                     ; 895 }
2077  0698 81            	ret	
2102                     ; 903 void ClearLINTimebaseTick(void)
2102                     ; 904 {
2103                     	switch	.text
2104  0699               L35_ClearLINTimebaseTick:
2108                     ; 905 	LINTick=FALSE;
2110  0699 725f003a      	clr	L53_LINTick
2111                     ; 906 }
2114  069d 81            	ret	
2139                     ; 914 uint8_t TestLINTimebaseTick(void)
2139                     ; 915 {
2140                     	switch	.text
2141  069e               L15_TestLINTimebaseTick:
2145                     ; 916 	if (LINTick) return 1;
2147  069e c6003a        	ld	a,L53_LINTick
2148  06a1 2702          	jreq	L766
2151  06a3 a601          	ld	a,#1
2154  06a5               L766:
2155                     ; 917 	else return 0;
2159  06a5 81            	ret	
2183                     ; 926 void LINError(void)
2183                     ; 927 {
2184                     	switch	.text
2185  06a6               L55_LINError:
2189                     ; 928 	GPIO_WriteHigh(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3); /* LD3 red LED ON */
2191  06a6 4b08          	push	#8
2192  06a8 ae5000        	ldw	x,#20480
2193  06ab cd0000        	call	_GPIO_WriteHigh
2195  06ae 84            	pop	a
2196                     ; 929 }
2199  06af 81            	ret	
2552                     	xdef	_SetLINTimebaseTick
2553                     	xdef	_LIN_WriteData
2554                     	xdef	_LIN_ReadData
2555                     	xdef	_LIN_Task
2556                     	xdef	_LIN_SlaveConfig
2557                     	xdef	_InitScheduleTable
2558                     	xdef	_LIN_MasterConfig
2559                     	xdef	_UART3_BDIE
2560                     	xdef	_ReceptionError
2561                     	xdef	_UART3Data
2562                     	xdef	_UART3_SR_Buf
2563                     	xdef	_LINSlave
2564                     	xdef	_LINReceptionTimeout
2565                     	xdef	_LINReceptionTimeoutValue
2566                     	xdef	_IdentifierParityError
2567                     	xdef	_BreakReceived
2568                     	xdef	_HeaderReceived
2569                     	xdef	_DataReceived
2570                     	switch	.bss
2571  0000               L72_DLC:
2572  0000 00            	ds.b	1
2573  0001               L32_LINReceiveBuffer:
2574  0001 000000000000  	ds.b	9
2575  000a               L12_LINTransmitBuffer:
2576  000a 000000000000  	ds.b	9
2577  0013               _LINScheduleTable:
2578  0013 000000000000  	ds.b	52
2579                     	xdef	_LINScheduleTable
2580  0047               _LIN_FSM:
2581  0047 00            	ds.b	1
2582                     	xdef	_LIN_FSM
2583                     	xref	_ErrorState
2584                     	xref	_UART3_SendBreak
2585                     	xref	_UART3_SendData8
2586                     	xref	_UART3_ReceiverWakeUpCmd
2587                     	xref	_UART3_LINCmd
2588                     	xref	_UART3_LINConfig
2589                     	xref	_UART3_LINBreakDetectionConfig
2590                     	xref	_UART3_ITConfig
2591                     	xref	_UART3_Init
2592                     	xref	_UART3_DeInit
2593                     	xref	_GPIO_WriteLow
2594                     	xref	_GPIO_WriteHigh
2595                     	xref.b	c_x
2615                     	end
