   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  19                     	switch	.data
  20  0000               L3_AppliTick:
  21  0000 00            	dc.b	0
  51                     ; 78 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  51                     ; 79 {
  52                     	switch	.text
  53  0000               f_NonHandledInterrupt:
  57                     ; 83 }
  60  0000 80            	iret	
  82                     ; 91 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  82                     ; 92 {
  83                     	switch	.text
  84  0001               f_TRAP_IRQHandler:
  88                     ; 96 }
  91  0001 80            	iret	
 113                     ; 102 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 113                     ; 103 {
 114                     	switch	.text
 115  0002               f_TLI_IRQHandler:
 119                     ; 107 }
 122  0002 80            	iret	
 144                     ; 114 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 144                     ; 115 {
 145                     	switch	.text
 146  0003               f_AWU_IRQHandler:
 150                     ; 119 }
 153  0003 80            	iret	
 175                     ; 126 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 175                     ; 127 {
 176                     	switch	.text
 177  0004               f_CLK_IRQHandler:
 181                     ; 131 }
 184  0004 80            	iret	
 207                     ; 138 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 207                     ; 139 {
 208                     	switch	.text
 209  0005               f_EXTI_PORTA_IRQHandler:
 213                     ; 143 }
 216  0005 80            	iret	
 239                     ; 150 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 239                     ; 151 {
 240                     	switch	.text
 241  0006               f_EXTI_PORTB_IRQHandler:
 245                     ; 155 }
 248  0006 80            	iret	
 271                     ; 162 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 271                     ; 163 {
 272                     	switch	.text
 273  0007               f_EXTI_PORTC_IRQHandler:
 277                     ; 167 }
 280  0007 80            	iret	
 303                     ; 174 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 303                     ; 175 {
 304                     	switch	.text
 305  0008               f_EXTI_PORTD_IRQHandler:
 309                     ; 179 }
 312  0008 80            	iret	
 338                     ; 186 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 338                     ; 187 {
 339                     	switch	.text
 340  0009               f_EXTI_PORTE_IRQHandler:
 342  0009 8a            	push	cc
 343  000a 84            	pop	a
 344  000b a4bf          	and	a,#191
 345  000d 88            	push	a
 346  000e 86            	pop	cc
 347  000f 3b0002        	push	c_x+2
 348  0012 be00          	ldw	x,c_x
 349  0014 89            	pushw	x
 350  0015 3b0002        	push	c_y+2
 351  0018 be00          	ldw	x,c_y
 352  001a 89            	pushw	x
 355                     ; 192   	if (GPIO_ReadInputPin(GPIOE,GPIO_PIN_2)==0) UserButton1=TRUE;
 357  001b 4b04          	push	#4
 358  001d ae5014        	ldw	x,#20500
 359  0020 cd0000        	call	_GPIO_ReadInputPin
 361  0023 5b01          	addw	sp,#1
 362  0025 4d            	tnz	a
 363  0026 2604          	jrne	L331
 366  0028 35010000      	mov	_UserButton1,#1
 367  002c               L331:
 368                     ; 193 	if (GPIO_ReadInputPin(GPIOE,GPIO_PIN_1)==0) UserButton2=TRUE;
 370  002c 4b02          	push	#2
 371  002e ae5014        	ldw	x,#20500
 372  0031 cd0000        	call	_GPIO_ReadInputPin
 374  0034 5b01          	addw	sp,#1
 375  0036 4d            	tnz	a
 376  0037 2604          	jrne	L531
 379  0039 35010000      	mov	_UserButton2,#1
 380  003d               L531:
 381                     ; 196 }
 384  003d 85            	popw	x
 385  003e bf00          	ldw	c_y,x
 386  0040 320002        	pop	c_y+2
 387  0043 85            	popw	x
 388  0044 bf00          	ldw	c_x,x
 389  0046 320002        	pop	c_x+2
 390  0049 80            	iret	
 415                     ; 217  INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
 415                     ; 218 {
 416                     	switch	.text
 417  004a               f_CAN_RX_IRQHandler:
 419  004a 8a            	push	cc
 420  004b 84            	pop	a
 421  004c a4bf          	and	a,#191
 422  004e 88            	push	a
 423  004f 86            	pop	cc
 424  0050 3b0002        	push	c_x+2
 425  0053 be00          	ldw	x,c_x
 426  0055 89            	pushw	x
 427  0056 3b0002        	push	c_y+2
 428  0059 be00          	ldw	x,c_y
 429  005b 89            	pushw	x
 432                     ; 223   ReceptionEnable=TRUE;
 434  005c 35010000      	mov	_ReceptionEnable,#1
 435                     ; 226 	CAN_Receive();
 437  0060 cd0000        	call	_CAN_Receive
 439                     ; 228 	FrameReceived=1;
 441  0063 35010000      	mov	_FrameReceived,#1
 442                     ; 231 }
 445  0067 85            	popw	x
 446  0068 bf00          	ldw	c_y,x
 447  006a 320002        	pop	c_y+2
 448  006d 85            	popw	x
 449  006e bf00          	ldw	c_x,x
 450  0070 320002        	pop	c_x+2
 451  0073 80            	iret	
 473                     ; 238  INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
 473                     ; 239 {
 474                     	switch	.text
 475  0074               f_CAN_TX_IRQHandler:
 479                     ; 243 }
 482  0074 80            	iret	
 504                     ; 251 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 504                     ; 252 {
 505                     	switch	.text
 506  0075               f_SPI_IRQHandler:
 510                     ; 256 }
 513  0075 80            	iret	
 536                     ; 263 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 536                     ; 264 {
 537                     	switch	.text
 538  0076               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 542                     ; 268 }
 545  0076 80            	iret	
 568                     ; 275 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 568                     ; 276 {
 569                     	switch	.text
 570  0077               f_TIM1_CAP_COM_IRQHandler:
 574                     ; 280 }
 577  0077 80            	iret	
 600                     ; 312  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 600                     ; 313 {
 601                     	switch	.text
 602  0078               f_TIM2_UPD_OVF_BRK_IRQHandler:
 606                     ; 317 }
 609  0078 80            	iret	
 632                     ; 324  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 632                     ; 325 {
 633                     	switch	.text
 634  0079               f_TIM2_CAP_COM_IRQHandler:
 638                     ; 329 }
 641  0079 80            	iret	
 664                     ; 339  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 664                     ; 340 {
 665                     	switch	.text
 666  007a               f_TIM3_UPD_OVF_BRK_IRQHandler:
 670                     ; 344 }
 673  007a 80            	iret	
 696                     ; 351  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 696                     ; 352 {
 697                     	switch	.text
 698  007b               f_TIM3_CAP_COM_IRQHandler:
 702                     ; 356 }
 705  007b 80            	iret	
 728                     ; 366  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 728                     ; 367 {
 729                     	switch	.text
 730  007c               f_UART1_TX_IRQHandler:
 734                     ; 371 }
 737  007c 80            	iret	
 760                     ; 378  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 760                     ; 379 {
 761                     	switch	.text
 762  007d               f_UART1_RX_IRQHandler:
 766                     ; 383 }
 769  007d 80            	iret	
 791                     ; 391 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 791                     ; 392 {
 792                     	switch	.text
 793  007e               f_I2C_IRQHandler:
 797                     ; 396 }
 800  007e 80            	iret	
 823                     ; 430  INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
 823                     ; 431 {
 824                     	switch	.text
 825  007f               f_UART3_TX_IRQHandler:
 829                     ; 435   }
 832  007f 80            	iret	
 864                     ; 442  INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
 864                     ; 443 {
 865                     	switch	.text
 866  0080               f_UART3_RX_IRQHandler:
 868  0080 8a            	push	cc
 869  0081 84            	pop	a
 870  0082 a4bf          	and	a,#191
 871  0084 88            	push	a
 872  0085 86            	pop	cc
 873  0086 3b0002        	push	c_x+2
 874  0089 be00          	ldw	x,c_x
 875  008b 89            	pushw	x
 876  008c 3b0002        	push	c_y+2
 877  008f be00          	ldw	x,c_y
 878  0091 89            	pushw	x
 881                     ; 450 	UART3_SR_Buf = UART3->SR;
 884  0092 5552400000    	mov	_UART3_SR_Buf,21056
 885                     ; 451 	UART3Data=UART3->DR;
 887  0097 5552410000    	mov	_UART3Data,21057
 888                     ; 453 	if (LINSlave==TRUE)
 890  009c c60000        	ld	a,_LINSlave
 891  009f 4a            	dec	a
 892  00a0 2629          	jrne	L713
 893                     ; 458 		if (UART3->CR6 & UART3_CR6_LHDF)
 895  00a2 7203524915    	btjf	21065,#1,L123
 896                     ; 460 			UART3->CR6 &= ~UART3_CR6_LHDF; /* Reset LHDF flag */
 898  00a7 72135249      	bres	21065,#1
 899                     ; 461 			HeaderReceived=1;
 901  00ab 35010000      	mov	_HeaderReceived,#1
 902                     ; 462 			DataReceived=0; /* remove limitation when mute mode disabled and del lentgh=23.9-bit */
 904  00af c70000        	ld	_DataReceived,a
 905                     ; 463 			IdentifierParityError = UART3_SR_Buf&0x01;		
 907  00b2 c60000        	ld	a,_UART3_SR_Buf
 908  00b5 a401          	and	a,#1
 909  00b7 c70000        	ld	_IdentifierParityError,a
 911  00ba 2044          	jra	L133
 912  00bc               L123:
 913                     ; 477 			if (UART3_SR_Buf & UART3_SR_OR) /* UART3_SR_OR is same bit as UART3_SR_LHE */
 915  00bc 7207000008    	btjf	_UART3_SR_Buf,#3,L523
 916                     ; 479 				UART3->CR6 &= ~UART3_CR6_LSF; /* clear LSF flag */
 918  00c1 72115249      	bres	21065,#0
 919                     ; 480 				ReceptionError=1;			
 921  00c5 35010000      	mov	_ReceptionError,#1
 922  00c9               L523:
 923                     ; 494 			if (UART3_SR_Buf & UART3_SR_RXNE)
 924                     ; 496 				DataReceived=1;
 925  00c9 202c          	jpf	L143
 926  00cb               L713:
 927                     ; 504 		if (UART3->CR4 & UART3_CR4_LBDF)
 929  00cb 720952470a    	btjf	21063,#4,L333
 930                     ; 506 			UART3->CR4 &= ~UART3_CR4_LBDF; /* Reset LBDF flag */
 932  00d0 72195247      	bres	21063,#4
 933                     ; 507 			BreakReceived=1;
 935  00d4 35010000      	mov	_BreakReceived,#1
 937  00d8 2026          	jra	L133
 938  00da               L333:
 939                     ; 512 			if (UART3_SR_Buf & UART3_SR_FE)
 941  00da 720300000b    	btjf	_UART3_SR_Buf,#1,L733
 942                     ; 514 				DataReceived=1;
 944  00df 35010000      	mov	_DataReceived,#1
 945                     ; 515 				ReceptionError=1;
 947  00e3 35010000      	mov	_ReceptionError,#1
 948                     ; 516 				UART3_BDIE(); /* It can be a Break, wait for next IT...*/
 950  00e7 cd0000        	call	_UART3_BDIE
 952  00ea               L733:
 953                     ; 520 			if (UART3_SR_Buf & UART3_SR_OR)
 955  00ea 7207000008    	btjf	_UART3_SR_Buf,#3,L143
 956                     ; 522 				DataReceived=1;
 958  00ef 35010000      	mov	_DataReceived,#1
 959                     ; 523 				ReceptionError=1;
 961  00f3 35010000      	mov	_ReceptionError,#1
 962  00f7               L143:
 963                     ; 527 			if (UART3_SR_Buf & UART3_SR_RXNE)
 965                     ; 529 				DataReceived=1;
 968  00f7 720b000004    	btjf	_UART3_SR_Buf,#5,L133
 970  00fc 35010000      	mov	_DataReceived,#1
 971  0100               L133:
 972                     ; 535   }
 976  0100 85            	popw	x
 977  0101 bf00          	ldw	c_y,x
 978  0103 320002        	pop	c_y+2
 979  0106 85            	popw	x
 980  0107 bf00          	ldw	c_x,x
 981  0109 320002        	pop	c_x+2
 982  010c 80            	iret	
1007                     ; 544  INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
1007                     ; 545 {
1008                     	switch	.text
1009  010d               f_ADC2_IRQHandler:
1011  010d 8a            	push	cc
1012  010e 84            	pop	a
1013  010f a4bf          	and	a,#191
1014  0111 88            	push	a
1015  0112 86            	pop	cc
1016  0113 3b0002        	push	c_x+2
1017  0116 be00          	ldw	x,c_x
1018  0118 89            	pushw	x
1019  0119 3b0002        	push	c_y+2
1020  011c be00          	ldw	x,c_y
1021  011e 89            	pushw	x
1024                     ; 552     Conversion_Value = ADC2_GetConversionValue();
1026  011f cd0000        	call	_ADC2_GetConversionValue
1028  0122 cf0000        	ldw	_Conversion_Value,x
1029                     ; 553 	ADC2_ClearITPendingBit();
1031  0125 cd0000        	call	_ADC2_ClearITPendingBit
1033                     ; 554 }
1036  0128 85            	popw	x
1037  0129 bf00          	ldw	c_y,x
1038  012b 320002        	pop	c_y+2
1039  012e 85            	popw	x
1040  012f bf00          	ldw	c_x,x
1041  0131 320002        	pop	c_x+2
1042  0134 80            	iret	
1074                     ; 588  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
1074                     ; 589 {
1075                     	switch	.text
1076  0135               f_TIM4_UPD_OVF_IRQHandler:
1078  0135 8a            	push	cc
1079  0136 84            	pop	a
1080  0137 a4bf          	and	a,#191
1081  0139 88            	push	a
1082  013a 86            	pop	cc
1083  013b 3b0002        	push	c_x+2
1084  013e be00          	ldw	x,c_x
1085  0140 89            	pushw	x
1086  0141 3b0002        	push	c_y+2
1087  0144 be00          	ldw	x,c_y
1088  0146 89            	pushw	x
1091                     ; 592   SetLINTimebaseTick();
1094  0147 cd0000        	call	_SetLINTimebaseTick
1096                     ; 593   SetCANTimebaseTick();
1098  014a cd0000        	call	_SetCANTimebaseTick
1100                     ; 595   if (AppliTick>APPLI_TASK_40MS)
1102  014d c60000        	ld	a,L3_AppliTick
1103  0150 a128          	cp	a,#40
1104  0152 2509          	jrult	L563
1105                     ; 597 		AppliTick=0;
1107  0154 725f0000      	clr	L3_AppliTick
1108                     ; 598 		SetAppliTimebaseTick();
1110  0158 cd0000        	call	_SetAppliTimebaseTick
1113  015b 2004          	jra	L763
1114  015d               L563:
1115                     ; 602 		AppliTick++;
1117  015d 725c0000      	inc	L3_AppliTick
1118  0161               L763:
1119                     ; 605 	if (LINReceptionTimeout==TRUE) LINReceptionTimeoutValue++;
1121  0161 c60000        	ld	a,_LINReceptionTimeout
1122  0164 4a            	dec	a
1123  0165 2604          	jrne	L173
1126  0167 725c0000      	inc	_LINReceptionTimeoutValue
1127  016b               L173:
1128                     ; 607 	TimingDelay_Decrement();
1130  016b cd0000        	call	_TimingDelay_Decrement
1132                     ; 608 	WdgAutoDecrement();
1134  016e cd0000        	call	_WdgAutoDecrement
1136                     ; 611 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
1138  0171 a601          	ld	a,#1
1139  0173 cd0000        	call	_TIM4_ClearITPendingBit
1141                     ; 614 }
1145  0176 85            	popw	x
1146  0177 bf00          	ldw	c_y,x
1147  0179 320002        	pop	c_y+2
1148  017c 85            	popw	x
1149  017d bf00          	ldw	c_x,x
1150  017f 320002        	pop	c_x+2
1151  0182 80            	iret	
1174                     ; 622 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
1174                     ; 623 {
1175                     	switch	.text
1176  0183               f_EEPROM_EEC_IRQHandler:
1180                     ; 627 }
1183  0183 80            	iret	
1204                     	xref	_UART3_BDIE
1205                     	xref	_LINReceptionTimeout
1206                     	xref	_LINReceptionTimeoutValue
1207                     	xref	_IdentifierParityError
1208                     	xref	_BreakReceived
1209                     	xref	_HeaderReceived
1210                     	xref	_DataReceived
1211                     	xref	_WdgAutoDecrement
1212                     	xref	_TimingDelay_Decrement
1213                     	xref	_SetAppliTimebaseTick
1214                     	xref	_SetCANTimebaseTick
1215                     	xref	_SetLINTimebaseTick
1216                     	xref	_LINSlave
1217                     	xref	_ReceptionEnable
1218                     	xref	_FrameReceived
1219                     	xref	_Conversion_Value
1220                     	xref	_ReceptionError
1221                     	xref	_UART3Data
1222                     	xref	_UART3_SR_Buf
1223                     	xref	_UserButton2
1224                     	xref	_UserButton1
1225                     	xdef	f_EEPROM_EEC_IRQHandler
1226                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1227                     	xdef	f_ADC2_IRQHandler
1228                     	xdef	f_UART3_TX_IRQHandler
1229                     	xdef	f_UART3_RX_IRQHandler
1230                     	xdef	f_I2C_IRQHandler
1231                     	xdef	f_UART1_RX_IRQHandler
1232                     	xdef	f_UART1_TX_IRQHandler
1233                     	xdef	f_TIM3_CAP_COM_IRQHandler
1234                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
1235                     	xdef	f_TIM2_CAP_COM_IRQHandler
1236                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1237                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1238                     	xdef	f_TIM1_CAP_COM_IRQHandler
1239                     	xdef	f_SPI_IRQHandler
1240                     	xdef	f_CAN_TX_IRQHandler
1241                     	xdef	f_CAN_RX_IRQHandler
1242                     	xdef	f_EXTI_PORTE_IRQHandler
1243                     	xdef	f_EXTI_PORTD_IRQHandler
1244                     	xdef	f_EXTI_PORTC_IRQHandler
1245                     	xdef	f_EXTI_PORTB_IRQHandler
1246                     	xdef	f_EXTI_PORTA_IRQHandler
1247                     	xdef	f_CLK_IRQHandler
1248                     	xdef	f_AWU_IRQHandler
1249                     	xdef	f_TLI_IRQHandler
1250                     	xdef	f_TRAP_IRQHandler
1251                     	xdef	f_NonHandledInterrupt
1252                     	xref	_TIM4_ClearITPendingBit
1253                     	xref	_GPIO_ReadInputPin
1254                     	xref	_CAN_Receive
1255                     	xref	_ADC2_ClearITPendingBit
1256                     	xref	_ADC2_GetConversionValue
1257                     	xref.b	c_x
1258                     	xref.b	c_y
1277                     	end
