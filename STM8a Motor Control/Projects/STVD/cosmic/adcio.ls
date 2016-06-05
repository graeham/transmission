   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  19                     	switch	.data
  20  0000               _Conversion_Value_IO:
  21  0000 0000          	dc.w	0
  53                     ; 49 void ADCIO_Config(void)
  53                     ; 50 {
  55                     	switch	.text
  56  0000               _ADCIO_Config:
  60                     ; 52   GPIO_Init(GPIOB, GPIO_PIN_0, GPIO_MODE_IN_FL_NO_IT);
  62  0000 4b00          	push	#0
  63  0002 4b01          	push	#1
  64  0004 ae5005        	ldw	x,#20485
  65  0007 cd0000        	call	_GPIO_Init
  67  000a 85            	popw	x
  68                     ; 56   ADC2_DeInit();
  70  000b cd0000        	call	_ADC2_DeInit
  72                     ; 64 		ADC2_Init(ADC2_CONVERSIONMODE_SINGLE, ADC2_CHANNEL_0, ADC2_PRESSEL_FCPU_D2, \
  72                     ; 65             ADC2_EXTTRIG_TIM, DISABLE, ADC2_ALIGN_RIGHT, ADC2_SCHMITTTRIG_CHANNEL0,\
  72                     ; 66             DISABLE);
  74  000e 4b00          	push	#0
  75  0010 4b00          	push	#0
  76  0012 4b08          	push	#8
  77  0014 4b00          	push	#0
  78  0016 4b00          	push	#0
  79  0018 4b00          	push	#0
  80  001a 5f            	clrw	x
  81  001b cd0000        	call	_ADC2_Init
  83  001e 5b06          	addw	sp,#6
  84                     ; 67 }
  87  0020 81            	ret	
 111                     ; 78 uint16_t GetADCIOData(void)
 111                     ; 79 {
 112                     	switch	.text
 113  0021               _GetADCIOData:
 117                     ; 80 	return (Conversion_Value_IO);
 119  0021 ce0000        	ldw	x,_Conversion_Value_IO
 122  0024 81            	ret	
 145                     	xdef	_GetADCIOData
 146                     	xdef	_ADCIO_Config
 147                     	xdef	_Conversion_Value_IO
 148                     	xref	_GPIO_Init
 149                     	xref	_ADC2_Init
 150                     	xref	_ADC2_DeInit
 169                     	end
