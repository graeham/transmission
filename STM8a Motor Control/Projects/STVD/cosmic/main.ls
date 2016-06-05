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
  82                     ; 86 void main(void)
  82                     ; 87 {
  84                     	switch	.text
  85  0000               _main:
  89                     ; 92   GPIO_Config();  
  91  0000 cd00b9        	call	L12_GPIO_Config
  93                     ; 95     ADC_Config();    
  95  0003 cd0000        	call	_ADC_Config
  97                     ; 96 		ADCIO_Config(); 
  99  0006 cd0000        	call	_ADCIO_Config
 101                     ; 98   if ((GPIOE->IDR & GPIO_PIN_2) == 0x0)
 103  0009 720450150a    	btjt	20501,#2,L14
 104                     ; 100 	TransmissionEnable=TRUE;
 106  000e 35010000      	mov	_TransmissionEnable,#1
 107                     ; 101 	CANMaster=TRUE;
 109  0012 35010000      	mov	_CANMaster,#1
 111  0016 2009          	jra	L34
 112  0018               L14:
 113                     ; 105   else if ((GPIOE->IDR & GPIO_PIN_1) == 0x0)
 115  0018 7202501504    	btjt	20501,#1,L34
 116                     ; 107 	LINSlave=TRUE;
 118  001d 35010000      	mov	_LINSlave,#1
 119  0021               L34:
 120                     ; 111   CLK_Config();
 122  0021 ad7e          	call	L71_CLK_Config
 124                     ; 114   SPI_DeInit();
 126  0023 cd0000        	call	_SPI_DeInit
 128                     ; 115   SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_64, SPI_MODE_MASTER, SPI_CLOCKPOLARITY_LOW,
 128                     ; 116            SPI_CLOCKPHASE_1EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX, SPI_NSS_SOFT,(uint8_t)0x07);
 130  0026 4b07          	push	#7
 131  0028 4b02          	push	#2
 132  002a 4b00          	push	#0
 133  002c 4b00          	push	#0
 134  002e 4b00          	push	#0
 135  0030 4b04          	push	#4
 136  0032 ae0028        	ldw	x,#40
 137  0035 cd0000        	call	_SPI_Init
 139  0038 5b06          	addw	sp,#6
 140                     ; 122 	ADCIO_Config();
 142  003a cd0000        	call	_ADCIO_Config
 144                     ; 123 	ADC2_ITConfig(ENABLE);
 146  003d a601          	ld	a,#1
 147  003f cd0000        	call	_ADC2_ITConfig
 149                     ; 126   TIM4_Config();  
 151  0042 cd0143        	call	L11_TIM4_Config
 153                     ; 129   SPI_Cmd(ENABLE); 
 155  0045 a601          	ld	a,#1
 156  0047 cd0000        	call	_SPI_Cmd
 158                     ; 132   TIM4_Cmd(ENABLE);
 160  004a a601          	ld	a,#1
 161  004c cd0000        	call	_TIM4_Cmd
 163                     ; 137   if (LINSlave==TRUE)
 165  004f c60000        	ld	a,_LINSlave
 166  0052 4a            	dec	a
 167  0053 2605          	jrne	L74
 168                     ; 139 	LIN_SlaveConfig();
 170  0055 cd0000        	call	_LIN_SlaveConfig
 173  0058 2006          	jra	L15
 174  005a               L74:
 175                     ; 144 	LIN_MasterConfig();
 177  005a cd0000        	call	_LIN_MasterConfig
 179                     ; 145 	InitScheduleTable();
 181  005d cd0000        	call	_InitScheduleTable
 183  0060               L15:
 184                     ; 149   CAN_Config();
 186  0060 cd0000        	call	_CAN_Config
 188                     ; 152   enableInterrupts();
 191  0063 9a            	rim	
 193                     ; 155   Delay(40);
 196  0064 ae0028        	ldw	x,#40
 197  0067 89            	pushw	x
 198  0068 5f            	clrw	x
 199  0069 89            	pushw	x
 200  006a cd019f        	call	L31_Delay
 202  006d 5b04          	addw	sp,#4
 203                     ; 157   L99PM62drv_Init();
 205  006f cd0000        	call	_L99PM62drv_Init
 207                     ; 159   L99PM62drv_WdgAutoTrigger(L99PM62WdgTriggerRefreshValue10);
 209  0072 ae000a        	ldw	x,#10
 210  0075 89            	pushw	x
 211  0076 5f            	clrw	x
 212  0077 89            	pushw	x
 213  0078 cd0154        	call	L51_L99PM62drv_WdgAutoTrigger
 215  007b 5b04          	addw	sp,#4
 216  007d               L35:
 217                     ; 164 		Appli();
 219  007d cd0000        	call	_Appli
 221                     ; 166 		if (StartupCompleted==TRUE) /* To allow leds display at startup */
 223  0080 c60000        	ld	a,_StartupCompleted
 224  0083 4a            	dec	a
 225  0084 26f7          	jrne	L35
 226                     ; 169 			if ((CANMaster==TRUE)||(ReceptionEnable==TRUE)) CAN_Task();		
 228  0086 c60000        	ld	a,_CANMaster
 229  0089 4a            	dec	a
 230  008a 2706          	jreq	L36
 232  008c c6000c        	ld	a,_ReceptionEnable
 233  008f 4a            	dec	a
 234  0090 2605          	jrne	L16
 235  0092               L36:
 238  0092 cd0000        	call	_CAN_Task
 241  0095 20e6          	jra	L35
 242  0097               L16:
 243                     ; 171 			else if (ReceptionEnable==FALSE) LIN_Task();
 245  0097 c6000c        	ld	a,_ReceptionEnable
 246  009a 26e1          	jrne	L35
 249  009c cd0000        	call	_LIN_Task
 251  009f 20dc          	jra	L35
 309                     ; 183 void CLK_Config(void)
 309                     ; 184 {
 310                     	switch	.text
 311  00a1               L71_CLK_Config:
 313  00a1 88            	push	a
 314       00000001      OFST:	set	1
 317                     ; 185 	ErrorStatus status = ERROR;
 319                     ; 189 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 321  00a2 4f            	clr	a
 322  00a3 cd0000        	call	_CLK_HSIPrescalerConfig
 324                     ; 193 	if (LINSlave==TRUE)
 326  00a6 c60000        	ld	a,_LINSlave
 327  00a9 4a            	dec	a
 328  00aa 270b          	jreq	L121
 330                     ; 201 		status = CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
 332  00ac 4b00          	push	#0
 333  00ae 4b00          	push	#0
 334  00b0 ae01b4        	ldw	x,#436
 335  00b3 cd0000        	call	_CLK_ClockSwitchConfig
 337  00b6 85            	popw	x
 338  00b7               L121:
 339                     ; 203 }
 342  00b7 84            	pop	a
 343  00b8 81            	ret	
 368                     ; 212 void GPIO_Config(void)
 368                     ; 213 {
 369                     	switch	.text
 370  00b9               L12_GPIO_Config:
 374                     ; 223 	GPIO_Init(GPIOG, (GPIO_Pin_TypeDef)GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
 376  00b9 4be0          	push	#224
 377  00bb 4b01          	push	#1
 378  00bd ae501e        	ldw	x,#20510
 379  00c0 cd0000        	call	_GPIO_Init
 381  00c3 85            	popw	x
 382                     ; 224 	GPIO_Init(GPIOG, (GPIO_Pin_TypeDef)GPIO_PIN_1, GPIO_MODE_IN_PU_NO_IT);	
 384  00c4 4b40          	push	#64
 385  00c6 4b02          	push	#2
 386  00c8 ae501e        	ldw	x,#20510
 387  00cb cd0000        	call	_GPIO_Init
 389  00ce 85            	popw	x
 390                     ; 227 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)(GPIO_PIN_5|GPIO_PIN_6), GPIO_MODE_OUT_PP_LOW_FAST); /* MOSI + CLK */
 392  00cf 4be0          	push	#224
 393  00d1 4b60          	push	#96
 394  00d3 ae500a        	ldw	x,#20490
 395  00d6 cd0000        	call	_GPIO_Init
 397  00d9 85            	popw	x
 398                     ; 228 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef) (GPIO_PIN_7), GPIO_MODE_IN_PU_NO_IT); /* MISO */
 400  00da 4b40          	push	#64
 401  00dc 4b80          	push	#128
 402  00de ae500a        	ldw	x,#20490
 403  00e1 cd0000        	call	_GPIO_Init
 405  00e4 85            	popw	x
 406                     ; 229 	GPIO_Init(GPIOE, (GPIO_Pin_TypeDef)(GPIO_PIN_5), GPIO_MODE_OUT_PP_HIGH_FAST); /* CSN */
 408  00e5 4bf0          	push	#240
 409  00e7 4b20          	push	#32
 410  00e9 ae5014        	ldw	x,#20500
 411  00ec cd0000        	call	_GPIO_Init
 413  00ef 85            	popw	x
 414                     ; 232 	GPIO_Init(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 416  00f0 4be0          	push	#224
 417  00f2 4b08          	push	#8
 418  00f4 ae5000        	ldw	x,#20480
 419  00f7 cd0000        	call	_GPIO_Init
 421  00fa 85            	popw	x
 422                     ; 233 	GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 424  00fb 4be0          	push	#224
 425  00fd 4b08          	push	#8
 426  00ff ae500f        	ldw	x,#20495
 427  0102 cd0000        	call	_GPIO_Init
 429  0105 85            	popw	x
 430                     ; 234 	GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
 432  0106 4be0          	push	#224
 433  0108 4b01          	push	#1
 434  010a ae500f        	ldw	x,#20495
 435  010d cd0000        	call	_GPIO_Init
 437  0110 85            	popw	x
 438                     ; 235 	GPIO_Init(GPIOE, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 440  0111 4be0          	push	#224
 441  0113 4b08          	push	#8
 442  0115 ae5014        	ldw	x,#20500
 443  0118 cd0000        	call	_GPIO_Init
 445  011b 85            	popw	x
 446                     ; 236 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 448  011c 4be0          	push	#224
 449  011e 4b08          	push	#8
 450  0120 ae500a        	ldw	x,#20490
 451  0123 cd0000        	call	_GPIO_Init
 453  0126 85            	popw	x
 454                     ; 239 	GPIO_Init( GPIOE, GPIO_PIN_2, GPIO_MODE_IN_FL_IT);
 456  0127 4b20          	push	#32
 457  0129 4b04          	push	#4
 458  012b ae5014        	ldw	x,#20500
 459  012e cd0000        	call	_GPIO_Init
 461  0131 85            	popw	x
 462                     ; 242 	GPIO_Init( GPIOE, GPIO_PIN_1, GPIO_MODE_IN_FL_IT);
 464  0132 4b20          	push	#32
 465  0134 4b02          	push	#2
 466  0136 ae5014        	ldw	x,#20500
 467  0139 cd0000        	call	_GPIO_Init
 469  013c 85            	popw	x
 470                     ; 245 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOE, EXTI_SENSITIVITY_FALL_ONLY);    	
 472  013d ae0402        	ldw	x,#1026
 474                     ; 247 }
 477  0140 cc0000        	jp	_EXTI_SetExtIntSensitivity
 503                     ; 255 static void TIM4_Config(void)
 503                     ; 256 {
 504                     	switch	.text
 505  0143               L11_TIM4_Config:
 509                     ; 267   TIM4_TimeBaseInit(TIM4_PRESCALER_128, TIM4_PERIOD);
 511  0143 ae077c        	ldw	x,#1916
 512  0146 cd0000        	call	_TIM4_TimeBaseInit
 514                     ; 269   TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 516  0149 a601          	ld	a,#1
 517  014b cd0000        	call	_TIM4_ClearFlag
 519                     ; 271   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 521  014e ae0101        	ldw	x,#257
 523                     ; 273 }
 526  0151 cc0000        	jp	_TIM4_ITConfig
 562                     ; 281 void L99PM62drv_WdgAutoTrigger( u32 WdgAutoTriggerValue){
 563                     	switch	.text
 564  0154               L51_L99PM62drv_WdgAutoTrigger:
 566       00000000      OFST:	set	0
 569                     ; 283 	WdgTrigger = WdgAutoTriggerValue;
 571  0154 1e05          	ldw	x,(OFST+5,sp)
 572  0156 cf0006        	ldw	L5_WdgTrigger+2,x
 573  0159 1e03          	ldw	x,(OFST+3,sp)
 574  015b cf0004        	ldw	L5_WdgTrigger,x
 575                     ; 284 	WdgTriggerReload = WdgAutoTriggerValue;
 577  015e 1e05          	ldw	x,(OFST+5,sp)
 578  0160 cf000a        	ldw	L7_WdgTriggerReload+2,x
 579  0163 1e03          	ldw	x,(OFST+3,sp)
 580  0165 cf0008        	ldw	L7_WdgTriggerReload,x
 581                     ; 285 }
 584  0168 81            	ret	
 611                     ; 293 void WdgAutoDecrement(void)
 611                     ; 294 {
 612                     	switch	.text
 613  0169               _WdgAutoDecrement:
 617                     ; 295 	  if(WdgTriggerReload != 0x00)
 619  0169 ae0008        	ldw	x,#L7_WdgTriggerReload
 620  016c cd0000        	call	c_lzmp
 622  016f 271f          	jreq	L761
 623                     ; 297 			WdgTrigger--;
 625  0171 ae0004        	ldw	x,#L5_WdgTrigger
 626  0174 a601          	ld	a,#1
 627  0176 cd0000        	call	c_lgsbc
 629                     ; 298 			if(WdgTrigger == 0x00)
 631  0179 cd0000        	call	c_lzmp
 633  017c 2612          	jrne	L761
 634                     ; 300 				L99PM62drv_WdgTrigger();
 636  017e cd0000        	call	_L99PM62drv_WdgTrigger
 638                     ; 301 				WdgTrigger = WdgTriggerReload;
 640  0181 ce000a        	ldw	x,L7_WdgTriggerReload+2
 641  0184 cf0006        	ldw	L5_WdgTrigger+2,x
 642  0187 ce0008        	ldw	x,L7_WdgTriggerReload
 643  018a cf0004        	ldw	L5_WdgTrigger,x
 644                     ; 303 				L99PM62drv_ClearStatusRegisters();
 646  018d cd0000        	call	_L99PM62drv_ClearStatusRegisters
 648  0190               L761:
 649                     ; 306 }
 652  0190 81            	ret	
 677                     ; 314 void TimingDelay_Decrement(void)
 677                     ; 315 {
 678                     	switch	.text
 679  0191               _TimingDelay_Decrement:
 683                     ; 316   if (TimingDelay != 0x00)
 685  0191 ae0000        	ldw	x,#L3_TimingDelay
 686  0194 cd0000        	call	c_lzmp
 688  0197 2705          	jreq	L302
 689                     ; 318     TimingDelay--;
 691  0199 a601          	ld	a,#1
 692  019b cd0000        	call	c_lgsbc
 694  019e               L302:
 695                     ; 320 }
 698  019e 81            	ret	
 731                     ; 328 void Delay(u32 nTime)
 731                     ; 329 {
 732                     	switch	.text
 733  019f               L31_Delay:
 735       00000000      OFST:	set	0
 738                     ; 330   TimingDelay = nTime;
 740  019f 1e05          	ldw	x,(OFST+5,sp)
 741  01a1 cf0002        	ldw	L3_TimingDelay+2,x
 742  01a4 1e03          	ldw	x,(OFST+3,sp)
 743  01a6 cf0000        	ldw	L3_TimingDelay,x
 745  01a9 ae0000        	ldw	x,#L3_TimingDelay
 746  01ac               L522:
 747                     ; 332   while (TimingDelay != 0);
 749  01ac cd0000        	call	c_lzmp
 751  01af 26fb          	jrne	L522
 752                     ; 333 }
 755  01b1 81            	ret	
 790                     ; 345 void assert_failed(uint8_t* file, uint32_t line)
 790                     ; 346 { 
 791                     	switch	.text
 792  01b2               _assert_failed:
 796  01b2               L742:
 797  01b2 20fe          	jra	L742
 865                     	xdef	_WdgAutoDecrement
 866                     	xdef	_main
 867                     	xdef	_TimingDelay_Decrement
 868                     	xdef	_ReceptionEnable
 869                     	xref	_ADCIO_Config
 870                     	xref	_ADC_Config
 871                     	xref	_CAN_Config
 872                     	xref	_CAN_Task
 873                     	xref	_Appli
 874                     	xref	_InitScheduleTable
 875                     	xref	_LIN_SlaveConfig
 876                     	xref	_LIN_MasterConfig
 877                     	xref	_LIN_Task
 878                     	xref	_StartupCompleted
 879                     	xref	_LINSlave
 880                     	xref	_CANMaster
 881                     	xref	_TransmissionEnable
 882                     	xref	_L99PM62drv_ClearStatusRegisters
 883                     	xref	_L99PM62drv_WdgTrigger
 884                     	xref	_L99PM62drv_Init
 885                     	xdef	_assert_failed
 886                     	xref	_TIM4_ClearFlag
 887                     	xref	_TIM4_ITConfig
 888                     	xref	_TIM4_Cmd
 889                     	xref	_TIM4_TimeBaseInit
 890                     	xref	_SPI_Cmd
 891                     	xref	_SPI_Init
 892                     	xref	_SPI_DeInit
 893                     	xref	_GPIO_Init
 894                     	xref	_EXTI_SetExtIntSensitivity
 895                     	xref	_CLK_HSIPrescalerConfig
 896                     	xref	_CLK_ClockSwitchConfig
 897                     	xref	_ADC2_ITConfig
 916                     	xref	c_lgsbc
 917                     	xref	c_lzmp
 918                     	end
