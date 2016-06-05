   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  19                     	switch	.data
  20  0000               _Conversion_Value_IO:
  21  0000 0000          	dc.w	0
  52                     ; 49 void ADCIO_Config(void)
  52                     ; 50 {
  54                     	switch	.text
  55  0000               _ADCIO_Config:
  59                     ; 55   ADC2_DeInit();
  61  0000 cd0000        	call	_ADC2_DeInit
  63                     ; 62   ADC2_Init(ADC2_CONVERSIONMODE_SINGLE, ADC2_CHANNEL_0, ADC2_PRESSEL_FCPU_D2, \
  63                     ; 63             ADC2_EXTTRIG_TIM, DISABLE, ADC2_ALIGN_RIGHT, ADC2_SCHMITTTRIG_CHANNEL0,\
  63                     ; 64             DISABLE);
  65  0003 4b00          	push	#0
  66  0005 4b00          	push	#0
  67  0007 4b08          	push	#8
  68  0009 4b00          	push	#0
  69  000b 4b00          	push	#0
  70  000d 4b00          	push	#0
  71  000f 5f            	clrw	x
  72  0010 cd0000        	call	_ADC2_Init
  74  0013 5b06          	addw	sp,#6
  75                     ; 66 }
  78  0015 81            	ret	
 102                     ; 77 uint16_t GetADCIOData(void)
 102                     ; 78 {
 103                     	switch	.text
 104  0016               _GetADCIOData:
 108                     ; 79 	return (Conversion_Value_IO);
 110  0016 ce0000        	ldw	x,_Conversion_Value_IO
 113  0019 81            	ret	
 136                     	xdef	_GetADCIOData
 137                     	xdef	_ADCIO_Config
 138                     	xdef	_Conversion_Value_IO
 139                     	xref	_ADC2_Init
 140                     	xref	_ADC2_DeInit
 159                     	end
