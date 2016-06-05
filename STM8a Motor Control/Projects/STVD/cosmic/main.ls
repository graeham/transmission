   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  19                     	switch	.data
  20  0000               L3_TimingDelay:
  21  0000 00000000      	dc.l	0
  22  0004               L5_WdgTrigger:
  23  0004 00000000      	dc.l	0
  24  0008               L7_WdgTriggerReload:
  25  0008 00000000      	dc.l	0
  26  000c               _ReceptionEnable:
  27  000c 00            	dc.b	0
  81                     ; 84 void main(void)
  81                     ; 85 {
  83                     	switch	.text
  84  0000               _main:
  88                     ; 90   GPIO_Config();  
  90  0000 cd00b6        	call	L12_GPIO_Config
  92                     ; 93     ADC_Config();    
  94  0003 cd0000        	call	_ADC_Config
  96                     ; 96   if ((GPIOE->IDR & GPIO_PIN_2) == 0x0)
  98  0006 720450150a    	btjt	20501,#2,L14
  99                     ; 98 	TransmissionEnable=TRUE;
 101  000b 35010000      	mov	_TransmissionEnable,#1
 102                     ; 99 	CANMaster=TRUE;
 104  000f 35010000      	mov	_CANMaster,#1
 106  0013 2009          	jra	L34
 107  0015               L14:
 108                     ; 103   else if ((GPIOE->IDR & GPIO_PIN_1) == 0x0)
 110  0015 7202501504    	btjt	20501,#1,L34
 111                     ; 105 	LINSlave=TRUE;
 113  001a 35010000      	mov	_LINSlave,#1
 114  001e               L34:
 115                     ; 109   CLK_Config();
 117  001e ad7e          	call	L71_CLK_Config
 119                     ; 112   SPI_DeInit();
 121  0020 cd0000        	call	_SPI_DeInit
 123                     ; 113   SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_64, SPI_MODE_MASTER, SPI_CLOCKPOLARITY_LOW,
 123                     ; 114            SPI_CLOCKPHASE_1EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX, SPI_NSS_SOFT,(uint8_t)0x07);
 125  0023 4b07          	push	#7
 126  0025 4b02          	push	#2
 127  0027 4b00          	push	#0
 128  0029 4b00          	push	#0
 129  002b 4b00          	push	#0
 130  002d 4b04          	push	#4
 131  002f ae0028        	ldw	x,#40
 132  0032 cd0000        	call	_SPI_Init
 134  0035 5b06          	addw	sp,#6
 135                     ; 117   ADC_Config();    
 137  0037 cd0000        	call	_ADC_Config
 139                     ; 118   ADC2_ITConfig(ENABLE);
 141  003a a601          	ld	a,#1
 142  003c cd0000        	call	_ADC2_ITConfig
 144                     ; 121   TIM4_Config();  
 146  003f cd014b        	call	L11_TIM4_Config
 148                     ; 124   SPI_Cmd(ENABLE); 
 150  0042 a601          	ld	a,#1
 151  0044 cd0000        	call	_SPI_Cmd
 153                     ; 127   TIM4_Cmd(ENABLE);
 155  0047 a601          	ld	a,#1
 156  0049 cd0000        	call	_TIM4_Cmd
 158                     ; 132   if (LINSlave==TRUE)
 160  004c c60000        	ld	a,_LINSlave
 161  004f 4a            	dec	a
 162  0050 2605          	jrne	L74
 163                     ; 134 	LIN_SlaveConfig();
 165  0052 cd0000        	call	_LIN_SlaveConfig
 168  0055 2006          	jra	L15
 169  0057               L74:
 170                     ; 139 	LIN_MasterConfig();
 172  0057 cd0000        	call	_LIN_MasterConfig
 174                     ; 140 	InitScheduleTable();
 176  005a cd0000        	call	_InitScheduleTable
 178  005d               L15:
 179                     ; 144   CAN_Config();
 181  005d cd0000        	call	_CAN_Config
 183                     ; 147   enableInterrupts();
 186  0060 9a            	rim	
 188                     ; 150   Delay(40);
 191  0061 ae0028        	ldw	x,#40
 192  0064 89            	pushw	x
 193  0065 5f            	clrw	x
 194  0066 89            	pushw	x
 195  0067 cd01a7        	call	L31_Delay
 197  006a 5b04          	addw	sp,#4
 198                     ; 152   L99PM62drv_Init();
 200  006c cd0000        	call	_L99PM62drv_Init
 202                     ; 154   L99PM62drv_WdgAutoTrigger(L99PM62WdgTriggerRefreshValue10);
 204  006f ae000a        	ldw	x,#10
 205  0072 89            	pushw	x
 206  0073 5f            	clrw	x
 207  0074 89            	pushw	x
 208  0075 cd015c        	call	L51_L99PM62drv_WdgAutoTrigger
 210  0078 5b04          	addw	sp,#4
 211  007a               L35:
 212                     ; 159 		Appli();
 214  007a cd0000        	call	_Appli
 216                     ; 161 		if (StartupCompleted==TRUE) /* To allow leds display at startup */
 218  007d c60000        	ld	a,_StartupCompleted
 219  0080 4a            	dec	a
 220  0081 26f7          	jrne	L35
 221                     ; 164 			if ((CANMaster==TRUE)||(ReceptionEnable==TRUE)) CAN_Task();		
 223  0083 c60000        	ld	a,_CANMaster
 224  0086 4a            	dec	a
 225  0087 2706          	jreq	L36
 227  0089 c6000c        	ld	a,_ReceptionEnable
 228  008c 4a            	dec	a
 229  008d 2605          	jrne	L16
 230  008f               L36:
 233  008f cd0000        	call	_CAN_Task
 236  0092 20e6          	jra	L35
 237  0094               L16:
 238                     ; 166 			else if (ReceptionEnable==FALSE) LIN_Task();
 240  0094 c6000c        	ld	a,_ReceptionEnable
 241  0097 26e1          	jrne	L35
 244  0099 cd0000        	call	_LIN_Task
 246  009c 20dc          	jra	L35
 304                     ; 178 void CLK_Config(void)
 304                     ; 179 {
 305                     	switch	.text
 306  009e               L71_CLK_Config:
 308  009e 88            	push	a
 309       00000001      OFST:	set	1
 312                     ; 180 	ErrorStatus status = ERROR;
 314                     ; 184 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 316  009f 4f            	clr	a
 317  00a0 cd0000        	call	_CLK_HSIPrescalerConfig
 319                     ; 188 	if (LINSlave==TRUE)
 321  00a3 c60000        	ld	a,_LINSlave
 322  00a6 4a            	dec	a
 323  00a7 270b          	jreq	L121
 325                     ; 196 		status = CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
 327  00a9 4b00          	push	#0
 328  00ab 4b00          	push	#0
 329  00ad ae01b4        	ldw	x,#436
 330  00b0 cd0000        	call	_CLK_ClockSwitchConfig
 332  00b3 85            	popw	x
 333  00b4               L121:
 334                     ; 198 }
 337  00b4 84            	pop	a
 338  00b5 81            	ret	
 363                     ; 207 void GPIO_Config(void)
 363                     ; 208 {
 364                     	switch	.text
 365  00b6               L12_GPIO_Config:
 369                     ; 210 	GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_PIN_ALL, GPIO_MODE_IN_FL_NO_IT);
 371  00b6 4b00          	push	#0
 372  00b8 4bff          	push	#255
 373  00ba ae5005        	ldw	x,#20485
 374  00bd cd0000        	call	_GPIO_Init
 376  00c0 85            	popw	x
 377                     ; 217 	GPIO_Init(GPIOG, (GPIO_Pin_TypeDef)GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
 379  00c1 4be0          	push	#224
 380  00c3 4b01          	push	#1
 381  00c5 ae501e        	ldw	x,#20510
 382  00c8 cd0000        	call	_GPIO_Init
 384  00cb 85            	popw	x
 385                     ; 218 	GPIO_Init(GPIOG, (GPIO_Pin_TypeDef)GPIO_PIN_1, GPIO_MODE_IN_PU_NO_IT);	
 387  00cc 4b40          	push	#64
 388  00ce 4b02          	push	#2
 389  00d0 ae501e        	ldw	x,#20510
 390  00d3 cd0000        	call	_GPIO_Init
 392  00d6 85            	popw	x
 393                     ; 221 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)(GPIO_PIN_5|GPIO_PIN_6), GPIO_MODE_OUT_PP_LOW_FAST); /* MOSI + CLK */
 395  00d7 4be0          	push	#224
 396  00d9 4b60          	push	#96
 397  00db ae500a        	ldw	x,#20490
 398  00de cd0000        	call	_GPIO_Init
 400  00e1 85            	popw	x
 401                     ; 222 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT); /* MISO */
 403  00e2 4b40          	push	#64
 404  00e4 4b80          	push	#128
 405  00e6 ae500a        	ldw	x,#20490
 406  00e9 cd0000        	call	_GPIO_Init
 408  00ec 85            	popw	x
 409                     ; 223 	GPIO_Init(GPIOE, (GPIO_Pin_TypeDef)(GPIO_PIN_5), GPIO_MODE_OUT_PP_HIGH_FAST); /* CSN */
 411  00ed 4bf0          	push	#240
 412  00ef 4b20          	push	#32
 413  00f1 ae5014        	ldw	x,#20500
 414  00f4 cd0000        	call	_GPIO_Init
 416  00f7 85            	popw	x
 417                     ; 226 	GPIO_Init(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 419  00f8 4be0          	push	#224
 420  00fa 4b08          	push	#8
 421  00fc ae5000        	ldw	x,#20480
 422  00ff cd0000        	call	_GPIO_Init
 424  0102 85            	popw	x
 425                     ; 227 	GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 427  0103 4be0          	push	#224
 428  0105 4b08          	push	#8
 429  0107 ae500f        	ldw	x,#20495
 430  010a cd0000        	call	_GPIO_Init
 432  010d 85            	popw	x
 433                     ; 228 	GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
 435  010e 4be0          	push	#224
 436  0110 4b01          	push	#1
 437  0112 ae500f        	ldw	x,#20495
 438  0115 cd0000        	call	_GPIO_Init
 440  0118 85            	popw	x
 441                     ; 229 	GPIO_Init(GPIOE, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 443  0119 4be0          	push	#224
 444  011b 4b08          	push	#8
 445  011d ae5014        	ldw	x,#20500
 446  0120 cd0000        	call	_GPIO_Init
 448  0123 85            	popw	x
 449                     ; 230 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 451  0124 4be0          	push	#224
 452  0126 4b08          	push	#8
 453  0128 ae500a        	ldw	x,#20490
 454  012b cd0000        	call	_GPIO_Init
 456  012e 85            	popw	x
 457                     ; 233 	GPIO_Init( GPIOE, GPIO_PIN_2, GPIO_MODE_IN_FL_IT);
 459  012f 4b20          	push	#32
 460  0131 4b04          	push	#4
 461  0133 ae5014        	ldw	x,#20500
 462  0136 cd0000        	call	_GPIO_Init
 464  0139 85            	popw	x
 465                     ; 236 	GPIO_Init( GPIOE, GPIO_PIN_1, GPIO_MODE_IN_FL_IT);
 467  013a 4b20          	push	#32
 468  013c 4b02          	push	#2
 469  013e ae5014        	ldw	x,#20500
 470  0141 cd0000        	call	_GPIO_Init
 472  0144 85            	popw	x
 473                     ; 239 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOE, EXTI_SENSITIVITY_FALL_ONLY);    	
 475  0145 ae0402        	ldw	x,#1026
 477                     ; 241 }
 480  0148 cc0000        	jp	_EXTI_SetExtIntSensitivity
 506                     ; 249 static void TIM4_Config(void)
 506                     ; 250 {
 507                     	switch	.text
 508  014b               L11_TIM4_Config:
 512                     ; 261   TIM4_TimeBaseInit(TIM4_PRESCALER_128, TIM4_PERIOD);
 514  014b ae077c        	ldw	x,#1916
 515  014e cd0000        	call	_TIM4_TimeBaseInit
 517                     ; 263   TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 519  0151 a601          	ld	a,#1
 520  0153 cd0000        	call	_TIM4_ClearFlag
 522                     ; 265   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 524  0156 ae0101        	ldw	x,#257
 526                     ; 267 }
 529  0159 cc0000        	jp	_TIM4_ITConfig
 565                     ; 275 void L99PM62drv_WdgAutoTrigger( u32 WdgAutoTriggerValue){
 566                     	switch	.text
 567  015c               L51_L99PM62drv_WdgAutoTrigger:
 569       00000000      OFST:	set	0
 572                     ; 277 	WdgTrigger = WdgAutoTriggerValue;
 574  015c 1e05          	ldw	x,(OFST+5,sp)
 575  015e cf0006        	ldw	L5_WdgTrigger+2,x
 576  0161 1e03          	ldw	x,(OFST+3,sp)
 577  0163 cf0004        	ldw	L5_WdgTrigger,x
 578                     ; 278 	WdgTriggerReload = WdgAutoTriggerValue;
 580  0166 1e05          	ldw	x,(OFST+5,sp)
 581  0168 cf000a        	ldw	L7_WdgTriggerReload+2,x
 582  016b 1e03          	ldw	x,(OFST+3,sp)
 583  016d cf0008        	ldw	L7_WdgTriggerReload,x
 584                     ; 279 }
 587  0170 81            	ret	
 614                     ; 287 void WdgAutoDecrement(void)
 614                     ; 288 {
 615                     	switch	.text
 616  0171               _WdgAutoDecrement:
 620                     ; 289 	  if(WdgTriggerReload != 0x00)
 622  0171 ae0008        	ldw	x,#L7_WdgTriggerReload
 623  0174 cd0000        	call	c_lzmp
 625  0177 271f          	jreq	L761
 626                     ; 291 			WdgTrigger--;
 628  0179 ae0004        	ldw	x,#L5_WdgTrigger
 629  017c a601          	ld	a,#1
 630  017e cd0000        	call	c_lgsbc
 632                     ; 292 			if(WdgTrigger == 0x00)
 634  0181 cd0000        	call	c_lzmp
 636  0184 2612          	jrne	L761
 637                     ; 294 				L99PM62drv_WdgTrigger();
 639  0186 cd0000        	call	_L99PM62drv_WdgTrigger
 641                     ; 295 				WdgTrigger = WdgTriggerReload;
 643  0189 ce000a        	ldw	x,L7_WdgTriggerReload+2
 644  018c cf0006        	ldw	L5_WdgTrigger+2,x
 645  018f ce0008        	ldw	x,L7_WdgTriggerReload
 646  0192 cf0004        	ldw	L5_WdgTrigger,x
 647                     ; 297 				L99PM62drv_ClearStatusRegisters();
 649  0195 cd0000        	call	_L99PM62drv_ClearStatusRegisters
 651  0198               L761:
 652                     ; 300 }
 655  0198 81            	ret	
 680                     ; 308 void TimingDelay_Decrement(void)
 680                     ; 309 {
 681                     	switch	.text
 682  0199               _TimingDelay_Decrement:
 686                     ; 310   if (TimingDelay != 0x00)
 688  0199 ae0000        	ldw	x,#L3_TimingDelay
 689  019c cd0000        	call	c_lzmp
 691  019f 2705          	jreq	L302
 692                     ; 312     TimingDelay--;
 694  01a1 a601          	ld	a,#1
 695  01a3 cd0000        	call	c_lgsbc
 697  01a6               L302:
 698                     ; 314 }
 701  01a6 81            	ret	
 734                     ; 322 void Delay(u32 nTime)
 734                     ; 323 {
 735                     	switch	.text
 736  01a7               L31_Delay:
 738       00000000      OFST:	set	0
 741                     ; 324   TimingDelay = nTime;
 743  01a7 1e05          	ldw	x,(OFST+5,sp)
 744  01a9 cf0002        	ldw	L3_TimingDelay+2,x
 745  01ac 1e03          	ldw	x,(OFST+3,sp)
 746  01ae cf0000        	ldw	L3_TimingDelay,x
 748  01b1 ae0000        	ldw	x,#L3_TimingDelay
 749  01b4               L522:
 750                     ; 326   while (TimingDelay != 0);
 752  01b4 cd0000        	call	c_lzmp
 754  01b7 26fb          	jrne	L522
 755                     ; 327 }
 758  01b9 81            	ret	
 793                     ; 339 void assert_failed(uint8_t* file, uint32_t line)
 793                     ; 340 { 
 794                     	switch	.text
 795  01ba               _assert_failed:
 799  01ba               L742:
 800  01ba 20fe          	jra	L742
 868                     	xdef	_WdgAutoDecrement
 869                     	xdef	_main
 870                     	xdef	_TimingDelay_Decrement
 871                     	xdef	_ReceptionEnable
 872                     	xref	_ADC_Config
 873                     	xref	_CAN_Config
 874                     	xref	_CAN_Task
 875                     	xref	_Appli
 876                     	xref	_InitScheduleTable
 877                     	xref	_LIN_SlaveConfig
 878                     	xref	_LIN_MasterConfig
 879                     	xref	_LIN_Task
 880                     	xref	_StartupCompleted
 881                     	xref	_LINSlave
 882                     	xref	_CANMaster
 883                     	xref	_TransmissionEnable
 884                     	xref	_L99PM62drv_ClearStatusRegisters
 885                     	xref	_L99PM62drv_WdgTrigger
 886                     	xref	_L99PM62drv_Init
 887                     	xdef	_assert_failed
 888                     	xref	_TIM4_ClearFlag
 889                     	xref	_TIM4_ITConfig
 890                     	xref	_TIM4_Cmd
 891                     	xref	_TIM4_TimeBaseInit
 892                     	xref	_SPI_Cmd
 893                     	xref	_SPI_Init
 894                     	xref	_SPI_DeInit
 895                     	xref	_GPIO_Init
 896                     	xref	_EXTI_SetExtIntSensitivity
 897                     	xref	_CLK_HSIPrescalerConfig
 898                     	xref	_CLK_ClockSwitchConfig
 899                     	xref	_ADC2_ITConfig
 918                     	xref	c_lgsbc
 919                     	xref	c_lzmp
 920                     	end
