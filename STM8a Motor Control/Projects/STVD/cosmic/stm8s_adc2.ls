   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  47                     ; 48 void ADC2_DeInit(void)
  47                     ; 49 {
  49                     	switch	.text
  50  0000               _ADC2_DeInit:
  54                     ; 50     ADC2->CSR  = ADC2_CSR_RESET_VALUE;
  56  0000 725f5400      	clr	21504
  57                     ; 51     ADC2->CR1  = ADC2_CR1_RESET_VALUE;
  59  0004 725f5401      	clr	21505
  60                     ; 52     ADC2->CR2  = ADC2_CR2_RESET_VALUE;
  62  0008 725f5402      	clr	21506
  63                     ; 53     ADC2->TDRH = ADC2_TDRH_RESET_VALUE;
  65  000c 725f5406      	clr	21510
  66                     ; 54     ADC2->TDRL = ADC2_TDRL_RESET_VALUE;
  68  0010 725f5407      	clr	21511
  69                     ; 55 }
  72  0014 81            	ret	
 599                     ; 77 void ADC2_Init(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_PresSel_TypeDef ADC2_PrescalerSelection, ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState ADC2_ExtTriggerState, ADC2_Align_TypeDef ADC2_Align, ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState ADC2_SchmittTriggerState)
 599                     ; 78 {
 600                     	switch	.text
 601  0015               _ADC2_Init:
 603  0015 89            	pushw	x
 604       00000000      OFST:	set	0
 607                     ; 81     assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
 609  0016 9e            	ld	a,xh
 610  0017 4d            	tnz	a
 611  0018 2712          	jreq	L41
 612  001a 9e            	ld	a,xh
 613  001b 4a            	dec	a
 614  001c 270e          	jreq	L41
 615  001e ae0051        	ldw	x,#81
 616  0021 89            	pushw	x
 617  0022 5f            	clrw	x
 618  0023 89            	pushw	x
 619  0024 ae0000        	ldw	x,#L172
 620  0027 cd0000        	call	_assert_failed
 622  002a 5b04          	addw	sp,#4
 623  002c               L41:
 624                     ; 82     assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
 626  002c 7b02          	ld	a,(OFST+2,sp)
 627  002e 274a          	jreq	L42
 628  0030 a101          	cp	a,#1
 629  0032 2746          	jreq	L42
 630  0034 a102          	cp	a,#2
 631  0036 2742          	jreq	L42
 632  0038 a103          	cp	a,#3
 633  003a 273e          	jreq	L42
 634  003c a104          	cp	a,#4
 635  003e 273a          	jreq	L42
 636  0040 a105          	cp	a,#5
 637  0042 2736          	jreq	L42
 638  0044 a106          	cp	a,#6
 639  0046 2732          	jreq	L42
 640  0048 a107          	cp	a,#7
 641  004a 272e          	jreq	L42
 642  004c a108          	cp	a,#8
 643  004e 272a          	jreq	L42
 644  0050 a109          	cp	a,#9
 645  0052 2726          	jreq	L42
 646  0054 a10a          	cp	a,#10
 647  0056 2722          	jreq	L42
 648  0058 a10b          	cp	a,#11
 649  005a 271e          	jreq	L42
 650  005c a10c          	cp	a,#12
 651  005e 271a          	jreq	L42
 652  0060 a10d          	cp	a,#13
 653  0062 2716          	jreq	L42
 654  0064 a10e          	cp	a,#14
 655  0066 2712          	jreq	L42
 656  0068 a10f          	cp	a,#15
 657  006a 270e          	jreq	L42
 658  006c ae0052        	ldw	x,#82
 659  006f 89            	pushw	x
 660  0070 5f            	clrw	x
 661  0071 89            	pushw	x
 662  0072 ae0000        	ldw	x,#L172
 663  0075 cd0000        	call	_assert_failed
 665  0078 5b04          	addw	sp,#4
 666  007a               L42:
 667                     ; 83     assert_param(IS_ADC2_PRESSEL_OK(ADC2_PrescalerSelection));
 669  007a 7b05          	ld	a,(OFST+5,sp)
 670  007c 272a          	jreq	L43
 671  007e a110          	cp	a,#16
 672  0080 2726          	jreq	L43
 673  0082 a120          	cp	a,#32
 674  0084 2722          	jreq	L43
 675  0086 a130          	cp	a,#48
 676  0088 271e          	jreq	L43
 677  008a a140          	cp	a,#64
 678  008c 271a          	jreq	L43
 679  008e a150          	cp	a,#80
 680  0090 2716          	jreq	L43
 681  0092 a160          	cp	a,#96
 682  0094 2712          	jreq	L43
 683  0096 a170          	cp	a,#112
 684  0098 270e          	jreq	L43
 685  009a ae0053        	ldw	x,#83
 686  009d 89            	pushw	x
 687  009e 5f            	clrw	x
 688  009f 89            	pushw	x
 689  00a0 ae0000        	ldw	x,#L172
 690  00a3 cd0000        	call	_assert_failed
 692  00a6 5b04          	addw	sp,#4
 693  00a8               L43:
 694                     ; 84     assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
 696  00a8 7b06          	ld	a,(OFST+6,sp)
 697  00aa 2711          	jreq	L44
 698  00ac 4a            	dec	a
 699  00ad 270e          	jreq	L44
 700  00af ae0054        	ldw	x,#84
 701  00b2 89            	pushw	x
 702  00b3 5f            	clrw	x
 703  00b4 89            	pushw	x
 704  00b5 ae0000        	ldw	x,#L172
 705  00b8 cd0000        	call	_assert_failed
 707  00bb 5b04          	addw	sp,#4
 708  00bd               L44:
 709                     ; 85     assert_param(IS_FUNCTIONALSTATE_OK(((ADC2_ExtTriggerState))));
 711  00bd 7b07          	ld	a,(OFST+7,sp)
 712  00bf 2711          	jreq	L45
 713  00c1 4a            	dec	a
 714  00c2 270e          	jreq	L45
 715  00c4 ae0055        	ldw	x,#85
 716  00c7 89            	pushw	x
 717  00c8 5f            	clrw	x
 718  00c9 89            	pushw	x
 719  00ca ae0000        	ldw	x,#L172
 720  00cd cd0000        	call	_assert_failed
 722  00d0 5b04          	addw	sp,#4
 723  00d2               L45:
 724                     ; 86     assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));
 726  00d2 7b08          	ld	a,(OFST+8,sp)
 727  00d4 2712          	jreq	L46
 728  00d6 a108          	cp	a,#8
 729  00d8 270e          	jreq	L46
 730  00da ae0056        	ldw	x,#86
 731  00dd 89            	pushw	x
 732  00de 5f            	clrw	x
 733  00df 89            	pushw	x
 734  00e0 ae0000        	ldw	x,#L172
 735  00e3 cd0000        	call	_assert_failed
 737  00e6 5b04          	addw	sp,#4
 738  00e8               L46:
 739                     ; 87     assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
 741  00e8 7b09          	ld	a,(OFST+9,sp)
 742  00ea 274e          	jreq	L47
 743  00ec a101          	cp	a,#1
 744  00ee 274a          	jreq	L47
 745  00f0 a102          	cp	a,#2
 746  00f2 2746          	jreq	L47
 747  00f4 a103          	cp	a,#3
 748  00f6 2742          	jreq	L47
 749  00f8 a104          	cp	a,#4
 750  00fa 273e          	jreq	L47
 751  00fc a105          	cp	a,#5
 752  00fe 273a          	jreq	L47
 753  0100 a106          	cp	a,#6
 754  0102 2736          	jreq	L47
 755  0104 a107          	cp	a,#7
 756  0106 2732          	jreq	L47
 757  0108 a108          	cp	a,#8
 758  010a 272e          	jreq	L47
 759  010c a109          	cp	a,#9
 760  010e 272a          	jreq	L47
 761  0110 a10a          	cp	a,#10
 762  0112 2726          	jreq	L47
 763  0114 a10b          	cp	a,#11
 764  0116 2722          	jreq	L47
 765  0118 a10c          	cp	a,#12
 766  011a 271e          	jreq	L47
 767  011c a10d          	cp	a,#13
 768  011e 271a          	jreq	L47
 769  0120 a10e          	cp	a,#14
 770  0122 2716          	jreq	L47
 771  0124 a10f          	cp	a,#15
 772  0126 2712          	jreq	L47
 773  0128 a11f          	cp	a,#31
 774  012a 270e          	jreq	L47
 775  012c ae0057        	ldw	x,#87
 776  012f 89            	pushw	x
 777  0130 5f            	clrw	x
 778  0131 89            	pushw	x
 779  0132 ae0000        	ldw	x,#L172
 780  0135 cd0000        	call	_assert_failed
 782  0138 5b04          	addw	sp,#4
 783  013a               L47:
 784                     ; 88     assert_param(IS_FUNCTIONALSTATE_OK(ADC2_SchmittTriggerState));
 786  013a 7b0a          	ld	a,(OFST+10,sp)
 787  013c 2711          	jreq	L401
 788  013e 4a            	dec	a
 789  013f 270e          	jreq	L401
 790  0141 ae0058        	ldw	x,#88
 791  0144 89            	pushw	x
 792  0145 5f            	clrw	x
 793  0146 89            	pushw	x
 794  0147 ae0000        	ldw	x,#L172
 795  014a cd0000        	call	_assert_failed
 797  014d 5b04          	addw	sp,#4
 798  014f               L401:
 799                     ; 93     ADC2_ConversionConfig(ADC2_ConversionMode, ADC2_Channel, ADC2_Align);
 801  014f 7b08          	ld	a,(OFST+8,sp)
 802  0151 88            	push	a
 803  0152 7b03          	ld	a,(OFST+3,sp)
 804  0154 97            	ld	xl,a
 805  0155 7b02          	ld	a,(OFST+2,sp)
 806  0157 95            	ld	xh,a
 807  0158 cd02f2        	call	_ADC2_ConversionConfig
 809  015b 84            	pop	a
 810                     ; 95     ADC2_PrescalerConfig(ADC2_PrescalerSelection);
 812  015c 7b05          	ld	a,(OFST+5,sp)
 813  015e ad62          	call	_ADC2_PrescalerConfig
 815                     ; 100     ADC2_ExternalTriggerConfig(ADC2_ExtTrigger, ADC2_ExtTriggerState);
 817  0160 7b07          	ld	a,(OFST+7,sp)
 818  0162 97            	ld	xl,a
 819  0163 7b06          	ld	a,(OFST+6,sp)
 820  0165 95            	ld	xh,a
 821  0166 cd039a        	call	_ADC2_ExternalTriggerConfig
 823                     ; 105     ADC2_SchmittTriggerConfig(ADC2_SchmittTriggerChannel, ADC2_SchmittTriggerState);
 825  0169 7b0a          	ld	a,(OFST+10,sp)
 826  016b 97            	ld	xl,a
 827  016c 7b09          	ld	a,(OFST+9,sp)
 828  016e 95            	ld	xh,a
 829  016f cd0202        	call	_ADC2_SchmittTriggerConfig
 831                     ; 108     ADC2->CR1 |= ADC2_CR1_ADON;
 833  0172 72105401      	bset	21505,#0
 834                     ; 110 }
 837  0176 85            	popw	x
 838  0177 81            	ret	
 874                     ; 118 void ADC2_Cmd(FunctionalState NewState)
 874                     ; 119 {
 875                     	switch	.text
 876  0178               _ADC2_Cmd:
 878  0178 88            	push	a
 879       00000000      OFST:	set	0
 882                     ; 122     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 884  0179 4d            	tnz	a
 885  017a 2711          	jreq	L621
 886  017c 4a            	dec	a
 887  017d 270e          	jreq	L621
 888  017f ae007a        	ldw	x,#122
 889  0182 89            	pushw	x
 890  0183 5f            	clrw	x
 891  0184 89            	pushw	x
 892  0185 ae0000        	ldw	x,#L172
 893  0188 cd0000        	call	_assert_failed
 895  018b 5b04          	addw	sp,#4
 896  018d               L621:
 897                     ; 124     if (NewState != DISABLE)
 899  018d 7b01          	ld	a,(OFST+1,sp)
 900  018f 2706          	jreq	L113
 901                     ; 126         ADC2->CR1 |= ADC2_CR1_ADON;
 903  0191 72105401      	bset	21505,#0
 905  0195 2004          	jra	L313
 906  0197               L113:
 907                     ; 130         ADC2->CR1 &= (uint8_t)(~ADC2_CR1_ADON);
 909  0197 72115401      	bres	21505,#0
 910  019b               L313:
 911                     ; 133 }
 914  019b 84            	pop	a
 915  019c 81            	ret	
 951                     ; 140 void ADC2_ITConfig(FunctionalState NewState)
 951                     ; 141 {
 952                     	switch	.text
 953  019d               _ADC2_ITConfig:
 955  019d 88            	push	a
 956       00000000      OFST:	set	0
 959                     ; 144     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 961  019e 4d            	tnz	a
 962  019f 2711          	jreq	L041
 963  01a1 4a            	dec	a
 964  01a2 270e          	jreq	L041
 965  01a4 ae0090        	ldw	x,#144
 966  01a7 89            	pushw	x
 967  01a8 5f            	clrw	x
 968  01a9 89            	pushw	x
 969  01aa ae0000        	ldw	x,#L172
 970  01ad cd0000        	call	_assert_failed
 972  01b0 5b04          	addw	sp,#4
 973  01b2               L041:
 974                     ; 146     if (NewState != DISABLE)
 976  01b2 7b01          	ld	a,(OFST+1,sp)
 977  01b4 2706          	jreq	L333
 978                     ; 149         ADC2->CSR |= (uint8_t)ADC2_CSR_EOCIE;
 980  01b6 721a5400      	bset	21504,#5
 982  01ba 2004          	jra	L533
 983  01bc               L333:
 984                     ; 154         ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOCIE);
 986  01bc 721b5400      	bres	21504,#5
 987  01c0               L533:
 988                     ; 157 }
 991  01c0 84            	pop	a
 992  01c1 81            	ret	
1029                     ; 165 void ADC2_PrescalerConfig(ADC2_PresSel_TypeDef ADC2_Prescaler)
1029                     ; 166 {
1030                     	switch	.text
1031  01c2               _ADC2_PrescalerConfig:
1033  01c2 88            	push	a
1034       00000000      OFST:	set	0
1037                     ; 169     assert_param(IS_ADC2_PRESSEL_OK(ADC2_Prescaler));
1039  01c3 4d            	tnz	a
1040  01c4 272a          	jreq	L251
1041  01c6 a110          	cp	a,#16
1042  01c8 2726          	jreq	L251
1043  01ca a120          	cp	a,#32
1044  01cc 2722          	jreq	L251
1045  01ce a130          	cp	a,#48
1046  01d0 271e          	jreq	L251
1047  01d2 a140          	cp	a,#64
1048  01d4 271a          	jreq	L251
1049  01d6 a150          	cp	a,#80
1050  01d8 2716          	jreq	L251
1051  01da a160          	cp	a,#96
1052  01dc 2712          	jreq	L251
1053  01de a170          	cp	a,#112
1054  01e0 270e          	jreq	L251
1055  01e2 ae00a9        	ldw	x,#169
1056  01e5 89            	pushw	x
1057  01e6 5f            	clrw	x
1058  01e7 89            	pushw	x
1059  01e8 ae0000        	ldw	x,#L172
1060  01eb cd0000        	call	_assert_failed
1062  01ee 5b04          	addw	sp,#4
1063  01f0               L251:
1064                     ; 172     ADC2->CR1 &= (uint8_t)(~ADC2_CR1_SPSEL);
1066  01f0 c65401        	ld	a,21505
1067  01f3 a48f          	and	a,#143
1068  01f5 c75401        	ld	21505,a
1069                     ; 174     ADC2->CR1 |= (uint8_t)(ADC2_Prescaler);
1071  01f8 c65401        	ld	a,21505
1072  01fb 1a01          	or	a,(OFST+1,sp)
1073  01fd c75401        	ld	21505,a
1074                     ; 176 }
1077  0200 84            	pop	a
1078  0201 81            	ret	
1126                     ; 187 void ADC2_SchmittTriggerConfig(ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState NewState)
1126                     ; 188 {
1127                     	switch	.text
1128  0202               _ADC2_SchmittTriggerConfig:
1130  0202 89            	pushw	x
1131       00000000      OFST:	set	0
1134                     ; 191     assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
1136  0203 9e            	ld	a,xh
1137  0204 4d            	tnz	a
1138  0205 275d          	jreq	L461
1139  0207 9e            	ld	a,xh
1140  0208 4a            	dec	a
1141  0209 2759          	jreq	L461
1142  020b 9e            	ld	a,xh
1143  020c a102          	cp	a,#2
1144  020e 2754          	jreq	L461
1145  0210 9e            	ld	a,xh
1146  0211 a103          	cp	a,#3
1147  0213 274f          	jreq	L461
1148  0215 9e            	ld	a,xh
1149  0216 a104          	cp	a,#4
1150  0218 274a          	jreq	L461
1151  021a 9e            	ld	a,xh
1152  021b a105          	cp	a,#5
1153  021d 2745          	jreq	L461
1154  021f 9e            	ld	a,xh
1155  0220 a106          	cp	a,#6
1156  0222 2740          	jreq	L461
1157  0224 9e            	ld	a,xh
1158  0225 a107          	cp	a,#7
1159  0227 273b          	jreq	L461
1160  0229 9e            	ld	a,xh
1161  022a a108          	cp	a,#8
1162  022c 2736          	jreq	L461
1163  022e 9e            	ld	a,xh
1164  022f a109          	cp	a,#9
1165  0231 2731          	jreq	L461
1166  0233 9e            	ld	a,xh
1167  0234 a10a          	cp	a,#10
1168  0236 272c          	jreq	L461
1169  0238 9e            	ld	a,xh
1170  0239 a10b          	cp	a,#11
1171  023b 2727          	jreq	L461
1172  023d 9e            	ld	a,xh
1173  023e a10c          	cp	a,#12
1174  0240 2722          	jreq	L461
1175  0242 9e            	ld	a,xh
1176  0243 a10d          	cp	a,#13
1177  0245 271d          	jreq	L461
1178  0247 9e            	ld	a,xh
1179  0248 a10e          	cp	a,#14
1180  024a 2718          	jreq	L461
1181  024c 9e            	ld	a,xh
1182  024d a10f          	cp	a,#15
1183  024f 2713          	jreq	L461
1184  0251 9e            	ld	a,xh
1185  0252 a11f          	cp	a,#31
1186  0254 270e          	jreq	L461
1187  0256 ae00bf        	ldw	x,#191
1188  0259 89            	pushw	x
1189  025a 5f            	clrw	x
1190  025b 89            	pushw	x
1191  025c ae0000        	ldw	x,#L172
1192  025f cd0000        	call	_assert_failed
1194  0262 5b04          	addw	sp,#4
1195  0264               L461:
1196                     ; 192     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1198  0264 7b02          	ld	a,(OFST+2,sp)
1199  0266 2711          	jreq	L471
1200  0268 4a            	dec	a
1201  0269 270e          	jreq	L471
1202  026b ae00c0        	ldw	x,#192
1203  026e 89            	pushw	x
1204  026f 5f            	clrw	x
1205  0270 89            	pushw	x
1206  0271 ae0000        	ldw	x,#L172
1207  0274 cd0000        	call	_assert_failed
1209  0277 5b04          	addw	sp,#4
1210  0279               L471:
1211                     ; 194     if (ADC2_SchmittTriggerChannel == ADC2_SCHMITTTRIG_ALL)
1213  0279 7b01          	ld	a,(OFST+1,sp)
1214  027b a11f          	cp	a,#31
1215  027d 261d          	jrne	L773
1216                     ; 196         if (NewState != DISABLE)
1218  027f 7b02          	ld	a,(OFST+2,sp)
1219  0281 270a          	jreq	L104
1220                     ; 198             ADC2->TDRL &= (uint8_t)0x0;
1222  0283 725f5407      	clr	21511
1223                     ; 199             ADC2->TDRH &= (uint8_t)0x0;
1225  0287 725f5406      	clr	21510
1227  028b 2063          	jra	L504
1228  028d               L104:
1229                     ; 203             ADC2->TDRL |= (uint8_t)0xFF;
1231  028d c65407        	ld	a,21511
1232  0290 aaff          	or	a,#255
1233  0292 c75407        	ld	21511,a
1234                     ; 204             ADC2->TDRH |= (uint8_t)0xFF;
1236  0295 c65406        	ld	a,21510
1237  0298 aaff          	or	a,#255
1238  029a 2051          	jp	LC001
1239  029c               L773:
1240                     ; 207     else if (ADC2_SchmittTriggerChannel < ADC2_SCHMITTTRIG_CHANNEL8)
1242  029c a108          	cp	a,#8
1243  029e 0d02          	tnz	(OFST+2,sp)
1244  02a0 2426          	jruge	L704
1245                     ; 209         if (NewState != DISABLE)
1247  02a2 2714          	jreq	L114
1248                     ; 211             ADC2->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC2_SchmittTriggerChannel));
1250  02a4 5f            	clrw	x
1251  02a5 97            	ld	xl,a
1252  02a6 a601          	ld	a,#1
1253  02a8 5d            	tnzw	x
1254  02a9 2704          	jreq	L002
1255  02ab               L202:
1256  02ab 48            	sll	a
1257  02ac 5a            	decw	x
1258  02ad 26fc          	jrne	L202
1259  02af               L002:
1260  02af 43            	cpl	a
1261  02b0 c45407        	and	a,21511
1262  02b3               LC002:
1263  02b3 c75407        	ld	21511,a
1265  02b6 2038          	jra	L504
1266  02b8               L114:
1267                     ; 215             ADC2->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC2_SchmittTriggerChannel);
1269  02b8 5f            	clrw	x
1270  02b9 97            	ld	xl,a
1271  02ba a601          	ld	a,#1
1272  02bc 5d            	tnzw	x
1273  02bd 2704          	jreq	L402
1274  02bf               L602:
1275  02bf 48            	sll	a
1276  02c0 5a            	decw	x
1277  02c1 26fc          	jrne	L602
1278  02c3               L402:
1279  02c3 ca5407        	or	a,21511
1280  02c6 20eb          	jp	LC002
1281  02c8               L704:
1282                     ; 220         if (NewState != DISABLE)
1284  02c8 2713          	jreq	L714
1285                     ; 222             ADC2->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC2_SchmittTriggerChannel - (uint8_t)8)));
1287  02ca a008          	sub	a,#8
1288  02cc 5f            	clrw	x
1289  02cd 97            	ld	xl,a
1290  02ce a601          	ld	a,#1
1291  02d0 5d            	tnzw	x
1292  02d1 2704          	jreq	L012
1293  02d3               L212:
1294  02d3 48            	sll	a
1295  02d4 5a            	decw	x
1296  02d5 26fc          	jrne	L212
1297  02d7               L012:
1298  02d7 43            	cpl	a
1299  02d8 c45406        	and	a,21510
1301  02db 2010          	jp	LC001
1302  02dd               L714:
1303                     ; 226             ADC2->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC2_SchmittTriggerChannel - (uint8_t)8));
1305  02dd a008          	sub	a,#8
1306  02df 5f            	clrw	x
1307  02e0 97            	ld	xl,a
1308  02e1 a601          	ld	a,#1
1309  02e3 5d            	tnzw	x
1310  02e4 2704          	jreq	L412
1311  02e6               L612:
1312  02e6 48            	sll	a
1313  02e7 5a            	decw	x
1314  02e8 26fc          	jrne	L612
1315  02ea               L412:
1316  02ea ca5406        	or	a,21510
1317  02ed               LC001:
1318  02ed c75406        	ld	21510,a
1319  02f0               L504:
1320                     ; 230 }
1323  02f0 85            	popw	x
1324  02f1 81            	ret	
1382                     ; 242 void ADC2_ConversionConfig(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_Align_TypeDef ADC2_Align)
1382                     ; 243 {
1383                     	switch	.text
1384  02f2               _ADC2_ConversionConfig:
1386  02f2 89            	pushw	x
1387       00000000      OFST:	set	0
1390                     ; 246     assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
1392  02f3 9e            	ld	a,xh
1393  02f4 4d            	tnz	a
1394  02f5 2712          	jreq	L622
1395  02f7 9e            	ld	a,xh
1396  02f8 4a            	dec	a
1397  02f9 270e          	jreq	L622
1398  02fb ae00f6        	ldw	x,#246
1399  02fe 89            	pushw	x
1400  02ff 5f            	clrw	x
1401  0300 89            	pushw	x
1402  0301 ae0000        	ldw	x,#L172
1403  0304 cd0000        	call	_assert_failed
1405  0307 5b04          	addw	sp,#4
1406  0309               L622:
1407                     ; 247     assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
1409  0309 7b02          	ld	a,(OFST+2,sp)
1410  030b 274a          	jreq	L632
1411  030d a101          	cp	a,#1
1412  030f 2746          	jreq	L632
1413  0311 a102          	cp	a,#2
1414  0313 2742          	jreq	L632
1415  0315 a103          	cp	a,#3
1416  0317 273e          	jreq	L632
1417  0319 a104          	cp	a,#4
1418  031b 273a          	jreq	L632
1419  031d a105          	cp	a,#5
1420  031f 2736          	jreq	L632
1421  0321 a106          	cp	a,#6
1422  0323 2732          	jreq	L632
1423  0325 a107          	cp	a,#7
1424  0327 272e          	jreq	L632
1425  0329 a108          	cp	a,#8
1426  032b 272a          	jreq	L632
1427  032d a109          	cp	a,#9
1428  032f 2726          	jreq	L632
1429  0331 a10a          	cp	a,#10
1430  0333 2722          	jreq	L632
1431  0335 a10b          	cp	a,#11
1432  0337 271e          	jreq	L632
1433  0339 a10c          	cp	a,#12
1434  033b 271a          	jreq	L632
1435  033d a10d          	cp	a,#13
1436  033f 2716          	jreq	L632
1437  0341 a10e          	cp	a,#14
1438  0343 2712          	jreq	L632
1439  0345 a10f          	cp	a,#15
1440  0347 270e          	jreq	L632
1441  0349 ae00f7        	ldw	x,#247
1442  034c 89            	pushw	x
1443  034d 5f            	clrw	x
1444  034e 89            	pushw	x
1445  034f ae0000        	ldw	x,#L172
1446  0352 cd0000        	call	_assert_failed
1448  0355 5b04          	addw	sp,#4
1449  0357               L632:
1450                     ; 248     assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));
1452  0357 7b05          	ld	a,(OFST+5,sp)
1453  0359 2712          	jreq	L642
1454  035b a108          	cp	a,#8
1455  035d 270e          	jreq	L642
1456  035f ae00f8        	ldw	x,#248
1457  0362 89            	pushw	x
1458  0363 5f            	clrw	x
1459  0364 89            	pushw	x
1460  0365 ae0000        	ldw	x,#L172
1461  0368 cd0000        	call	_assert_failed
1463  036b 5b04          	addw	sp,#4
1464  036d               L642:
1465                     ; 251     ADC2->CR2 &= (uint8_t)(~ADC2_CR2_ALIGN);
1467  036d 72175402      	bres	21506,#3
1468                     ; 253     ADC2->CR2 |= (uint8_t)(ADC2_Align);
1470  0371 c65402        	ld	a,21506
1471  0374 1a05          	or	a,(OFST+5,sp)
1472  0376 c75402        	ld	21506,a
1473                     ; 255     if (ADC2_ConversionMode == ADC2_CONVERSIONMODE_CONTINUOUS)
1475  0379 7b01          	ld	a,(OFST+1,sp)
1476  037b 4a            	dec	a
1477  037c 2606          	jrne	L154
1478                     ; 258         ADC2->CR1 |= ADC2_CR1_CONT;
1480  037e 72125401      	bset	21505,#1
1482  0382 2004          	jra	L354
1483  0384               L154:
1484                     ; 263         ADC2->CR1 &= (uint8_t)(~ADC2_CR1_CONT);
1486  0384 72135401      	bres	21505,#1
1487  0388               L354:
1488                     ; 267     ADC2->CSR &= (uint8_t)(~ADC2_CSR_CH);
1490  0388 c65400        	ld	a,21504
1491  038b a4f0          	and	a,#240
1492  038d c75400        	ld	21504,a
1493                     ; 269     ADC2->CSR |= (uint8_t)(ADC2_Channel);
1495  0390 c65400        	ld	a,21504
1496  0393 1a02          	or	a,(OFST+2,sp)
1497  0395 c75400        	ld	21504,a
1498                     ; 271 }
1501  0398 85            	popw	x
1502  0399 81            	ret	
1549                     ; 284 void ADC2_ExternalTriggerConfig(ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState NewState)
1549                     ; 285 {
1550                     	switch	.text
1551  039a               _ADC2_ExternalTriggerConfig:
1553  039a 89            	pushw	x
1554       00000000      OFST:	set	0
1557                     ; 288     assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
1559  039b 9e            	ld	a,xh
1560  039c 4d            	tnz	a
1561  039d 2712          	jreq	L062
1562  039f 9e            	ld	a,xh
1563  03a0 4a            	dec	a
1564  03a1 270e          	jreq	L062
1565  03a3 ae0120        	ldw	x,#288
1566  03a6 89            	pushw	x
1567  03a7 5f            	clrw	x
1568  03a8 89            	pushw	x
1569  03a9 ae0000        	ldw	x,#L172
1570  03ac cd0000        	call	_assert_failed
1572  03af 5b04          	addw	sp,#4
1573  03b1               L062:
1574                     ; 289     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1576  03b1 7b02          	ld	a,(OFST+2,sp)
1577  03b3 2711          	jreq	L072
1578  03b5 4a            	dec	a
1579  03b6 270e          	jreq	L072
1580  03b8 ae0121        	ldw	x,#289
1581  03bb 89            	pushw	x
1582  03bc 5f            	clrw	x
1583  03bd 89            	pushw	x
1584  03be ae0000        	ldw	x,#L172
1585  03c1 cd0000        	call	_assert_failed
1587  03c4 5b04          	addw	sp,#4
1588  03c6               L072:
1589                     ; 292     ADC2->CR2 &= (uint8_t)(~ADC2_CR2_EXTSEL);
1591  03c6 c65402        	ld	a,21506
1592  03c9 a4cf          	and	a,#207
1593  03cb c75402        	ld	21506,a
1594                     ; 294     if (NewState != DISABLE)
1596  03ce 7b02          	ld	a,(OFST+2,sp)
1597  03d0 2706          	jreq	L774
1598                     ; 297         ADC2->CR2 |= (uint8_t)(ADC2_CR2_EXTTRIG);
1600  03d2 721c5402      	bset	21506,#6
1602  03d6 2004          	jra	L105
1603  03d8               L774:
1604                     ; 302         ADC2->CR2 &= (uint8_t)(~ADC2_CR2_EXTTRIG);
1606  03d8 721d5402      	bres	21506,#6
1607  03dc               L105:
1608                     ; 306     ADC2->CR2 |= (uint8_t)(ADC2_ExtTrigger);
1610  03dc c65402        	ld	a,21506
1611  03df 1a01          	or	a,(OFST+1,sp)
1612  03e1 c75402        	ld	21506,a
1613                     ; 308 }
1616  03e4 85            	popw	x
1617  03e5 81            	ret	
1641                     ; 320 void ADC2_StartConversion(void)
1641                     ; 321 {
1642                     	switch	.text
1643  03e6               _ADC2_StartConversion:
1647                     ; 322     ADC2->CR1 |= ADC2_CR1_ADON;
1649  03e6 72105401      	bset	21505,#0
1650                     ; 323 }
1653  03ea 81            	ret	
1693                     ; 332 uint16_t ADC2_GetConversionValue(void)
1693                     ; 333 {
1694                     	switch	.text
1695  03eb               _ADC2_GetConversionValue:
1697  03eb 5205          	subw	sp,#5
1698       00000005      OFST:	set	5
1701                     ; 335     uint16_t temph = 0;
1703                     ; 336     uint8_t templ = 0;
1705                     ; 338     if ((ADC2->CR2 & ADC2_CR2_ALIGN) != 0) /* Right alignment */
1707  03ed 720754020e    	btjf	21506,#3,L135
1708                     ; 341         templ = ADC2->DRL;
1710  03f2 c65405        	ld	a,21509
1711  03f5 6b03          	ld	(OFST-2,sp),a
1713                     ; 343         temph = ADC2->DRH;
1715  03f7 c65404        	ld	a,21508
1716  03fa 97            	ld	xl,a
1718                     ; 345         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1720  03fb 7b03          	ld	a,(OFST-2,sp)
1721  03fd 02            	rlwa	x,a
1724  03fe 201a          	jra	L335
1725  0400               L135:
1726                     ; 350         temph = ADC2->DRH;
1728  0400 c65404        	ld	a,21508
1729  0403 97            	ld	xl,a
1731                     ; 352         templ = ADC2->DRL;
1733  0404 c65405        	ld	a,21509
1734  0407 6b03          	ld	(OFST-2,sp),a
1736                     ; 354         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1738  0409 4f            	clr	a
1739  040a 02            	rlwa	x,a
1740  040b 1f01          	ldw	(OFST-4,sp),x
1742  040d 7b03          	ld	a,(OFST-2,sp)
1743  040f 97            	ld	xl,a
1744  0410 a640          	ld	a,#64
1745  0412 42            	mul	x,a
1746  0413 01            	rrwa	x,a
1747  0414 1a02          	or	a,(OFST-3,sp)
1748  0416 01            	rrwa	x,a
1749  0417 1a01          	or	a,(OFST-4,sp)
1750  0419 01            	rrwa	x,a
1752  041a               L335:
1753                     ; 357     return ((uint16_t)temph);
1757  041a 5b05          	addw	sp,#5
1758  041c 81            	ret	
1802                     ; 366 FlagStatus ADC2_GetFlagStatus(void)
1802                     ; 367 {
1803                     	switch	.text
1804  041d               _ADC2_GetFlagStatus:
1808                     ; 369     return (FlagStatus)(ADC2->CSR & ADC2_CSR_EOC);
1810  041d c65400        	ld	a,21504
1811  0420 a480          	and	a,#128
1814  0422 81            	ret	
1837                     ; 378 void ADC2_ClearFlag(void)
1837                     ; 379 {
1838                     	switch	.text
1839  0423               _ADC2_ClearFlag:
1843                     ; 380     ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOC);
1845  0423 721f5400      	bres	21504,#7
1846                     ; 381 }
1849  0427 81            	ret	
1873                     ; 389 ITStatus ADC2_GetITStatus(void)
1873                     ; 390 {
1874                     	switch	.text
1875  0428               _ADC2_GetITStatus:
1879                     ; 391     return (ITStatus)(ADC2->CSR & ADC2_CSR_EOC);
1881  0428 c65400        	ld	a,21504
1882  042b a480          	and	a,#128
1885  042d 81            	ret	
1909                     ; 399 void ADC2_ClearITPendingBit(void)
1909                     ; 400 {
1910                     	switch	.text
1911  042e               _ADC2_ClearITPendingBit:
1915                     ; 401     ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOC);
1917  042e 721f5400      	bres	21504,#7
1918                     ; 402 }
1921  0432 81            	ret	
1934                     	xdef	_ADC2_ClearITPendingBit
1935                     	xdef	_ADC2_GetITStatus
1936                     	xdef	_ADC2_ClearFlag
1937                     	xdef	_ADC2_GetFlagStatus
1938                     	xdef	_ADC2_GetConversionValue
1939                     	xdef	_ADC2_StartConversion
1940                     	xdef	_ADC2_ExternalTriggerConfig
1941                     	xdef	_ADC2_ConversionConfig
1942                     	xdef	_ADC2_SchmittTriggerConfig
1943                     	xdef	_ADC2_PrescalerConfig
1944                     	xdef	_ADC2_ITConfig
1945                     	xdef	_ADC2_Cmd
1946                     	xdef	_ADC2_Init
1947                     	xdef	_ADC2_DeInit
1948                     	xref	_assert_failed
1949                     .const:	section	.text
1950  0000               L172:
1951  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
1952  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
1953  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
1954  0036 5f616463322e  	dc.b	"_adc2.c",0
1974                     	end
