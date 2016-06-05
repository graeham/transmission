   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  19                     	switch	.data
  20  0000               L3_Data0:
  21  0000 00            	dc.b	0
  22  0001               L5_Data1:
  23  0001 00            	dc.b	0
  24  0002               L7_motorDuty1:
  25  0002 00            	dc.b	0
  26  0003               L11_BarStatus:
  27  0003 00            	dc.b	0
  28  0004               L31_AppliTimebaseTick:
  29  0004 00            	dc.b	0
  30  0005               _StartupDisplay:
  31  0005 00            	dc.b	0
  32  0006               _StartupCompleted:
  33  0006 00            	dc.b	0
  87                     ; 232 void Appli(void)
  87                     ; 233 {
  89                     	switch	.text
  90  0000               _Appli:
  92  0000 88            	push	a
  93       00000001      OFST:	set	1
  96                     ; 235 	if (TestAppliTimebaseTick())
  98  0001 cd062e        	call	L53_TestAppliTimebaseTick
 100  0004 4d            	tnz	a
 101  0005 2603cc03d1    	jreq	L75
 102                     ; 237 		ClearAppliTimebaseTick();
 104  000a cd0629        	call	L33_ClearAppliTimebaseTick
 106                     ; 241 		if (StartupDisplay<23)
 109  000d c60005        	ld	a,_StartupDisplay
 110  0010 a117          	cp	a,#23
 111  0012 2429          	jruge	L16
 112                     ; 243 			StartupDisplay++;
 114  0014 725c0005      	inc	_StartupDisplay
 115                     ; 246 			if ((CANMaster==TRUE)&&(TransmissionEnable==TRUE)) LED_Display(CAN_MASTER_TEST_MODE);
 117  0018 c60000        	ld	a,_CANMaster
 118  001b 4a            	dec	a
 119  001c 260a          	jrne	L36
 121  001e c60000        	ld	a,_TransmissionEnable
 122  0021 4a            	dec	a
 123  0022 2604          	jrne	L36
 126  0024 a606          	ld	a,#6
 129  0026 200f          	jp	LC004
 130  0028               L36:
 131                     ; 252 			else if (LINSlave==TRUE) LED_Display(LIN_SLAVE_TEST_MODE);
 133  0028 c60000        	ld	a,_LINSlave
 134  002b 4a            	dec	a
 135  002c 2604          	jrne	L76
 138  002e a608          	ld	a,#8
 141  0030 2005          	jp	LC004
 142  0032               L76:
 143                     ; 255 			else LED_Display(StartupDisplay>>2);
 145  0032 c60005        	ld	a,_StartupDisplay
 146  0035 44            	srl	a
 147  0036 44            	srl	a
 148  0037               LC004:
 149  0037 cd0636        	call	L73_LED_Display
 151  003a cc03d1        	jra	L75
 152  003d               L16:
 153                     ; 259 			StartupCompleted=TRUE;
 155  003d 35010006      	mov	_StartupCompleted,#1
 156                     ; 261 			ADC2_StartConversion();
 158  0041 cd0000        	call	_ADC2_StartConversion
 160                     ; 264 			Data0 = (uint8_t) GetADCData();
 162  0044 cd0000        	call	_GetADCData
 164  0047 9f            	ld	a,xl
 165  0048 c70000        	ld	L3_Data0,a
 166                     ; 265 			Data1 = (uint8_t) (GetADCData()>>8);
 168  004b cd0000        	call	_GetADCData
 170  004e 4f            	clr	a
 171  004f 01            	rrwa	x,a
 172  0050 9f            	ld	a,xl
 173  0051 c70001        	ld	L5_Data1,a
 174                     ; 274 			motorDuty1 = (Data1 << 6) | (Data0 >> 2);
 176  0054 c60000        	ld	a,L3_Data0
 177  0057 44            	srl	a
 178  0058 44            	srl	a
 179  0059 6b01          	ld	(OFST+0,sp),a
 181  005b c60001        	ld	a,L5_Data1
 182  005e 97            	ld	xl,a
 183  005f a640          	ld	a,#64
 184  0061 42            	mul	x,a
 185  0062 9f            	ld	a,xl
 186  0063 1a01          	or	a,(OFST+0,sp)
 187  0065 c70002        	ld	L7_motorDuty1,a
 188                     ; 278 			if ((TransmissionEnable==TRUE)&&(CANMaster==TRUE))
 190  0068 c60000        	ld	a,_TransmissionEnable
 191  006b 4a            	dec	a
 192  006c 2703cc0140    	jrne	L57
 194  0071 c60000        	ld	a,_CANMaster
 195  0074 4a            	dec	a
 196  0075 26f7          	jrne	L57
 197                     ; 280 				WRITE_CAN_MASTER_RV1_TRIMMER_LSB(Data0);
 199  0077 3b0000        	push	L3_Data0
 200  007a ae0203        	ldw	x,#515
 201  007d cd0000        	call	_CAN_WriteData
 203  0080 84            	pop	a
 204                     ; 281 				WRITE_CAN_MASTER_RV1_TRIMMER_MSB(Data1);
 206  0081 3b0001        	push	L5_Data1
 207  0084 ae0202        	ldw	x,#514
 208  0087 cd0000        	call	_CAN_WriteData
 210  008a 84            	pop	a
 211                     ; 283 				L99PM62drv_SetPWMDutyCycle(L99PM62DRV_MASK_PWM1,motorDuty1/2.0);
 213  008b c60002        	ld	a,L7_motorDuty1
 214  008e 5f            	clrw	x
 215  008f 97            	ld	xl,a
 216  0090 cd0000        	call	c_itof
 218  0093 ae0000        	ldw	x,#L301
 219  0096 cd0000        	call	c_fdiv
 221  0099 cd0000        	call	c_ftol
 223  009c b603          	ld	a,c_lreg+3
 224  009e ae0100        	ldw	x,#256
 225  00a1 97            	ld	xl,a
 226  00a2 cd0000        	call	_L99PM62drv_SetPWMDutyCycle
 228                     ; 286 				if (UserButton1Status()) 
 230  00a5 cd03d3        	call	L51_UserButton1Status
 232  00a8 4d            	tnz	a
 233  00a9 270e          	jreq	L701
 234                     ; 288 					WRITE_CAN_MASTER_USER1_BUTTON(TRUE);
 236  00ab 4b01          	push	#1
 237  00ad ae0200        	ldw	x,#512
 238  00b0 cd0000        	call	_CAN_WriteData
 240  00b3 84            	pop	a
 241                     ; 289 					IncrementStatus();			
 243  00b4 cd03ed        	call	L12_IncrementStatus
 246  00b7 2009          	jra	L111
 247  00b9               L701:
 248                     ; 293 					WRITE_CAN_MASTER_USER1_BUTTON(FALSE);		
 250  00b9 4b00          	push	#0
 251  00bb ae0200        	ldw	x,#512
 252  00be cd0000        	call	_CAN_WriteData
 254  00c1 84            	pop	a
 255  00c2               L111:
 256                     ; 297 				if (UserButton2Status())
 258  00c2 cd03e0        	call	L71_UserButton2Status
 260  00c5 4d            	tnz	a
 261  00c6 270e          	jreq	L311
 262                     ; 299 					WRITE_CAN_MASTER_USER2_BUTTON(TRUE);
 264  00c8 4b01          	push	#1
 265  00ca ae0201        	ldw	x,#513
 266  00cd cd0000        	call	_CAN_WriteData
 268  00d0 84            	pop	a
 269                     ; 300 					DecrementStatus();
 271  00d1 cd0418        	call	L32_DecrementStatus
 274  00d4 2009          	jra	L511
 275  00d6               L311:
 276                     ; 304 					WRITE_CAN_MASTER_USER2_BUTTON(FALSE);			
 278  00d6 4b00          	push	#0
 279  00d8 ae0201        	ldw	x,#513
 280  00db cd0000        	call	_CAN_WriteData
 282  00de 84            	pop	a
 283  00df               L511:
 284                     ; 306 				if(!ErrorState)
 286  00df c60000        	ld	a,_ErrorState
 287  00e2 2703cc03d1    	jrne	L75
 288                     ; 309 					if (READ_CAN_MASTER_LD4_GREEN_LED) LD4_GREEN_LED_ON; else LD4_GREEN_LED_OFF;
 290  00e7 ae0100        	ldw	x,#256
 291  00ea cd0000        	call	_CAN_ReadData
 293  00ed 4d            	tnz	a
 294  00ee 270a          	jreq	L121
 297  00f0 4b08          	push	#8
 298  00f2 ae500f        	ldw	x,#20495
 299  00f5 cd0000        	call	_GPIO_WriteHigh
 302  00f8 2008          	jra	L321
 303  00fa               L121:
 306  00fa 4b08          	push	#8
 307  00fc ae500f        	ldw	x,#20495
 308  00ff cd0000        	call	_GPIO_WriteLow
 310  0102               L321:
 311  0102 ae0101        	ldw	x,#257
 312  0105 84            	pop	a
 313                     ; 310 					if (READ_CAN_MASTER_LD5_GREEN_LED) LD5_GREEN_LED_ON; else LD5_GREEN_LED_OFF;
 315  0106 cd0000        	call	_CAN_ReadData
 317  0109 4d            	tnz	a
 318  010a 270a          	jreq	L521
 321  010c 4b01          	push	#1
 322  010e ae500f        	ldw	x,#20495
 323  0111 cd0000        	call	_GPIO_WriteHigh
 326  0114 2008          	jra	L721
 327  0116               L521:
 330  0116 4b01          	push	#1
 331  0118 ae500f        	ldw	x,#20495
 332  011b cd0000        	call	_GPIO_WriteLow
 334  011e               L721:
 335  011e ae0102        	ldw	x,#258
 336  0121 84            	pop	a
 337                     ; 311 					if (READ_CAN_MASTER_LD6_GREEN_LED) LD6_GREEN_LED_ON; else LD6_GREEN_LED_OFF;
 339  0122 cd0000        	call	_CAN_ReadData
 341  0125 4d            	tnz	a
 342  0126 270a          	jreq	L131
 345  0128 4b08          	push	#8
 346  012a ae5014        	ldw	x,#20500
 347  012d cd0000        	call	_GPIO_WriteHigh
 350  0130 2008          	jra	L331
 351  0132               L131:
 354  0132 4b08          	push	#8
 355  0134 ae5014        	ldw	x,#20500
 356  0137 cd0000        	call	_GPIO_WriteLow
 358  013a               L331:
 359  013a ae0103        	ldw	x,#259
 360                     ; 312 					if (READ_CAN_MASTER_LD7_GREEN_LED) LD7_GREEN_LED_ON; else LD7_GREEN_LED_OFF;
 365  013d cc0212        	jp	LC006
 368  0140               L57:
 369                     ; 317 			else if ((TransmissionEnable==TRUE)&&(CANMaster==FALSE))
 371  0140 c60000        	ld	a,_TransmissionEnable
 372  0143 4a            	dec	a
 373  0144 2703cc0219    	jrne	L341
 375  0149 c60000        	ld	a,_CANMaster
 376  014c 26f8          	jrne	L341
 377                     ; 319 				WRITE_CAN_SLAVE_RV1_TRIMMER_LSB(Data0);
 379  014e 3b0000        	push	L3_Data0
 380  0151 ae0303        	ldw	x,#771
 381  0154 cd0000        	call	_CAN_WriteData
 383  0157 84            	pop	a
 384                     ; 320 				WRITE_CAN_SLAVE_RV1_TRIMMER_MSB(Data1);
 386  0158 3b0001        	push	L5_Data1
 387  015b ae0302        	ldw	x,#770
 388  015e cd0000        	call	_CAN_WriteData
 390  0161 84            	pop	a
 391                     ; 321 				L99PM62drv_SetPWMDutyCycle(L99PM62DRV_MASK_PWM1,motorDuty1/2.0);
 393  0162 c60002        	ld	a,L7_motorDuty1
 394  0165 5f            	clrw	x
 395  0166 97            	ld	xl,a
 396  0167 cd0000        	call	c_itof
 398  016a ae0000        	ldw	x,#L301
 399  016d cd0000        	call	c_fdiv
 401  0170 cd0000        	call	c_ftol
 403  0173 b603          	ld	a,c_lreg+3
 404  0175 ae0100        	ldw	x,#256
 405  0178 97            	ld	xl,a
 406  0179 cd0000        	call	_L99PM62drv_SetPWMDutyCycle
 408                     ; 324 				if (UserButton1Status()) 
 410  017c cd03d3        	call	L51_UserButton1Status
 412  017f 4d            	tnz	a
 413  0180 270e          	jreq	L541
 414                     ; 326 					WRITE_CAN_SLAVE_USER1_BUTTON(TRUE);
 416  0182 4b01          	push	#1
 417  0184 ae0300        	ldw	x,#768
 418  0187 cd0000        	call	_CAN_WriteData
 420  018a 84            	pop	a
 421                     ; 327 					IncrementStatus();			
 423  018b cd03ed        	call	L12_IncrementStatus
 426  018e 2009          	jra	L741
 427  0190               L541:
 428                     ; 331 					WRITE_CAN_SLAVE_USER1_BUTTON(FALSE);		
 430  0190 4b00          	push	#0
 431  0192 ae0300        	ldw	x,#768
 432  0195 cd0000        	call	_CAN_WriteData
 434  0198 84            	pop	a
 435  0199               L741:
 436                     ; 335 				if (UserButton2Status())
 438  0199 cd03e0        	call	L71_UserButton2Status
 440  019c 4d            	tnz	a
 441  019d 270e          	jreq	L151
 442                     ; 337 					WRITE_CAN_SLAVE_USER2_BUTTON(TRUE);
 444  019f 4b01          	push	#1
 445  01a1 ae0301        	ldw	x,#769
 446  01a4 cd0000        	call	_CAN_WriteData
 448  01a7 84            	pop	a
 449                     ; 338 					DecrementStatus();
 451  01a8 cd0418        	call	L32_DecrementStatus
 454  01ab 2009          	jra	L351
 455  01ad               L151:
 456                     ; 342 					WRITE_CAN_SLAVE_USER2_BUTTON(FALSE);			
 458  01ad 4b00          	push	#0
 459  01af ae0301        	ldw	x,#769
 460  01b2 cd0000        	call	_CAN_WriteData
 462  01b5 84            	pop	a
 463  01b6               L351:
 464                     ; 344 				if(!ErrorState)
 466  01b6 c60000        	ld	a,_ErrorState
 467  01b9 2703cc03d1    	jrne	L75
 468                     ; 347 					if (READ_CAN_SLAVE_LD4_GREEN_LED) LD4_GREEN_LED_ON; else LD4_GREEN_LED_OFF;
 470  01be 5f            	clrw	x
 471  01bf cd0000        	call	_CAN_ReadData
 473  01c2 4d            	tnz	a
 474  01c3 270a          	jreq	L751
 477  01c5 4b08          	push	#8
 478  01c7 ae500f        	ldw	x,#20495
 479  01ca cd0000        	call	_GPIO_WriteHigh
 482  01cd 2008          	jra	L161
 483  01cf               L751:
 486  01cf 4b08          	push	#8
 487  01d1 ae500f        	ldw	x,#20495
 488  01d4 cd0000        	call	_GPIO_WriteLow
 490  01d7               L161:
 491  01d7 ae0001        	ldw	x,#1
 492  01da 84            	pop	a
 493                     ; 348 					if (READ_CAN_SLAVE_LD5_GREEN_LED) LD5_GREEN_LED_ON; else LD5_GREEN_LED_OFF;
 495  01db cd0000        	call	_CAN_ReadData
 497  01de 4d            	tnz	a
 498  01df 270a          	jreq	L361
 501  01e1 4b01          	push	#1
 502  01e3 ae500f        	ldw	x,#20495
 503  01e6 cd0000        	call	_GPIO_WriteHigh
 506  01e9 2008          	jra	L561
 507  01eb               L361:
 510  01eb 4b01          	push	#1
 511  01ed ae500f        	ldw	x,#20495
 512  01f0 cd0000        	call	_GPIO_WriteLow
 514  01f3               L561:
 515  01f3 ae0002        	ldw	x,#2
 516  01f6 84            	pop	a
 517                     ; 349 					if (READ_CAN_SLAVE_LD6_GREEN_LED) LD6_GREEN_LED_ON; else LD6_GREEN_LED_OFF;
 519  01f7 cd0000        	call	_CAN_ReadData
 521  01fa 4d            	tnz	a
 522  01fb 270a          	jreq	L761
 525  01fd 4b08          	push	#8
 526  01ff ae5014        	ldw	x,#20500
 527  0202 cd0000        	call	_GPIO_WriteHigh
 530  0205 2008          	jra	L171
 531  0207               L761:
 534  0207 4b08          	push	#8
 535  0209 ae5014        	ldw	x,#20500
 536  020c cd0000        	call	_GPIO_WriteLow
 538  020f               L171:
 539  020f ae0003        	ldw	x,#3
 540                     ; 350 					if (READ_CAN_SLAVE_LD7_GREEN_LED) LD7_GREEN_LED_ON; else LD7_GREEN_LED_OFF;
 542  0212               LC006:
 543  0212 84            	pop	a
 545  0213 cd0000        	call	_CAN_ReadData
 550  0216 cc02ea        	jp	LC005
 553  0219               L341:
 554                     ; 357 				if (LINSlave==TRUE)
 556  0219 c60000        	ld	a,_LINSlave
 557  021c 4a            	dec	a
 558  021d 2703cc02fb    	jrne	L102
 559                     ; 360 					WRITE_SLAVE_RV1_TRIMMER_LSB(Data0);
 561  0222 3b0000        	push	L3_Data0
 562  0225 ae0303        	ldw	x,#771
 563  0228 cd0000        	call	_LIN_WriteData
 565  022b 84            	pop	a
 566                     ; 361 					WRITE_SLAVE_RV1_TRIMMER_MSB(Data1);
 568  022c 3b0001        	push	L5_Data1
 569  022f ae0302        	ldw	x,#770
 570  0232 cd0000        	call	_LIN_WriteData
 572  0235 84            	pop	a
 573                     ; 362 					L99PM62drv_SetPWMDutyCycle(L99PM62DRV_MASK_PWM1,motorDuty1/2.0);
 575  0236 c60002        	ld	a,L7_motorDuty1
 576  0239 5f            	clrw	x
 577  023a 97            	ld	xl,a
 578  023b cd0000        	call	c_itof
 580  023e ae0000        	ldw	x,#L301
 581  0241 cd0000        	call	c_fdiv
 583  0244 cd0000        	call	c_ftol
 585  0247 b603          	ld	a,c_lreg+3
 586  0249 ae0100        	ldw	x,#256
 587  024c 97            	ld	xl,a
 588  024d cd0000        	call	_L99PM62drv_SetPWMDutyCycle
 590                     ; 365 					if (UserButton1Status()) 
 592  0250 cd03d3        	call	L51_UserButton1Status
 594  0253 4d            	tnz	a
 595  0254 270e          	jreq	L302
 596                     ; 367 						WRITE_SLAVE_USER1_BUTTON(TRUE);
 598  0256 4b01          	push	#1
 599  0258 ae0300        	ldw	x,#768
 600  025b cd0000        	call	_LIN_WriteData
 602  025e 84            	pop	a
 603                     ; 368 						IncrementStatus();			
 605  025f cd03ed        	call	L12_IncrementStatus
 608  0262 2009          	jra	L502
 609  0264               L302:
 610                     ; 372 						WRITE_SLAVE_USER1_BUTTON(FALSE);		
 612  0264 4b00          	push	#0
 613  0266 ae0300        	ldw	x,#768
 614  0269 cd0000        	call	_LIN_WriteData
 616  026c 84            	pop	a
 617  026d               L502:
 618                     ; 376 					if (UserButton2Status())
 620  026d cd03e0        	call	L71_UserButton2Status
 622  0270 4d            	tnz	a
 623  0271 270e          	jreq	L702
 624                     ; 378 						WRITE_SLAVE_USER2_BUTTON(TRUE);
 626  0273 4b01          	push	#1
 627  0275 ae0301        	ldw	x,#769
 628  0278 cd0000        	call	_LIN_WriteData
 630  027b 84            	pop	a
 631                     ; 379 						DecrementStatus();
 633  027c cd0418        	call	L32_DecrementStatus
 636  027f 2009          	jra	L112
 637  0281               L702:
 638                     ; 383 						WRITE_SLAVE_USER2_BUTTON(FALSE);			
 640  0281 4b00          	push	#0
 641  0283 ae0301        	ldw	x,#769
 642  0286 cd0000        	call	_LIN_WriteData
 644  0289 84            	pop	a
 645  028a               L112:
 646                     ; 385 					if(!ErrorState)
 648  028a c60000        	ld	a,_ErrorState
 649  028d 2703cc03d1    	jrne	L75
 650                     ; 388 						if (READ_SLAVE_LD4_GREEN_LED) LD4_GREEN_LED_ON; else LD4_GREEN_LED_OFF;
 652  0292 5f            	clrw	x
 653  0293 cd0000        	call	_LIN_ReadData
 655  0296 4d            	tnz	a
 656  0297 270a          	jreq	L512
 659  0299 4b08          	push	#8
 660  029b ae500f        	ldw	x,#20495
 661  029e cd0000        	call	_GPIO_WriteHigh
 664  02a1 2008          	jra	L712
 665  02a3               L512:
 668  02a3 4b08          	push	#8
 669  02a5 ae500f        	ldw	x,#20495
 670  02a8 cd0000        	call	_GPIO_WriteLow
 672  02ab               L712:
 673  02ab ae0001        	ldw	x,#1
 674  02ae 84            	pop	a
 675                     ; 389 						if (READ_SLAVE_LD5_GREEN_LED) LD5_GREEN_LED_ON; else LD5_GREEN_LED_OFF;
 677  02af cd0000        	call	_LIN_ReadData
 679  02b2 4d            	tnz	a
 680  02b3 270a          	jreq	L122
 683  02b5 4b01          	push	#1
 684  02b7 ae500f        	ldw	x,#20495
 685  02ba cd0000        	call	_GPIO_WriteHigh
 688  02bd 2008          	jra	L322
 689  02bf               L122:
 692  02bf 4b01          	push	#1
 693  02c1 ae500f        	ldw	x,#20495
 694  02c4 cd0000        	call	_GPIO_WriteLow
 696  02c7               L322:
 697  02c7 ae0002        	ldw	x,#2
 698  02ca 84            	pop	a
 699                     ; 390 						if (READ_SLAVE_LD6_GREEN_LED) LD6_GREEN_LED_ON; else LD6_GREEN_LED_OFF;
 701  02cb cd0000        	call	_LIN_ReadData
 703  02ce 4d            	tnz	a
 704  02cf 270a          	jreq	L522
 707  02d1 4b08          	push	#8
 708  02d3 ae5014        	ldw	x,#20500
 709  02d6 cd0000        	call	_GPIO_WriteHigh
 712  02d9 2008          	jra	L722
 713  02db               L522:
 716  02db 4b08          	push	#8
 717  02dd ae5014        	ldw	x,#20500
 718  02e0 cd0000        	call	_GPIO_WriteLow
 720  02e3               L722:
 721  02e3 ae0003        	ldw	x,#3
 722  02e6 84            	pop	a
 723                     ; 391 						if (READ_SLAVE_LD7_GREEN_LED) LD7_GREEN_LED_ON; else LD7_GREEN_LED_OFF;
 725  02e7 cd0000        	call	_LIN_ReadData
 727  02ea               LC005:
 728  02ea 4d            	tnz	a
 729  02eb 2603cc03c8    	jreq	L562
 732  02f0               LC003:
 736  02f0 4b08          	push	#8
 737  02f2 ae500a        	ldw	x,#20490
 738  02f5 cd0000        	call	_GPIO_WriteHigh
 741  02f8 cc03d0        	jp	LC001
 744  02fb               L102:
 745                     ; 397 					WRITE_MASTER_RV1_TRIMMER_LSB(Data0);
 747  02fb 3b0000        	push	L3_Data0
 748  02fe ae0203        	ldw	x,#515
 749  0301 cd0000        	call	_LIN_WriteData
 751  0304 84            	pop	a
 752                     ; 398 					WRITE_MASTER_RV1_TRIMMER_MSB(Data1);
 754  0305 3b0001        	push	L5_Data1
 755  0308 ae0202        	ldw	x,#514
 756  030b cd0000        	call	_LIN_WriteData
 758  030e 84            	pop	a
 759                     ; 399 					L99PM62drv_SetPWMDutyCycle(L99PM62DRV_MASK_PWM1,motorDuty1/2.0);
 761  030f c60002        	ld	a,L7_motorDuty1
 762  0312 5f            	clrw	x
 763  0313 97            	ld	xl,a
 764  0314 cd0000        	call	c_itof
 766  0317 ae0000        	ldw	x,#L301
 767  031a cd0000        	call	c_fdiv
 769  031d cd0000        	call	c_ftol
 771  0320 b603          	ld	a,c_lreg+3
 772  0322 ae0100        	ldw	x,#256
 773  0325 97            	ld	xl,a
 774  0326 cd0000        	call	_L99PM62drv_SetPWMDutyCycle
 776                     ; 402 					if (UserButton1Status()) 
 778  0329 cd03d3        	call	L51_UserButton1Status
 780  032c 4d            	tnz	a
 781  032d 270e          	jreq	L732
 782                     ; 404 						WRITE_MASTER_USER1_BUTTON(TRUE);
 784  032f 4b01          	push	#1
 785  0331 ae0200        	ldw	x,#512
 786  0334 cd0000        	call	_LIN_WriteData
 788  0337 84            	pop	a
 789                     ; 405 						IncrementStatus();			
 791  0338 cd03ed        	call	L12_IncrementStatus
 794  033b 2009          	jra	L142
 795  033d               L732:
 796                     ; 409 						WRITE_MASTER_USER1_BUTTON(FALSE);		
 798  033d 4b00          	push	#0
 799  033f ae0200        	ldw	x,#512
 800  0342 cd0000        	call	_LIN_WriteData
 802  0345 84            	pop	a
 803  0346               L142:
 804                     ; 413 					if (UserButton2Status())
 806  0346 cd03e0        	call	L71_UserButton2Status
 808  0349 4d            	tnz	a
 809  034a 270e          	jreq	L342
 810                     ; 415 						WRITE_MASTER_USER2_BUTTON(TRUE);
 812  034c 4b01          	push	#1
 813  034e ae0201        	ldw	x,#513
 814  0351 cd0000        	call	_LIN_WriteData
 816  0354 84            	pop	a
 817                     ; 416 						DecrementStatus();
 819  0355 cd0418        	call	L32_DecrementStatus
 822  0358 2009          	jra	L542
 823  035a               L342:
 824                     ; 420 						WRITE_MASTER_USER2_BUTTON(FALSE);			
 826  035a 4b00          	push	#0
 827  035c ae0201        	ldw	x,#513
 828  035f cd0000        	call	_LIN_WriteData
 830  0362 84            	pop	a
 831  0363               L542:
 832                     ; 422 					if(!ErrorState)
 834  0363 c60000        	ld	a,_ErrorState
 835  0366 2669          	jrne	L75
 836                     ; 425 						if (READ_MASTER_LD4_GREEN_LED) LD4_GREEN_LED_ON; else LD4_GREEN_LED_OFF;
 838  0368 ae0100        	ldw	x,#256
 839  036b cd0000        	call	_LIN_ReadData
 841  036e 4d            	tnz	a
 842  036f 270a          	jreq	L152
 845  0371 4b08          	push	#8
 846  0373 ae500f        	ldw	x,#20495
 847  0376 cd0000        	call	_GPIO_WriteHigh
 850  0379 2008          	jra	L352
 851  037b               L152:
 854  037b 4b08          	push	#8
 855  037d ae500f        	ldw	x,#20495
 856  0380 cd0000        	call	_GPIO_WriteLow
 858  0383               L352:
 859  0383 ae0101        	ldw	x,#257
 860  0386 84            	pop	a
 861                     ; 426 						if (READ_MASTER_LD5_GREEN_LED) LD5_GREEN_LED_ON; else LD5_GREEN_LED_OFF;
 863  0387 cd0000        	call	_LIN_ReadData
 865  038a 4d            	tnz	a
 866  038b 270a          	jreq	L552
 869  038d 4b01          	push	#1
 870  038f ae500f        	ldw	x,#20495
 871  0392 cd0000        	call	_GPIO_WriteHigh
 874  0395 2008          	jra	L752
 875  0397               L552:
 878  0397 4b01          	push	#1
 879  0399 ae500f        	ldw	x,#20495
 880  039c cd0000        	call	_GPIO_WriteLow
 882  039f               L752:
 883  039f ae0102        	ldw	x,#258
 884  03a2 84            	pop	a
 885                     ; 427 						if (READ_MASTER_LD6_GREEN_LED) LD6_GREEN_LED_ON; else LD6_GREEN_LED_OFF;
 887  03a3 cd0000        	call	_LIN_ReadData
 889  03a6 4d            	tnz	a
 890  03a7 270a          	jreq	L162
 893  03a9 4b08          	push	#8
 894  03ab ae5014        	ldw	x,#20500
 895  03ae cd0000        	call	_GPIO_WriteHigh
 898  03b1 2008          	jra	L362
 899  03b3               L162:
 902  03b3 4b08          	push	#8
 903  03b5 ae5014        	ldw	x,#20500
 904  03b8 cd0000        	call	_GPIO_WriteLow
 906  03bb               L362:
 907  03bb ae0103        	ldw	x,#259
 908  03be 84            	pop	a
 909                     ; 428 						if (READ_MASTER_LD7_GREEN_LED) LD7_GREEN_LED_ON; else LD7_GREEN_LED_OFF;
 911  03bf cd0000        	call	_LIN_ReadData
 913  03c2 4d            	tnz	a
 917  03c3 2703cc02f0    	jrne	LC003
 918  03c8               L562:
 924  03c8 4b08          	push	#8
 925  03ca ae500a        	ldw	x,#20490
 926  03cd cd0000        	call	_GPIO_WriteLow
 928  03d0               LC001:
 929  03d0 84            	pop	a
 930  03d1               L75:
 931                     ; 437 }
 934  03d1 84            	pop	a
 935  03d2 81            	ret	
 980                     ; 448 bool UserButton1Status(void)
 980                     ; 449 {
 981                     	switch	.text
 982  03d3               L51_UserButton1Status:
 986                     ; 451 	if (UserButton1==TRUE)
 988  03d3 c60001        	ld	a,_UserButton1
 989  03d6 4a            	dec	a
 990  03d7 2605          	jrne	L113
 991                     ; 453 		UserButton1=FALSE;
 993  03d9 c70001        	ld	_UserButton1,a
 994                     ; 454 		return(TRUE);
 996  03dc 4c            	inc	a
 999  03dd 81            	ret	
1000  03de               L113:
1001                     ; 458 		return(FALSE);
1003  03de 4f            	clr	a
1006  03df 81            	ret	
1031                     ; 471 bool UserButton2Status(void)
1031                     ; 472 {
1032                     	switch	.text
1033  03e0               L71_UserButton2Status:
1037                     ; 474 	if (UserButton2==TRUE)
1039  03e0 c60000        	ld	a,_UserButton2
1040  03e3 4a            	dec	a
1041  03e4 2605          	jrne	L523
1042                     ; 476 		UserButton2=FALSE;
1044  03e6 c70000        	ld	_UserButton2,a
1045                     ; 477 		return(TRUE);
1047  03e9 4c            	inc	a
1050  03ea 81            	ret	
1051  03eb               L523:
1052                     ; 481 		return(FALSE);
1054  03eb 4f            	clr	a
1057  03ec 81            	ret	
1086                     ; 493 void IncrementStatus(void)
1086                     ; 494 {	
1087                     	switch	.text
1088  03ed               L12_IncrementStatus:
1092                     ; 495 	if (BarStatus<4)
1094  03ed c60003        	ld	a,L11_BarStatus
1095  03f0 a104          	cp	a,#4
1096  03f2 2423          	jruge	L143
1097                     ; 497 		BarStatus++;
1099  03f4 725c0003      	inc	L11_BarStatus
1100                     ; 498 		if ((TransmissionEnable==TRUE)&&(CANMaster==TRUE)) UpdateSlaveLedStatus(); /* CAN "Master" test mode */
1102  03f8 c60000        	ld	a,_TransmissionEnable
1103  03fb 4a            	dec	a
1104  03fc 2609          	jrne	L343
1106  03fe c60000        	ld	a,_CANMaster
1107  0401 4a            	dec	a
1108  0402 2603          	jrne	L343
1114  0404 cc05b0        	jp	L13_UpdateSlaveLedStatus
1115  0407               L343:
1116                     ; 499 		else if ((TransmissionEnable==TRUE)&&(CANMaster==FALSE)) UpdateMasterLedStatus(); /* CAN "Slave" tes mode */
1118  0407 c60000        	ld	a,_TransmissionEnable
1119  040a 4a            	dec	a
1120  040b 2608          	jrne	L743
1122  040d c60000        	ld	a,_CANMaster
1123  0410 2603          	jrne	L743
1129  0412 cc0534        	jp	L72_UpdateMasterLedStatus
1130  0415               L743:
1131                     ; 500 		else UpdateBarStatus(); /* LIN Master demo or test mode */
1133  0415 ad2a          	call	L52_UpdateBarStatus
1135  0417               L143:
1136                     ; 503 }
1139  0417 81            	ret	
1168                     ; 512 void DecrementStatus(void)
1168                     ; 513 {	
1169                     	switch	.text
1170  0418               L32_DecrementStatus:
1174                     ; 514 	if (BarStatus>0)
1176  0418 c60003        	ld	a,L11_BarStatus
1177  041b 2723          	jreq	L363
1178                     ; 516 		BarStatus--;
1180  041d 725a0003      	dec	L11_BarStatus
1181                     ; 517 		if ((TransmissionEnable==TRUE)&&(CANMaster==TRUE)) UpdateSlaveLedStatus(); /* CAN "Master" test mode */
1183  0421 c60000        	ld	a,_TransmissionEnable
1184  0424 4a            	dec	a
1185  0425 2609          	jrne	L563
1187  0427 c60000        	ld	a,_CANMaster
1188  042a 4a            	dec	a
1189  042b 2603          	jrne	L563
1195  042d cc05b0        	jp	L13_UpdateSlaveLedStatus
1196  0430               L563:
1197                     ; 518 		else if ((TransmissionEnable==TRUE)&&(CANMaster==FALSE)) UpdateMasterLedStatus(); /* CAN "Slave" test mode */
1199  0430 c60000        	ld	a,_TransmissionEnable
1200  0433 4a            	dec	a
1201  0434 2608          	jrne	L173
1203  0436 c60000        	ld	a,_CANMaster
1204  0439 2603          	jrne	L173
1210  043b cc0534        	jp	L72_UpdateMasterLedStatus
1211  043e               L173:
1212                     ; 519 		else UpdateBarStatus(); /* LIN Master demo or test mode */
1214  043e ad01          	call	L52_UpdateBarStatus
1216  0440               L363:
1217                     ; 522 }
1220  0440 81            	ret	
1246                     ; 532 void UpdateBarStatus(void)
1246                     ; 533 {
1247                     	switch	.text
1248  0441               L52_UpdateBarStatus:
1252                     ; 536 	if (LINSlave==TRUE)
1254  0441 c60000        	ld	a,_LINSlave
1255  0444 4a            	dec	a
1256  0445 2679          	jrne	L534
1257                     ; 538 		switch (BarStatus)
1259  0447 c60003        	ld	a,L11_BarStatus
1261                     ; 580 				break;
1262  044a 270c          	jreq	L573
1263  044c 4a            	dec	a
1264  044d 270d          	jreq	L773
1265  044f 4a            	dec	a
1266  0450 2729          	jreq	L104
1267  0452 4a            	dec	a
1268  0453 2733          	jreq	L304
1269  0455 4a            	dec	a
1270  0456 2746          	jreq	L504
1271                     ; 575 			default:
1271                     ; 576 				WRITE_MASTER_LD4_GREEN_LED(0);
1273                     ; 577 				WRITE_MASTER_LD5_GREEN_LED(0);
1275                     ; 578 				WRITE_MASTER_LD6_GREEN_LED(0);
1277                     ; 579 				WRITE_MASTER_LD7_GREEN_LED(0);
1279                     ; 580 				break;
1281  0458               L573:
1282                     ; 540 			case 0:
1282                     ; 541 				WRITE_MASTER_LD4_GREEN_LED(0);
1285  0458 4b00          	push	#0
1287                     ; 542 				WRITE_MASTER_LD5_GREEN_LED(0);
1289                     ; 543 				WRITE_MASTER_LD6_GREEN_LED(0);
1291                     ; 544 				WRITE_MASTER_LD7_GREEN_LED(0);
1293                     ; 545 				break;
1295  045a 2002          	jp	LC015
1296  045c               L773:
1297                     ; 547 			case 1:
1297                     ; 548 				WRITE_MASTER_LD4_GREEN_LED(1);
1299  045c 4b01          	push	#1
1301                     ; 549 				WRITE_MASTER_LD5_GREEN_LED(0);
1303  045e               LC015:
1304  045e ae0100        	ldw	x,#256
1305  0461 cd0000        	call	_LIN_WriteData
1306  0464 84            	pop	a
1309  0465 4b00          	push	#0
1311                     ; 550 				WRITE_MASTER_LD6_GREEN_LED(0);
1313  0467               LC014:
1314  0467 ae0101        	ldw	x,#257
1315  046a cd0000        	call	_LIN_WriteData
1316  046d 84            	pop	a
1320  046e 4b00          	push	#0
1322                     ; 551 				WRITE_MASTER_LD7_GREEN_LED(0);
1324  0470               LC013:
1325  0470 ae0102        	ldw	x,#258
1326  0473 cd0000        	call	_LIN_WriteData
1327  0476 84            	pop	a
1332  0477 4b00          	push	#0
1334                     ; 552 				break;
1336  0479 2040          	jp	LC012
1337  047b               L104:
1338                     ; 554 			case 2:
1338                     ; 555 				WRITE_MASTER_LD4_GREEN_LED(1);
1340  047b 4b01          	push	#1
1341  047d ae0100        	ldw	x,#256
1342  0480 cd0000        	call	_LIN_WriteData
1344  0483 84            	pop	a
1345                     ; 556 				WRITE_MASTER_LD5_GREEN_LED(1);
1347  0484 4b01          	push	#1
1349                     ; 557 				WRITE_MASTER_LD6_GREEN_LED(0);
1351                     ; 558 				WRITE_MASTER_LD7_GREEN_LED(0);
1353                     ; 559 				break;
1355  0486 20df          	jp	LC014
1356  0488               L304:
1357                     ; 561 			case 3:
1357                     ; 562 				WRITE_MASTER_LD4_GREEN_LED(1);
1359  0488 4b01          	push	#1
1360  048a ae0100        	ldw	x,#256
1361  048d cd0000        	call	_LIN_WriteData
1363  0490 84            	pop	a
1364                     ; 563 				WRITE_MASTER_LD5_GREEN_LED(1);
1366  0491 4b01          	push	#1
1367  0493 ae0101        	ldw	x,#257
1368  0496 cd0000        	call	_LIN_WriteData
1370  0499 84            	pop	a
1371                     ; 564 				WRITE_MASTER_LD6_GREEN_LED(1);
1373  049a 4b01          	push	#1
1375                     ; 565 				WRITE_MASTER_LD7_GREEN_LED(0);
1377                     ; 566 				break;		
1379  049c 20d2          	jp	LC013
1380  049e               L504:
1381                     ; 568 			case 4:
1381                     ; 569 				WRITE_MASTER_LD4_GREEN_LED(1);
1383  049e 4b01          	push	#1
1384  04a0 ae0100        	ldw	x,#256
1385  04a3 cd0000        	call	_LIN_WriteData
1387  04a6 84            	pop	a
1388                     ; 570 				WRITE_MASTER_LD5_GREEN_LED(1);
1390  04a7 4b01          	push	#1
1391  04a9 ae0101        	ldw	x,#257
1392  04ac cd0000        	call	_LIN_WriteData
1394  04af 84            	pop	a
1395                     ; 571 				WRITE_MASTER_LD6_GREEN_LED(1);
1397  04b0 4b01          	push	#1
1398  04b2 ae0102        	ldw	x,#258
1399  04b5 cd0000        	call	_LIN_WriteData
1401  04b8 84            	pop	a
1402                     ; 572 				WRITE_MASTER_LD7_GREEN_LED(1);
1404  04b9 4b01          	push	#1
1405  04bb               LC012:
1406  04bb ae0103        	ldw	x,#259
1408                     ; 573 				break;			
1410  04be 202f          	jra	L344
1411                     ; 580 				break;
1412  04c0               L534:
1413                     ; 587 		switch (BarStatus)
1415  04c0 c60003        	ld	a,L11_BarStatus
1417                     ; 629 				break;
1418  04c3 270c          	jreq	L114
1419  04c5 4a            	dec	a
1420  04c6 272c          	jreq	L314
1421  04c8 4a            	dec	a
1422  04c9 272d          	jreq	L514
1423  04cb 4a            	dec	a
1424  04cc 2735          	jreq	L714
1425  04ce 4a            	dec	a
1426  04cf 2746          	jreq	L124
1427                     ; 624 			default:
1427                     ; 625 				WRITE_STM8AL_BAR0(0);
1429                     ; 626 				WRITE_STM8AL_BAR1(0);
1431                     ; 627 				WRITE_STM8AL_BAR2(0);
1433                     ; 628 				WRITE_STM8AL_BAR3(0);
1435                     ; 629 				break;
1437  04d1               L114:
1438                     ; 589 			case 0:
1438                     ; 590 				WRITE_STM8AL_BAR0(0);
1441  04d1 4b00          	push	#0
1443                     ; 591 				WRITE_STM8AL_BAR1(0);
1445  04d3               LC010:
1446  04d3 5f            	clrw	x
1447  04d4 cd0000        	call	_LIN_WriteData
1448  04d7 84            	pop	a
1451  04d8 4b00          	push	#0
1453                     ; 592 				WRITE_STM8AL_BAR2(0);
1455  04da               LC009:
1456  04da ae0001        	ldw	x,#1
1457  04dd cd0000        	call	_LIN_WriteData
1458  04e0 84            	pop	a
1462  04e1 4b00          	push	#0
1464                     ; 593 				WRITE_STM8AL_BAR3(0);
1466  04e3               LC008:
1467  04e3 ae0002        	ldw	x,#2
1468  04e6 cd0000        	call	_LIN_WriteData
1469  04e9 84            	pop	a
1474  04ea 4b00          	push	#0
1475  04ec               LC007:
1476  04ec ae0003        	ldw	x,#3
1478                     ; 594 				break;
1479  04ef               L344:
1480  04ef cd0000        	call	_LIN_WriteData
1481  04f2 84            	pop	a
1482                     ; 632 }
1485  04f3 81            	ret	
1486  04f4               L314:
1487                     ; 596 			case 1:
1487                     ; 597 				WRITE_STM8AL_BAR0(1);
1489  04f4 4b01          	push	#1
1491                     ; 598 				WRITE_STM8AL_BAR1(0);
1493                     ; 599 				WRITE_STM8AL_BAR2(0);
1495                     ; 600 				WRITE_STM8AL_BAR3(0);
1497                     ; 601 				break;
1499  04f6 20db          	jp	LC010
1500  04f8               L514:
1501                     ; 603 			case 2:
1501                     ; 604 				WRITE_STM8AL_BAR0(1);
1503  04f8 4b01          	push	#1
1504  04fa 5f            	clrw	x
1505  04fb cd0000        	call	_LIN_WriteData
1507  04fe 84            	pop	a
1508                     ; 605 				WRITE_STM8AL_BAR1(1);
1510  04ff 4b01          	push	#1
1512                     ; 606 				WRITE_STM8AL_BAR2(0);
1514                     ; 607 				WRITE_STM8AL_BAR3(0);
1516                     ; 608 				break;
1518  0501 20d7          	jp	LC009
1519  0503               L714:
1520                     ; 610 			case 3:
1520                     ; 611 				WRITE_STM8AL_BAR0(1);
1522  0503 4b01          	push	#1
1523  0505 5f            	clrw	x
1524  0506 cd0000        	call	_LIN_WriteData
1526  0509 84            	pop	a
1527                     ; 612 				WRITE_STM8AL_BAR1(1);
1529  050a 4b01          	push	#1
1530  050c ae0001        	ldw	x,#1
1531  050f cd0000        	call	_LIN_WriteData
1533  0512 84            	pop	a
1534                     ; 613 				WRITE_STM8AL_BAR2(1);
1536  0513 4b01          	push	#1
1538                     ; 614 				WRITE_STM8AL_BAR3(0);
1540                     ; 615 				break;		
1542  0515 20cc          	jp	LC008
1543  0517               L124:
1544                     ; 617 			case 4:
1544                     ; 618 				WRITE_STM8AL_BAR0(1);
1546  0517 4b01          	push	#1
1547  0519 5f            	clrw	x
1548  051a cd0000        	call	_LIN_WriteData
1550  051d 84            	pop	a
1551                     ; 619 				WRITE_STM8AL_BAR1(1);
1553  051e 4b01          	push	#1
1554  0520 ae0001        	ldw	x,#1
1555  0523 cd0000        	call	_LIN_WriteData
1557  0526 84            	pop	a
1558                     ; 620 				WRITE_STM8AL_BAR2(1);
1560  0527 4b01          	push	#1
1561  0529 ae0002        	ldw	x,#2
1562  052c cd0000        	call	_LIN_WriteData
1564  052f 84            	pop	a
1565                     ; 621 				WRITE_STM8AL_BAR3(1);
1567  0530 4b01          	push	#1
1569                     ; 622 				break;			
1571  0532 20b8          	jp	LC007
1597                     ; 635 void UpdateMasterLedStatus(void)
1597                     ; 636 {
1598                     	switch	.text
1599  0534               L72_UpdateMasterLedStatus:
1603                     ; 638 	switch (BarStatus)
1605  0534 c60003        	ld	a,L11_BarStatus
1607                     ; 680 			break;
1608  0537 270c          	jreq	L154
1609  0539 4a            	dec	a
1610  053a 270d          	jreq	L354
1611  053c 4a            	dec	a
1612  053d 2720          	jreq	L554
1613  053f 4a            	dec	a
1614  0540 272a          	jreq	L754
1615  0542 4a            	dec	a
1616  0543 2746          	jreq	L164
1617                     ; 675 		default:
1617                     ; 676 			WRITE_CAN_MASTER_LD4_GREEN_LED(0);
1619                     ; 677 			WRITE_CAN_MASTER_LD5_GREEN_LED(0);
1621                     ; 678 			WRITE_CAN_MASTER_LD6_GREEN_LED(0);
1623                     ; 679 			WRITE_CAN_MASTER_LD7_GREEN_LED(0);
1625                     ; 680 			break;
1627  0545               L154:
1628                     ; 640 		case 0:
1628                     ; 641 			WRITE_CAN_MASTER_LD4_GREEN_LED(0);
1631  0545 4b00          	push	#0
1633                     ; 642 			WRITE_CAN_MASTER_LD5_GREEN_LED(0);
1635                     ; 643 			WRITE_CAN_MASTER_LD6_GREEN_LED(0);
1637                     ; 644 			WRITE_CAN_MASTER_LD7_GREEN_LED(0);
1639                     ; 645 			break;
1641  0547 2002          	jp	LC019
1642  0549               L354:
1643                     ; 647 		case 1:
1643                     ; 648 			WRITE_CAN_MASTER_LD4_GREEN_LED(1);
1645  0549 4b01          	push	#1
1647                     ; 649 			WRITE_CAN_MASTER_LD5_GREEN_LED(0);
1649  054b               LC019:
1650  054b ae0100        	ldw	x,#256
1651  054e cd0000        	call	_CAN_WriteData
1652  0551 84            	pop	a
1655  0552 4b00          	push	#0
1657                     ; 650 			WRITE_CAN_MASTER_LD6_GREEN_LED(0);
1659  0554               LC018:
1660  0554 ae0101        	ldw	x,#257
1661  0557 cd0000        	call	_CAN_WriteData
1662  055a 84            	pop	a
1666  055b 4b00          	push	#0
1668                     ; 651 			WRITE_CAN_MASTER_LD7_GREEN_LED(0);
1670                     ; 652 			break;
1672  055d 2021          	jp	LC017
1673  055f               L554:
1674                     ; 654 		case 2:
1674                     ; 655 			WRITE_CAN_MASTER_LD4_GREEN_LED(1);
1676  055f 4b01          	push	#1
1677  0561 ae0100        	ldw	x,#256
1678  0564 cd0000        	call	_CAN_WriteData
1680  0567 84            	pop	a
1681                     ; 656 			WRITE_CAN_MASTER_LD5_GREEN_LED(1);
1683  0568 4b01          	push	#1
1685                     ; 657 			WRITE_CAN_MASTER_LD6_GREEN_LED(0);
1687                     ; 658 			WRITE_CAN_MASTER_LD7_GREEN_LED(0);
1689                     ; 659 			break;
1691  056a 20e8          	jp	LC018
1692  056c               L754:
1693                     ; 661 		case 3:
1693                     ; 662 			WRITE_CAN_MASTER_LD4_GREEN_LED(1);
1695  056c 4b01          	push	#1
1696  056e ae0100        	ldw	x,#256
1697  0571 cd0000        	call	_CAN_WriteData
1699  0574 84            	pop	a
1700                     ; 663 			WRITE_CAN_MASTER_LD5_GREEN_LED(1);
1702  0575 4b01          	push	#1
1703  0577 ae0101        	ldw	x,#257
1704  057a cd0000        	call	_CAN_WriteData
1706  057d 84            	pop	a
1707                     ; 664 			WRITE_CAN_MASTER_LD6_GREEN_LED(1);
1709  057e 4b01          	push	#1
1711                     ; 665 			WRITE_CAN_MASTER_LD7_GREEN_LED(0);
1713  0580               LC017:
1714  0580 ae0102        	ldw	x,#258
1715  0583 cd0000        	call	_CAN_WriteData
1716  0586 84            	pop	a
1721  0587 4b00          	push	#0
1723                     ; 666 			break;		
1725  0589 201d          	jra	L774
1726  058b               L164:
1727                     ; 668 		case 4:
1727                     ; 669 			WRITE_CAN_MASTER_LD4_GREEN_LED(1);
1729  058b 4b01          	push	#1
1730  058d ae0100        	ldw	x,#256
1731  0590 cd0000        	call	_CAN_WriteData
1733  0593 84            	pop	a
1734                     ; 670 			WRITE_CAN_MASTER_LD5_GREEN_LED(1);
1736  0594 4b01          	push	#1
1737  0596 ae0101        	ldw	x,#257
1738  0599 cd0000        	call	_CAN_WriteData
1740  059c 84            	pop	a
1741                     ; 671 			WRITE_CAN_MASTER_LD6_GREEN_LED(1);
1743  059d 4b01          	push	#1
1744  059f ae0102        	ldw	x,#258
1745  05a2 cd0000        	call	_CAN_WriteData
1747  05a5 84            	pop	a
1748                     ; 672 			WRITE_CAN_MASTER_LD7_GREEN_LED(1);
1750  05a6 4b01          	push	#1
1752                     ; 673 			break;			
1754  05a8               L774:
1755  05a8 ae0103        	ldw	x,#259
1756  05ab cd0000        	call	_CAN_WriteData
1757  05ae 84            	pop	a
1758                     ; 682 }
1761  05af 81            	ret	
1787                     ; 684 void UpdateSlaveLedStatus(void)
1787                     ; 685 {
1788                     	switch	.text
1789  05b0               L13_UpdateSlaveLedStatus:
1793                     ; 687 	switch (BarStatus)
1795  05b0 c60003        	ld	a,L11_BarStatus
1797                     ; 729 			break;
1798  05b3 270c          	jreq	L105
1799  05b5 4a            	dec	a
1800  05b6 270d          	jreq	L305
1801  05b8 4a            	dec	a
1802  05b9 271e          	jreq	L505
1803  05bb 4a            	dec	a
1804  05bc 2726          	jreq	L705
1805  05be 4a            	dec	a
1806  05bf 2740          	jreq	L115
1807                     ; 724 		default:
1807                     ; 725 			WRITE_CAN_SLAVE_LD4_GREEN_LED(0);
1809                     ; 726 			WRITE_CAN_SLAVE_LD5_GREEN_LED(0);
1811                     ; 727 			WRITE_CAN_SLAVE_LD6_GREEN_LED(0);
1813                     ; 728 			WRITE_CAN_SLAVE_LD7_GREEN_LED(0);
1815                     ; 729 			break;
1817  05c1               L105:
1818                     ; 689 		case 0:
1818                     ; 690 			WRITE_CAN_SLAVE_LD4_GREEN_LED(0);
1821  05c1 4b00          	push	#0
1823                     ; 691 			WRITE_CAN_SLAVE_LD5_GREEN_LED(0);
1825                     ; 692 			WRITE_CAN_SLAVE_LD6_GREEN_LED(0);
1827                     ; 693 			WRITE_CAN_SLAVE_LD7_GREEN_LED(0);
1829                     ; 694 			break;
1831  05c3 2002          	jp	LC023
1832  05c5               L305:
1833                     ; 696 		case 1:
1833                     ; 697 			WRITE_CAN_SLAVE_LD4_GREEN_LED(1);
1835  05c5 4b01          	push	#1
1837                     ; 698 			WRITE_CAN_SLAVE_LD5_GREEN_LED(0);
1839  05c7               LC023:
1840  05c7 5f            	clrw	x
1841  05c8 cd0000        	call	_CAN_WriteData
1842  05cb 84            	pop	a
1845  05cc 4b00          	push	#0
1847                     ; 699 			WRITE_CAN_SLAVE_LD6_GREEN_LED(0);
1849  05ce               LC022:
1850  05ce ae0001        	ldw	x,#1
1851  05d1 cd0000        	call	_CAN_WriteData
1852  05d4 84            	pop	a
1856  05d5 4b00          	push	#0
1858                     ; 700 			WRITE_CAN_SLAVE_LD7_GREEN_LED(0);
1860                     ; 701 			break;
1862  05d7 201d          	jp	LC021
1863  05d9               L505:
1864                     ; 703 		case 2:
1864                     ; 704 			WRITE_CAN_SLAVE_LD4_GREEN_LED(1);
1866  05d9 4b01          	push	#1
1867  05db 5f            	clrw	x
1868  05dc cd0000        	call	_CAN_WriteData
1870  05df 84            	pop	a
1871                     ; 705 			WRITE_CAN_SLAVE_LD5_GREEN_LED(1);
1873  05e0 4b01          	push	#1
1875                     ; 706 			WRITE_CAN_SLAVE_LD6_GREEN_LED(0);
1877                     ; 707 			WRITE_CAN_SLAVE_LD7_GREEN_LED(0);
1879                     ; 708 			break;
1881  05e2 20ea          	jp	LC022
1882  05e4               L705:
1883                     ; 710 		case 3:
1883                     ; 711 			WRITE_CAN_SLAVE_LD4_GREEN_LED(1);
1885  05e4 4b01          	push	#1
1886  05e6 5f            	clrw	x
1887  05e7 cd0000        	call	_CAN_WriteData
1889  05ea 84            	pop	a
1890                     ; 712 			WRITE_CAN_SLAVE_LD5_GREEN_LED(1);
1892  05eb 4b01          	push	#1
1893  05ed ae0001        	ldw	x,#1
1894  05f0 cd0000        	call	_CAN_WriteData
1896  05f3 84            	pop	a
1897                     ; 713 			WRITE_CAN_SLAVE_LD6_GREEN_LED(1);
1899  05f4 4b01          	push	#1
1901                     ; 714 			WRITE_CAN_SLAVE_LD7_GREEN_LED(0);
1903  05f6               LC021:
1904  05f6 ae0002        	ldw	x,#2
1905  05f9 cd0000        	call	_CAN_WriteData
1906  05fc 84            	pop	a
1911  05fd 4b00          	push	#0
1913                     ; 715 			break;		
1915  05ff 201b          	jra	L725
1916  0601               L115:
1917                     ; 717 		case 4:
1917                     ; 718 			WRITE_CAN_SLAVE_LD4_GREEN_LED(1);
1919  0601 4b01          	push	#1
1920  0603 5f            	clrw	x
1921  0604 cd0000        	call	_CAN_WriteData
1923  0607 84            	pop	a
1924                     ; 719 			WRITE_CAN_SLAVE_LD5_GREEN_LED(1);
1926  0608 4b01          	push	#1
1927  060a ae0001        	ldw	x,#1
1928  060d cd0000        	call	_CAN_WriteData
1930  0610 84            	pop	a
1931                     ; 720 			WRITE_CAN_SLAVE_LD6_GREEN_LED(1);
1933  0611 4b01          	push	#1
1934  0613 ae0002        	ldw	x,#2
1935  0616 cd0000        	call	_CAN_WriteData
1937  0619 84            	pop	a
1938                     ; 721 			WRITE_CAN_SLAVE_LD7_GREEN_LED(1);
1940  061a 4b01          	push	#1
1942                     ; 722 			break;			
1944  061c               L725:
1945  061c ae0003        	ldw	x,#3
1946  061f cd0000        	call	_CAN_WriteData
1947  0622 84            	pop	a
1948                     ; 731 }
1951  0623 81            	ret	
1976                     ; 739 void SetAppliTimebaseTick(void)
1976                     ; 740 {
1977                     	switch	.text
1978  0624               _SetAppliTimebaseTick:
1982                     ; 741 	AppliTimebaseTick=TRUE;
1984  0624 35010004      	mov	L31_AppliTimebaseTick,#1
1985                     ; 742 }
1988  0628 81            	ret	
2013                     ; 750 void ClearAppliTimebaseTick(void)
2013                     ; 751 {
2014                     	switch	.text
2015  0629               L33_ClearAppliTimebaseTick:
2019                     ; 752 	AppliTimebaseTick=FALSE;
2021  0629 725f0004      	clr	L31_AppliTimebaseTick
2022                     ; 753 }
2025  062d 81            	ret	
2051                     ; 761 bool TestAppliTimebaseTick(void)
2051                     ; 762 {
2052                     	switch	.text
2053  062e               L53_TestAppliTimebaseTick:
2057                     ; 763 	if (AppliTimebaseTick) return TRUE;
2059  062e c60004        	ld	a,L31_AppliTimebaseTick
2060  0631 2702          	jreq	L165
2063  0633 a601          	ld	a,#1
2066  0635               L165:
2067                     ; 764 	else return FALSE;
2071  0635 81            	ret	
2105                     ; 773 void LED_Display(uint8_t Ledstatus)
2105                     ; 774 {
2106                     	switch	.text
2107  0636               L73_LED_Display:
2111                     ; 776   switch((uint8_t)Ledstatus)
2114                     ; 856 		break;
2115  0636 4d            	tnz	a
2116  0637 2727          	jreq	L565
2117  0639 4a            	dec	a
2118  063a 272e          	jreq	L765
2119  063c 4a            	dec	a
2120  063d 2750          	jreq	L175
2121  063f 4a            	dec	a
2122  0640 2760          	jreq	L375
2123  0642 4a            	dec	a
2124  0643 2779          	jreq	L575
2125  0645 4a            	dec	a
2126  0646 2603cc06ed    	jreq	L775
2127  064b 4a            	dec	a
2128  064c 2603cc0712    	jreq	L106
2129  0651 4a            	dec	a
2130  0652 2603cc0725    	jreq	L306
2131  0657 4a            	dec	a
2132  0658 2603cc0741    	jreq	L506
2133                     ; 850 	default: 
2133                     ; 851 		LD3_RED_LED_OFF;
2135                     ; 852 		LD4_GREEN_LED_OFF;
2137                     ; 853 		LD5_GREEN_LED_OFF;
2139                     ; 854 		LD6_GREEN_LED_OFF;
2141                     ; 855 		LD7_GREEN_LED_ON;
2143                     ; 856 		break;
2145  065d cc06ed        	jp	L775
2146  0660               L565:
2147                     ; 778 	case 0: 
2147                     ; 779 		LD3_RED_LED_OFF;
2149  0660 4b08          	push	#8
2150  0662 ae5000        	ldw	x,#20480
2151  0665 cd0000        	call	_GPIO_WriteLow
2153                     ; 780 		LD4_GREEN_LED_OFF;
2155                     ; 781 		LD5_GREEN_LED_OFF;
2157                     ; 782 		LD6_GREEN_LED_OFF;
2159                     ; 783 		LD7_GREEN_LED_OFF;
2161                     ; 784 		break;
2163  0668 2008          	jp	LC031
2164  066a               L765:
2165                     ; 786 	case 1: 
2165                     ; 787 		LD3_RED_LED_ON;
2167  066a 4b08          	push	#8
2168  066c ae5000        	ldw	x,#20480
2169  066f cd0000        	call	_GPIO_WriteHigh
2171                     ; 788 		LD4_GREEN_LED_OFF;
2173  0672               LC031:
2174  0672 84            	pop	a
2176  0673 4b08          	push	#8
2177  0675 ae500f        	ldw	x,#20495
2178  0678 cd0000        	call	_GPIO_WriteLow
2180                     ; 789 		LD5_GREEN_LED_OFF;
2182  067b               LC030:
2183  067b 84            	pop	a
2186  067c 4b01          	push	#1
2187  067e ae500f        	ldw	x,#20495
2188  0681 cd0000        	call	_GPIO_WriteLow
2190                     ; 790 		LD6_GREEN_LED_OFF;
2192  0684               LC029:
2193  0684 84            	pop	a
2198  0685 4b08          	push	#8
2199  0687 ae5014        	ldw	x,#20500
2200  068a cd0000        	call	_GPIO_WriteLow
2202                     ; 791 		LD7_GREEN_LED_OFF;
2204                     ; 792 		break;
2206  068d 2052          	jp	LC028
2207  068f               L175:
2208                     ; 794 	case 2: 
2208                     ; 795 		LD3_RED_LED_OFF;
2210  068f 4b08          	push	#8
2211  0691 ae5000        	ldw	x,#20480
2212  0694 cd0000        	call	_GPIO_WriteLow
2214  0697 84            	pop	a
2215                     ; 796 		LD4_GREEN_LED_ON;
2217  0698 4b08          	push	#8
2218  069a ae500f        	ldw	x,#20495
2219  069d cd0000        	call	_GPIO_WriteHigh
2221                     ; 797 		LD5_GREEN_LED_OFF;
2223                     ; 798 		LD6_GREEN_LED_OFF;
2225                     ; 799 		LD7_GREEN_LED_OFF;
2227                     ; 800 		break;
2229  06a0 20d9          	jp	LC030
2230  06a2               L375:
2231                     ; 802 	case 3: 
2231                     ; 803 		LD3_RED_LED_OFF;
2233  06a2 4b08          	push	#8
2234  06a4 ae5000        	ldw	x,#20480
2235  06a7 cd0000        	call	_GPIO_WriteLow
2237  06aa 84            	pop	a
2238                     ; 804 		LD4_GREEN_LED_OFF;
2240  06ab 4b08          	push	#8
2241  06ad ae500f        	ldw	x,#20495
2242  06b0 cd0000        	call	_GPIO_WriteLow
2244                     ; 805 		LD5_GREEN_LED_ON;
2246  06b3               LC032:
2247  06b3 84            	pop	a
2249  06b4 4b01          	push	#1
2250  06b6 ae500f        	ldw	x,#20495
2251  06b9 cd0000        	call	_GPIO_WriteHigh
2253                     ; 806 		LD6_GREEN_LED_OFF;
2255                     ; 807 		LD7_GREEN_LED_OFF;
2257                     ; 808 		break;
2259  06bc 20c6          	jp	LC029
2260  06be               L575:
2261                     ; 810 	case 4: 
2261                     ; 811 		LD3_RED_LED_OFF;
2263  06be 4b08          	push	#8
2264  06c0 ae5000        	ldw	x,#20480
2265  06c3 cd0000        	call	_GPIO_WriteLow
2267  06c6 84            	pop	a
2268                     ; 812 		LD4_GREEN_LED_OFF;
2270  06c7 4b08          	push	#8
2271  06c9 ae500f        	ldw	x,#20495
2272  06cc cd0000        	call	_GPIO_WriteLow
2274  06cf 84            	pop	a
2275                     ; 813 		LD5_GREEN_LED_OFF;
2277  06d0 4b01          	push	#1
2278  06d2 ae500f        	ldw	x,#20495
2279  06d5 cd0000        	call	_GPIO_WriteLow
2281  06d8 84            	pop	a
2282                     ; 814 		LD6_GREEN_LED_ON;
2284  06d9 4b08          	push	#8
2285  06db ae5014        	ldw	x,#20500
2286  06de cd0000        	call	_GPIO_WriteHigh
2288                     ; 815 		LD7_GREEN_LED_OFF;
2290  06e1               LC028:
2291  06e1 84            	pop	a
2297  06e2 4b08          	push	#8
2298  06e4 ae500a        	ldw	x,#20490
2299  06e7 cd0000        	call	_GPIO_WriteLow
2301                     ; 816 		break;
2303  06ea cc076d        	jra	L726
2304  06ed               L775:
2305                     ; 818 	case 5: 
2305                     ; 819 		LD3_RED_LED_OFF;
2308                     ; 820 		LD4_GREEN_LED_OFF;
2311                     ; 821 		LD5_GREEN_LED_OFF;
2314  06ed 4b08          	push	#8
2315  06ef ae5000        	ldw	x,#20480
2316  06f2 cd0000        	call	_GPIO_WriteLow
2317  06f5 84            	pop	a
2319  06f6 4b08          	push	#8
2320  06f8 ae500f        	ldw	x,#20495
2321  06fb cd0000        	call	_GPIO_WriteLow
2322  06fe 84            	pop	a
2324  06ff 4b01          	push	#1
2325  0701 ae500f        	ldw	x,#20495
2326  0704 cd0000        	call	_GPIO_WriteLow
2328                     ; 822 		LD6_GREEN_LED_OFF;
2330  0707               LC026:
2331  0707 84            	pop	a
2334  0708 4b08          	push	#8
2335  070a ae5014        	ldw	x,#20500
2336  070d cd0000        	call	_GPIO_WriteLow
2338                     ; 823 		LD7_GREEN_LED_ON;
2340                     ; 824 		break;
2342  0710 2052          	jp	LC025
2343  0712               L106:
2344                     ; 826 	case 6: 
2344                     ; 827 		LD3_RED_LED_OFF;
2346  0712 4b08          	push	#8
2347  0714 ae5000        	ldw	x,#20480
2348  0717 cd0000        	call	_GPIO_WriteLow
2350  071a 84            	pop	a
2351                     ; 828 		LD4_GREEN_LED_ON;
2353  071b 4b08          	push	#8
2354  071d ae500f        	ldw	x,#20495
2355  0720 cd0000        	call	_GPIO_WriteHigh
2357                     ; 829 		LD5_GREEN_LED_ON;
2359                     ; 830 		LD6_GREEN_LED_OFF;
2361                     ; 831 		LD7_GREEN_LED_OFF;
2363                     ; 832 		break;
2365  0723 208e          	jp	LC032
2366  0725               L306:
2367                     ; 834 	case 7: 
2367                     ; 835 		LD3_RED_LED_OFF;
2369  0725 4b08          	push	#8
2370  0727 ae5000        	ldw	x,#20480
2371  072a cd0000        	call	_GPIO_WriteLow
2373  072d 84            	pop	a
2374                     ; 836 		LD4_GREEN_LED_OFF;
2376  072e 4b08          	push	#8
2377  0730 ae500f        	ldw	x,#20495
2378  0733 cd0000        	call	_GPIO_WriteLow
2380  0736 84            	pop	a
2381                     ; 837 		LD5_GREEN_LED_ON;
2383  0737 4b01          	push	#1
2384  0739 ae500f        	ldw	x,#20495
2385  073c cd0000        	call	_GPIO_WriteHigh
2387                     ; 838 		LD6_GREEN_LED_OFF;
2389                     ; 839 		LD7_GREEN_LED_ON;
2391                     ; 840 		break;
2393  073f 20c6          	jp	LC026
2394  0741               L506:
2395                     ; 842 	case 8: 
2395                     ; 843 		LD3_RED_LED_OFF;
2397  0741 4b08          	push	#8
2398  0743 ae5000        	ldw	x,#20480
2399  0746 cd0000        	call	_GPIO_WriteLow
2401  0749 84            	pop	a
2402                     ; 844 		LD4_GREEN_LED_ON;
2404  074a 4b08          	push	#8
2405  074c ae500f        	ldw	x,#20495
2406  074f cd0000        	call	_GPIO_WriteHigh
2408  0752 84            	pop	a
2409                     ; 845 		LD5_GREEN_LED_ON;
2411  0753 4b01          	push	#1
2412  0755 ae500f        	ldw	x,#20495
2413  0758 cd0000        	call	_GPIO_WriteHigh
2415  075b 84            	pop	a
2416                     ; 846 		LD6_GREEN_LED_ON;
2418  075c 4b08          	push	#8
2419  075e ae5014        	ldw	x,#20500
2420  0761 cd0000        	call	_GPIO_WriteHigh
2422                     ; 847 		LD7_GREEN_LED_ON;
2424  0764               LC025:
2425  0764 84            	pop	a
2429  0765 4b08          	push	#8
2430  0767 ae500a        	ldw	x,#20490
2431  076a cd0000        	call	_GPIO_WriteHigh
2433                     ; 848 		break;
2435  076d               L726:
2436  076d 84            	pop	a
2437                     ; 858 }
2440  076e 81            	ret	
2530                     	xdef	_Appli
2531                     	xdef	_SetAppliTimebaseTick
2532                     	xdef	_StartupCompleted
2533                     	xdef	_StartupDisplay
2534                     	switch	.bss
2535  0000               _UserButton2:
2536  0000 00            	ds.b	1
2537                     	xdef	_UserButton2
2538  0001               _UserButton1:
2539  0001 00            	ds.b	1
2540                     	xdef	_UserButton1
2541                     	xref	_GetADCData
2542                     	xref	_CAN_WriteData
2543                     	xref	_CAN_ReadData
2544                     	xref	_LIN_WriteData
2545                     	xref	_LIN_ReadData
2546                     	xref	_ErrorState
2547                     	xref	_LINSlave
2548                     	xref	_CANMaster
2549                     	xref	_TransmissionEnable
2550                     	xref	_L99PM62drv_SetPWMDutyCycle
2551                     	xref	_GPIO_WriteLow
2552                     	xref	_GPIO_WriteHigh
2553                     	xref	_ADC2_StartConversion
2554                     .const:	section	.text
2555  0000               L301:
2556  0000 40000000      	dc.w	16384,0
2557                     	xref.b	c_lreg
2558                     	xref.b	c_x
2578                     	xref	c_ftol
2579                     	xref	c_fdiv
2580                     	xref	c_itof
2581                     	end
