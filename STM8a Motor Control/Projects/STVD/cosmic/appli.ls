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
  90                     ; 232 void Appli(void)
  90                     ; 233 {
  92                     	switch	.text
  93  0000               _Appli:
  97                     ; 235 	if (TestAppliTimebaseTick())
  99  0000 cd05dc        	call	L53_TestAppliTimebaseTick
 101  0003 4d            	tnz	a
 102  0004 2603cc0380    	jreq	L75
 103                     ; 237 		ClearAppliTimebaseTick();
 105  0009 cd05d7        	call	L33_ClearAppliTimebaseTick
 107                     ; 241 		if (StartupDisplay<23)
 110  000c c60005        	ld	a,_StartupDisplay
 111  000f a117          	cp	a,#23
 112  0011 2426          	jruge	L16
 113                     ; 243 			StartupDisplay++;
 115  0013 725c0005      	inc	_StartupDisplay
 116                     ; 246 			if ((CANMaster==TRUE)&&(TransmissionEnable==TRUE)) LED_Display(CAN_MASTER_TEST_MODE);
 118  0017 c60000        	ld	a,_CANMaster
 119  001a 4a            	dec	a
 120  001b 260a          	jrne	L36
 122  001d c60000        	ld	a,_TransmissionEnable
 123  0020 4a            	dec	a
 124  0021 2604          	jrne	L36
 127  0023 a606          	ld	a,#6
 130  0025 200f          	jp	LC004
 131  0027               L36:
 132                     ; 252 			else if (LINSlave==TRUE) LED_Display(LIN_SLAVE_TEST_MODE);
 134  0027 c60000        	ld	a,_LINSlave
 135  002a 4a            	dec	a
 136  002b 2604          	jrne	L76
 139  002d a608          	ld	a,#8
 142  002f 2005          	jp	LC004
 143  0031               L76:
 144                     ; 255 			else LED_Display(StartupDisplay>>2);
 146  0031 c60005        	ld	a,_StartupDisplay
 147  0034 44            	srl	a
 148  0035 44            	srl	a
 149  0036               LC004:
 152  0036 cc05e4        	jp	L73_LED_Display
 153  0039               L16:
 154                     ; 259 			StartupCompleted=TRUE;
 156  0039 35010006      	mov	_StartupCompleted,#1
 157                     ; 261 			ADC2_StartConversion();
 159  003d cd0000        	call	_ADC2_StartConversion
 161                     ; 264 			Data0 = (uint8_t) GetADCIOData();
 163  0040 cd0000        	call	_GetADCIOData
 165  0043 9f            	ld	a,xl
 166  0044 c70000        	ld	L3_Data0,a
 167                     ; 265 			Data1 = (uint8_t) (GetADCIOData()>>8);
 169  0047 cd0000        	call	_GetADCIOData
 171  004a 4f            	clr	a
 172  004b 01            	rrwa	x,a
 173  004c 9f            	ld	a,xl
 174  004d c70001        	ld	L5_Data1,a
 175                     ; 267 			ADC2_StartConversion();
 177  0050 cd0000        	call	_ADC2_StartConversion
 179                     ; 270 			motorDuty1 = (uint8_t) (GetADCData()>>2);
 181  0053 cd0000        	call	_GetADCData
 183  0056 54            	srlw	x
 184  0057 54            	srlw	x
 185  0058 9f            	ld	a,xl
 186  0059 c70002        	ld	L7_motorDuty1,a
 187                     ; 274 			if ((TransmissionEnable==TRUE)&&(CANMaster==TRUE))
 189  005c c60000        	ld	a,_TransmissionEnable
 190  005f 4a            	dec	a
 191  0060 2703cc013d    	jrne	L57
 193  0065 c60000        	ld	a,_CANMaster
 194  0068 4a            	dec	a
 195  0069 26f7          	jrne	L57
 196                     ; 276 				WRITE_CAN_MASTER_RV1_TRIMMER_LSB(Data0);
 198  006b 3b0000        	push	L3_Data0
 199  006e ae0203        	ldw	x,#515
 200  0071 cd0000        	call	_CAN_WriteData
 202  0074 84            	pop	a
 203                     ; 277 				WRITE_CAN_MASTER_RV1_TRIMMER_MSB(Data1);
 205  0075 3b0001        	push	L5_Data1
 206  0078 ae0202        	ldw	x,#514
 207  007b cd0000        	call	_CAN_WriteData
 209  007e 84            	pop	a
 210                     ; 278 				L99PM62drv_SetPWMFrequ(L99PM62DRV_PWMFREQU_200HZ);
 212  007f a601          	ld	a,#1
 213  0081 cd0000        	call	_L99PM62drv_SetPWMFrequ
 215                     ; 279 				L99PM62drv_SetPWMDutyCycle(L99PM62DRV_MASK_PWM1,motorDuty1/2.0);
 217  0084 c60002        	ld	a,L7_motorDuty1
 218  0087 5f            	clrw	x
 219  0088 97            	ld	xl,a
 220  0089 cd0000        	call	c_itof
 222  008c ae0000        	ldw	x,#L301
 223  008f cd0000        	call	c_fdiv
 225  0092 cd0000        	call	c_ftol
 227  0095 b603          	ld	a,c_lreg+3
 228  0097 ae0100        	ldw	x,#256
 229  009a 97            	ld	xl,a
 230  009b cd0000        	call	_L99PM62drv_SetPWMDutyCycle
 232                     ; 280 				L99PM62drv_SetOut1Mode(L99PM62DRV_OUT1_MODE_PWM1);
 234  009e 4f            	clr	a
 235  009f cd0000        	call	_L99PM62drv_SetOut1Mode
 237                     ; 283 				if (UserButton1Status()) 
 239  00a2 cd0381        	call	L51_UserButton1Status
 241  00a5 4d            	tnz	a
 242  00a6 270e          	jreq	L701
 243                     ; 285 					WRITE_CAN_MASTER_USER1_BUTTON(TRUE);
 245  00a8 4b01          	push	#1
 246  00aa ae0200        	ldw	x,#512
 247  00ad cd0000        	call	_CAN_WriteData
 249  00b0 84            	pop	a
 250                     ; 286 					IncrementStatus();			
 252  00b1 cd039b        	call	L12_IncrementStatus
 255  00b4 2009          	jra	L111
 256  00b6               L701:
 257                     ; 290 					WRITE_CAN_MASTER_USER1_BUTTON(FALSE);		
 259  00b6 4b00          	push	#0
 260  00b8 ae0200        	ldw	x,#512
 261  00bb cd0000        	call	_CAN_WriteData
 263  00be 84            	pop	a
 264  00bf               L111:
 265                     ; 294 				if (UserButton2Status())
 267  00bf cd038e        	call	L71_UserButton2Status
 269  00c2 4d            	tnz	a
 270  00c3 270e          	jreq	L311
 271                     ; 296 					WRITE_CAN_MASTER_USER2_BUTTON(TRUE);
 273  00c5 4b01          	push	#1
 274  00c7 ae0201        	ldw	x,#513
 275  00ca cd0000        	call	_CAN_WriteData
 277  00cd 84            	pop	a
 278                     ; 297 					DecrementStatus();
 280  00ce cd03c6        	call	L32_DecrementStatus
 283  00d1 2009          	jra	L511
 284  00d3               L311:
 285                     ; 301 					WRITE_CAN_MASTER_USER2_BUTTON(FALSE);			
 287  00d3 4b00          	push	#0
 288  00d5 ae0201        	ldw	x,#513
 289  00d8 cd0000        	call	_CAN_WriteData
 291  00db 84            	pop	a
 292  00dc               L511:
 293                     ; 303 				if(!ErrorState)
 295  00dc c60000        	ld	a,_ErrorState
 296  00df 2703cc0380    	jrne	L75
 297                     ; 306 					if (READ_CAN_MASTER_LD4_GREEN_LED) LD4_GREEN_LED_ON; else LD4_GREEN_LED_OFF;
 299  00e4 ae0100        	ldw	x,#256
 300  00e7 cd0000        	call	_CAN_ReadData
 302  00ea 4d            	tnz	a
 303  00eb 270a          	jreq	L121
 306  00ed 4b08          	push	#8
 307  00ef ae500f        	ldw	x,#20495
 308  00f2 cd0000        	call	_GPIO_WriteHigh
 311  00f5 2008          	jra	L321
 312  00f7               L121:
 315  00f7 4b08          	push	#8
 316  00f9 ae500f        	ldw	x,#20495
 317  00fc cd0000        	call	_GPIO_WriteLow
 319  00ff               L321:
 320  00ff ae0101        	ldw	x,#257
 321  0102 84            	pop	a
 322                     ; 307 					if (READ_CAN_MASTER_LD5_GREEN_LED) LD5_GREEN_LED_ON; else LD5_GREEN_LED_OFF;
 324  0103 cd0000        	call	_CAN_ReadData
 326  0106 4d            	tnz	a
 327  0107 270a          	jreq	L521
 330  0109 4b01          	push	#1
 331  010b ae500f        	ldw	x,#20495
 332  010e cd0000        	call	_GPIO_WriteHigh
 335  0111 2008          	jra	L721
 336  0113               L521:
 339  0113 4b01          	push	#1
 340  0115 ae500f        	ldw	x,#20495
 341  0118 cd0000        	call	_GPIO_WriteLow
 343  011b               L721:
 344  011b ae0102        	ldw	x,#258
 345  011e 84            	pop	a
 346                     ; 308 					if (READ_CAN_MASTER_LD6_GREEN_LED) LD6_GREEN_LED_ON; else LD6_GREEN_LED_OFF;
 348  011f cd0000        	call	_CAN_ReadData
 350  0122 4d            	tnz	a
 351  0123 270a          	jreq	L131
 354  0125 4b08          	push	#8
 355  0127 ae5014        	ldw	x,#20500
 356  012a cd0000        	call	_GPIO_WriteHigh
 359  012d 2008          	jra	L331
 360  012f               L131:
 363  012f 4b08          	push	#8
 364  0131 ae5014        	ldw	x,#20500
 365  0134 cd0000        	call	_GPIO_WriteLow
 367  0137               L331:
 368  0137 ae0103        	ldw	x,#259
 369                     ; 309 					if (READ_CAN_MASTER_LD7_GREEN_LED) LD7_GREEN_LED_ON; else LD7_GREEN_LED_OFF;
 374  013a cc01f5        	jp	LC006
 377  013d               L57:
 378                     ; 314 			else if ((TransmissionEnable==TRUE)&&(CANMaster==FALSE))
 380  013d c60000        	ld	a,_TransmissionEnable
 381  0140 4a            	dec	a
 382  0141 2703cc01fc    	jrne	L341
 384  0146 c60000        	ld	a,_CANMaster
 385  0149 26f8          	jrne	L341
 386                     ; 316 				WRITE_CAN_SLAVE_RV1_TRIMMER_LSB(Data0);
 388  014b 3b0000        	push	L3_Data0
 389  014e ae0303        	ldw	x,#771
 390  0151 cd0000        	call	_CAN_WriteData
 392  0154 84            	pop	a
 393                     ; 317 				WRITE_CAN_SLAVE_RV1_TRIMMER_MSB(Data1);
 395  0155 3b0001        	push	L5_Data1
 396  0158 ae0302        	ldw	x,#770
 397  015b cd0000        	call	_CAN_WriteData
 399  015e 84            	pop	a
 400                     ; 320 				if (UserButton1Status()) 
 402  015f cd0381        	call	L51_UserButton1Status
 404  0162 4d            	tnz	a
 405  0163 270e          	jreq	L541
 406                     ; 322 					WRITE_CAN_SLAVE_USER1_BUTTON(TRUE);
 408  0165 4b01          	push	#1
 409  0167 ae0300        	ldw	x,#768
 410  016a cd0000        	call	_CAN_WriteData
 412  016d 84            	pop	a
 413                     ; 323 					IncrementStatus();			
 415  016e cd039b        	call	L12_IncrementStatus
 418  0171 2009          	jra	L741
 419  0173               L541:
 420                     ; 327 					WRITE_CAN_SLAVE_USER1_BUTTON(FALSE);		
 422  0173 4b00          	push	#0
 423  0175 ae0300        	ldw	x,#768
 424  0178 cd0000        	call	_CAN_WriteData
 426  017b 84            	pop	a
 427  017c               L741:
 428                     ; 331 				if (UserButton2Status())
 430  017c cd038e        	call	L71_UserButton2Status
 432  017f 4d            	tnz	a
 433  0180 270e          	jreq	L151
 434                     ; 333 					WRITE_CAN_SLAVE_USER2_BUTTON(TRUE);
 436  0182 4b01          	push	#1
 437  0184 ae0301        	ldw	x,#769
 438  0187 cd0000        	call	_CAN_WriteData
 440  018a 84            	pop	a
 441                     ; 334 					DecrementStatus();
 443  018b cd03c6        	call	L32_DecrementStatus
 446  018e 2009          	jra	L351
 447  0190               L151:
 448                     ; 338 					WRITE_CAN_SLAVE_USER2_BUTTON(FALSE);			
 450  0190 4b00          	push	#0
 451  0192 ae0301        	ldw	x,#769
 452  0195 cd0000        	call	_CAN_WriteData
 454  0198 84            	pop	a
 455  0199               L351:
 456                     ; 340 				if(!ErrorState)
 458  0199 c60000        	ld	a,_ErrorState
 459  019c 2703cc0380    	jrne	L75
 460                     ; 343 					if (READ_CAN_SLAVE_LD4_GREEN_LED) LD4_GREEN_LED_ON; else LD4_GREEN_LED_OFF;
 462  01a1 5f            	clrw	x
 463  01a2 cd0000        	call	_CAN_ReadData
 465  01a5 4d            	tnz	a
 466  01a6 270a          	jreq	L751
 469  01a8 4b08          	push	#8
 470  01aa ae500f        	ldw	x,#20495
 471  01ad cd0000        	call	_GPIO_WriteHigh
 474  01b0 2008          	jra	L161
 475  01b2               L751:
 478  01b2 4b08          	push	#8
 479  01b4 ae500f        	ldw	x,#20495
 480  01b7 cd0000        	call	_GPIO_WriteLow
 482  01ba               L161:
 483  01ba ae0001        	ldw	x,#1
 484  01bd 84            	pop	a
 485                     ; 344 					if (READ_CAN_SLAVE_LD5_GREEN_LED) LD5_GREEN_LED_ON; else LD5_GREEN_LED_OFF;
 487  01be cd0000        	call	_CAN_ReadData
 489  01c1 4d            	tnz	a
 490  01c2 270a          	jreq	L361
 493  01c4 4b01          	push	#1
 494  01c6 ae500f        	ldw	x,#20495
 495  01c9 cd0000        	call	_GPIO_WriteHigh
 498  01cc 2008          	jra	L561
 499  01ce               L361:
 502  01ce 4b01          	push	#1
 503  01d0 ae500f        	ldw	x,#20495
 504  01d3 cd0000        	call	_GPIO_WriteLow
 506  01d6               L561:
 507  01d6 ae0002        	ldw	x,#2
 508  01d9 84            	pop	a
 509                     ; 345 					if (READ_CAN_SLAVE_LD6_GREEN_LED) LD6_GREEN_LED_ON; else LD6_GREEN_LED_OFF;
 511  01da cd0000        	call	_CAN_ReadData
 513  01dd 4d            	tnz	a
 514  01de 270a          	jreq	L761
 517  01e0 4b08          	push	#8
 518  01e2 ae5014        	ldw	x,#20500
 519  01e5 cd0000        	call	_GPIO_WriteHigh
 522  01e8 2008          	jra	L171
 523  01ea               L761:
 526  01ea 4b08          	push	#8
 527  01ec ae5014        	ldw	x,#20500
 528  01ef cd0000        	call	_GPIO_WriteLow
 530  01f2               L171:
 531  01f2 ae0003        	ldw	x,#3
 532                     ; 346 					if (READ_CAN_SLAVE_LD7_GREEN_LED) LD7_GREEN_LED_ON; else LD7_GREEN_LED_OFF;
 534  01f5               LC006:
 535  01f5 84            	pop	a
 537  01f6 cd0000        	call	_CAN_ReadData
 542  01f9 cc02b3        	jp	LC005
 545  01fc               L341:
 546                     ; 353 				if (LINSlave==TRUE)
 548  01fc c60000        	ld	a,_LINSlave
 549  01ff 4a            	dec	a
 550  0200 2703cc02c4    	jrne	L102
 551                     ; 356 					WRITE_SLAVE_RV1_TRIMMER_LSB(Data0);
 553  0205 3b0000        	push	L3_Data0
 554  0208 ae0303        	ldw	x,#771
 555  020b cd0000        	call	_LIN_WriteData
 557  020e 84            	pop	a
 558                     ; 357 					WRITE_SLAVE_RV1_TRIMMER_MSB(Data1);
 560  020f 3b0001        	push	L5_Data1
 561  0212 ae0302        	ldw	x,#770
 562  0215 cd0000        	call	_LIN_WriteData
 564  0218 84            	pop	a
 565                     ; 360 					if (UserButton1Status()) 
 567  0219 cd0381        	call	L51_UserButton1Status
 569  021c 4d            	tnz	a
 570  021d 270e          	jreq	L302
 571                     ; 362 						WRITE_SLAVE_USER1_BUTTON(TRUE);
 573  021f 4b01          	push	#1
 574  0221 ae0300        	ldw	x,#768
 575  0224 cd0000        	call	_LIN_WriteData
 577  0227 84            	pop	a
 578                     ; 363 						IncrementStatus();			
 580  0228 cd039b        	call	L12_IncrementStatus
 583  022b 2009          	jra	L502
 584  022d               L302:
 585                     ; 367 						WRITE_SLAVE_USER1_BUTTON(FALSE);		
 587  022d 4b00          	push	#0
 588  022f ae0300        	ldw	x,#768
 589  0232 cd0000        	call	_LIN_WriteData
 591  0235 84            	pop	a
 592  0236               L502:
 593                     ; 371 					if (UserButton2Status())
 595  0236 cd038e        	call	L71_UserButton2Status
 597  0239 4d            	tnz	a
 598  023a 270e          	jreq	L702
 599                     ; 373 						WRITE_SLAVE_USER2_BUTTON(TRUE);
 601  023c 4b01          	push	#1
 602  023e ae0301        	ldw	x,#769
 603  0241 cd0000        	call	_LIN_WriteData
 605  0244 84            	pop	a
 606                     ; 374 						DecrementStatus();
 608  0245 cd03c6        	call	L32_DecrementStatus
 611  0248 2009          	jra	L112
 612  024a               L702:
 613                     ; 378 						WRITE_SLAVE_USER2_BUTTON(FALSE);			
 615  024a 4b00          	push	#0
 616  024c ae0301        	ldw	x,#769
 617  024f cd0000        	call	_LIN_WriteData
 619  0252 84            	pop	a
 620  0253               L112:
 621                     ; 380 					if(!ErrorState)
 623  0253 c60000        	ld	a,_ErrorState
 624  0256 2703cc0380    	jrne	L75
 625                     ; 383 						if (READ_SLAVE_LD4_GREEN_LED) LD4_GREEN_LED_ON; else LD4_GREEN_LED_OFF;
 627  025b 5f            	clrw	x
 628  025c cd0000        	call	_LIN_ReadData
 630  025f 4d            	tnz	a
 631  0260 270a          	jreq	L512
 634  0262 4b08          	push	#8
 635  0264 ae500f        	ldw	x,#20495
 636  0267 cd0000        	call	_GPIO_WriteHigh
 639  026a 2008          	jra	L712
 640  026c               L512:
 643  026c 4b08          	push	#8
 644  026e ae500f        	ldw	x,#20495
 645  0271 cd0000        	call	_GPIO_WriteLow
 647  0274               L712:
 648  0274 ae0001        	ldw	x,#1
 649  0277 84            	pop	a
 650                     ; 384 						if (READ_SLAVE_LD5_GREEN_LED) LD5_GREEN_LED_ON; else LD5_GREEN_LED_OFF;
 652  0278 cd0000        	call	_LIN_ReadData
 654  027b 4d            	tnz	a
 655  027c 270a          	jreq	L122
 658  027e 4b01          	push	#1
 659  0280 ae500f        	ldw	x,#20495
 660  0283 cd0000        	call	_GPIO_WriteHigh
 663  0286 2008          	jra	L322
 664  0288               L122:
 667  0288 4b01          	push	#1
 668  028a ae500f        	ldw	x,#20495
 669  028d cd0000        	call	_GPIO_WriteLow
 671  0290               L322:
 672  0290 ae0002        	ldw	x,#2
 673  0293 84            	pop	a
 674                     ; 385 						if (READ_SLAVE_LD6_GREEN_LED) LD6_GREEN_LED_ON; else LD6_GREEN_LED_OFF;
 676  0294 cd0000        	call	_LIN_ReadData
 678  0297 4d            	tnz	a
 679  0298 270a          	jreq	L522
 682  029a 4b08          	push	#8
 683  029c ae5014        	ldw	x,#20500
 684  029f cd0000        	call	_GPIO_WriteHigh
 687  02a2 2008          	jra	L722
 688  02a4               L522:
 691  02a4 4b08          	push	#8
 692  02a6 ae5014        	ldw	x,#20500
 693  02a9 cd0000        	call	_GPIO_WriteLow
 695  02ac               L722:
 696  02ac ae0003        	ldw	x,#3
 697  02af 84            	pop	a
 698                     ; 386 						if (READ_SLAVE_LD7_GREEN_LED) LD7_GREEN_LED_ON; else LD7_GREEN_LED_OFF;
 700  02b0 cd0000        	call	_LIN_ReadData
 702  02b3               LC005:
 703  02b3 4d            	tnz	a
 704  02b4 2603cc0377    	jreq	L562
 707  02b9               LC003:
 711  02b9 4b08          	push	#8
 712  02bb ae500a        	ldw	x,#20490
 713  02be cd0000        	call	_GPIO_WriteHigh
 716  02c1 cc037f        	jp	LC001
 719  02c4               L102:
 720                     ; 392 					WRITE_MASTER_RV1_TRIMMER_LSB(Data0);
 722  02c4 3b0000        	push	L3_Data0
 723  02c7 ae0203        	ldw	x,#515
 724  02ca cd0000        	call	_LIN_WriteData
 726  02cd 84            	pop	a
 727                     ; 393 					WRITE_MASTER_RV1_TRIMMER_MSB(Data1);
 729  02ce 3b0001        	push	L5_Data1
 730  02d1 ae0202        	ldw	x,#514
 731  02d4 cd0000        	call	_LIN_WriteData
 733  02d7 84            	pop	a
 734                     ; 396 					if (UserButton1Status()) 
 736  02d8 cd0381        	call	L51_UserButton1Status
 738  02db 4d            	tnz	a
 739  02dc 270e          	jreq	L732
 740                     ; 398 						WRITE_MASTER_USER1_BUTTON(TRUE);
 742  02de 4b01          	push	#1
 743  02e0 ae0200        	ldw	x,#512
 744  02e3 cd0000        	call	_LIN_WriteData
 746  02e6 84            	pop	a
 747                     ; 399 						IncrementStatus();			
 749  02e7 cd039b        	call	L12_IncrementStatus
 752  02ea 2009          	jra	L142
 753  02ec               L732:
 754                     ; 403 						WRITE_MASTER_USER1_BUTTON(FALSE);		
 756  02ec 4b00          	push	#0
 757  02ee ae0200        	ldw	x,#512
 758  02f1 cd0000        	call	_LIN_WriteData
 760  02f4 84            	pop	a
 761  02f5               L142:
 762                     ; 407 					if (UserButton2Status())
 764  02f5 cd038e        	call	L71_UserButton2Status
 766  02f8 4d            	tnz	a
 767  02f9 270e          	jreq	L342
 768                     ; 409 						WRITE_MASTER_USER2_BUTTON(TRUE);
 770  02fb 4b01          	push	#1
 771  02fd ae0201        	ldw	x,#513
 772  0300 cd0000        	call	_LIN_WriteData
 774  0303 84            	pop	a
 775                     ; 410 						DecrementStatus();
 777  0304 cd03c6        	call	L32_DecrementStatus
 780  0307 2009          	jra	L542
 781  0309               L342:
 782                     ; 414 						WRITE_MASTER_USER2_BUTTON(FALSE);			
 784  0309 4b00          	push	#0
 785  030b ae0201        	ldw	x,#513
 786  030e cd0000        	call	_LIN_WriteData
 788  0311 84            	pop	a
 789  0312               L542:
 790                     ; 416 					if(!ErrorState)
 792  0312 c60000        	ld	a,_ErrorState
 793  0315 2669          	jrne	L75
 794                     ; 419 						if (READ_MASTER_LD4_GREEN_LED) LD4_GREEN_LED_ON; else LD4_GREEN_LED_OFF;
 796  0317 ae0100        	ldw	x,#256
 797  031a cd0000        	call	_LIN_ReadData
 799  031d 4d            	tnz	a
 800  031e 270a          	jreq	L152
 803  0320 4b08          	push	#8
 804  0322 ae500f        	ldw	x,#20495
 805  0325 cd0000        	call	_GPIO_WriteHigh
 808  0328 2008          	jra	L352
 809  032a               L152:
 812  032a 4b08          	push	#8
 813  032c ae500f        	ldw	x,#20495
 814  032f cd0000        	call	_GPIO_WriteLow
 816  0332               L352:
 817  0332 ae0101        	ldw	x,#257
 818  0335 84            	pop	a
 819                     ; 420 						if (READ_MASTER_LD5_GREEN_LED) LD5_GREEN_LED_ON; else LD5_GREEN_LED_OFF;
 821  0336 cd0000        	call	_LIN_ReadData
 823  0339 4d            	tnz	a
 824  033a 270a          	jreq	L552
 827  033c 4b01          	push	#1
 828  033e ae500f        	ldw	x,#20495
 829  0341 cd0000        	call	_GPIO_WriteHigh
 832  0344 2008          	jra	L752
 833  0346               L552:
 836  0346 4b01          	push	#1
 837  0348 ae500f        	ldw	x,#20495
 838  034b cd0000        	call	_GPIO_WriteLow
 840  034e               L752:
 841  034e ae0102        	ldw	x,#258
 842  0351 84            	pop	a
 843                     ; 421 						if (READ_MASTER_LD6_GREEN_LED) LD6_GREEN_LED_ON; else LD6_GREEN_LED_OFF;
 845  0352 cd0000        	call	_LIN_ReadData
 847  0355 4d            	tnz	a
 848  0356 270a          	jreq	L162
 851  0358 4b08          	push	#8
 852  035a ae5014        	ldw	x,#20500
 853  035d cd0000        	call	_GPIO_WriteHigh
 856  0360 2008          	jra	L362
 857  0362               L162:
 860  0362 4b08          	push	#8
 861  0364 ae5014        	ldw	x,#20500
 862  0367 cd0000        	call	_GPIO_WriteLow
 864  036a               L362:
 865  036a ae0103        	ldw	x,#259
 866  036d 84            	pop	a
 867                     ; 422 						if (READ_MASTER_LD7_GREEN_LED) LD7_GREEN_LED_ON; else LD7_GREEN_LED_OFF;
 869  036e cd0000        	call	_LIN_ReadData
 871  0371 4d            	tnz	a
 875  0372 2703cc02b9    	jrne	LC003
 876  0377               L562:
 882  0377 4b08          	push	#8
 883  0379 ae500a        	ldw	x,#20490
 884  037c cd0000        	call	_GPIO_WriteLow
 886  037f               LC001:
 887  037f 84            	pop	a
 888  0380               L75:
 889                     ; 431 }
 892  0380 81            	ret	
 937                     ; 442 bool UserButton1Status(void)
 937                     ; 443 {
 938                     	switch	.text
 939  0381               L51_UserButton1Status:
 943                     ; 445 	if (UserButton1==TRUE)
 945  0381 c60001        	ld	a,_UserButton1
 946  0384 4a            	dec	a
 947  0385 2605          	jrne	L113
 948                     ; 447 		UserButton1=FALSE;
 950  0387 c70001        	ld	_UserButton1,a
 951                     ; 448 		return(TRUE);
 953  038a 4c            	inc	a
 956  038b 81            	ret	
 957  038c               L113:
 958                     ; 452 		return(FALSE);
 960  038c 4f            	clr	a
 963  038d 81            	ret	
 988                     ; 465 bool UserButton2Status(void)
 988                     ; 466 {
 989                     	switch	.text
 990  038e               L71_UserButton2Status:
 994                     ; 468 	if (UserButton2==TRUE)
 996  038e c60000        	ld	a,_UserButton2
 997  0391 4a            	dec	a
 998  0392 2605          	jrne	L523
 999                     ; 470 		UserButton2=FALSE;
1001  0394 c70000        	ld	_UserButton2,a
1002                     ; 471 		return(TRUE);
1004  0397 4c            	inc	a
1007  0398 81            	ret	
1008  0399               L523:
1009                     ; 475 		return(FALSE);
1011  0399 4f            	clr	a
1014  039a 81            	ret	
1043                     ; 487 void IncrementStatus(void)
1043                     ; 488 {	
1044                     	switch	.text
1045  039b               L12_IncrementStatus:
1049                     ; 489 	if (BarStatus<4)
1051  039b c60003        	ld	a,L11_BarStatus
1052  039e a104          	cp	a,#4
1053  03a0 2423          	jruge	L143
1054                     ; 491 		BarStatus++;
1056  03a2 725c0003      	inc	L11_BarStatus
1057                     ; 492 		if ((TransmissionEnable==TRUE)&&(CANMaster==TRUE)) UpdateSlaveLedStatus(); /* CAN "Master" test mode */
1059  03a6 c60000        	ld	a,_TransmissionEnable
1060  03a9 4a            	dec	a
1061  03aa 2609          	jrne	L343
1063  03ac c60000        	ld	a,_CANMaster
1064  03af 4a            	dec	a
1065  03b0 2603          	jrne	L343
1071  03b2 cc055e        	jp	L13_UpdateSlaveLedStatus
1072  03b5               L343:
1073                     ; 493 		else if ((TransmissionEnable==TRUE)&&(CANMaster==FALSE)) UpdateMasterLedStatus(); /* CAN "Slave" tes mode */
1075  03b5 c60000        	ld	a,_TransmissionEnable
1076  03b8 4a            	dec	a
1077  03b9 2608          	jrne	L743
1079  03bb c60000        	ld	a,_CANMaster
1080  03be 2603          	jrne	L743
1086  03c0 cc04e2        	jp	L72_UpdateMasterLedStatus
1087  03c3               L743:
1088                     ; 494 		else UpdateBarStatus(); /* LIN Master demo or test mode */
1090  03c3 ad2a          	call	L52_UpdateBarStatus
1092  03c5               L143:
1093                     ; 497 }
1096  03c5 81            	ret	
1125                     ; 506 void DecrementStatus(void)
1125                     ; 507 {	
1126                     	switch	.text
1127  03c6               L32_DecrementStatus:
1131                     ; 508 	if (BarStatus>0)
1133  03c6 c60003        	ld	a,L11_BarStatus
1134  03c9 2723          	jreq	L363
1135                     ; 510 		BarStatus--;
1137  03cb 725a0003      	dec	L11_BarStatus
1138                     ; 511 		if ((TransmissionEnable==TRUE)&&(CANMaster==TRUE)) UpdateSlaveLedStatus(); /* CAN "Master" test mode */
1140  03cf c60000        	ld	a,_TransmissionEnable
1141  03d2 4a            	dec	a
1142  03d3 2609          	jrne	L563
1144  03d5 c60000        	ld	a,_CANMaster
1145  03d8 4a            	dec	a
1146  03d9 2603          	jrne	L563
1152  03db cc055e        	jp	L13_UpdateSlaveLedStatus
1153  03de               L563:
1154                     ; 512 		else if ((TransmissionEnable==TRUE)&&(CANMaster==FALSE)) UpdateMasterLedStatus(); /* CAN "Slave" test mode */
1156  03de c60000        	ld	a,_TransmissionEnable
1157  03e1 4a            	dec	a
1158  03e2 2608          	jrne	L173
1160  03e4 c60000        	ld	a,_CANMaster
1161  03e7 2603          	jrne	L173
1167  03e9 cc04e2        	jp	L72_UpdateMasterLedStatus
1168  03ec               L173:
1169                     ; 513 		else UpdateBarStatus(); /* LIN Master demo or test mode */
1171  03ec ad01          	call	L52_UpdateBarStatus
1173  03ee               L363:
1174                     ; 516 }
1177  03ee 81            	ret	
1203                     ; 526 void UpdateBarStatus(void)
1203                     ; 527 {
1204                     	switch	.text
1205  03ef               L52_UpdateBarStatus:
1209                     ; 530 	if (LINSlave==TRUE)
1211  03ef c60000        	ld	a,_LINSlave
1212  03f2 4a            	dec	a
1213  03f3 2679          	jrne	L534
1214                     ; 532 		switch (BarStatus)
1216  03f5 c60003        	ld	a,L11_BarStatus
1218                     ; 574 				break;
1219  03f8 270c          	jreq	L573
1220  03fa 4a            	dec	a
1221  03fb 270d          	jreq	L773
1222  03fd 4a            	dec	a
1223  03fe 2729          	jreq	L104
1224  0400 4a            	dec	a
1225  0401 2733          	jreq	L304
1226  0403 4a            	dec	a
1227  0404 2746          	jreq	L504
1228                     ; 569 			default:
1228                     ; 570 				WRITE_MASTER_LD4_GREEN_LED(0);
1230                     ; 571 				WRITE_MASTER_LD5_GREEN_LED(0);
1232                     ; 572 				WRITE_MASTER_LD6_GREEN_LED(0);
1234                     ; 573 				WRITE_MASTER_LD7_GREEN_LED(0);
1236                     ; 574 				break;
1238  0406               L573:
1239                     ; 534 			case 0:
1239                     ; 535 				WRITE_MASTER_LD4_GREEN_LED(0);
1242  0406 4b00          	push	#0
1244                     ; 536 				WRITE_MASTER_LD5_GREEN_LED(0);
1246                     ; 537 				WRITE_MASTER_LD6_GREEN_LED(0);
1248                     ; 538 				WRITE_MASTER_LD7_GREEN_LED(0);
1250                     ; 539 				break;
1252  0408 2002          	jp	LC015
1253  040a               L773:
1254                     ; 541 			case 1:
1254                     ; 542 				WRITE_MASTER_LD4_GREEN_LED(1);
1256  040a 4b01          	push	#1
1258                     ; 543 				WRITE_MASTER_LD5_GREEN_LED(0);
1260  040c               LC015:
1261  040c ae0100        	ldw	x,#256
1262  040f cd0000        	call	_LIN_WriteData
1263  0412 84            	pop	a
1266  0413 4b00          	push	#0
1268                     ; 544 				WRITE_MASTER_LD6_GREEN_LED(0);
1270  0415               LC014:
1271  0415 ae0101        	ldw	x,#257
1272  0418 cd0000        	call	_LIN_WriteData
1273  041b 84            	pop	a
1277  041c 4b00          	push	#0
1279                     ; 545 				WRITE_MASTER_LD7_GREEN_LED(0);
1281  041e               LC013:
1282  041e ae0102        	ldw	x,#258
1283  0421 cd0000        	call	_LIN_WriteData
1284  0424 84            	pop	a
1289  0425 4b00          	push	#0
1291                     ; 546 				break;
1293  0427 2040          	jp	LC012
1294  0429               L104:
1295                     ; 548 			case 2:
1295                     ; 549 				WRITE_MASTER_LD4_GREEN_LED(1);
1297  0429 4b01          	push	#1
1298  042b ae0100        	ldw	x,#256
1299  042e cd0000        	call	_LIN_WriteData
1301  0431 84            	pop	a
1302                     ; 550 				WRITE_MASTER_LD5_GREEN_LED(1);
1304  0432 4b01          	push	#1
1306                     ; 551 				WRITE_MASTER_LD6_GREEN_LED(0);
1308                     ; 552 				WRITE_MASTER_LD7_GREEN_LED(0);
1310                     ; 553 				break;
1312  0434 20df          	jp	LC014
1313  0436               L304:
1314                     ; 555 			case 3:
1314                     ; 556 				WRITE_MASTER_LD4_GREEN_LED(1);
1316  0436 4b01          	push	#1
1317  0438 ae0100        	ldw	x,#256
1318  043b cd0000        	call	_LIN_WriteData
1320  043e 84            	pop	a
1321                     ; 557 				WRITE_MASTER_LD5_GREEN_LED(1);
1323  043f 4b01          	push	#1
1324  0441 ae0101        	ldw	x,#257
1325  0444 cd0000        	call	_LIN_WriteData
1327  0447 84            	pop	a
1328                     ; 558 				WRITE_MASTER_LD6_GREEN_LED(1);
1330  0448 4b01          	push	#1
1332                     ; 559 				WRITE_MASTER_LD7_GREEN_LED(0);
1334                     ; 560 				break;		
1336  044a 20d2          	jp	LC013
1337  044c               L504:
1338                     ; 562 			case 4:
1338                     ; 563 				WRITE_MASTER_LD4_GREEN_LED(1);
1340  044c 4b01          	push	#1
1341  044e ae0100        	ldw	x,#256
1342  0451 cd0000        	call	_LIN_WriteData
1344  0454 84            	pop	a
1345                     ; 564 				WRITE_MASTER_LD5_GREEN_LED(1);
1347  0455 4b01          	push	#1
1348  0457 ae0101        	ldw	x,#257
1349  045a cd0000        	call	_LIN_WriteData
1351  045d 84            	pop	a
1352                     ; 565 				WRITE_MASTER_LD6_GREEN_LED(1);
1354  045e 4b01          	push	#1
1355  0460 ae0102        	ldw	x,#258
1356  0463 cd0000        	call	_LIN_WriteData
1358  0466 84            	pop	a
1359                     ; 566 				WRITE_MASTER_LD7_GREEN_LED(1);
1361  0467 4b01          	push	#1
1362  0469               LC012:
1363  0469 ae0103        	ldw	x,#259
1365                     ; 567 				break;			
1367  046c 202f          	jra	L344
1368                     ; 574 				break;
1369  046e               L534:
1370                     ; 581 		switch (BarStatus)
1372  046e c60003        	ld	a,L11_BarStatus
1374                     ; 623 				break;
1375  0471 270c          	jreq	L114
1376  0473 4a            	dec	a
1377  0474 272c          	jreq	L314
1378  0476 4a            	dec	a
1379  0477 272d          	jreq	L514
1380  0479 4a            	dec	a
1381  047a 2735          	jreq	L714
1382  047c 4a            	dec	a
1383  047d 2746          	jreq	L124
1384                     ; 618 			default:
1384                     ; 619 				WRITE_STM8AL_BAR0(0);
1386                     ; 620 				WRITE_STM8AL_BAR1(0);
1388                     ; 621 				WRITE_STM8AL_BAR2(0);
1390                     ; 622 				WRITE_STM8AL_BAR3(0);
1392                     ; 623 				break;
1394  047f               L114:
1395                     ; 583 			case 0:
1395                     ; 584 				WRITE_STM8AL_BAR0(0);
1398  047f 4b00          	push	#0
1400                     ; 585 				WRITE_STM8AL_BAR1(0);
1402  0481               LC010:
1403  0481 5f            	clrw	x
1404  0482 cd0000        	call	_LIN_WriteData
1405  0485 84            	pop	a
1408  0486 4b00          	push	#0
1410                     ; 586 				WRITE_STM8AL_BAR2(0);
1412  0488               LC009:
1413  0488 ae0001        	ldw	x,#1
1414  048b cd0000        	call	_LIN_WriteData
1415  048e 84            	pop	a
1419  048f 4b00          	push	#0
1421                     ; 587 				WRITE_STM8AL_BAR3(0);
1423  0491               LC008:
1424  0491 ae0002        	ldw	x,#2
1425  0494 cd0000        	call	_LIN_WriteData
1426  0497 84            	pop	a
1431  0498 4b00          	push	#0
1432  049a               LC007:
1433  049a ae0003        	ldw	x,#3
1435                     ; 588 				break;
1436  049d               L344:
1437  049d cd0000        	call	_LIN_WriteData
1438  04a0 84            	pop	a
1439                     ; 626 }
1442  04a1 81            	ret	
1443  04a2               L314:
1444                     ; 590 			case 1:
1444                     ; 591 				WRITE_STM8AL_BAR0(1);
1446  04a2 4b01          	push	#1
1448                     ; 592 				WRITE_STM8AL_BAR1(0);
1450                     ; 593 				WRITE_STM8AL_BAR2(0);
1452                     ; 594 				WRITE_STM8AL_BAR3(0);
1454                     ; 595 				break;
1456  04a4 20db          	jp	LC010
1457  04a6               L514:
1458                     ; 597 			case 2:
1458                     ; 598 				WRITE_STM8AL_BAR0(1);
1460  04a6 4b01          	push	#1
1461  04a8 5f            	clrw	x
1462  04a9 cd0000        	call	_LIN_WriteData
1464  04ac 84            	pop	a
1465                     ; 599 				WRITE_STM8AL_BAR1(1);
1467  04ad 4b01          	push	#1
1469                     ; 600 				WRITE_STM8AL_BAR2(0);
1471                     ; 601 				WRITE_STM8AL_BAR3(0);
1473                     ; 602 				break;
1475  04af 20d7          	jp	LC009
1476  04b1               L714:
1477                     ; 604 			case 3:
1477                     ; 605 				WRITE_STM8AL_BAR0(1);
1479  04b1 4b01          	push	#1
1480  04b3 5f            	clrw	x
1481  04b4 cd0000        	call	_LIN_WriteData
1483  04b7 84            	pop	a
1484                     ; 606 				WRITE_STM8AL_BAR1(1);
1486  04b8 4b01          	push	#1
1487  04ba ae0001        	ldw	x,#1
1488  04bd cd0000        	call	_LIN_WriteData
1490  04c0 84            	pop	a
1491                     ; 607 				WRITE_STM8AL_BAR2(1);
1493  04c1 4b01          	push	#1
1495                     ; 608 				WRITE_STM8AL_BAR3(0);
1497                     ; 609 				break;		
1499  04c3 20cc          	jp	LC008
1500  04c5               L124:
1501                     ; 611 			case 4:
1501                     ; 612 				WRITE_STM8AL_BAR0(1);
1503  04c5 4b01          	push	#1
1504  04c7 5f            	clrw	x
1505  04c8 cd0000        	call	_LIN_WriteData
1507  04cb 84            	pop	a
1508                     ; 613 				WRITE_STM8AL_BAR1(1);
1510  04cc 4b01          	push	#1
1511  04ce ae0001        	ldw	x,#1
1512  04d1 cd0000        	call	_LIN_WriteData
1514  04d4 84            	pop	a
1515                     ; 614 				WRITE_STM8AL_BAR2(1);
1517  04d5 4b01          	push	#1
1518  04d7 ae0002        	ldw	x,#2
1519  04da cd0000        	call	_LIN_WriteData
1521  04dd 84            	pop	a
1522                     ; 615 				WRITE_STM8AL_BAR3(1);
1524  04de 4b01          	push	#1
1526                     ; 616 				break;			
1528  04e0 20b8          	jp	LC007
1554                     ; 629 void UpdateMasterLedStatus(void)
1554                     ; 630 {
1555                     	switch	.text
1556  04e2               L72_UpdateMasterLedStatus:
1560                     ; 632 	switch (BarStatus)
1562  04e2 c60003        	ld	a,L11_BarStatus
1564                     ; 674 			break;
1565  04e5 270c          	jreq	L154
1566  04e7 4a            	dec	a
1567  04e8 270d          	jreq	L354
1568  04ea 4a            	dec	a
1569  04eb 2720          	jreq	L554
1570  04ed 4a            	dec	a
1571  04ee 272a          	jreq	L754
1572  04f0 4a            	dec	a
1573  04f1 2746          	jreq	L164
1574                     ; 669 		default:
1574                     ; 670 			WRITE_CAN_MASTER_LD4_GREEN_LED(0);
1576                     ; 671 			WRITE_CAN_MASTER_LD5_GREEN_LED(0);
1578                     ; 672 			WRITE_CAN_MASTER_LD6_GREEN_LED(0);
1580                     ; 673 			WRITE_CAN_MASTER_LD7_GREEN_LED(0);
1582                     ; 674 			break;
1584  04f3               L154:
1585                     ; 634 		case 0:
1585                     ; 635 			WRITE_CAN_MASTER_LD4_GREEN_LED(0);
1588  04f3 4b00          	push	#0
1590                     ; 636 			WRITE_CAN_MASTER_LD5_GREEN_LED(0);
1592                     ; 637 			WRITE_CAN_MASTER_LD6_GREEN_LED(0);
1594                     ; 638 			WRITE_CAN_MASTER_LD7_GREEN_LED(0);
1596                     ; 639 			break;
1598  04f5 2002          	jp	LC019
1599  04f7               L354:
1600                     ; 641 		case 1:
1600                     ; 642 			WRITE_CAN_MASTER_LD4_GREEN_LED(1);
1602  04f7 4b01          	push	#1
1604                     ; 643 			WRITE_CAN_MASTER_LD5_GREEN_LED(0);
1606  04f9               LC019:
1607  04f9 ae0100        	ldw	x,#256
1608  04fc cd0000        	call	_CAN_WriteData
1609  04ff 84            	pop	a
1612  0500 4b00          	push	#0
1614                     ; 644 			WRITE_CAN_MASTER_LD6_GREEN_LED(0);
1616  0502               LC018:
1617  0502 ae0101        	ldw	x,#257
1618  0505 cd0000        	call	_CAN_WriteData
1619  0508 84            	pop	a
1623  0509 4b00          	push	#0
1625                     ; 645 			WRITE_CAN_MASTER_LD7_GREEN_LED(0);
1627                     ; 646 			break;
1629  050b 2021          	jp	LC017
1630  050d               L554:
1631                     ; 648 		case 2:
1631                     ; 649 			WRITE_CAN_MASTER_LD4_GREEN_LED(1);
1633  050d 4b01          	push	#1
1634  050f ae0100        	ldw	x,#256
1635  0512 cd0000        	call	_CAN_WriteData
1637  0515 84            	pop	a
1638                     ; 650 			WRITE_CAN_MASTER_LD5_GREEN_LED(1);
1640  0516 4b01          	push	#1
1642                     ; 651 			WRITE_CAN_MASTER_LD6_GREEN_LED(0);
1644                     ; 652 			WRITE_CAN_MASTER_LD7_GREEN_LED(0);
1646                     ; 653 			break;
1648  0518 20e8          	jp	LC018
1649  051a               L754:
1650                     ; 655 		case 3:
1650                     ; 656 			WRITE_CAN_MASTER_LD4_GREEN_LED(1);
1652  051a 4b01          	push	#1
1653  051c ae0100        	ldw	x,#256
1654  051f cd0000        	call	_CAN_WriteData
1656  0522 84            	pop	a
1657                     ; 657 			WRITE_CAN_MASTER_LD5_GREEN_LED(1);
1659  0523 4b01          	push	#1
1660  0525 ae0101        	ldw	x,#257
1661  0528 cd0000        	call	_CAN_WriteData
1663  052b 84            	pop	a
1664                     ; 658 			WRITE_CAN_MASTER_LD6_GREEN_LED(1);
1666  052c 4b01          	push	#1
1668                     ; 659 			WRITE_CAN_MASTER_LD7_GREEN_LED(0);
1670  052e               LC017:
1671  052e ae0102        	ldw	x,#258
1672  0531 cd0000        	call	_CAN_WriteData
1673  0534 84            	pop	a
1678  0535 4b00          	push	#0
1680                     ; 660 			break;		
1682  0537 201d          	jra	L774
1683  0539               L164:
1684                     ; 662 		case 4:
1684                     ; 663 			WRITE_CAN_MASTER_LD4_GREEN_LED(1);
1686  0539 4b01          	push	#1
1687  053b ae0100        	ldw	x,#256
1688  053e cd0000        	call	_CAN_WriteData
1690  0541 84            	pop	a
1691                     ; 664 			WRITE_CAN_MASTER_LD5_GREEN_LED(1);
1693  0542 4b01          	push	#1
1694  0544 ae0101        	ldw	x,#257
1695  0547 cd0000        	call	_CAN_WriteData
1697  054a 84            	pop	a
1698                     ; 665 			WRITE_CAN_MASTER_LD6_GREEN_LED(1);
1700  054b 4b01          	push	#1
1701  054d ae0102        	ldw	x,#258
1702  0550 cd0000        	call	_CAN_WriteData
1704  0553 84            	pop	a
1705                     ; 666 			WRITE_CAN_MASTER_LD7_GREEN_LED(1);
1707  0554 4b01          	push	#1
1709                     ; 667 			break;			
1711  0556               L774:
1712  0556 ae0103        	ldw	x,#259
1713  0559 cd0000        	call	_CAN_WriteData
1714  055c 84            	pop	a
1715                     ; 676 }
1718  055d 81            	ret	
1744                     ; 678 void UpdateSlaveLedStatus(void)
1744                     ; 679 {
1745                     	switch	.text
1746  055e               L13_UpdateSlaveLedStatus:
1750                     ; 681 	switch (BarStatus)
1752  055e c60003        	ld	a,L11_BarStatus
1754                     ; 723 			break;
1755  0561 270c          	jreq	L105
1756  0563 4a            	dec	a
1757  0564 270d          	jreq	L305
1758  0566 4a            	dec	a
1759  0567 271e          	jreq	L505
1760  0569 4a            	dec	a
1761  056a 2726          	jreq	L705
1762  056c 4a            	dec	a
1763  056d 2740          	jreq	L115
1764                     ; 718 		default:
1764                     ; 719 			WRITE_CAN_SLAVE_LD4_GREEN_LED(0);
1766                     ; 720 			WRITE_CAN_SLAVE_LD5_GREEN_LED(0);
1768                     ; 721 			WRITE_CAN_SLAVE_LD6_GREEN_LED(0);
1770                     ; 722 			WRITE_CAN_SLAVE_LD7_GREEN_LED(0);
1772                     ; 723 			break;
1774  056f               L105:
1775                     ; 683 		case 0:
1775                     ; 684 			WRITE_CAN_SLAVE_LD4_GREEN_LED(0);
1778  056f 4b00          	push	#0
1780                     ; 685 			WRITE_CAN_SLAVE_LD5_GREEN_LED(0);
1782                     ; 686 			WRITE_CAN_SLAVE_LD6_GREEN_LED(0);
1784                     ; 687 			WRITE_CAN_SLAVE_LD7_GREEN_LED(0);
1786                     ; 688 			break;
1788  0571 2002          	jp	LC023
1789  0573               L305:
1790                     ; 690 		case 1:
1790                     ; 691 			WRITE_CAN_SLAVE_LD4_GREEN_LED(1);
1792  0573 4b01          	push	#1
1794                     ; 692 			WRITE_CAN_SLAVE_LD5_GREEN_LED(0);
1796  0575               LC023:
1797  0575 5f            	clrw	x
1798  0576 cd0000        	call	_CAN_WriteData
1799  0579 84            	pop	a
1802  057a 4b00          	push	#0
1804                     ; 693 			WRITE_CAN_SLAVE_LD6_GREEN_LED(0);
1806  057c               LC022:
1807  057c ae0001        	ldw	x,#1
1808  057f cd0000        	call	_CAN_WriteData
1809  0582 84            	pop	a
1813  0583 4b00          	push	#0
1815                     ; 694 			WRITE_CAN_SLAVE_LD7_GREEN_LED(0);
1817                     ; 695 			break;
1819  0585 201d          	jp	LC021
1820  0587               L505:
1821                     ; 697 		case 2:
1821                     ; 698 			WRITE_CAN_SLAVE_LD4_GREEN_LED(1);
1823  0587 4b01          	push	#1
1824  0589 5f            	clrw	x
1825  058a cd0000        	call	_CAN_WriteData
1827  058d 84            	pop	a
1828                     ; 699 			WRITE_CAN_SLAVE_LD5_GREEN_LED(1);
1830  058e 4b01          	push	#1
1832                     ; 700 			WRITE_CAN_SLAVE_LD6_GREEN_LED(0);
1834                     ; 701 			WRITE_CAN_SLAVE_LD7_GREEN_LED(0);
1836                     ; 702 			break;
1838  0590 20ea          	jp	LC022
1839  0592               L705:
1840                     ; 704 		case 3:
1840                     ; 705 			WRITE_CAN_SLAVE_LD4_GREEN_LED(1);
1842  0592 4b01          	push	#1
1843  0594 5f            	clrw	x
1844  0595 cd0000        	call	_CAN_WriteData
1846  0598 84            	pop	a
1847                     ; 706 			WRITE_CAN_SLAVE_LD5_GREEN_LED(1);
1849  0599 4b01          	push	#1
1850  059b ae0001        	ldw	x,#1
1851  059e cd0000        	call	_CAN_WriteData
1853  05a1 84            	pop	a
1854                     ; 707 			WRITE_CAN_SLAVE_LD6_GREEN_LED(1);
1856  05a2 4b01          	push	#1
1858                     ; 708 			WRITE_CAN_SLAVE_LD7_GREEN_LED(0);
1860  05a4               LC021:
1861  05a4 ae0002        	ldw	x,#2
1862  05a7 cd0000        	call	_CAN_WriteData
1863  05aa 84            	pop	a
1868  05ab 4b00          	push	#0
1870                     ; 709 			break;		
1872  05ad 201b          	jra	L725
1873  05af               L115:
1874                     ; 711 		case 4:
1874                     ; 712 			WRITE_CAN_SLAVE_LD4_GREEN_LED(1);
1876  05af 4b01          	push	#1
1877  05b1 5f            	clrw	x
1878  05b2 cd0000        	call	_CAN_WriteData
1880  05b5 84            	pop	a
1881                     ; 713 			WRITE_CAN_SLAVE_LD5_GREEN_LED(1);
1883  05b6 4b01          	push	#1
1884  05b8 ae0001        	ldw	x,#1
1885  05bb cd0000        	call	_CAN_WriteData
1887  05be 84            	pop	a
1888                     ; 714 			WRITE_CAN_SLAVE_LD6_GREEN_LED(1);
1890  05bf 4b01          	push	#1
1891  05c1 ae0002        	ldw	x,#2
1892  05c4 cd0000        	call	_CAN_WriteData
1894  05c7 84            	pop	a
1895                     ; 715 			WRITE_CAN_SLAVE_LD7_GREEN_LED(1);
1897  05c8 4b01          	push	#1
1899                     ; 716 			break;			
1901  05ca               L725:
1902  05ca ae0003        	ldw	x,#3
1903  05cd cd0000        	call	_CAN_WriteData
1904  05d0 84            	pop	a
1905                     ; 725 }
1908  05d1 81            	ret	
1933                     ; 733 void SetAppliTimebaseTick(void)
1933                     ; 734 {
1934                     	switch	.text
1935  05d2               _SetAppliTimebaseTick:
1939                     ; 735 	AppliTimebaseTick=TRUE;
1941  05d2 35010004      	mov	L31_AppliTimebaseTick,#1
1942                     ; 736 }
1945  05d6 81            	ret	
1970                     ; 744 void ClearAppliTimebaseTick(void)
1970                     ; 745 {
1971                     	switch	.text
1972  05d7               L33_ClearAppliTimebaseTick:
1976                     ; 746 	AppliTimebaseTick=FALSE;
1978  05d7 725f0004      	clr	L31_AppliTimebaseTick
1979                     ; 747 }
1982  05db 81            	ret	
2008                     ; 755 bool TestAppliTimebaseTick(void)
2008                     ; 756 {
2009                     	switch	.text
2010  05dc               L53_TestAppliTimebaseTick:
2014                     ; 757 	if (AppliTimebaseTick) return TRUE;
2016  05dc c60004        	ld	a,L31_AppliTimebaseTick
2017  05df 2702          	jreq	L165
2020  05e1 a601          	ld	a,#1
2023  05e3               L165:
2024                     ; 758 	else return FALSE;
2028  05e3 81            	ret	
2062                     ; 767 void LED_Display(uint8_t Ledstatus)
2062                     ; 768 {
2063                     	switch	.text
2064  05e4               L73_LED_Display:
2068                     ; 770   switch((uint8_t)Ledstatus)
2071                     ; 850 		break;
2072  05e4 4d            	tnz	a
2073  05e5 2727          	jreq	L565
2074  05e7 4a            	dec	a
2075  05e8 272e          	jreq	L765
2076  05ea 4a            	dec	a
2077  05eb 2750          	jreq	L175
2078  05ed 4a            	dec	a
2079  05ee 2760          	jreq	L375
2080  05f0 4a            	dec	a
2081  05f1 2779          	jreq	L575
2082  05f3 4a            	dec	a
2083  05f4 2603cc069b    	jreq	L775
2084  05f9 4a            	dec	a
2085  05fa 2603cc06c0    	jreq	L106
2086  05ff 4a            	dec	a
2087  0600 2603cc06d3    	jreq	L306
2088  0605 4a            	dec	a
2089  0606 2603cc06ef    	jreq	L506
2090                     ; 844 	default: 
2090                     ; 845 		LD3_RED_LED_OFF;
2092                     ; 846 		LD4_GREEN_LED_OFF;
2094                     ; 847 		LD5_GREEN_LED_OFF;
2096                     ; 848 		LD6_GREEN_LED_OFF;
2098                     ; 849 		LD7_GREEN_LED_ON;
2100                     ; 850 		break;
2102  060b cc069b        	jp	L775
2103  060e               L565:
2104                     ; 772 	case 0: 
2104                     ; 773 		LD3_RED_LED_OFF;
2106  060e 4b08          	push	#8
2107  0610 ae5000        	ldw	x,#20480
2108  0613 cd0000        	call	_GPIO_WriteLow
2110                     ; 774 		LD4_GREEN_LED_OFF;
2112                     ; 775 		LD5_GREEN_LED_OFF;
2114                     ; 776 		LD6_GREEN_LED_OFF;
2116                     ; 777 		LD7_GREEN_LED_OFF;
2118                     ; 778 		break;
2120  0616 2008          	jp	LC031
2121  0618               L765:
2122                     ; 780 	case 1: 
2122                     ; 781 		LD3_RED_LED_ON;
2124  0618 4b08          	push	#8
2125  061a ae5000        	ldw	x,#20480
2126  061d cd0000        	call	_GPIO_WriteHigh
2128                     ; 782 		LD4_GREEN_LED_OFF;
2130  0620               LC031:
2131  0620 84            	pop	a
2133  0621 4b08          	push	#8
2134  0623 ae500f        	ldw	x,#20495
2135  0626 cd0000        	call	_GPIO_WriteLow
2137                     ; 783 		LD5_GREEN_LED_OFF;
2139  0629               LC030:
2140  0629 84            	pop	a
2143  062a 4b01          	push	#1
2144  062c ae500f        	ldw	x,#20495
2145  062f cd0000        	call	_GPIO_WriteLow
2147                     ; 784 		LD6_GREEN_LED_OFF;
2149  0632               LC029:
2150  0632 84            	pop	a
2155  0633 4b08          	push	#8
2156  0635 ae5014        	ldw	x,#20500
2157  0638 cd0000        	call	_GPIO_WriteLow
2159                     ; 785 		LD7_GREEN_LED_OFF;
2161                     ; 786 		break;
2163  063b 2052          	jp	LC028
2164  063d               L175:
2165                     ; 788 	case 2: 
2165                     ; 789 		LD3_RED_LED_OFF;
2167  063d 4b08          	push	#8
2168  063f ae5000        	ldw	x,#20480
2169  0642 cd0000        	call	_GPIO_WriteLow
2171  0645 84            	pop	a
2172                     ; 790 		LD4_GREEN_LED_ON;
2174  0646 4b08          	push	#8
2175  0648 ae500f        	ldw	x,#20495
2176  064b cd0000        	call	_GPIO_WriteHigh
2178                     ; 791 		LD5_GREEN_LED_OFF;
2180                     ; 792 		LD6_GREEN_LED_OFF;
2182                     ; 793 		LD7_GREEN_LED_OFF;
2184                     ; 794 		break;
2186  064e 20d9          	jp	LC030
2187  0650               L375:
2188                     ; 796 	case 3: 
2188                     ; 797 		LD3_RED_LED_OFF;
2190  0650 4b08          	push	#8
2191  0652 ae5000        	ldw	x,#20480
2192  0655 cd0000        	call	_GPIO_WriteLow
2194  0658 84            	pop	a
2195                     ; 798 		LD4_GREEN_LED_OFF;
2197  0659 4b08          	push	#8
2198  065b ae500f        	ldw	x,#20495
2199  065e cd0000        	call	_GPIO_WriteLow
2201                     ; 799 		LD5_GREEN_LED_ON;
2203  0661               LC032:
2204  0661 84            	pop	a
2206  0662 4b01          	push	#1
2207  0664 ae500f        	ldw	x,#20495
2208  0667 cd0000        	call	_GPIO_WriteHigh
2210                     ; 800 		LD6_GREEN_LED_OFF;
2212                     ; 801 		LD7_GREEN_LED_OFF;
2214                     ; 802 		break;
2216  066a 20c6          	jp	LC029
2217  066c               L575:
2218                     ; 804 	case 4: 
2218                     ; 805 		LD3_RED_LED_OFF;
2220  066c 4b08          	push	#8
2221  066e ae5000        	ldw	x,#20480
2222  0671 cd0000        	call	_GPIO_WriteLow
2224  0674 84            	pop	a
2225                     ; 806 		LD4_GREEN_LED_OFF;
2227  0675 4b08          	push	#8
2228  0677 ae500f        	ldw	x,#20495
2229  067a cd0000        	call	_GPIO_WriteLow
2231  067d 84            	pop	a
2232                     ; 807 		LD5_GREEN_LED_OFF;
2234  067e 4b01          	push	#1
2235  0680 ae500f        	ldw	x,#20495
2236  0683 cd0000        	call	_GPIO_WriteLow
2238  0686 84            	pop	a
2239                     ; 808 		LD6_GREEN_LED_ON;
2241  0687 4b08          	push	#8
2242  0689 ae5014        	ldw	x,#20500
2243  068c cd0000        	call	_GPIO_WriteHigh
2245                     ; 809 		LD7_GREEN_LED_OFF;
2247  068f               LC028:
2248  068f 84            	pop	a
2254  0690 4b08          	push	#8
2255  0692 ae500a        	ldw	x,#20490
2256  0695 cd0000        	call	_GPIO_WriteLow
2258                     ; 810 		break;
2260  0698 cc071b        	jra	L726
2261  069b               L775:
2262                     ; 812 	case 5: 
2262                     ; 813 		LD3_RED_LED_OFF;
2265                     ; 814 		LD4_GREEN_LED_OFF;
2268                     ; 815 		LD5_GREEN_LED_OFF;
2271  069b 4b08          	push	#8
2272  069d ae5000        	ldw	x,#20480
2273  06a0 cd0000        	call	_GPIO_WriteLow
2274  06a3 84            	pop	a
2276  06a4 4b08          	push	#8
2277  06a6 ae500f        	ldw	x,#20495
2278  06a9 cd0000        	call	_GPIO_WriteLow
2279  06ac 84            	pop	a
2281  06ad 4b01          	push	#1
2282  06af ae500f        	ldw	x,#20495
2283  06b2 cd0000        	call	_GPIO_WriteLow
2285                     ; 816 		LD6_GREEN_LED_OFF;
2287  06b5               LC026:
2288  06b5 84            	pop	a
2291  06b6 4b08          	push	#8
2292  06b8 ae5014        	ldw	x,#20500
2293  06bb cd0000        	call	_GPIO_WriteLow
2295                     ; 817 		LD7_GREEN_LED_ON;
2297                     ; 818 		break;
2299  06be 2052          	jp	LC025
2300  06c0               L106:
2301                     ; 820 	case 6: 
2301                     ; 821 		LD3_RED_LED_OFF;
2303  06c0 4b08          	push	#8
2304  06c2 ae5000        	ldw	x,#20480
2305  06c5 cd0000        	call	_GPIO_WriteLow
2307  06c8 84            	pop	a
2308                     ; 822 		LD4_GREEN_LED_ON;
2310  06c9 4b08          	push	#8
2311  06cb ae500f        	ldw	x,#20495
2312  06ce cd0000        	call	_GPIO_WriteHigh
2314                     ; 823 		LD5_GREEN_LED_ON;
2316                     ; 824 		LD6_GREEN_LED_OFF;
2318                     ; 825 		LD7_GREEN_LED_OFF;
2320                     ; 826 		break;
2322  06d1 208e          	jp	LC032
2323  06d3               L306:
2324                     ; 828 	case 7: 
2324                     ; 829 		LD3_RED_LED_OFF;
2326  06d3 4b08          	push	#8
2327  06d5 ae5000        	ldw	x,#20480
2328  06d8 cd0000        	call	_GPIO_WriteLow
2330  06db 84            	pop	a
2331                     ; 830 		LD4_GREEN_LED_OFF;
2333  06dc 4b08          	push	#8
2334  06de ae500f        	ldw	x,#20495
2335  06e1 cd0000        	call	_GPIO_WriteLow
2337  06e4 84            	pop	a
2338                     ; 831 		LD5_GREEN_LED_ON;
2340  06e5 4b01          	push	#1
2341  06e7 ae500f        	ldw	x,#20495
2342  06ea cd0000        	call	_GPIO_WriteHigh
2344                     ; 832 		LD6_GREEN_LED_OFF;
2346                     ; 833 		LD7_GREEN_LED_ON;
2348                     ; 834 		break;
2350  06ed 20c6          	jp	LC026
2351  06ef               L506:
2352                     ; 836 	case 8: 
2352                     ; 837 		LD3_RED_LED_OFF;
2354  06ef 4b08          	push	#8
2355  06f1 ae5000        	ldw	x,#20480
2356  06f4 cd0000        	call	_GPIO_WriteLow
2358  06f7 84            	pop	a
2359                     ; 838 		LD4_GREEN_LED_ON;
2361  06f8 4b08          	push	#8
2362  06fa ae500f        	ldw	x,#20495
2363  06fd cd0000        	call	_GPIO_WriteHigh
2365  0700 84            	pop	a
2366                     ; 839 		LD5_GREEN_LED_ON;
2368  0701 4b01          	push	#1
2369  0703 ae500f        	ldw	x,#20495
2370  0706 cd0000        	call	_GPIO_WriteHigh
2372  0709 84            	pop	a
2373                     ; 840 		LD6_GREEN_LED_ON;
2375  070a 4b08          	push	#8
2376  070c ae5014        	ldw	x,#20500
2377  070f cd0000        	call	_GPIO_WriteHigh
2379                     ; 841 		LD7_GREEN_LED_ON;
2381  0712               LC025:
2382  0712 84            	pop	a
2386  0713 4b08          	push	#8
2387  0715 ae500a        	ldw	x,#20490
2388  0718 cd0000        	call	_GPIO_WriteHigh
2390                     ; 842 		break;
2392  071b               L726:
2393  071b 84            	pop	a
2394                     ; 852 }
2397  071c 81            	ret	
2487                     	xdef	_Appli
2488                     	xdef	_SetAppliTimebaseTick
2489                     	xdef	_StartupCompleted
2490                     	xdef	_StartupDisplay
2491                     	switch	.bss
2492  0000               _UserButton2:
2493  0000 00            	ds.b	1
2494                     	xdef	_UserButton2
2495  0001               _UserButton1:
2496  0001 00            	ds.b	1
2497                     	xdef	_UserButton1
2498                     	xref	_GetADCIOData
2499                     	xref	_GetADCData
2500                     	xref	_CAN_WriteData
2501                     	xref	_CAN_ReadData
2502                     	xref	_LIN_WriteData
2503                     	xref	_LIN_ReadData
2504                     	xref	_ErrorState
2505                     	xref	_LINSlave
2506                     	xref	_CANMaster
2507                     	xref	_TransmissionEnable
2508                     	xref	_L99PM62drv_SetPWMDutyCycle
2509                     	xref	_L99PM62drv_SetPWMFrequ
2510                     	xref	_L99PM62drv_SetOut1Mode
2511                     	xref	_GPIO_WriteLow
2512                     	xref	_GPIO_WriteHigh
2513                     	xref	_ADC2_StartConversion
2514                     .const:	section	.text
2515  0000               L301:
2516  0000 40000000      	dc.w	16384,0
2517                     	xref.b	c_lreg
2518                     	xref.b	c_x
2538                     	xref	c_ftol
2539                     	xref	c_fdiv
2540                     	xref	c_itof
2541                     	end
