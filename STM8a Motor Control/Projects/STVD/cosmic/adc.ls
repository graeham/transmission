   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  19                     	switch	.data
  20  0000               _Conversion_Value:
  21  0000 0000          	dc.w	0
  53                     ; 49 void ADC_Config(void)
  53                     ; 50 {
  55                     	switch	.text
  56  0000               _ADC_Config:
  60                     ; 52   GPIO_Init(GPIOE, GPIO_PIN_7, GPIO_MODE_IN_FL_NO_IT);
  62  0000 4b00          	push	#0
  63  0002 4b80          	push	#128
  64  0004 ae5014        	ldw	x,#20500
  65  0007 cd0000        	call	_GPIO_Init
  67  000a 85            	popw	x
  68                     ; 55   ADC2_DeInit();
  70  000b cd0000        	call	_ADC2_DeInit
  72                     ; 58   ADC2_Init(ADC2_CONVERSIONMODE_SINGLE, ADC2_CHANNEL_8, ADC2_PRESSEL_FCPU_D2, \
  72                     ; 59             ADC2_EXTTRIG_TIM, DISABLE, ADC2_ALIGN_RIGHT, ADC2_SCHMITTTRIG_CHANNEL8,\
  72                     ; 60             DISABLE);
  74  000e 4b00          	push	#0
  75  0010 4b08          	push	#8
  76  0012 4b08          	push	#8
  77  0014 4b00          	push	#0
  78  0016 4b00          	push	#0
  79  0018 4b00          	push	#0
  80  001a ae0008        	ldw	x,#8
  81  001d cd0000        	call	_ADC2_Init
  83  0020 5b06          	addw	sp,#6
  84                     ; 62 }
  87  0022 81            	ret	
 111                     ; 73 uint16_t GetADCData(void)
 111                     ; 74 {
 112                     	switch	.text
 113  0023               _GetADCData:
 117                     ; 75 	return (Conversion_Value);
 119  0023 ce0000        	ldw	x,_Conversion_Value
 122  0026 81            	ret	
 144                     	xdef	_GetADCData
 145                     	xdef	_ADC_Config
 146                     	xdef	_Conversion_Value
 147                     	xref	_GPIO_Init
 148                     	xref	_ADC2_Init
 149                     	xref	_ADC2_DeInit
 168                     	end
