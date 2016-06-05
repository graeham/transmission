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
  88                     ; 232 void Appli(void)
  88                     ; 233 {
  90                     	switch	.text
  91  0000               _Appli:
  93  0000 88            	push	a
  94       00000001      OFST:	set	1
  97                     ; 235 	if (TestAppliTimebaseTick())
  99  0001 cd0641        	call	L53_TestAppliTimebaseTick
 101  0004 4d            	tnz	a
 102  0005 2603cc03e4    	jreq	L75
 103                     ; 237 		ClearAppliTimebaseTick();
 105  000a cd063c        	call	L33_ClearAppliTimebaseTick
 107                     ; 241 		if (StartupDisplay<23)
 110  000d c60005        	ld	a,_StartupDisplay
 111  0010 a117          	cp	a,#23
 112  0012 2429          	jruge	L16
 113                     ; 243 			StartupDisplay++;
 115  0014 725c0005      	inc	_StartupDisplay
 116                     ; 246 			if ((CANMaster==TRUE)&&(TransmissionEnable==TRUE)) LED_Display(CAN_MASTER_TEST_MODE);
 118  0018 c60000        	ld	a,_CANMaster
 119  001b 4a            	dec	a
 120  001c 260a          	jrne	L36
 122  001e c60000        	ld	a,_TransmissionEnable
 123  0021 4a            	dec	a
 124  0022 2604          	jrne	L36
 127  0024 a606          	ld	a,#6
 130  0026 200f          	jp	LC004
 131  0028               L36:
 132                     ; 252 			else if (LINSlave==TRUE) LED_Display(LIN_SLAVE_TEST_MODE);
 134  0028 c60000        	ld	a,_LINSlave
 135  002b 4a            	dec	a
 136  002c 2604          	jrne	L76
 139  002e a608          	ld	a,#8
 142  0030 2005          	jp	LC004
 143  0032               L76:
 144                     ; 255 			else LED_Display(StartupDisplay>>2);
 146  0032 c60005        	ld	a,_StartupDisplay
 147  0035 44            	srl	a
 148  0036 44            	srl	a
 149  0037               LC004:
 150  0037 cd0649        	call	L73_LED_Display
 152  003a cc03e4        	jra	L75
 153  003d               L16:
 154                     ; 259 			StartupCompleted=TRUE;
 156  003d 35010006      	mov	_StartupCompleted,#1
 157                     ; 261 			ADC2_StartConversion();
 159  0041 cd0000        	call	_ADC2_StartConversion
 161                     ; 264 			Data0 = (uint8_t) GetADCData();
 163  0044 cd0000        	call	_GetADCData
 165  0047 9f            	ld	a,xl
 166  0048 c70000        	ld	L3_Data0,a
 167                     ; 265 			Data1 = (uint8_t) (GetADCData()>>8);
 169  004b cd0000        	call	_GetADCData
 171  004e 4f            	clr	a
 172  004f 01            	rrwa	x,a
 173  0050 9f            	ld	a,xl
 174  0051 c70001        	ld	L5_Data1,a
 175                     ; 274 			motorDuty1 = (Data1 << 6) | (Data0 >> 2);
 177  0054 c60000        	ld	a,L3_Data0
 178  0057 44            	srl	a
 179  0058 44            	srl	a
 180  0059 6b01          	ld	(OFST+0,sp),a
 182  005b c60001        	ld	a,L5_Data1
 183  005e 97            	ld	xl,a
 184  005f a640          	ld	a,#64
 185  0061 42            	mul	x,a
 186  0062 9f            	ld	a,xl
 187  0063 1a01          	or	a,(OFST+0,sp)
 188  0065 c70002        	ld	L7_motorDuty1,a
 189                     ; 277 			ADC2_StartConversion();
 191  0068 cd0000        	call	_ADC2_StartConversion
 193                     ; 279 			Data0 = (uint8_t) GetADCIOData();
 195  006b cd0000        	call	_GetADCIOData
 197  006e 9f            	ld	a,xl
 198  006f c70000        	ld	L3_Data0,a
 199                     ; 280 			Data1 = (uint8_t) (GetADCIOData()>>8);
 201  0072 cd0000        	call	_GetADCIOData
 203  0075 4f            	clr	a
 204  0076 01            	rrwa	x,a
 205  0077 9f            	ld	a,xl
 206  0078 c70001        	ld	L5_Data1,a
 207                     ; 284 			if ((TransmissionEnable==TRUE)&&(CANMaster==TRUE))
 209  007b c60000        	ld	a,_TransmissionEnable
 210  007e 4a            	dec	a
 211  007f 2703cc0153    	jrne	L57
 213  0084 c60000        	ld	a,_CANMaster
 214  0087 4a            	dec	a
 215  0088 26f7          	jrne	L57
 216                     ; 286 				WRITE_CAN_MASTER_RV1_TRIMMER_LSB(Data0);
 218  008a 3b0000        	push	L3_Data0
 219  008d ae0203        	ldw	x,#515
 220  0090 cd0000        	call	_CAN_WriteData
 222  0093 84            	pop	a
 223                     ; 287 				WRITE_CAN_MASTER_RV1_TRIMMER_MSB(Data1);
 225  0094 3b0001        	push	L5_Data1
 226  0097 ae0202        	ldw	x,#514
 227  009a cd0000        	call	_CAN_WriteData
 229  009d 84            	pop	a
 230                     ; 289 				L99PM62drv_SetPWMDutyCycle(L99PM62DRV_MASK_PWM1,motorDuty1/2.0);
 232  009e c60002        	ld	a,L7_motorDuty1
 233  00a1 5f            	clrw	x
 234  00a2 97            	ld	xl,a
 235  00a3 cd0000        	call	c_itof
 237  00a6 ae0000        	ldw	x,#L301
 238  00a9 cd0000        	call	c_fdiv
 240  00ac cd0000        	call	c_ftol
 242  00af b603          	ld	a,c_lreg+3
 243  00b1 ae0100        	ldw	x,#256
 244  00b4 97            	ld	xl,a
 245  00b5 cd0000        	call	_L99PM62drv_SetPWMDutyCycle
 247                     ; 292 				if (UserButton1Status()) 
 249  00b8 cd03e6        	call	L51_UserButton1Status
 251  00bb 4d            	tnz	a
 252  00bc 270e          	jreq	L701
 253                     ; 294 					WRITE_CAN_MASTER_USER1_BUTTON(TRUE);
 255  00be 4b01          	push	#1
 256  00c0 ae0200        	ldw	x,#512
 257  00c3 cd0000        	call	_CAN_WriteData
 259  00c6 84            	pop	a
 260                     ; 295 					IncrementStatus();			
 262  00c7 cd0400        	call	L12_IncrementStatus
 265  00ca 2009          	jra	L111
 266  00cc               L701:
 267                     ; 299 					WRITE_CAN_MASTER_USER1_BUTTON(FALSE);		
 269  00cc 4b00          	push	#0
 270  00ce ae0200        	ldw	x,#512
 271  00d1 cd0000        	call	_CAN_WriteData
 273  00d4 84            	pop	a
 274  00d5               L111:
 275                     ; 303 				if (UserButton2Status())
 277  00d5 cd03f3        	call	L71_UserButton2Status
 279  00d8 4d            	tnz	a
 280  00d9 270e          	jreq	L311
 281                     ; 305 					WRITE_CAN_MASTER_USER2_BUTTON(TRUE);
 283  00db 4b01          	push	#1
 284  00dd ae0201        	ldw	x,#513
 285  00e0 cd0000        	call	_CAN_WriteData
 287  00e3 84            	pop	a
 288                     ; 306 					DecrementStatus();
 290  00e4 cd042b        	call	L32_DecrementStatus
 293  00e7 2009          	jra	L511
 294  00e9               L311:
 295                     ; 310 					WRITE_CAN_MASTER_USER2_BUTTON(FALSE);			
 297  00e9 4b00          	push	#0
 298  00eb ae0201        	ldw	x,#513
 299  00ee cd0000        	call	_CAN_WriteData
 301  00f1 84            	pop	a
 302  00f2               L511:
 303                     ; 312 				if(!ErrorState)
 305  00f2 c60000        	ld	a,_ErrorState
 306  00f5 2703cc03e4    	jrne	L75
 307                     ; 315 					if (READ_CAN_MASTER_LD4_GREEN_LED) LD4_GREEN_LED_ON; else LD4_GREEN_LED_OFF;
 309  00fa ae0100        	ldw	x,#256
 310  00fd cd0000        	call	_CAN_ReadData
 312  0100 4d            	tnz	a
 313  0101 270a          	jreq	L121
 316  0103 4b08          	push	#8
 317  0105 ae500f        	ldw	x,#20495
 318  0108 cd0000        	call	_GPIO_WriteHigh
 321  010b 2008          	jra	L321
 322  010d               L121:
 325  010d 4b08          	push	#8
 326  010f ae500f        	ldw	x,#20495
 327  0112 cd0000        	call	_GPIO_WriteLow
 329  0115               L321:
 330  0115 ae0101        	ldw	x,#257
 331  0118 84            	pop	a
 332                     ; 316 					if (READ_CAN_MASTER_LD5_GREEN_LED) LD5_GREEN_LED_ON; else LD5_GREEN_LED_OFF;
 334  0119 cd0000        	call	_CAN_ReadData
 336  011c 4d            	tnz	a
 337  011d 270a          	jreq	L521
 340  011f 4b01          	push	#1
 341  0121 ae500f        	ldw	x,#20495
 342  0124 cd0000        	call	_GPIO_WriteHigh
 345  0127 2008          	jra	L721
 346  0129               L521:
 349  0129 4b01          	push	#1
 350  012b ae500f        	ldw	x,#20495
 351  012e cd0000        	call	_GPIO_WriteLow
 353  0131               L721:
 354  0131 ae0102        	ldw	x,#258
 355  0134 84            	pop	a
 356                     ; 317 					if (READ_CAN_MASTER_LD6_GREEN_LED) LD6_GREEN_LED_ON; else LD6_GREEN_LED_OFF;
 358  0135 cd0000        	call	_CAN_ReadData
 360  0138 4d            	tnz	a
 361  0139 270a          	jreq	L131
 364  013b 4b08          	push	#8
 365  013d ae5014        	ldw	x,#20500
 366  0140 cd0000        	call	_GPIO_WriteHigh
 369  0143 2008          	jra	L331
 370  0145               L131:
 373  0145 4b08          	push	#8
 374  0147 ae5014        	ldw	x,#20500
 375  014a cd0000        	call	_GPIO_WriteLow
 377  014d               L331:
 378  014d ae0103        	ldw	x,#259
 379                     ; 318 					if (READ_CAN_MASTER_LD7_GREEN_LED) LD7_GREEN_LED_ON; else LD7_GREEN_LED_OFF;
 384  0150 cc0225        	jp	LC006
 387  0153               L57:
 388                     ; 323 			else if ((TransmissionEnable==TRUE)&&(CANMaster==FALSE))
 390  0153 c60000        	ld	a,_TransmissionEnable
 391  0156 4a            	dec	a
 392  0157 2703cc022c    	jrne	L341
 394  015c c60000        	ld	a,_CANMaster
 395  015f 26f8          	jrne	L341
 396                     ; 325 				WRITE_CAN_SLAVE_RV1_TRIMMER_LSB(Data0);
 398  0161 3b0000        	push	L3_Data0
 399  0164 ae0303        	ldw	x,#771
 400  0167 cd0000        	call	_CAN_WriteData
 402  016a 84            	pop	a
 403                     ; 326 				WRITE_CAN_SLAVE_RV1_TRIMMER_MSB(Data1);
 405  016b 3b0001        	push	L5_Data1
 406  016e ae0302        	ldw	x,#770
 407  0171 cd0000        	call	_CAN_WriteData
 409  0174 84            	pop	a
 410                     ; 327 				L99PM62drv_SetPWMDutyCycle(L99PM62DRV_MASK_PWM1,motorDuty1/2.0);
 412  0175 c60002        	ld	a,L7_motorDuty1
 413  0178 5f            	clrw	x
 414  0179 97            	ld	xl,a
 415  017a cd0000        	call	c_itof
 417  017d ae0000        	ldw	x,#L301
 418  0180 cd0000        	call	c_fdiv
 420  0183 cd0000        	call	c_ftol
 422  0186 b603          	ld	a,c_lreg+3
 423  0188 ae0100        	ldw	x,#256
 424  018b 97            	ld	xl,a
 425  018c cd0000        	call	_L99PM62drv_SetPWMDutyCycle
 427                     ; 330 				if (UserButton1Status()) 
 429  018f cd03e6        	call	L51_UserButton1Status
 431  0192 4d            	tnz	a
 432  0193 270e          	jreq	L541
 433                     ; 332 					WRITE_CAN_SLAVE_USER1_BUTTON(TRUE);
 435  0195 4b01          	push	#1
 436  0197 ae0300        	ldw	x,#768
 437  019a cd0000        	call	_CAN_WriteData
 439  019d 84            	pop	a
 440                     ; 333 					IncrementStatus();			
 442  019e cd0400        	call	L12_IncrementStatus
 445  01a1 2009          	jra	L741
 446  01a3               L541:
 447                     ; 337 					WRITE_CAN_SLAVE_USER1_BUTTON(FALSE);		
 449  01a3 4b00          	push	#0
 450  01a5 ae0300        	ldw	x,#768
 451  01a8 cd0000        	call	_CAN_WriteData
 453  01ab 84            	pop	a
 454  01ac               L741:
 455                     ; 341 				if (UserButton2Status())
 457  01ac cd03f3        	call	L71_UserButton2Status
 459  01af 4d            	tnz	a
 460  01b0 270e          	jreq	L151
 461                     ; 343 					WRITE_CAN_SLAVE_USER2_BUTTON(TRUE);
 463  01b2 4b01          	push	#1
 464  01b4 ae0301        	ldw	x,#769
 465  01b7 cd0000        	call	_CAN_WriteData
 467  01ba 84            	pop	a
 468                     ; 344 					DecrementStatus();
 470  01bb cd042b        	call	L32_DecrementStatus
 473  01be 2009          	jra	L351
 474  01c0               L151:
 475                     ; 348 					WRITE_CAN_SLAVE_USER2_BUTTON(FALSE);			
 477  01c0 4b00          	push	#0
 478  01c2 ae0301        	ldw	x,#769
 479  01c5 cd0000        	call	_CAN_WriteData
 481  01c8 84            	pop	a
 482  01c9               L351:
 483                     ; 350 				if(!ErrorState)
 485  01c9 c60000        	ld	a,_ErrorState
 486  01cc 2703cc03e4    	jrne	L75
 487                     ; 353 					if (READ_CAN_SLAVE_LD4_GREEN_LED) LD4_GREEN_LED_ON; else LD4_GREEN_LED_OFF;
 489  01d1 5f            	clrw	x
 490  01d2 cd0000        	call	_CAN_ReadData
 492  01d5 4d            	tnz	a
 493  01d6 270a          	jreq	L751
 496  01d8 4b08          	push	#8
 497  01da ae500f        	ldw	x,#20495
 498  01dd cd0000        	call	_GPIO_WriteHigh
 501  01e0 2008          	jra	L161
 502  01e2               L751:
 505  01e2 4b08          	push	#8
 506  01e4 ae500f        	ldw	x,#20495
 507  01e7 cd0000        	call	_GPIO_WriteLow
 509  01ea               L161:
 510  01ea ae0001        	ldw	x,#1
 511  01ed 84            	pop	a
 512                     ; 354 					if (READ_CAN_SLAVE_LD5_GREEN_LED) LD5_GREEN_LED_ON; else LD5_GREEN_LED_OFF;
 514  01ee cd0000        	call	_CAN_ReadData
 516  01f1 4d            	tnz	a
 517  01f2 270a          	jreq	L361
 520  01f4 4b01          	push	#1
 521  01f6 ae500f        	ldw	x,#20495
 522  01f9 cd0000        	call	_GPIO_WriteHigh
 525  01fc 2008          	jra	L561
 526  01fe               L361:
 529  01fe 4b01          	push	#1
 530  0200 ae500f        	ldw	x,#20495
 531  0203 cd0000        	call	_GPIO_WriteLow
 533  0206               L561:
 534  0206 ae0002        	ldw	x,#2
 535  0209 84            	pop	a
 536                     ; 355 					if (READ_CAN_SLAVE_LD6_GREEN_LED) LD6_GREEN_LED_ON; else LD6_GREEN_LED_OFF;
 538  020a cd0000        	call	_CAN_ReadData
 540  020d 4d            	tnz	a
 541  020e 270a          	jreq	L761
 544  0210 4b08          	push	#8
 545  0212 ae5014        	ldw	x,#20500
 546  0215 cd0000        	call	_GPIO_WriteHigh
 549  0218 2008          	jra	L171
 550  021a               L761:
 553  021a 4b08          	push	#8
 554  021c ae5014        	ldw	x,#20500
 555  021f cd0000        	call	_GPIO_WriteLow
 557  0222               L171:
 558  0222 ae0003        	ldw	x,#3
 559                     ; 356 					if (READ_CAN_SLAVE_LD7_GREEN_LED) LD7_GREEN_LED_ON; else LD7_GREEN_LED_OFF;
 561  0225               LC006:
 562  0225 84            	pop	a
 564  0226 cd0000        	call	_CAN_ReadData
 569  0229 cc02fd        	jp	LC005
 572  022c               L341:
 573                     ; 363 				if (LINSlave==TRUE)
 575  022c c60000        	ld	a,_LINSlave
 576  022f 4a            	dec	a
 577  0230 2703cc030e    	jrne	L102
 578                     ; 366 					WRITE_SLAVE_RV1_TRIMMER_LSB(Data0);
 580  0235 3b0000        	push	L3_Data0
 581  0238 ae0303        	ldw	x,#771
 582  023b cd0000        	call	_LIN_WriteData
 584  023e 84            	pop	a
 585                     ; 367 					WRITE_SLAVE_RV1_TRIMMER_MSB(Data1);
 587  023f 3b0001        	push	L5_Data1
 588  0242 ae0302        	ldw	x,#770
 589  0245 cd0000        	call	_LIN_WriteData
 591  0248 84            	pop	a
 592                     ; 368 					L99PM62drv_SetPWMDutyCycle(L99PM62DRV_MASK_PWM1,motorDuty1/2.0);
 594  0249 c60002        	ld	a,L7_motorDuty1
 595  024c 5f            	clrw	x
 596  024d 97            	ld	xl,a
 597  024e cd0000        	call	c_itof
 599  0251 ae0000        	ldw	x,#L301
 600  0254 cd0000        	call	c_fdiv
 602  0257 cd0000        	call	c_ftol
 604  025a b603          	ld	a,c_lreg+3
 605  025c ae0100        	ldw	x,#256
 606  025f 97            	ld	xl,a
 607  0260 cd0000        	call	_L99PM62drv_SetPWMDutyCycle
 609                     ; 371 					if (UserButton1Status()) 
 611  0263 cd03e6        	call	L51_UserButton1Status
 613  0266 4d            	tnz	a
 614  0267 270e          	jreq	L302
 615                     ; 373 						WRITE_SLAVE_USER1_BUTTON(TRUE);
 617  0269 4b01          	push	#1
 618  026b ae0300        	ldw	x,#768
 619  026e cd0000        	call	_LIN_WriteData
 621  0271 84            	pop	a
 622                     ; 374 						IncrementStatus();			
 624  0272 cd0400        	call	L12_IncrementStatus
 627  0275 2009          	jra	L502
 628  0277               L302:
 629                     ; 378 						WRITE_SLAVE_USER1_BUTTON(FALSE);		
 631  0277 4b00          	push	#0
 632  0279 ae0300        	ldw	x,#768
 633  027c cd0000        	call	_LIN_WriteData
 635  027f 84            	pop	a
 636  0280               L502:
 637                     ; 382 					if (UserButton2Status())
 639  0280 cd03f3        	call	L71_UserButton2Status
 641  0283 4d            	tnz	a
 642  0284 270e          	jreq	L702
 643                     ; 384 						WRITE_SLAVE_USER2_BUTTON(TRUE);
 645  0286 4b01          	push	#1
 646  0288 ae0301        	ldw	x,#769
 647  028b cd0000        	call	_LIN_WriteData
 649  028e 84            	pop	a
 650                     ; 385 						DecrementStatus();
 652  028f cd042b        	call	L32_DecrementStatus
 655  0292 2009          	jra	L112
 656  0294               L702:
 657                     ; 389 						WRITE_SLAVE_USER2_BUTTON(FALSE);			
 659  0294 4b00          	push	#0
 660  0296 ae0301        	ldw	x,#769
 661  0299 cd0000        	call	_LIN_WriteData
 663  029c 84            	pop	a
 664  029d               L112:
 665                     ; 391 					if(!ErrorState)
 667  029d c60000        	ld	a,_ErrorState
 668  02a0 2703cc03e4    	jrne	L75
 669                     ; 394 						if (READ_SLAVE_LD4_GREEN_LED) LD4_GREEN_LED_ON; else LD4_GREEN_LED_OFF;
 671  02a5 5f            	clrw	x
 672  02a6 cd0000        	call	_LIN_ReadData
 674  02a9 4d            	tnz	a
 675  02aa 270a          	jreq	L512
 678  02ac 4b08          	push	#8
 679  02ae ae500f        	ldw	x,#20495
 680  02b1 cd0000        	call	_GPIO_WriteHigh
 683  02b4 2008          	jra	L712
 684  02b6               L512:
 687  02b6 4b08          	push	#8
 688  02b8 ae500f        	ldw	x,#20495
 689  02bb cd0000        	call	_GPIO_WriteLow
 691  02be               L712:
 692  02be ae0001        	ldw	x,#1
 693  02c1 84            	pop	a
 694                     ; 395 						if (READ_SLAVE_LD5_GREEN_LED) LD5_GREEN_LED_ON; else LD5_GREEN_LED_OFF;
 696  02c2 cd0000        	call	_LIN_ReadData
 698  02c5 4d            	tnz	a
 699  02c6 270a          	jreq	L122
 702  02c8 4b01          	push	#1
 703  02ca ae500f        	ldw	x,#20495
 704  02cd cd0000        	call	_GPIO_WriteHigh
 707  02d0 2008          	jra	L322
 708  02d2               L122:
 711  02d2 4b01          	push	#1
 712  02d4 ae500f        	ldw	x,#20495
 713  02d7 cd0000        	call	_GPIO_WriteLow
 715  02da               L322:
 716  02da ae0002        	ldw	x,#2
 717  02dd 84            	pop	a
 718                     ; 396 						if (READ_SLAVE_LD6_GREEN_LED) LD6_GREEN_LED_ON; else LD6_GREEN_LED_OFF;
 720  02de cd0000        	call	_LIN_ReadData
 722  02e1 4d            	tnz	a
 723  02e2 270a          	jreq	L522
 726  02e4 4b08          	push	#8
 727  02e6 ae5014        	ldw	x,#20500
 728  02e9 cd0000        	call	_GPIO_WriteHigh
 731  02ec 2008          	jra	L722
 732  02ee               L522:
 735  02ee 4b08          	push	#8
 736  02f0 ae5014        	ldw	x,#20500
 737  02f3 cd0000        	call	_GPIO_WriteLow
 739  02f6               L722:
 740  02f6 ae0003        	ldw	x,#3
 741  02f9 84            	pop	a
 742                     ; 397 						if (READ_SLAVE_LD7_GREEN_LED) LD7_GREEN_LED_ON; else LD7_GREEN_LED_OFF;
 744  02fa cd0000        	call	_LIN_ReadData
 746  02fd               LC005:
 747  02fd 4d            	tnz	a
 748  02fe 2603cc03db    	jreq	L562
 751  0303               LC003:
 755  0303 4b08          	push	#8
 756  0305 ae500a        	ldw	x,#20490
 757  0308 cd0000        	call	_GPIO_WriteHigh
 760  030b cc03e3        	jp	LC001
 763  030e               L102:
 764                     ; 403 					WRITE_MASTER_RV1_TRIMMER_LSB(Data0);
 766  030e 3b0000        	push	L3_Data0
 767  0311 ae0203        	ldw	x,#515
 768  0314 cd0000        	call	_LIN_WriteData
 770  0317 84            	pop	a
 771                     ; 404 					WRITE_MASTER_RV1_TRIMMER_MSB(Data1);
 773  0318 3b0001        	push	L5_Data1
 774  031b ae0202        	ldw	x,#514
 775  031e cd0000        	call	_LIN_WriteData
 777  0321 84            	pop	a
 778                     ; 405 					L99PM62drv_SetPWMDutyCycle(L99PM62DRV_MASK_PWM1,motorDuty1/2.0);
 780  0322 c60002        	ld	a,L7_motorDuty1
 781  0325 5f            	clrw	x
 782  0326 97            	ld	xl,a
 783  0327 cd0000        	call	c_itof
 785  032a ae0000        	ldw	x,#L301
 786  032d cd0000        	call	c_fdiv
 788  0330 cd0000        	call	c_ftol
 790  0333 b603          	ld	a,c_lreg+3
 791  0335 ae0100        	ldw	x,#256
 792  0338 97            	ld	xl,a
 793  0339 cd0000        	call	_L99PM62drv_SetPWMDutyCycle
 795                     ; 408 					if (UserButton1Status()) 
 797  033c cd03e6        	call	L51_UserButton1Status
 799  033f 4d            	tnz	a
 800  0340 270e          	jreq	L732
 801                     ; 410 						WRITE_MASTER_USER1_BUTTON(TRUE);
 803  0342 4b01          	push	#1
 804  0344 ae0200        	ldw	x,#512
 805  0347 cd0000        	call	_LIN_WriteData
 807  034a 84            	pop	a
 808                     ; 411 						IncrementStatus();			
 810  034b cd0400        	call	L12_IncrementStatus
 813  034e 2009          	jra	L142
 814  0350               L732:
 815                     ; 415 						WRITE_MASTER_USER1_BUTTON(FALSE);		
 817  0350 4b00          	push	#0
 818  0352 ae0200        	ldw	x,#512
 819  0355 cd0000        	call	_LIN_WriteData
 821  0358 84            	pop	a
 822  0359               L142:
 823                     ; 419 					if (UserButton2Status())
 825  0359 cd03f3        	call	L71_UserButton2Status
 827  035c 4d            	tnz	a
 828  035d 270e          	jreq	L342
 829                     ; 421 						WRITE_MASTER_USER2_BUTTON(TRUE);
 831  035f 4b01          	push	#1
 832  0361 ae0201        	ldw	x,#513
 833  0364 cd0000        	call	_LIN_WriteData
 835  0367 84            	pop	a
 836                     ; 422 						DecrementStatus();
 838  0368 cd042b        	call	L32_DecrementStatus
 841  036b 2009          	jra	L542
 842  036d               L342:
 843                     ; 426 						WRITE_MASTER_USER2_BUTTON(FALSE);			
 845  036d 4b00          	push	#0
 846  036f ae0201        	ldw	x,#513
 847  0372 cd0000        	call	_LIN_WriteData
 849  0375 84            	pop	a
 850  0376               L542:
 851                     ; 428 					if(!ErrorState)
 853  0376 c60000        	ld	a,_ErrorState
 854  0379 2669          	jrne	L75
 855                     ; 431 						if (READ_MASTER_LD4_GREEN_LED) LD4_GREEN_LED_ON; else LD4_GREEN_LED_OFF;
 857  037b ae0100        	ldw	x,#256
 858  037e cd0000        	call	_LIN_ReadData
 860  0381 4d            	tnz	a
 861  0382 270a          	jreq	L152
 864  0384 4b08          	push	#8
 865  0386 ae500f        	ldw	x,#20495
 866  0389 cd0000        	call	_GPIO_WriteHigh
 869  038c 2008          	jra	L352
 870  038e               L152:
 873  038e 4b08          	push	#8
 874  0390 ae500f        	ldw	x,#20495
 875  0393 cd0000        	call	_GPIO_WriteLow
 877  0396               L352:
 878  0396 ae0101        	ldw	x,#257
 879  0399 84            	pop	a
 880                     ; 432 						if (READ_MASTER_LD5_GREEN_LED) LD5_GREEN_LED_ON; else LD5_GREEN_LED_OFF;
 882  039a cd0000        	call	_LIN_ReadData
 884  039d 4d            	tnz	a
 885  039e 270a          	jreq	L552
 888  03a0 4b01          	push	#1
 889  03a2 ae500f        	ldw	x,#20495
 890  03a5 cd0000        	call	_GPIO_WriteHigh
 893  03a8 2008          	jra	L752
 894  03aa               L552:
 897  03aa 4b01          	push	#1
 898  03ac ae500f        	ldw	x,#20495
 899  03af cd0000        	call	_GPIO_WriteLow
 901  03b2               L752:
 902  03b2 ae0102        	ldw	x,#258
 903  03b5 84            	pop	a
 904                     ; 433 						if (READ_MASTER_LD6_GREEN_LED) LD6_GREEN_LED_ON; else LD6_GREEN_LED_OFF;
 906  03b6 cd0000        	call	_LIN_ReadData
 908  03b9 4d            	tnz	a
 909  03ba 270a          	jreq	L162
 912  03bc 4b08          	push	#8
 913  03be ae5014        	ldw	x,#20500
 914  03c1 cd0000        	call	_GPIO_WriteHigh
 917  03c4 2008          	jra	L362
 918  03c6               L162:
 921  03c6 4b08          	push	#8
 922  03c8 ae5014        	ldw	x,#20500
 923  03cb cd0000        	call	_GPIO_WriteLow
 925  03ce               L362:
 926  03ce ae0103        	ldw	x,#259
 927  03d1 84            	pop	a
 928                     ; 434 						if (READ_MASTER_LD7_GREEN_LED) LD7_GREEN_LED_ON; else LD7_GREEN_LED_OFF;
 930  03d2 cd0000        	call	_LIN_ReadData
 932  03d5 4d            	tnz	a
 936  03d6 2703cc0303    	jrne	LC003
 937  03db               L562:
 943  03db 4b08          	push	#8
 944  03dd ae500a        	ldw	x,#20490
 945  03e0 cd0000        	call	_GPIO_WriteLow
 947  03e3               LC001:
 948  03e3 84            	pop	a
 949  03e4               L75:
 950                     ; 443 }
 953  03e4 84            	pop	a
 954  03e5 81            	ret	
 999                     ; 454 bool UserButton1Status(void)
 999                     ; 455 {
1000                     	switch	.text
1001  03e6               L51_UserButton1Status:
1005                     ; 457 	if (UserButton1==TRUE)
1007  03e6 c60001        	ld	a,_UserButton1
1008  03e9 4a            	dec	a
1009  03ea 2605          	jrne	L113
1010                     ; 459 		UserButton1=FALSE;
1012  03ec c70001        	ld	_UserButton1,a
1013                     ; 460 		return(TRUE);
1015  03ef 4c            	inc	a
1018  03f0 81            	ret	
1019  03f1               L113:
1020                     ; 464 		return(FALSE);
1022  03f1 4f            	clr	a
1025  03f2 81            	ret	
1050                     ; 477 bool UserButton2Status(void)
1050                     ; 478 {
1051                     	switch	.text
1052  03f3               L71_UserButton2Status:
1056                     ; 480 	if (UserButton2==TRUE)
1058  03f3 c60000        	ld	a,_UserButton2
1059  03f6 4a            	dec	a
1060  03f7 2605          	jrne	L523
1061                     ; 482 		UserButton2=FALSE;
1063  03f9 c70000        	ld	_UserButton2,a
1064                     ; 483 		return(TRUE);
1066  03fc 4c            	inc	a
1069  03fd 81            	ret	
1070  03fe               L523:
1071                     ; 487 		return(FALSE);
1073  03fe 4f            	clr	a
1076  03ff 81            	ret	
1105                     ; 499 void IncrementStatus(void)
1105                     ; 500 {	
1106                     	switch	.text
1107  0400               L12_IncrementStatus:
1111                     ; 501 	if (BarStatus<4)
1113  0400 c60003        	ld	a,L11_BarStatus
1114  0403 a104          	cp	a,#4
1115  0405 2423          	jruge	L143
1116                     ; 503 		BarStatus++;
1118  0407 725c0003      	inc	L11_BarStatus
1119                     ; 504 		if ((TransmissionEnable==TRUE)&&(CANMaster==TRUE)) UpdateSlaveLedStatus(); /* CAN "Master" test mode */
1121  040b c60000        	ld	a,_TransmissionEnable
1122  040e 4a            	dec	a
1123  040f 2609          	jrne	L343
1125  0411 c60000        	ld	a,_CANMaster
1126  0414 4a            	dec	a
1127  0415 2603          	jrne	L343
1133  0417 cc05c3        	jp	L13_UpdateSlaveLedStatus
1134  041a               L343:
1135                     ; 505 		else if ((TransmissionEnable==TRUE)&&(CANMaster==FALSE)) UpdateMasterLedStatus(); /* CAN "Slave" tes mode */
1137  041a c60000        	ld	a,_TransmissionEnable
1138  041d 4a            	dec	a
1139  041e 2608          	jrne	L743
1141  0420 c60000        	ld	a,_CANMaster
1142  0423 2603          	jrne	L743
1148  0425 cc0547        	jp	L72_UpdateMasterLedStatus
1149  0428               L743:
1150                     ; 506 		else UpdateBarStatus(); /* LIN Master demo or test mode */
1152  0428 ad2a          	call	L52_UpdateBarStatus
1154  042a               L143:
1155                     ; 509 }
1158  042a 81            	ret	
1187                     ; 518 void DecrementStatus(void)
1187                     ; 519 {	
1188                     	switch	.text
1189  042b               L32_DecrementStatus:
1193                     ; 520 	if (BarStatus>0)
1195  042b c60003        	ld	a,L11_BarStatus
1196  042e 2723          	jreq	L363
1197                     ; 522 		BarStatus--;
1199  0430 725a0003      	dec	L11_BarStatus
1200                     ; 523 		if ((TransmissionEnable==TRUE)&&(CANMaster==TRUE)) UpdateSlaveLedStatus(); /* CAN "Master" test mode */
1202  0434 c60000        	ld	a,_TransmissionEnable
1203  0437 4a            	dec	a
1204  0438 2609          	jrne	L563
1206  043a c60000        	ld	a,_CANMaster
1207  043d 4a            	dec	a
1208  043e 2603          	jrne	L563
1214  0440 cc05c3        	jp	L13_UpdateSlaveLedStatus
1215  0443               L563:
1216                     ; 524 		else if ((TransmissionEnable==TRUE)&&(CANMaster==FALSE)) UpdateMasterLedStatus(); /* CAN "Slave" test mode */
1218  0443 c60000        	ld	a,_TransmissionEnable
1219  0446 4a            	dec	a
1220  0447 2608          	jrne	L173
1222  0449 c60000        	ld	a,_CANMaster
1223  044c 2603          	jrne	L173
1229  044e cc0547        	jp	L72_UpdateMasterLedStatus
1230  0451               L173:
1231                     ; 525 		else UpdateBarStatus(); /* LIN Master demo or test mode */
1233  0451 ad01          	call	L52_UpdateBarStatus
1235  0453               L363:
1236                     ; 528 }
1239  0453 81            	ret	
1265                     ; 538 void UpdateBarStatus(void)
1265                     ; 539 {
1266                     	switch	.text
1267  0454               L52_UpdateBarStatus:
1271                     ; 542 	if (LINSlave==TRUE)
1273  0454 c60000        	ld	a,_LINSlave
1274  0457 4a            	dec	a
1275  0458 2679          	jrne	L534
1276                     ; 544 		switch (BarStatus)
1278  045a c60003        	ld	a,L11_BarStatus
1280                     ; 586 				break;
1281  045d 270c          	jreq	L573
1282  045f 4a            	dec	a
1283  0460 270d          	jreq	L773
1284  0462 4a            	dec	a
1285  0463 2729          	jreq	L104
1286  0465 4a            	dec	a
1287  0466 2733          	jreq	L304
1288  0468 4a            	dec	a
1289  0469 2746          	jreq	L504
1290                     ; 581 			default:
1290                     ; 582 				WRITE_MASTER_LD4_GREEN_LED(0);
1292                     ; 583 				WRITE_MASTER_LD5_GREEN_LED(0);
1294                     ; 584 				WRITE_MASTER_LD6_GREEN_LED(0);
1296                     ; 585 				WRITE_MASTER_LD7_GREEN_LED(0);
1298                     ; 586 				break;
1300  046b               L573:
1301                     ; 546 			case 0:
1301                     ; 547 				WRITE_MASTER_LD4_GREEN_LED(0);
1304  046b 4b00          	push	#0
1306                     ; 548 				WRITE_MASTER_LD5_GREEN_LED(0);
1308                     ; 549 				WRITE_MASTER_LD6_GREEN_LED(0);
1310                     ; 550 				WRITE_MASTER_LD7_GREEN_LED(0);
1312                     ; 551 				break;
1314  046d 2002          	jp	LC015
1315  046f               L773:
1316                     ; 553 			case 1:
1316                     ; 554 				WRITE_MASTER_LD4_GREEN_LED(1);
1318  046f 4b01          	push	#1
1320                     ; 555 				WRITE_MASTER_LD5_GREEN_LED(0);
1322  0471               LC015:
1323  0471 ae0100        	ldw	x,#256
1324  0474 cd0000        	call	_LIN_WriteData
1325  0477 84            	pop	a
1328  0478 4b00          	push	#0
1330                     ; 556 				WRITE_MASTER_LD6_GREEN_LED(0);
1332  047a               LC014:
1333  047a ae0101        	ldw	x,#257
1334  047d cd0000        	call	_LIN_WriteData
1335  0480 84            	pop	a
1339  0481 4b00          	push	#0
1341                     ; 557 				WRITE_MASTER_LD7_GREEN_LED(0);
1343  0483               LC013:
1344  0483 ae0102        	ldw	x,#258
1345  0486 cd0000        	call	_LIN_WriteData
1346  0489 84            	pop	a
1351  048a 4b00          	push	#0
1353                     ; 558 				break;
1355  048c 2040          	jp	LC012
1356  048e               L104:
1357                     ; 560 			case 2:
1357                     ; 561 				WRITE_MASTER_LD4_GREEN_LED(1);
1359  048e 4b01          	push	#1
1360  0490 ae0100        	ldw	x,#256
1361  0493 cd0000        	call	_LIN_WriteData
1363  0496 84            	pop	a
1364                     ; 562 				WRITE_MASTER_LD5_GREEN_LED(1);
1366  0497 4b01          	push	#1
1368                     ; 563 				WRITE_MASTER_LD6_GREEN_LED(0);
1370                     ; 564 				WRITE_MASTER_LD7_GREEN_LED(0);
1372                     ; 565 				break;
1374  0499 20df          	jp	LC014
1375  049b               L304:
1376                     ; 567 			case 3:
1376                     ; 568 				WRITE_MASTER_LD4_GREEN_LED(1);
1378  049b 4b01          	push	#1
1379  049d ae0100        	ldw	x,#256
1380  04a0 cd0000        	call	_LIN_WriteData
1382  04a3 84            	pop	a
1383                     ; 569 				WRITE_MASTER_LD5_GREEN_LED(1);
1385  04a4 4b01          	push	#1
1386  04a6 ae0101        	ldw	x,#257
1387  04a9 cd0000        	call	_LIN_WriteData
1389  04ac 84            	pop	a
1390                     ; 570 				WRITE_MASTER_LD6_GREEN_LED(1);
1392  04ad 4b01          	push	#1
1394                     ; 571 				WRITE_MASTER_LD7_GREEN_LED(0);
1396                     ; 572 				break;		
1398  04af 20d2          	jp	LC013
1399  04b1               L504:
1400                     ; 574 			case 4:
1400                     ; 575 				WRITE_MASTER_LD4_GREEN_LED(1);
1402  04b1 4b01          	push	#1
1403  04b3 ae0100        	ldw	x,#256
1404  04b6 cd0000        	call	_LIN_WriteData
1406  04b9 84            	pop	a
1407                     ; 576 				WRITE_MASTER_LD5_GREEN_LED(1);
1409  04ba 4b01          	push	#1
1410  04bc ae0101        	ldw	x,#257
1411  04bf cd0000        	call	_LIN_WriteData
1413  04c2 84            	pop	a
1414                     ; 577 				WRITE_MASTER_LD6_GREEN_LED(1);
1416  04c3 4b01          	push	#1
1417  04c5 ae0102        	ldw	x,#258
1418  04c8 cd0000        	call	_LIN_WriteData
1420  04cb 84            	pop	a
1421                     ; 578 				WRITE_MASTER_LD7_GREEN_LED(1);
1423  04cc 4b01          	push	#1
1424  04ce               LC012:
1425  04ce ae0103        	ldw	x,#259
1427                     ; 579 				break;			
1429  04d1 202f          	jra	L344
1430                     ; 586 				break;
1431  04d3               L534:
1432                     ; 593 		switch (BarStatus)
1434  04d3 c60003        	ld	a,L11_BarStatus
1436                     ; 635 				break;
1437  04d6 270c          	jreq	L114
1438  04d8 4a            	dec	a
1439  04d9 272c          	jreq	L314
1440  04db 4a            	dec	a
1441  04dc 272d          	jreq	L514
1442  04de 4a            	dec	a
1443  04df 2735          	jreq	L714
1444  04e1 4a            	dec	a
1445  04e2 2746          	jreq	L124
1446                     ; 630 			default:
1446                     ; 631 				WRITE_STM8AL_BAR0(0);
1448                     ; 632 				WRITE_STM8AL_BAR1(0);
1450                     ; 633 				WRITE_STM8AL_BAR2(0);
1452                     ; 634 				WRITE_STM8AL_BAR3(0);
1454                     ; 635 				break;
1456  04e4               L114:
1457                     ; 595 			case 0:
1457                     ; 596 				WRITE_STM8AL_BAR0(0);
1460  04e4 4b00          	push	#0
1462                     ; 597 				WRITE_STM8AL_BAR1(0);
1464  04e6               LC010:
1465  04e6 5f            	clrw	x
1466  04e7 cd0000        	call	_LIN_WriteData
1467  04ea 84            	pop	a
1470  04eb 4b00          	push	#0
1472                     ; 598 				WRITE_STM8AL_BAR2(0);
1474  04ed               LC009:
1475  04ed ae0001        	ldw	x,#1
1476  04f0 cd0000        	call	_LIN_WriteData
1477  04f3 84            	pop	a
1481  04f4 4b00          	push	#0
1483                     ; 599 				WRITE_STM8AL_BAR3(0);
1485  04f6               LC008:
1486  04f6 ae0002        	ldw	x,#2
1487  04f9 cd0000        	call	_LIN_WriteData
1488  04fc 84            	pop	a
1493  04fd 4b00          	push	#0
1494  04ff               LC007:
1495  04ff ae0003        	ldw	x,#3
1497                     ; 600 				break;
1498  0502               L344:
1499  0502 cd0000        	call	_LIN_WriteData
1500  0505 84            	pop	a
1501                     ; 638 }
1504  0506 81            	ret	
1505  0507               L314:
1506                     ; 602 			case 1:
1506                     ; 603 				WRITE_STM8AL_BAR0(1);
1508  0507 4b01          	push	#1
1510                     ; 604 				WRITE_STM8AL_BAR1(0);
1512                     ; 605 				WRITE_STM8AL_BAR2(0);
1514                     ; 606 				WRITE_STM8AL_BAR3(0);
1516                     ; 607 				break;
1518  0509 20db          	jp	LC010
1519  050b               L514:
1520                     ; 609 			case 2:
1520                     ; 610 				WRITE_STM8AL_BAR0(1);
1522  050b 4b01          	push	#1
1523  050d 5f            	clrw	x
1524  050e cd0000        	call	_LIN_WriteData
1526  0511 84            	pop	a
1527                     ; 611 				WRITE_STM8AL_BAR1(1);
1529  0512 4b01          	push	#1
1531                     ; 612 				WRITE_STM8AL_BAR2(0);
1533                     ; 613 				WRITE_STM8AL_BAR3(0);
1535                     ; 614 				break;
1537  0514 20d7          	jp	LC009
1538  0516               L714:
1539                     ; 616 			case 3:
1539                     ; 617 				WRITE_STM8AL_BAR0(1);
1541  0516 4b01          	push	#1
1542  0518 5f            	clrw	x
1543  0519 cd0000        	call	_LIN_WriteData
1545  051c 84            	pop	a
1546                     ; 618 				WRITE_STM8AL_BAR1(1);
1548  051d 4b01          	push	#1
1549  051f ae0001        	ldw	x,#1
1550  0522 cd0000        	call	_LIN_WriteData
1552  0525 84            	pop	a
1553                     ; 619 				WRITE_STM8AL_BAR2(1);
1555  0526 4b01          	push	#1
1557                     ; 620 				WRITE_STM8AL_BAR3(0);
1559                     ; 621 				break;		
1561  0528 20cc          	jp	LC008
1562  052a               L124:
1563                     ; 623 			case 4:
1563                     ; 624 				WRITE_STM8AL_BAR0(1);
1565  052a 4b01          	push	#1
1566  052c 5f            	clrw	x
1567  052d cd0000        	call	_LIN_WriteData
1569  0530 84            	pop	a
1570                     ; 625 				WRITE_STM8AL_BAR1(1);
1572  0531 4b01          	push	#1
1573  0533 ae0001        	ldw	x,#1
1574  0536 cd0000        	call	_LIN_WriteData
1576  0539 84            	pop	a
1577                     ; 626 				WRITE_STM8AL_BAR2(1);
1579  053a 4b01          	push	#1
1580  053c ae0002        	ldw	x,#2
1581  053f cd0000        	call	_LIN_WriteData
1583  0542 84            	pop	a
1584                     ; 627 				WRITE_STM8AL_BAR3(1);
1586  0543 4b01          	push	#1
1588                     ; 628 				break;			
1590  0545 20b8          	jp	LC007
1616                     ; 641 void UpdateMasterLedStatus(void)
1616                     ; 642 {
1617                     	switch	.text
1618  0547               L72_UpdateMasterLedStatus:
1622                     ; 644 	switch (BarStatus)
1624  0547 c60003        	ld	a,L11_BarStatus
1626                     ; 686 			break;
1627  054a 270c          	jreq	L154
1628  054c 4a            	dec	a
1629  054d 270d          	jreq	L354
1630  054f 4a            	dec	a
1631  0550 2720          	jreq	L554
1632  0552 4a            	dec	a
1633  0553 272a          	jreq	L754
1634  0555 4a            	dec	a
1635  0556 2746          	jreq	L164
1636                     ; 681 		default:
1636                     ; 682 			WRITE_CAN_MASTER_LD4_GREEN_LED(0);
1638                     ; 683 			WRITE_CAN_MASTER_LD5_GREEN_LED(0);
1640                     ; 684 			WRITE_CAN_MASTER_LD6_GREEN_LED(0);
1642                     ; 685 			WRITE_CAN_MASTER_LD7_GREEN_LED(0);
1644                     ; 686 			break;
1646  0558               L154:
1647                     ; 646 		case 0:
1647                     ; 647 			WRITE_CAN_MASTER_LD4_GREEN_LED(0);
1650  0558 4b00          	push	#0
1652                     ; 648 			WRITE_CAN_MASTER_LD5_GREEN_LED(0);
1654                     ; 649 			WRITE_CAN_MASTER_LD6_GREEN_LED(0);
1656                     ; 650 			WRITE_CAN_MASTER_LD7_GREEN_LED(0);
1658                     ; 651 			break;
1660  055a 2002          	jp	LC019
1661  055c               L354:
1662                     ; 653 		case 1:
1662                     ; 654 			WRITE_CAN_MASTER_LD4_GREEN_LED(1);
1664  055c 4b01          	push	#1
1666                     ; 655 			WRITE_CAN_MASTER_LD5_GREEN_LED(0);
1668  055e               LC019:
1669  055e ae0100        	ldw	x,#256
1670  0561 cd0000        	call	_CAN_WriteData
1671  0564 84            	pop	a
1674  0565 4b00          	push	#0
1676                     ; 656 			WRITE_CAN_MASTER_LD6_GREEN_LED(0);
1678  0567               LC018:
1679  0567 ae0101        	ldw	x,#257
1680  056a cd0000        	call	_CAN_WriteData
1681  056d 84            	pop	a
1685  056e 4b00          	push	#0
1687                     ; 657 			WRITE_CAN_MASTER_LD7_GREEN_LED(0);
1689                     ; 658 			break;
1691  0570 2021          	jp	LC017
1692  0572               L554:
1693                     ; 660 		case 2:
1693                     ; 661 			WRITE_CAN_MASTER_LD4_GREEN_LED(1);
1695  0572 4b01          	push	#1
1696  0574 ae0100        	ldw	x,#256
1697  0577 cd0000        	call	_CAN_WriteData
1699  057a 84            	pop	a
1700                     ; 662 			WRITE_CAN_MASTER_LD5_GREEN_LED(1);
1702  057b 4b01          	push	#1
1704                     ; 663 			WRITE_CAN_MASTER_LD6_GREEN_LED(0);
1706                     ; 664 			WRITE_CAN_MASTER_LD7_GREEN_LED(0);
1708                     ; 665 			break;
1710  057d 20e8          	jp	LC018
1711  057f               L754:
1712                     ; 667 		case 3:
1712                     ; 668 			WRITE_CAN_MASTER_LD4_GREEN_LED(1);
1714  057f 4b01          	push	#1
1715  0581 ae0100        	ldw	x,#256
1716  0584 cd0000        	call	_CAN_WriteData
1718  0587 84            	pop	a
1719                     ; 669 			WRITE_CAN_MASTER_LD5_GREEN_LED(1);
1721  0588 4b01          	push	#1
1722  058a ae0101        	ldw	x,#257
1723  058d cd0000        	call	_CAN_WriteData
1725  0590 84            	pop	a
1726                     ; 670 			WRITE_CAN_MASTER_LD6_GREEN_LED(1);
1728  0591 4b01          	push	#1
1730                     ; 671 			WRITE_CAN_MASTER_LD7_GREEN_LED(0);
1732  0593               LC017:
1733  0593 ae0102        	ldw	x,#258
1734  0596 cd0000        	call	_CAN_WriteData
1735  0599 84            	pop	a
1740  059a 4b00          	push	#0
1742                     ; 672 			break;		
1744  059c 201d          	jra	L774
1745  059e               L164:
1746                     ; 674 		case 4:
1746                     ; 675 			WRITE_CAN_MASTER_LD4_GREEN_LED(1);
1748  059e 4b01          	push	#1
1749  05a0 ae0100        	ldw	x,#256
1750  05a3 cd0000        	call	_CAN_WriteData
1752  05a6 84            	pop	a
1753                     ; 676 			WRITE_CAN_MASTER_LD5_GREEN_LED(1);
1755  05a7 4b01          	push	#1
1756  05a9 ae0101        	ldw	x,#257
1757  05ac cd0000        	call	_CAN_WriteData
1759  05af 84            	pop	a
1760                     ; 677 			WRITE_CAN_MASTER_LD6_GREEN_LED(1);
1762  05b0 4b01          	push	#1
1763  05b2 ae0102        	ldw	x,#258
1764  05b5 cd0000        	call	_CAN_WriteData
1766  05b8 84            	pop	a
1767                     ; 678 			WRITE_CAN_MASTER_LD7_GREEN_LED(1);
1769  05b9 4b01          	push	#1
1771                     ; 679 			break;			
1773  05bb               L774:
1774  05bb ae0103        	ldw	x,#259
1775  05be cd0000        	call	_CAN_WriteData
1776  05c1 84            	pop	a
1777                     ; 688 }
1780  05c2 81            	ret	
1806                     ; 690 void UpdateSlaveLedStatus(void)
1806                     ; 691 {
1807                     	switch	.text
1808  05c3               L13_UpdateSlaveLedStatus:
1812                     ; 693 	switch (BarStatus)
1814  05c3 c60003        	ld	a,L11_BarStatus
1816                     ; 735 			break;
1817  05c6 270c          	jreq	L105
1818  05c8 4a            	dec	a
1819  05c9 270d          	jreq	L305
1820  05cb 4a            	dec	a
1821  05cc 271e          	jreq	L505
1822  05ce 4a            	dec	a
1823  05cf 2726          	jreq	L705
1824  05d1 4a            	dec	a
1825  05d2 2740          	jreq	L115
1826                     ; 730 		default:
1826                     ; 731 			WRITE_CAN_SLAVE_LD4_GREEN_LED(0);
1828                     ; 732 			WRITE_CAN_SLAVE_LD5_GREEN_LED(0);
1830                     ; 733 			WRITE_CAN_SLAVE_LD6_GREEN_LED(0);
1832                     ; 734 			WRITE_CAN_SLAVE_LD7_GREEN_LED(0);
1834                     ; 735 			break;
1836  05d4               L105:
1837                     ; 695 		case 0:
1837                     ; 696 			WRITE_CAN_SLAVE_LD4_GREEN_LED(0);
1840  05d4 4b00          	push	#0
1842                     ; 697 			WRITE_CAN_SLAVE_LD5_GREEN_LED(0);
1844                     ; 698 			WRITE_CAN_SLAVE_LD6_GREEN_LED(0);
1846                     ; 699 			WRITE_CAN_SLAVE_LD7_GREEN_LED(0);
1848                     ; 700 			break;
1850  05d6 2002          	jp	LC023
1851  05d8               L305:
1852                     ; 702 		case 1:
1852                     ; 703 			WRITE_CAN_SLAVE_LD4_GREEN_LED(1);
1854  05d8 4b01          	push	#1
1856                     ; 704 			WRITE_CAN_SLAVE_LD5_GREEN_LED(0);
1858  05da               LC023:
1859  05da 5f            	clrw	x
1860  05db cd0000        	call	_CAN_WriteData
1861  05de 84            	pop	a
1864  05df 4b00          	push	#0
1866                     ; 705 			WRITE_CAN_SLAVE_LD6_GREEN_LED(0);
1868  05e1               LC022:
1869  05e1 ae0001        	ldw	x,#1
1870  05e4 cd0000        	call	_CAN_WriteData
1871  05e7 84            	pop	a
1875  05e8 4b00          	push	#0
1877                     ; 706 			WRITE_CAN_SLAVE_LD7_GREEN_LED(0);
1879                     ; 707 			break;
1881  05ea 201d          	jp	LC021
1882  05ec               L505:
1883                     ; 709 		case 2:
1883                     ; 710 			WRITE_CAN_SLAVE_LD4_GREEN_LED(1);
1885  05ec 4b01          	push	#1
1886  05ee 5f            	clrw	x
1887  05ef cd0000        	call	_CAN_WriteData
1889  05f2 84            	pop	a
1890                     ; 711 			WRITE_CAN_SLAVE_LD5_GREEN_LED(1);
1892  05f3 4b01          	push	#1
1894                     ; 712 			WRITE_CAN_SLAVE_LD6_GREEN_LED(0);
1896                     ; 713 			WRITE_CAN_SLAVE_LD7_GREEN_LED(0);
1898                     ; 714 			break;
1900  05f5 20ea          	jp	LC022
1901  05f7               L705:
1902                     ; 716 		case 3:
1902                     ; 717 			WRITE_CAN_SLAVE_LD4_GREEN_LED(1);
1904  05f7 4b01          	push	#1
1905  05f9 5f            	clrw	x
1906  05fa cd0000        	call	_CAN_WriteData
1908  05fd 84            	pop	a
1909                     ; 718 			WRITE_CAN_SLAVE_LD5_GREEN_LED(1);
1911  05fe 4b01          	push	#1
1912  0600 ae0001        	ldw	x,#1
1913  0603 cd0000        	call	_CAN_WriteData
1915  0606 84            	pop	a
1916                     ; 719 			WRITE_CAN_SLAVE_LD6_GREEN_LED(1);
1918  0607 4b01          	push	#1
1920                     ; 720 			WRITE_CAN_SLAVE_LD7_GREEN_LED(0);
1922  0609               LC021:
1923  0609 ae0002        	ldw	x,#2
1924  060c cd0000        	call	_CAN_WriteData
1925  060f 84            	pop	a
1930  0610 4b00          	push	#0
1932                     ; 721 			break;		
1934  0612 201b          	jra	L725
1935  0614               L115:
1936                     ; 723 		case 4:
1936                     ; 724 			WRITE_CAN_SLAVE_LD4_GREEN_LED(1);
1938  0614 4b01          	push	#1
1939  0616 5f            	clrw	x
1940  0617 cd0000        	call	_CAN_WriteData
1942  061a 84            	pop	a
1943                     ; 725 			WRITE_CAN_SLAVE_LD5_GREEN_LED(1);
1945  061b 4b01          	push	#1
1946  061d ae0001        	ldw	x,#1
1947  0620 cd0000        	call	_CAN_WriteData
1949  0623 84            	pop	a
1950                     ; 726 			WRITE_CAN_SLAVE_LD6_GREEN_LED(1);
1952  0624 4b01          	push	#1
1953  0626 ae0002        	ldw	x,#2
1954  0629 cd0000        	call	_CAN_WriteData
1956  062c 84            	pop	a
1957                     ; 727 			WRITE_CAN_SLAVE_LD7_GREEN_LED(1);
1959  062d 4b01          	push	#1
1961                     ; 728 			break;			
1963  062f               L725:
1964  062f ae0003        	ldw	x,#3
1965  0632 cd0000        	call	_CAN_WriteData
1966  0635 84            	pop	a
1967                     ; 737 }
1970  0636 81            	ret	
1995                     ; 745 void SetAppliTimebaseTick(void)
1995                     ; 746 {
1996                     	switch	.text
1997  0637               _SetAppliTimebaseTick:
2001                     ; 747 	AppliTimebaseTick=TRUE;
2003  0637 35010004      	mov	L31_AppliTimebaseTick,#1
2004                     ; 748 }
2007  063b 81            	ret	
2032                     ; 756 void ClearAppliTimebaseTick(void)
2032                     ; 757 {
2033                     	switch	.text
2034  063c               L33_ClearAppliTimebaseTick:
2038                     ; 758 	AppliTimebaseTick=FALSE;
2040  063c 725f0004      	clr	L31_AppliTimebaseTick
2041                     ; 759 }
2044  0640 81            	ret	
2070                     ; 767 bool TestAppliTimebaseTick(void)
2070                     ; 768 {
2071                     	switch	.text
2072  0641               L53_TestAppliTimebaseTick:
2076                     ; 769 	if (AppliTimebaseTick) return TRUE;
2078  0641 c60004        	ld	a,L31_AppliTimebaseTick
2079  0644 2702          	jreq	L165
2082  0646 a601          	ld	a,#1
2085  0648               L165:
2086                     ; 770 	else return FALSE;
2090  0648 81            	ret	
2124                     ; 779 void LED_Display(uint8_t Ledstatus)
2124                     ; 780 {
2125                     	switch	.text
2126  0649               L73_LED_Display:
2130                     ; 782   switch((uint8_t)Ledstatus)
2133                     ; 862 		break;
2134  0649 4d            	tnz	a
2135  064a 2727          	jreq	L565
2136  064c 4a            	dec	a
2137  064d 272e          	jreq	L765
2138  064f 4a            	dec	a
2139  0650 2750          	jreq	L175
2140  0652 4a            	dec	a
2141  0653 2760          	jreq	L375
2142  0655 4a            	dec	a
2143  0656 2779          	jreq	L575
2144  0658 4a            	dec	a
2145  0659 2603cc0700    	jreq	L775
2146  065e 4a            	dec	a
2147  065f 2603cc0725    	jreq	L106
2148  0664 4a            	dec	a
2149  0665 2603cc0738    	jreq	L306
2150  066a 4a            	dec	a
2151  066b 2603cc0754    	jreq	L506
2152                     ; 856 	default: 
2152                     ; 857 		LD3_RED_LED_OFF;
2154                     ; 858 		LD4_GREEN_LED_OFF;
2156                     ; 859 		LD5_GREEN_LED_OFF;
2158                     ; 860 		LD6_GREEN_LED_OFF;
2160                     ; 861 		LD7_GREEN_LED_ON;
2162                     ; 862 		break;
2164  0670 cc0700        	jp	L775
2165  0673               L565:
2166                     ; 784 	case 0: 
2166                     ; 785 		LD3_RED_LED_OFF;
2168  0673 4b08          	push	#8
2169  0675 ae5000        	ldw	x,#20480
2170  0678 cd0000        	call	_GPIO_WriteLow
2172                     ; 786 		LD4_GREEN_LED_OFF;
2174                     ; 787 		LD5_GREEN_LED_OFF;
2176                     ; 788 		LD6_GREEN_LED_OFF;
2178                     ; 789 		LD7_GREEN_LED_OFF;
2180                     ; 790 		break;
2182  067b 2008          	jp	LC031
2183  067d               L765:
2184                     ; 792 	case 1: 
2184                     ; 793 		LD3_RED_LED_ON;
2186  067d 4b08          	push	#8
2187  067f ae5000        	ldw	x,#20480
2188  0682 cd0000        	call	_GPIO_WriteHigh
2190                     ; 794 		LD4_GREEN_LED_OFF;
2192  0685               LC031:
2193  0685 84            	pop	a
2195  0686 4b08          	push	#8
2196  0688 ae500f        	ldw	x,#20495
2197  068b cd0000        	call	_GPIO_WriteLow
2199                     ; 795 		LD5_GREEN_LED_OFF;
2201  068e               LC030:
2202  068e 84            	pop	a
2205  068f 4b01          	push	#1
2206  0691 ae500f        	ldw	x,#20495
2207  0694 cd0000        	call	_GPIO_WriteLow
2209                     ; 796 		LD6_GREEN_LED_OFF;
2211  0697               LC029:
2212  0697 84            	pop	a
2217  0698 4b08          	push	#8
2218  069a ae5014        	ldw	x,#20500
2219  069d cd0000        	call	_GPIO_WriteLow
2221                     ; 797 		LD7_GREEN_LED_OFF;
2223                     ; 798 		break;
2225  06a0 2052          	jp	LC028
2226  06a2               L175:
2227                     ; 800 	case 2: 
2227                     ; 801 		LD3_RED_LED_OFF;
2229  06a2 4b08          	push	#8
2230  06a4 ae5000        	ldw	x,#20480
2231  06a7 cd0000        	call	_GPIO_WriteLow
2233  06aa 84            	pop	a
2234                     ; 802 		LD4_GREEN_LED_ON;
2236  06ab 4b08          	push	#8
2237  06ad ae500f        	ldw	x,#20495
2238  06b0 cd0000        	call	_GPIO_WriteHigh
2240                     ; 803 		LD5_GREEN_LED_OFF;
2242                     ; 804 		LD6_GREEN_LED_OFF;
2244                     ; 805 		LD7_GREEN_LED_OFF;
2246                     ; 806 		break;
2248  06b3 20d9          	jp	LC030
2249  06b5               L375:
2250                     ; 808 	case 3: 
2250                     ; 809 		LD3_RED_LED_OFF;
2252  06b5 4b08          	push	#8
2253  06b7 ae5000        	ldw	x,#20480
2254  06ba cd0000        	call	_GPIO_WriteLow
2256  06bd 84            	pop	a
2257                     ; 810 		LD4_GREEN_LED_OFF;
2259  06be 4b08          	push	#8
2260  06c0 ae500f        	ldw	x,#20495
2261  06c3 cd0000        	call	_GPIO_WriteLow
2263                     ; 811 		LD5_GREEN_LED_ON;
2265  06c6               LC032:
2266  06c6 84            	pop	a
2268  06c7 4b01          	push	#1
2269  06c9 ae500f        	ldw	x,#20495
2270  06cc cd0000        	call	_GPIO_WriteHigh
2272                     ; 812 		LD6_GREEN_LED_OFF;
2274                     ; 813 		LD7_GREEN_LED_OFF;
2276                     ; 814 		break;
2278  06cf 20c6          	jp	LC029
2279  06d1               L575:
2280                     ; 816 	case 4: 
2280                     ; 817 		LD3_RED_LED_OFF;
2282  06d1 4b08          	push	#8
2283  06d3 ae5000        	ldw	x,#20480
2284  06d6 cd0000        	call	_GPIO_WriteLow
2286  06d9 84            	pop	a
2287                     ; 818 		LD4_GREEN_LED_OFF;
2289  06da 4b08          	push	#8
2290  06dc ae500f        	ldw	x,#20495
2291  06df cd0000        	call	_GPIO_WriteLow
2293  06e2 84            	pop	a
2294                     ; 819 		LD5_GREEN_LED_OFF;
2296  06e3 4b01          	push	#1
2297  06e5 ae500f        	ldw	x,#20495
2298  06e8 cd0000        	call	_GPIO_WriteLow
2300  06eb 84            	pop	a
2301                     ; 820 		LD6_GREEN_LED_ON;
2303  06ec 4b08          	push	#8
2304  06ee ae5014        	ldw	x,#20500
2305  06f1 cd0000        	call	_GPIO_WriteHigh
2307                     ; 821 		LD7_GREEN_LED_OFF;
2309  06f4               LC028:
2310  06f4 84            	pop	a
2316  06f5 4b08          	push	#8
2317  06f7 ae500a        	ldw	x,#20490
2318  06fa cd0000        	call	_GPIO_WriteLow
2320                     ; 822 		break;
2322  06fd cc0780        	jra	L726
2323  0700               L775:
2324                     ; 824 	case 5: 
2324                     ; 825 		LD3_RED_LED_OFF;
2327                     ; 826 		LD4_GREEN_LED_OFF;
2330                     ; 827 		LD5_GREEN_LED_OFF;
2333  0700 4b08          	push	#8
2334  0702 ae5000        	ldw	x,#20480
2335  0705 cd0000        	call	_GPIO_WriteLow
2336  0708 84            	pop	a
2338  0709 4b08          	push	#8
2339  070b ae500f        	ldw	x,#20495
2340  070e cd0000        	call	_GPIO_WriteLow
2341  0711 84            	pop	a
2343  0712 4b01          	push	#1
2344  0714 ae500f        	ldw	x,#20495
2345  0717 cd0000        	call	_GPIO_WriteLow
2347                     ; 828 		LD6_GREEN_LED_OFF;
2349  071a               LC026:
2350  071a 84            	pop	a
2353  071b 4b08          	push	#8
2354  071d ae5014        	ldw	x,#20500
2355  0720 cd0000        	call	_GPIO_WriteLow
2357                     ; 829 		LD7_GREEN_LED_ON;
2359                     ; 830 		break;
2361  0723 2052          	jp	LC025
2362  0725               L106:
2363                     ; 832 	case 6: 
2363                     ; 833 		LD3_RED_LED_OFF;
2365  0725 4b08          	push	#8
2366  0727 ae5000        	ldw	x,#20480
2367  072a cd0000        	call	_GPIO_WriteLow
2369  072d 84            	pop	a
2370                     ; 834 		LD4_GREEN_LED_ON;
2372  072e 4b08          	push	#8
2373  0730 ae500f        	ldw	x,#20495
2374  0733 cd0000        	call	_GPIO_WriteHigh
2376                     ; 835 		LD5_GREEN_LED_ON;
2378                     ; 836 		LD6_GREEN_LED_OFF;
2380                     ; 837 		LD7_GREEN_LED_OFF;
2382                     ; 838 		break;
2384  0736 208e          	jp	LC032
2385  0738               L306:
2386                     ; 840 	case 7: 
2386                     ; 841 		LD3_RED_LED_OFF;
2388  0738 4b08          	push	#8
2389  073a ae5000        	ldw	x,#20480
2390  073d cd0000        	call	_GPIO_WriteLow
2392  0740 84            	pop	a
2393                     ; 842 		LD4_GREEN_LED_OFF;
2395  0741 4b08          	push	#8
2396  0743 ae500f        	ldw	x,#20495
2397  0746 cd0000        	call	_GPIO_WriteLow
2399  0749 84            	pop	a
2400                     ; 843 		LD5_GREEN_LED_ON;
2402  074a 4b01          	push	#1
2403  074c ae500f        	ldw	x,#20495
2404  074f cd0000        	call	_GPIO_WriteHigh
2406                     ; 844 		LD6_GREEN_LED_OFF;
2408                     ; 845 		LD7_GREEN_LED_ON;
2410                     ; 846 		break;
2412  0752 20c6          	jp	LC026
2413  0754               L506:
2414                     ; 848 	case 8: 
2414                     ; 849 		LD3_RED_LED_OFF;
2416  0754 4b08          	push	#8
2417  0756 ae5000        	ldw	x,#20480
2418  0759 cd0000        	call	_GPIO_WriteLow
2420  075c 84            	pop	a
2421                     ; 850 		LD4_GREEN_LED_ON;
2423  075d 4b08          	push	#8
2424  075f ae500f        	ldw	x,#20495
2425  0762 cd0000        	call	_GPIO_WriteHigh
2427  0765 84            	pop	a
2428                     ; 851 		LD5_GREEN_LED_ON;
2430  0766 4b01          	push	#1
2431  0768 ae500f        	ldw	x,#20495
2432  076b cd0000        	call	_GPIO_WriteHigh
2434  076e 84            	pop	a
2435                     ; 852 		LD6_GREEN_LED_ON;
2437  076f 4b08          	push	#8
2438  0771 ae5014        	ldw	x,#20500
2439  0774 cd0000        	call	_GPIO_WriteHigh
2441                     ; 853 		LD7_GREEN_LED_ON;
2443  0777               LC025:
2444  0777 84            	pop	a
2448  0778 4b08          	push	#8
2449  077a ae500a        	ldw	x,#20490
2450  077d cd0000        	call	_GPIO_WriteHigh
2452                     ; 854 		break;
2454  0780               L726:
2455  0780 84            	pop	a
2456                     ; 864 }
2459  0781 81            	ret	
2549                     	xdef	_Appli
2550                     	xdef	_SetAppliTimebaseTick
2551                     	xdef	_StartupCompleted
2552                     	xdef	_StartupDisplay
2553                     	switch	.bss
2554  0000               _UserButton2:
2555  0000 00            	ds.b	1
2556                     	xdef	_UserButton2
2557  0001               _UserButton1:
2558  0001 00            	ds.b	1
2559                     	xdef	_UserButton1
2560                     	xref	_GetADCIOData
2561                     	xref	_GetADCData
2562                     	xref	_CAN_WriteData
2563                     	xref	_CAN_ReadData
2564                     	xref	_LIN_WriteData
2565                     	xref	_LIN_ReadData
2566                     	xref	_ErrorState
2567                     	xref	_LINSlave
2568                     	xref	_CANMaster
2569                     	xref	_TransmissionEnable
2570                     	xref	_L99PM62drv_SetPWMDutyCycle
2571                     	xref	_GPIO_WriteLow
2572                     	xref	_GPIO_WriteHigh
2573                     	xref	_ADC2_StartConversion
2574                     .const:	section	.text
2575  0000               L301:
2576  0000 40000000      	dc.w	16384,0
2577                     	xref.b	c_lreg
2578                     	xref.b	c_x
2598                     	xref	c_ftol
2599                     	xref	c_fdiv
2600                     	xref	c_itof
2601                     	end
