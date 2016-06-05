   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  19                     	switch	.data
  20  0000               L3_status:
  21  0000 f0            	dc.b	240
  22  0001               L5_Tx_IDE:
  23  0001 00            	dc.b	0
  24  0002               L7_Tx_RTR:
  25  0002 00            	dc.b	0
  26  0003               L11_Tx_DLC:
  27  0003 00            	dc.b	0
  28  0004               L31_Tx_Data:
  29  0004 00            	dc.b	0
  30  0005 000000000000  	ds.b	7
  31  000c               L51_Tx_Id:
  32  000c 00000000      	dc.l	0
  33  0010               L71_SendCANFrame:
  34  0010 00            	dc.b	0
  35  0011               L32_FrameNumber:
  36  0011 00            	dc.b	0
  37  0012               _FrameReceived:
  38  0012 00            	dc.b	0
  39  0013               _TransmissionEnable:
  40  0013 00            	dc.b	0
  41  0014               _CANMaster:
  42  0014 00            	dc.b	0
  43  0015               L52_CANTimebaseTick:
  44  0015 00            	dc.b	0
 756                     ; 74 void CAN_Config(void)
 756                     ; 75 {
 758                     	switch	.text
 759  0000               _CAN_Config:
 761  0000 5213          	subw	sp,#19
 762       00000013      OFST:	set	19
 765                     ; 76   CAN_InitStatus_TypeDef status = CAN_InitStatus_Failed;
 767                     ; 101   CAN_DeInit();
 769  0002 cd0000        	call	_CAN_DeInit
 771                     ; 104   CAN_MasterCtrl=CAN_MasterCtrl_AllDisabled;
 773                     ; 107 	CAN_Mode = CAN_Mode_Normal;
 775                     ; 114   CAN_SynJumpWidth = CAN_SynJumpWidth_1TimeQuantum;
 777                     ; 115   CAN_BitSeg1 = CAN_BitSeg1_8TimeQuantum;
 779                     ; 116   CAN_BitSeg2 = CAN_BitSeg2_7TimeQuantum;
 781                     ; 117   CAN_Prescaler = 2; /* 500kbit/s */
 783                     ; 119   status = CAN_Init(CAN_MasterCtrl, CAN_Mode, CAN_SynJumpWidth, CAN_BitSeg1, \
 783                     ; 120                     CAN_BitSeg2, CAN_Prescaler);
 785  0005 4b02          	push	#2
 786  0007 4b60          	push	#96
 787  0009 4b07          	push	#7
 788  000b 4b00          	push	#0
 789  000d 5f            	clrw	x
 790  000e cd0000        	call	_CAN_Init
 792  0011 5b04          	addw	sp,#4
 793                     ; 123   CAN_FilterNumber = CAN_FilterNumber_0;
 795                     ; 124   CAN_FilterActivation = ENABLE;
 797                     ; 125   CAN_FilterMode = CAN_FilterMode_IdMask;
 799                     ; 126   CAN_FilterScale = CAN_FilterScale_32Bit;
 801                     ; 127   CAN_FilterID1=0;  
 803                     ; 128   CAN_FilterID2=0;
 805                     ; 129   CAN_FilterID3=0;
 807                     ; 130   CAN_FilterID4=0;
 809                     ; 131   CAN_FilterIDMask1=0;
 811                     ; 132   CAN_FilterIDMask2=0;
 813                     ; 133   CAN_FilterIDMask3=0;
 815                     ; 134   CAN_FilterIDMask4=0;  
 817                     ; 135   CAN_FilterInit(CAN_FilterNumber, CAN_FilterActivation, CAN_FilterMode, 
 817                     ; 136                  CAN_FilterScale,CAN_FilterID1, CAN_FilterID2, CAN_FilterID3,
 817                     ; 137                  CAN_FilterID4,CAN_FilterIDMask1, CAN_FilterIDMask2, 
 817                     ; 138                  CAN_FilterIDMask3, CAN_FilterIDMask4);
 819  0013 4b00          	push	#0
 820  0015 4b00          	push	#0
 821  0017 4b00          	push	#0
 822  0019 4b00          	push	#0
 823  001b 4b00          	push	#0
 824  001d 4b00          	push	#0
 825  001f 4b00          	push	#0
 826  0021 4b00          	push	#0
 827  0023 4b06          	push	#6
 828  0025 4b00          	push	#0
 829  0027 ae0001        	ldw	x,#1
 830  002a cd0000        	call	_CAN_FilterInit
 832  002d 5b0a          	addw	sp,#10
 833                     ; 142   CAN_ITConfig(CAN_IT_FMP, ENABLE);
 835  002f 4b01          	push	#1
 836  0031 ae0002        	ldw	x,#2
 837  0034 cd0000        	call	_CAN_ITConfig
 839  0037 84            	pop	a
 840                     ; 143 }
 843  0038 5b13          	addw	sp,#19
 844  003a 81            	ret	
 923                     ; 151 void CAN_Task(void)
 923                     ; 152 {
 924                     	switch	.text
 925  003b               _CAN_Task:
 927  003b 88            	push	a
 928       00000001      OFST:	set	1
 931                     ; 154 	uint8_t Index=0;
 933                     ; 156 	if(TestCANTimebaseTick())
 935  003c cd0232        	call	L13_TestCANTimebaseTick
 937  003f 4d            	tnz	a
 938  0040 2603cc0200    	jreq	L734
 939                     ; 158 		ClearCANTimebaseTick();
 941  0045 cd022d        	call	L72_ClearCANTimebaseTick
 943                     ; 162 		if (FrameReceived)
 945  0048 c60012        	ld	a,_FrameReceived
 946  004b 2603cc0104    	jreq	L144
 947                     ; 164 			FrameReceived=0;
 949  0050 725f0012      	clr	_FrameReceived
 950                     ; 166 			if ((uint16_t)CAN_GetReceivedId()==SM1ID)
 952  0054 cd0000        	call	_CAN_GetReceivedId
 954  0057 be02          	ldw	x,c_lreg+2
 955  0059 a30200        	cpw	x,#512
 956  005c 2617          	jrne	L344
 957                     ; 168 				for (Index=0;Index<8;Index++)
 959  005e 4f            	clr	a
 960  005f 6b01          	ld	(OFST+0,sp),a
 962  0061               L544:
 963                     ; 170 					CAN_DataBuffer[1][Index]=CAN_GetReceivedData(Index);
 965  0061 5f            	clrw	x
 966  0062 97            	ld	xl,a
 967  0063 89            	pushw	x
 968  0064 7b03          	ld	a,(OFST+2,sp)
 969  0066 cd0000        	call	_CAN_GetReceivedData
 971  0069 85            	popw	x
 972  006a d70008        	ld	(L12_CAN_DataBuffer+8,x),a
 973                     ; 168 				for (Index=0;Index<8;Index++)
 975  006d 0c01          	inc	(OFST+0,sp)
 979  006f 7b01          	ld	a,(OFST+0,sp)
 980  0071 a108          	cp	a,#8
 981  0073 25ec          	jrult	L544
 982  0075               L344:
 983                     ; 173 			if ((uint16_t)CAN_GetReceivedId()==SM3ID)
 985  0075 cd0000        	call	_CAN_GetReceivedId
 987  0078 be02          	ldw	x,c_lreg+2
 988  007a a30400        	cpw	x,#1024
 989  007d 2617          	jrne	L354
 990                     ; 175 				for (Index=0;Index<4;Index++)
 992  007f 4f            	clr	a
 993  0080 6b01          	ld	(OFST+0,sp),a
 995  0082               L554:
 996                     ; 177 					CAN_DataBuffer[3][Index]=CAN_GetReceivedData(Index);
 998  0082 5f            	clrw	x
 999  0083 97            	ld	xl,a
1000  0084 89            	pushw	x
1001  0085 7b03          	ld	a,(OFST+2,sp)
1002  0087 cd0000        	call	_CAN_GetReceivedData
1004  008a 85            	popw	x
1005  008b d70018        	ld	(L12_CAN_DataBuffer+24,x),a
1006                     ; 175 				for (Index=0;Index<4;Index++)
1008  008e 0c01          	inc	(OFST+0,sp)
1012  0090 7b01          	ld	a,(OFST+0,sp)
1013  0092 a104          	cp	a,#4
1014  0094 25ec          	jrult	L554
1015  0096               L354:
1016                     ; 182 			if ((uint16_t)CAN_GetReceivedId()==MS0ID)
1018  0096 cd0000        	call	_CAN_GetReceivedId
1020  0099 be02          	ldw	x,c_lreg+2
1021  009b a30100        	cpw	x,#256
1022  009e 262d          	jrne	L364
1023                     ; 184 				CANMaster = FALSE;
1025  00a0 725f0014      	clr	_CANMaster
1026                     ; 185 				TransmissionEnable=TRUE;
1028  00a4 35010013      	mov	_TransmissionEnable,#1
1029                     ; 186 				if (!ErrorState) GPIO_WriteLow(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3); /* LD3 red LED OFF */
1031  00a8 c60000        	ld	a,_ErrorState
1032  00ab 2609          	jrne	L564
1035  00ad 4b08          	push	#8
1036  00af ae5000        	ldw	x,#20480
1037  00b2 cd0000        	call	_GPIO_WriteLow
1039  00b5 84            	pop	a
1040  00b6               L564:
1041                     ; 187 				for (Index=0;Index<8;Index++)
1043  00b6 4f            	clr	a
1044  00b7 6b01          	ld	(OFST+0,sp),a
1046  00b9               L764:
1047                     ; 189 					CAN_DataBuffer[0][Index]=CAN_GetReceivedData(Index);
1049  00b9 5f            	clrw	x
1050  00ba 97            	ld	xl,a
1051  00bb 89            	pushw	x
1052  00bc 7b03          	ld	a,(OFST+2,sp)
1053  00be cd0000        	call	_CAN_GetReceivedData
1055  00c1 85            	popw	x
1056  00c2 d70000        	ld	(L12_CAN_DataBuffer,x),a
1057                     ; 187 				for (Index=0;Index<8;Index++)
1059  00c5 0c01          	inc	(OFST+0,sp)
1063  00c7 7b01          	ld	a,(OFST+0,sp)
1064  00c9 a108          	cp	a,#8
1065  00cb 25ec          	jrult	L764
1066  00cd               L364:
1067                     ; 192 			if ((uint16_t)CAN_GetReceivedId()==MS2ID)
1069  00cd cd0000        	call	_CAN_GetReceivedId
1071  00d0 be02          	ldw	x,c_lreg+2
1072  00d2 a30300        	cpw	x,#768
1073  00d5 262d          	jrne	L144
1074                     ; 194 				CANMaster = FALSE;
1076  00d7 725f0014      	clr	_CANMaster
1077                     ; 195 				TransmissionEnable=TRUE;
1079  00db 35010013      	mov	_TransmissionEnable,#1
1080                     ; 196 				if (!ErrorState) GPIO_WriteLow(GPIOA, (GPIO_Pin_TypeDef)GPIO_PIN_3); /* LD3 red LED OFF */
1082  00df c60000        	ld	a,_ErrorState
1083  00e2 2609          	jrne	L774
1086  00e4 4b08          	push	#8
1087  00e6 ae5000        	ldw	x,#20480
1088  00e9 cd0000        	call	_GPIO_WriteLow
1090  00ec 84            	pop	a
1091  00ed               L774:
1092                     ; 197 				for (Index=0;Index<4;Index++)
1094  00ed 4f            	clr	a
1095  00ee 6b01          	ld	(OFST+0,sp),a
1097  00f0               L105:
1098                     ; 199 					CAN_DataBuffer[2][Index]=CAN_GetReceivedData(Index);
1100  00f0 5f            	clrw	x
1101  00f1 97            	ld	xl,a
1102  00f2 89            	pushw	x
1103  00f3 7b03          	ld	a,(OFST+2,sp)
1104  00f5 cd0000        	call	_CAN_GetReceivedData
1106  00f8 85            	popw	x
1107  00f9 d70010        	ld	(L12_CAN_DataBuffer+16,x),a
1108                     ; 197 				for (Index=0;Index<4;Index++)
1110  00fc 0c01          	inc	(OFST+0,sp)
1114  00fe 7b01          	ld	a,(OFST+0,sp)
1115  0100 a104          	cp	a,#4
1116  0102 25ec          	jrult	L105
1117  0104               L144:
1118                     ; 207 		SendCANFrame++;
1120  0104 725c0010      	inc	L71_SendCANFrame
1121                     ; 208 		if ((TransmissionEnable==TRUE)&&(SendCANFrame>20))
1123  0108 c60013        	ld	a,_TransmissionEnable
1124  010b 4a            	dec	a
1125  010c 2703cc0200    	jrne	L734
1127  0111 c60010        	ld	a,L71_SendCANFrame
1128  0114 a115          	cp	a,#21
1129  0116 25f6          	jrult	L734
1130                     ; 212 			SendCANFrame=0;
1133  0118 725f0010      	clr	L71_SendCANFrame
1134                     ; 213 			FrameNumber++;
1136  011c 725c0011      	inc	L32_FrameNumber
1137                     ; 214 			if (FrameNumber>3) FrameNumber=0;
1139  0120 c60011        	ld	a,L32_FrameNumber
1140  0123 a104          	cp	a,#4
1141  0125 2504          	jrult	L115
1144  0127 725f0011      	clr	L32_FrameNumber
1145  012b               L115:
1146                     ; 216 			switch (FrameNumber)
1148  012b c60011        	ld	a,L32_FrameNumber
1150                     ; 292 				default:
1150                     ; 293 					break;
1151  012e 270f          	jreq	L104
1152  0130 4a            	dec	a
1153  0131 2734          	jreq	L304
1154  0133 4a            	dec	a
1155  0134 275f          	jreq	L504
1156  0136 4a            	dec	a
1157  0137 2603cc01bd    	jreq	L704
1158  013c cc0200        	jra	L734
1159  013f               L104:
1160                     ; 218 				case 0:		
1160                     ; 219 					if (CANMaster==TRUE)
1162  013f c60014        	ld	a,_CANMaster
1163  0142 4a            	dec	a
1164  0143 26f7          	jrne	L734
1165                     ; 222 						Tx_Id = MS0ID;
1167  0145 ae0100        	ldw	x,#256
1168  0148 cf000e        	ldw	L51_Tx_Id+2,x
1169  014b 5f            	clrw	x
1170  014c cf000c        	ldw	L51_Tx_Id,x
1171                     ; 223 						Tx_DLC = 8;
1173  014f 35080003      	mov	L11_Tx_DLC,#8
1174                     ; 226 							for (Index=0;Index<8;Index++)
1176  0153 6b01          	ld	(OFST+0,sp),a
1178  0155               L125:
1179                     ; 228 								Tx_Data[Index]=CAN_DataBuffer[0][Index];
1181  0155 5f            	clrw	x
1182  0156 97            	ld	xl,a
1183  0157 d60000        	ld	a,(L12_CAN_DataBuffer,x)
1184  015a d70004        	ld	(L31_Tx_Data,x),a
1185                     ; 226 							for (Index=0;Index<8;Index++)
1187  015d 0c01          	inc	(OFST+0,sp)
1191  015f 7b01          	ld	a,(OFST+0,sp)
1192  0161 a108          	cp	a,#8
1193  0163 25f0          	jrult	L125
1194                     ; 232 						status = CAN_Transmit(Tx_Id,Tx_IDE,Tx_RTR,Tx_DLC,Tx_Data);
1196  0165 207c          	jp	LC001
1197  0167               L304:
1198                     ; 236 				case 1:	
1198                     ; 237 					if (CANMaster==FALSE)
1200  0167 725d0014      	tnz	_CANMaster
1201  016b 26cf          	jrne	L734
1202                     ; 240 						Tx_Id = SM1ID;
1204  016d ae0200        	ldw	x,#512
1205  0170 cf000e        	ldw	L51_Tx_Id+2,x
1206  0173 5f            	clrw	x
1207  0174 cf000c        	ldw	L51_Tx_Id,x
1208                     ; 241 						Tx_IDE = CAN_Id_Standard;
1210  0177 c70001        	ld	L5_Tx_IDE,a
1211                     ; 242 						Tx_RTR = CAN_RTR_Data;
1213  017a c70002        	ld	L7_Tx_RTR,a
1214                     ; 243 						Tx_DLC = 8;
1216  017d 35080003      	mov	L11_Tx_DLC,#8
1217                     ; 246 							for (Index=0;Index<8;Index++)
1219  0181 6b01          	ld	(OFST+0,sp),a
1221  0183               L135:
1222                     ; 248 								Tx_Data[Index]=CAN_DataBuffer[1][Index];
1224  0183 5f            	clrw	x
1225  0184 97            	ld	xl,a
1226  0185 d60008        	ld	a,(L12_CAN_DataBuffer+8,x)
1227  0188 d70004        	ld	(L31_Tx_Data,x),a
1228                     ; 246 							for (Index=0;Index<8;Index++)
1230  018b 0c01          	inc	(OFST+0,sp)
1234  018d 7b01          	ld	a,(OFST+0,sp)
1235  018f a108          	cp	a,#8
1236  0191 25f0          	jrult	L135
1237                     ; 252 						status = CAN_Transmit(Tx_Id,Tx_IDE,Tx_RTR,Tx_DLC,Tx_Data);
1239  0193 204e          	jp	LC001
1240  0195               L504:
1241                     ; 256 				case 2:		
1241                     ; 257 					if (CANMaster==TRUE)
1243  0195 c60014        	ld	a,_CANMaster
1244  0198 4a            	dec	a
1245  0199 2665          	jrne	L734
1246                     ; 260 						Tx_Id = MS2ID;
1248  019b ae0300        	ldw	x,#768
1249  019e cf000e        	ldw	L51_Tx_Id+2,x
1250  01a1 5f            	clrw	x
1251  01a2 cf000c        	ldw	L51_Tx_Id,x
1252                     ; 261 						Tx_DLC = 4;
1254  01a5 35040003      	mov	L11_Tx_DLC,#4
1255                     ; 264 							for (Index=0;Index<4;Index++)
1257  01a9 6b01          	ld	(OFST+0,sp),a
1259  01ab               L145:
1260                     ; 266 								Tx_Data[Index]=CAN_DataBuffer[2][Index];
1262  01ab 5f            	clrw	x
1263  01ac 97            	ld	xl,a
1264  01ad d60010        	ld	a,(L12_CAN_DataBuffer+16,x)
1265  01b0 d70004        	ld	(L31_Tx_Data,x),a
1266                     ; 264 							for (Index=0;Index<4;Index++)
1268  01b3 0c01          	inc	(OFST+0,sp)
1272  01b5 7b01          	ld	a,(OFST+0,sp)
1273  01b7 a104          	cp	a,#4
1274  01b9 25f0          	jrult	L145
1275                     ; 270 						status = CAN_Transmit(Tx_Id,Tx_IDE,Tx_RTR,Tx_DLC,Tx_Data);
1277  01bb 2026          	jp	LC001
1278  01bd               L704:
1279                     ; 274 				case 3:		
1279                     ; 275 					if (CANMaster==FALSE)
1281  01bd 725d0014      	tnz	_CANMaster
1282  01c1 263d          	jrne	L734
1283                     ; 278 						Tx_Id = SM3ID;
1285  01c3 ae0400        	ldw	x,#1024
1286  01c6 cf000e        	ldw	L51_Tx_Id+2,x
1287  01c9 5f            	clrw	x
1288  01ca cf000c        	ldw	L51_Tx_Id,x
1289                     ; 279 						Tx_DLC = 4;
1291  01cd 35040003      	mov	L11_Tx_DLC,#4
1292                     ; 282 							for (Index=0;Index<4;Index++)
1294  01d1 6b01          	ld	(OFST+0,sp),a
1296  01d3               L155:
1297                     ; 284 								Tx_Data[Index]=CAN_DataBuffer[3][Index];
1299  01d3 5f            	clrw	x
1300  01d4 97            	ld	xl,a
1301  01d5 d60018        	ld	a,(L12_CAN_DataBuffer+24,x)
1302  01d8 d70004        	ld	(L31_Tx_Data,x),a
1303                     ; 282 							for (Index=0;Index<4;Index++)
1305  01db 0c01          	inc	(OFST+0,sp)
1309  01dd 7b01          	ld	a,(OFST+0,sp)
1310  01df a104          	cp	a,#4
1311  01e1 25f0          	jrult	L155
1312                     ; 288 						status = CAN_Transmit(Tx_Id,Tx_IDE,Tx_RTR,Tx_DLC,Tx_Data);
1315  01e3               LC001:
1319  01e3 ae0004        	ldw	x,#L31_Tx_Data
1320  01e6 89            	pushw	x
1321  01e7 3b0003        	push	L11_Tx_DLC
1322  01ea 3b0002        	push	L7_Tx_RTR
1323  01ed 3b0001        	push	L5_Tx_IDE
1324  01f0 ce000e        	ldw	x,L51_Tx_Id+2
1325  01f3 89            	pushw	x
1326  01f4 ce000c        	ldw	x,L51_Tx_Id
1327  01f7 89            	pushw	x
1328  01f8 cd0000        	call	_CAN_Transmit
1329  01fb 5b09          	addw	sp,#9
1330  01fd c70000        	ld	L3_status,a
1331                     ; 292 				default:
1331                     ; 293 					break;
1334  0200               L734:
1335                     ; 298 }
1338  0200 84            	pop	a
1339  0201 81            	ret	
1379                     ; 309 uint8_t CAN_ReadData(uint8_t FrameNumber, uint8_t BytePosition)
1379                     ; 310 {
1380                     	switch	.text
1381  0202               _CAN_ReadData:
1383  0202 89            	pushw	x
1384       00000000      OFST:	set	0
1387                     ; 312 	return (CAN_DataBuffer[FrameNumber][BytePosition]);
1389  0203 9e            	ld	a,xh
1390  0204 97            	ld	xl,a
1391  0205 a608          	ld	a,#8
1392  0207 42            	mul	x,a
1393  0208 01            	rrwa	x,a
1394  0209 1b02          	add	a,(OFST+2,sp)
1395  020b 2401          	jrnc	L26
1396  020d 5c            	incw	x
1397  020e               L26:
1398  020e 02            	rlwa	x,a
1399  020f d60000        	ld	a,(L12_CAN_DataBuffer,x)
1402  0212 85            	popw	x
1403  0213 81            	ret	
1450                     ; 325 void CAN_WriteData(uint8_t FrameNumber, uint8_t BytePosition, uint8_t Value)
1450                     ; 326 {
1451                     	switch	.text
1452  0214               _CAN_WriteData:
1454  0214 89            	pushw	x
1455       00000000      OFST:	set	0
1458                     ; 327 	CAN_DataBuffer[FrameNumber][BytePosition]=Value;
1460  0215 9e            	ld	a,xh
1461  0216 97            	ld	xl,a
1462  0217 a608          	ld	a,#8
1463  0219 42            	mul	x,a
1464  021a 01            	rrwa	x,a
1465  021b 1b02          	add	a,(OFST+2,sp)
1466  021d 2401          	jrnc	L66
1467  021f 5c            	incw	x
1468  0220               L66:
1469  0220 02            	rlwa	x,a
1470  0221 7b05          	ld	a,(OFST+5,sp)
1471  0223 d70000        	ld	(L12_CAN_DataBuffer,x),a
1472                     ; 328 }
1475  0226 85            	popw	x
1476  0227 81            	ret	
1500                     ; 336 void SetCANTimebaseTick(void)
1500                     ; 337 {
1501                     	switch	.text
1502  0228               _SetCANTimebaseTick:
1506                     ; 338 	CANTimebaseTick=1;
1508  0228 35010015      	mov	L52_CANTimebaseTick,#1
1509                     ; 339 }
1512  022c 81            	ret	
1537                     ; 347 void ClearCANTimebaseTick(void)
1537                     ; 348 {
1538                     	switch	.text
1539  022d               L72_ClearCANTimebaseTick:
1543                     ; 349 	CANTimebaseTick=0;
1545  022d 725f0015      	clr	L52_CANTimebaseTick
1546                     ; 350 }
1549  0231 81            	ret	
1574                     ; 358 uint8_t TestCANTimebaseTick(void)
1574                     ; 359 {
1575                     	switch	.text
1576  0232               L13_TestCANTimebaseTick:
1580                     ; 360 	if (CANTimebaseTick) return 1;
1582  0232 c60015        	ld	a,L52_CANTimebaseTick
1583  0235 2702          	jreq	L546
1586  0237 a601          	ld	a,#1
1589  0239               L546:
1590                     ; 361 	else return 0;
1594  0239 81            	ret	
1854                     	xdef	_CAN_WriteData
1855                     	xdef	_CAN_ReadData
1856                     	xdef	_CAN_Task
1857                     	xdef	_CAN_Config
1858                     	xdef	_SetCANTimebaseTick
1859                     	xdef	_CANMaster
1860                     	xdef	_TransmissionEnable
1861                     	xdef	_FrameReceived
1862                     	switch	.bss
1863  0000               L12_CAN_DataBuffer:
1864  0000 000000000000  	ds.b	32
1865                     	xref	_ErrorState
1866                     	xref	_GPIO_WriteLow
1867                     	xref	_CAN_GetReceivedData
1868                     	xref	_CAN_GetReceivedId
1869                     	xref	_CAN_Transmit
1870                     	xref	_CAN_ITConfig
1871                     	xref	_CAN_FilterInit
1872                     	xref	_CAN_Init
1873                     	xref	_CAN_DeInit
1874                     	xref.b	c_lreg
1894                     	end
