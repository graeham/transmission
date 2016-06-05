   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  19                     	switch	.data
  20  0000               __Id:
  21  0000 00000000      	dc.l	0
  22  0004               __IDE:
  23  0004 00            	dc.b	0
  24  0005               __RTR:
  25  0005 00            	dc.b	0
  26  0006               __DLC:
  27  0006 00            	dc.b	0
  28  0007               __Data:
  29  0007 00            	dc.b	0
  30  0008 000000000000  	ds.b	7
  31  000f               __FMI:
  32  000f 00            	dc.b	0
  62                     ; 56 void CAN_DeInit(void)
  62                     ; 57 {
  64                     	switch	.text
  65  0000               _CAN_DeInit:
  69                     ; 59     CAN->MCR = CAN_MCR_INRQ;
  71  0000 35015420      	mov	21536,#1
  72                     ; 60     CAN->PSR = CAN_Page_Config;
  74  0004 35065427      	mov	21543,#6
  75                     ; 61     CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
  77  0008 4f            	clr	a
  78  0009 cd0991        	call	_CAN_OperatingModeRequest
  80                     ; 62     CAN->Page.Config.ESR = CAN_ESR_RESET_VALUE;
  82  000c 725f5428      	clr	21544
  83                     ; 63     CAN->Page.Config.EIER = CAN_EIER_RESET_VALUE;
  85  0010 725f5429      	clr	21545
  86                     ; 64     CAN->Page.Config.BTR1 = CAN_BTR1_RESET_VALUE;
  88  0014 3540542c      	mov	21548,#64
  89                     ; 65     CAN->Page.Config.BTR2 = CAN_BTR2_RESET_VALUE;
  91  0018 3523542d      	mov	21549,#35
  92                     ; 66     CAN->Page.Config.FMR1 = CAN_FMR1_RESET_VALUE;
  94  001c 725f5430      	clr	21552
  95                     ; 67     CAN->Page.Config.FMR2 = CAN_FMR2_RESET_VALUE;
  97  0020 725f5431      	clr	21553
  98                     ; 68     CAN->Page.Config.FCR1 = CAN_FCR_RESET_VALUE;
 100  0024 725f5432      	clr	21554
 101                     ; 69     CAN->Page.Config.FCR2 = CAN_FCR_RESET_VALUE;
 103  0028 725f5433      	clr	21555
 104                     ; 70     CAN->Page.Config.FCR3 = CAN_FCR_RESET_VALUE;
 106  002c 725f5434      	clr	21556
 107                     ; 71     CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
 109  0030 a601          	ld	a,#1
 110  0032 cd0991        	call	_CAN_OperatingModeRequest
 112                     ; 72     CAN->PSR = CAN_Page_RxFifo;
 114  0035 35075427      	mov	21543,#7
 115                     ; 73     CAN->Page.RxFIFO.MDLCR = CAN_MDLC_RESET_VALUE;
 117  0039 725f5429      	clr	21545
 118                     ; 74     CAN->PSR = CAN_Page_TxMailBox0;
 120  003d 725f5427      	clr	21543
 121                     ; 75     CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 123  0041 725f5429      	clr	21545
 124                     ; 76     CAN->PSR = CAN_Page_TxMailBox1;
 126  0045 35015427      	mov	21543,#1
 127                     ; 77     CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 129  0049 725f5429      	clr	21545
 130                     ; 78     CAN->PSR = CAN_Page_TxMailBox2;
 132  004d 35055427      	mov	21543,#5
 133                     ; 79     CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 135  0051 725f5429      	clr	21545
 136                     ; 81     CAN->MCR = CAN_MCR_RESET_VALUE;
 138  0055 35025420      	mov	21536,#2
 139                     ; 82     CAN->MSR = (uint8_t)(~CAN_MSR_RESET_VALUE);/* rc_w1 */
 141  0059 35fd5421      	mov	21537,#253
 142                     ; 83     CAN->TSR = (uint8_t)(~CAN_TSR_RESET_VALUE);/* rc_w1 */
 144  005d 35ff5422      	mov	21538,#255
 145                     ; 84     CAN->RFR = (uint8_t)(~CAN_RFR_RESET_VALUE);/* rc_w1 */
 147  0061 35ff5424      	mov	21540,#255
 148                     ; 85     CAN->IER = CAN_IER_RESET_VALUE;
 150  0065 725f5425      	clr	21541
 151                     ; 86     CAN->DGR = CAN_DGR_RESET_VALUE;
 153  0069 350c5426      	mov	21542,#12
 154                     ; 87     CAN->PSR = CAN_PSR_RESET_VALUE;
 156  006d 725f5427      	clr	21543
 157                     ; 88 }
 160  0071 81            	ret	
 707                     ; 100 CAN_InitStatus_TypeDef CAN_Init(CAN_MasterCtrl_TypeDef CAN_MasterCtrl,
 707                     ; 101                                 CAN_Mode_TypeDef CAN_Mode,
 707                     ; 102                                 CAN_SynJumpWidth_TypeDef CAN_SynJumpWidth,
 707                     ; 103                                 CAN_BitSeg1_TypeDef CAN_BitSeg1,
 707                     ; 104                                 CAN_BitSeg2_TypeDef CAN_BitSeg2,
 707                     ; 105                                 uint8_t CAN_Prescaler)
 707                     ; 106 {
 708                     	switch	.text
 709  0072               _CAN_Init:
 711  0072 89            	pushw	x
 712  0073 5204          	subw	sp,#4
 713       00000004      OFST:	set	4
 716                     ; 107     CAN_InitStatus_TypeDef InitStatus =  CAN_InitStatus_Failed;
 718                     ; 108     uint16_t timeout = CAN_ACKNOWLEDGE_TIMEOUT;
 720  0075 aeffff        	ldw	x,#65535
 721  0078 1f03          	ldw	(OFST-1,sp),x
 723                     ; 109     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
 725  007a cd0d72        	call	_CAN_GetSelectedPage
 727  007d 6b01          	ld	(OFST-3,sp),a
 729                     ; 113     assert_param(IS_CAN_MASTERCTRL_OK(CAN_MasterCtrl));
 731  007f 7b05          	ld	a,(OFST+1,sp)
 732  0081 2716          	jreq	L22
 733  0083 a1fd          	cp	a,#253
 734  0085 2404          	jruge	L61
 735  0087 a104          	cp	a,#4
 736  0089 240e          	jruge	L22
 737  008b               L61:
 738  008b ae0071        	ldw	x,#113
 739  008e 89            	pushw	x
 740  008f 5f            	clrw	x
 741  0090 89            	pushw	x
 742  0091 ae0008        	ldw	x,#L572
 743  0094 cd0000        	call	_assert_failed
 745  0097 5b04          	addw	sp,#4
 746  0099               L22:
 747                     ; 114     assert_param(IS_CAN_MODE_OK(CAN_Mode));
 749  0099 7b06          	ld	a,(OFST+2,sp)
 750  009b 271a          	jreq	L23
 751  009d a101          	cp	a,#1
 752  009f 2716          	jreq	L23
 753  00a1 a102          	cp	a,#2
 754  00a3 2712          	jreq	L23
 755  00a5 a103          	cp	a,#3
 756  00a7 270e          	jreq	L23
 757  00a9 ae0072        	ldw	x,#114
 758  00ac 89            	pushw	x
 759  00ad 5f            	clrw	x
 760  00ae 89            	pushw	x
 761  00af ae0008        	ldw	x,#L572
 762  00b2 cd0000        	call	_assert_failed
 764  00b5 5b04          	addw	sp,#4
 765  00b7               L23:
 766                     ; 115     assert_param(IS_CAN_SYNJUMPWIDTH_OK(CAN_SynJumpWidth));
 768  00b7 7b09          	ld	a,(OFST+5,sp)
 769  00b9 271a          	jreq	L24
 770  00bb a140          	cp	a,#64
 771  00bd 2716          	jreq	L24
 772  00bf a180          	cp	a,#128
 773  00c1 2712          	jreq	L24
 774  00c3 a1c0          	cp	a,#192
 775  00c5 270e          	jreq	L24
 776  00c7 ae0073        	ldw	x,#115
 777  00ca 89            	pushw	x
 778  00cb 5f            	clrw	x
 779  00cc 89            	pushw	x
 780  00cd ae0008        	ldw	x,#L572
 781  00d0 cd0000        	call	_assert_failed
 783  00d3 5b04          	addw	sp,#4
 784  00d5               L24:
 785                     ; 116     assert_param(IS_CAN_BITSEG1_OK(CAN_BitSeg1));
 787  00d5 7b0a          	ld	a,(OFST+6,sp)
 788  00d7 a110          	cp	a,#16
 789  00d9 250e          	jrult	L05
 790  00db ae0074        	ldw	x,#116
 791  00de 89            	pushw	x
 792  00df 5f            	clrw	x
 793  00e0 89            	pushw	x
 794  00e1 ae0008        	ldw	x,#L572
 795  00e4 cd0000        	call	_assert_failed
 797  00e7 5b04          	addw	sp,#4
 798  00e9               L05:
 799                     ; 117     assert_param(IS_CAN_BITSEG2_OK(CAN_BitSeg2));
 801  00e9 7b0b          	ld	a,(OFST+7,sp)
 802  00eb a110          	cp	a,#16
 803  00ed 2504          	jrult	L06
 804  00ef a171          	cp	a,#113
 805  00f1 2512          	jrult	L26
 806  00f3               L06:
 807  00f3 7b0b          	ld	a,(OFST+7,sp)
 808  00f5 270e          	jreq	L26
 809  00f7 ae0075        	ldw	x,#117
 810  00fa 89            	pushw	x
 811  00fb 5f            	clrw	x
 812  00fc 89            	pushw	x
 813  00fd ae0008        	ldw	x,#L572
 814  0100 cd0000        	call	_assert_failed
 816  0103 5b04          	addw	sp,#4
 817  0105               L26:
 818                     ; 118     assert_param(IS_CAN_PRESCALER_OK(CAN_Prescaler));
 820  0105 7b0c          	ld	a,(OFST+8,sp)
 821  0107 2704          	jreq	L66
 822  0109 a141          	cp	a,#65
 823  010b 250e          	jrult	L07
 824  010d               L66:
 825  010d ae0076        	ldw	x,#118
 826  0110 89            	pushw	x
 827  0111 5f            	clrw	x
 828  0112 89            	pushw	x
 829  0113 ae0008        	ldw	x,#L572
 830  0116 cd0000        	call	_assert_failed
 832  0119 5b04          	addw	sp,#4
 833  011b               L07:
 834                     ; 121     CAN->MCR = CAN_MCR_INRQ;
 836  011b 35015420      	mov	21536,#1
 838  011f 2003          	jra	L303
 839  0121               L772:
 840                     ; 125         timeout--;
 842  0121 5a            	decw	x
 843  0122 1f03          	ldw	(OFST-1,sp),x
 845  0124               L303:
 846                     ; 123     while (((uint8_t)(CAN->MSR & CAN_MSR_INAK) != 0x01) && ((uint16_t)timeout != 0))
 848  0124 7200542104    	btjt	21537,#0,L703
 850  0129 1e03          	ldw	x,(OFST-1,sp)
 851  012b 26f4          	jrne	L772
 852  012d               L703:
 853                     ; 129     if ((CAN->MSR & CAN_MSR_INAK) != CAN_MSR_INAK)
 855  012d 720054210c    	btjt	21537,#0,L113
 856                     ; 132         InitStatus =  CAN_InitStatus_Failed;
 858  0132               LC001:
 860  0132 0f02          	clr	(OFST-2,sp)
 863  0134               L313:
 864                     ; 166     CAN_SelectPage(can_page);
 866  0134 7b01          	ld	a,(OFST-3,sp)
 867  0136 cd0d76        	call	_CAN_SelectPage
 869                     ; 169     return (CAN_InitStatus_TypeDef)InitStatus;
 871  0139 7b02          	ld	a,(OFST-2,sp)
 874  013b 5b06          	addw	sp,#6
 875  013d 81            	ret	
 876  013e               L113:
 877                     ; 139         CAN->MCR |= (uint8_t)CAN_MasterCtrl;
 879  013e c65420        	ld	a,21536
 880  0141 1a05          	or	a,(OFST+1,sp)
 881  0143 c75420        	ld	21536,a
 882                     ; 142         CAN->DGR |= (uint8_t)CAN_Mode ;
 884  0146 c65426        	ld	a,21542
 885  0149 1a06          	or	a,(OFST+2,sp)
 886  014b c75426        	ld	21542,a
 887                     ; 143         CAN->PSR = CAN_Page_Config;
 889  014e 35065427      	mov	21543,#6
 890                     ; 144         CAN->Page.Config.BTR1 = (uint8_t)((uint8_t)(CAN_Prescaler - (uint8_t)1) | CAN_SynJumpWidth);
 892  0152 7b0c          	ld	a,(OFST+8,sp)
 893  0154 4a            	dec	a
 894  0155 1a09          	or	a,(OFST+5,sp)
 895  0157 c7542c        	ld	21548,a
 896                     ; 145         CAN->Page.Config.BTR2 = (uint8_t)(CAN_BitSeg1 | (uint8_t)CAN_BitSeg2);
 898  015a 7b0a          	ld	a,(OFST+6,sp)
 899  015c 1a0b          	or	a,(OFST+7,sp)
 900  015e c7542d        	ld	21549,a
 901                     ; 148         CAN->MCR &= (uint8_t)(~CAN_MCR_INRQ);
 903  0161 72115420      	bres	21536,#0
 904                     ; 150         timeout = 0xFFFF;
 906  0165 aeffff        	ldw	x,#65535
 908  0168 2001          	jra	L123
 909  016a               L513:
 910                     ; 153             timeout--;
 912  016a 5a            	decw	x
 913  016b               L123:
 914  016b 1f03          	ldw	(OFST-1,sp),x
 916                     ; 151         while ((((uint8_t)(CAN->MSR & CAN_MSR_INAK) == 0x01))&&(timeout != 0))
 916                     ; 152         {
 916                     ; 153             timeout--;
 918  016d 7201542102    	btjf	21537,#0,L523
 920  0172 26f6          	jrne	L513
 921  0174               L523:
 922                     ; 156         if ((CAN->MSR & CAN_MSR_INAK) == CAN_MSR_INAK)
 924  0174 7201542102    	btjf	21537,#0,L723
 925                     ; 158             InitStatus = CAN_InitStatus_Failed;
 927  0179 20b7          	jp	LC001
 928  017b               L723:
 929                     ; 162             InitStatus = CAN_InitStatus_Success;
 931  017b a601          	ld	a,#1
 932  017d 6b02          	ld	(OFST-2,sp),a
 934  017f 20b3          	jra	L313
1245                     ; 188 void CAN_FilterInit(CAN_FilterNumber_TypeDef CAN_FilterNumber,
1245                     ; 189                     FunctionalState CAN_FilterActivation,
1245                     ; 190                     CAN_FilterMode_TypeDef CAN_FilterMode,
1245                     ; 191                     CAN_FilterScale_TypeDef CAN_FilterScale,
1245                     ; 192                     uint8_t CAN_FilterID1,
1245                     ; 193                     uint8_t CAN_FilterID2,
1245                     ; 194                     uint8_t CAN_FilterID3,
1245                     ; 195                     uint8_t CAN_FilterID4,
1245                     ; 196                     uint8_t CAN_FilterIDMask1,
1245                     ; 197                     uint8_t CAN_FilterIDMask2,
1245                     ; 198                     uint8_t CAN_FilterIDMask3,
1245                     ; 199                     uint8_t CAN_FilterIDMask4)
1245                     ; 200 {
1246                     	switch	.text
1247  0181               _CAN_FilterInit:
1249  0181 89            	pushw	x
1250  0182 5205          	subw	sp,#5
1251       00000005      OFST:	set	5
1254                     ; 201     uint8_t fact = 0;
1256                     ; 202     uint8_t fsc  = 0;
1258                     ; 203     uint8_t fmhl = 0;
1260                     ; 205     CAN_Page_TypeDef can_page_filter = CAN_Page_Filter01;
1262                     ; 206     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
1264  0184 cd0d72        	call	_CAN_GetSelectedPage
1266  0187 6b01          	ld	(OFST-4,sp),a
1268                     ; 209     assert_param(IS_CAN_FILTER_NUMBER_OK(CAN_FilterNumber));
1270  0189 7b06          	ld	a,(OFST+1,sp)
1271  018b 2722          	jreq	L601
1272  018d a101          	cp	a,#1
1273  018f 271e          	jreq	L601
1274  0191 a102          	cp	a,#2
1275  0193 271a          	jreq	L601
1276  0195 a103          	cp	a,#3
1277  0197 2716          	jreq	L601
1278  0199 a104          	cp	a,#4
1279  019b 2712          	jreq	L601
1280  019d a105          	cp	a,#5
1281  019f 270e          	jreq	L601
1282  01a1 ae00d1        	ldw	x,#209
1283  01a4 89            	pushw	x
1284  01a5 5f            	clrw	x
1285  01a6 89            	pushw	x
1286  01a7 ae0008        	ldw	x,#L572
1287  01aa cd0000        	call	_assert_failed
1289  01ad 5b04          	addw	sp,#4
1290  01af               L601:
1291                     ; 210     assert_param(IS_FUNCTIONALSTATE_OK(CAN_FilterActivation));
1293  01af 7b07          	ld	a,(OFST+2,sp)
1294  01b1 2711          	jreq	L611
1295  01b3 4a            	dec	a
1296  01b4 270e          	jreq	L611
1297  01b6 ae00d2        	ldw	x,#210
1298  01b9 89            	pushw	x
1299  01ba 5f            	clrw	x
1300  01bb 89            	pushw	x
1301  01bc ae0008        	ldw	x,#L572
1302  01bf cd0000        	call	_assert_failed
1304  01c2 5b04          	addw	sp,#4
1305  01c4               L611:
1306                     ; 211     assert_param(IS_CAN_FILTER_MODE_OK(CAN_FilterMode));
1308  01c4 7b0a          	ld	a,(OFST+5,sp)
1309  01c6 2719          	jreq	L621
1310  01c8 a110          	cp	a,#16
1311  01ca 2715          	jreq	L621
1312  01cc a111          	cp	a,#17
1313  01ce 2711          	jreq	L621
1314  01d0 4a            	dec	a
1315  01d1 270e          	jreq	L621
1316  01d3 ae00d3        	ldw	x,#211
1317  01d6 89            	pushw	x
1318  01d7 5f            	clrw	x
1319  01d8 89            	pushw	x
1320  01d9 ae0008        	ldw	x,#L572
1321  01dc cd0000        	call	_assert_failed
1323  01df 5b04          	addw	sp,#4
1324  01e1               L621:
1325                     ; 212     assert_param(IS_CAN_FILTER_SCALE_OK(CAN_FilterScale));
1327  01e1 7b0b          	ld	a,(OFST+6,sp)
1328  01e3 271a          	jreq	L631
1329  01e5 a102          	cp	a,#2
1330  01e7 2716          	jreq	L631
1331  01e9 a104          	cp	a,#4
1332  01eb 2712          	jreq	L631
1333  01ed a106          	cp	a,#6
1334  01ef 270e          	jreq	L631
1335  01f1 ae00d4        	ldw	x,#212
1336  01f4 89            	pushw	x
1337  01f5 5f            	clrw	x
1338  01f6 89            	pushw	x
1339  01f7 ae0008        	ldw	x,#L572
1340  01fa cd0000        	call	_assert_failed
1342  01fd 5b04          	addw	sp,#4
1343  01ff               L631:
1344                     ; 215     if (CAN_FilterNumber == CAN_FilterNumber_0)
1346  01ff 7b06          	ld	a,(OFST+1,sp)
1347  0201 260d          	jrne	L305
1348                     ; 217         fact = 0x01;
1350  0203 4c            	inc	a
1351  0204 6b03          	ld	(OFST-2,sp),a
1353                     ; 218         fsc  = 0x00;
1355  0206 0f04          	clr	(OFST-1,sp)
1357                     ; 219         fmhl = 0x03;
1359  0208 a603          	ld	a,#3
1360  020a 6b05          	ld	(OFST+0,sp),a
1362                     ; 221         can_page_filter = CAN_Page_Filter01;
1364  020c a602          	ld	a,#2
1366  020e 2059          	jra	L505
1367  0210               L305:
1368                     ; 223     else if (CAN_FilterNumber == CAN_FilterNumber_1)
1370  0210 a101          	cp	a,#1
1371  0212 2610          	jrne	L705
1372                     ; 225         fact = 0x10;
1374  0214 a610          	ld	a,#16
1375  0216 6b03          	ld	(OFST-2,sp),a
1377                     ; 226         fsc  = 0x04;
1379  0218 a604          	ld	a,#4
1380  021a 6b04          	ld	(OFST-1,sp),a
1382                     ; 227         fmhl = 0x0C;
1384  021c a60c          	ld	a,#12
1385  021e 6b05          	ld	(OFST+0,sp),a
1387                     ; 229         can_page_filter = CAN_Page_Filter01;
1389  0220 a602          	ld	a,#2
1391  0222 2045          	jra	L505
1392  0224               L705:
1393                     ; 231     else if (CAN_FilterNumber == CAN_FilterNumber_2)
1395  0224 a102          	cp	a,#2
1396  0226 260e          	jrne	L315
1397                     ; 233         fact = 0x01;
1399  0228 a601          	ld	a,#1
1400  022a 6b03          	ld	(OFST-2,sp),a
1402                     ; 234         fsc  = 0x00;
1404  022c 0f04          	clr	(OFST-1,sp)
1406                     ; 235         fmhl = 0x30;
1408  022e a630          	ld	a,#48
1409  0230 6b05          	ld	(OFST+0,sp),a
1411                     ; 237         can_page_filter = CAN_Page_Filter23;
1413  0232 a603          	ld	a,#3
1415  0234 2033          	jra	L505
1416  0236               L315:
1417                     ; 239     else if (CAN_FilterNumber == CAN_FilterNumber_3)
1419  0236 a103          	cp	a,#3
1420  0238 2610          	jrne	L715
1421                     ; 241         fact = 0x10;
1423  023a a610          	ld	a,#16
1424  023c 6b03          	ld	(OFST-2,sp),a
1426                     ; 242         fsc  = 0x04;
1428  023e a604          	ld	a,#4
1429  0240 6b04          	ld	(OFST-1,sp),a
1431                     ; 243         fmhl = 0xC0;
1433  0242 a6c0          	ld	a,#192
1434  0244 6b05          	ld	(OFST+0,sp),a
1436                     ; 245         can_page_filter = CAN_Page_Filter23;
1438  0246 a603          	ld	a,#3
1440  0248 201f          	jra	L505
1441  024a               L715:
1442                     ; 247     else if (CAN_FilterNumber == CAN_FilterNumber_4)
1444  024a a104          	cp	a,#4
1445  024c 260d          	jrne	L325
1446                     ; 249         fact = 0x01;
1448  024e a601          	ld	a,#1
1449  0250 6b03          	ld	(OFST-2,sp),a
1451                     ; 250         fsc  = 0x00;
1453  0252 0f04          	clr	(OFST-1,sp)
1455                     ; 251         fmhl = 0x03;
1457  0254 a603          	ld	a,#3
1458  0256 6b05          	ld	(OFST+0,sp),a
1460                     ; 253         can_page_filter = CAN_Page_Filter45;
1462  0258 4c            	inc	a
1464  0259 200e          	jra	L505
1465  025b               L325:
1466                     ; 257         fact = 0x10;
1468  025b a610          	ld	a,#16
1469  025d 6b03          	ld	(OFST-2,sp),a
1471                     ; 258         fsc  = 0x04;
1473  025f a604          	ld	a,#4
1474  0261 6b04          	ld	(OFST-1,sp),a
1476                     ; 259         fmhl = 0x0C;
1478  0263 a60c          	ld	a,#12
1479  0265 6b05          	ld	(OFST+0,sp),a
1481                     ; 261         can_page_filter = CAN_Page_Filter45;
1483  0267 a604          	ld	a,#4
1484  0269               L505:
1485  0269 6b02          	ld	(OFST-3,sp),a
1487                     ; 265     CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
1489  026b 4f            	clr	a
1490  026c cd0991        	call	_CAN_OperatingModeRequest
1492                     ; 267     CAN->PSR = CAN_Page_Config;
1494  026f 35065427      	mov	21543,#6
1495                     ; 272     if (can_page_filter == CAN_Page_Filter01) /* FCR1 */
1497  0273 7b02          	ld	a,(OFST-3,sp)
1498  0275 a102          	cp	a,#2
1499  0277 262b          	jrne	L725
1500                     ; 275         CAN->Page.Config.FCR1 &= (uint8_t)(~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc )));
1502  0279 7b04          	ld	a,(OFST-1,sp)
1503  027b 5f            	clrw	x
1504  027c 97            	ld	xl,a
1505  027d a606          	ld	a,#6
1506  027f 5d            	tnzw	x
1507  0280 2704          	jreq	L441
1508  0282               L641:
1509  0282 48            	sll	a
1510  0283 5a            	decw	x
1511  0284 26fc          	jrne	L641
1512  0286               L441:
1513  0286 1a03          	or	a,(OFST-2,sp)
1514  0288 43            	cpl	a
1515  0289 c45432        	and	a,21554
1516  028c c75432        	ld	21554,a
1517                     ; 277         CAN->Page.Config.FCR1 |= (uint8_t)(CAN_FilterScale << fsc);
1519  028f 7b04          	ld	a,(OFST-1,sp)
1520  0291 5f            	clrw	x
1521  0292 97            	ld	xl,a
1522  0293 7b0b          	ld	a,(OFST+6,sp)
1523  0295 5d            	tnzw	x
1524  0296 2704          	jreq	L051
1525  0298               L251:
1526  0298 48            	sll	a
1527  0299 5a            	decw	x
1528  029a 26fc          	jrne	L251
1529  029c               L051:
1530  029c ca5432        	or	a,21554
1531  029f c75432        	ld	21554,a
1533  02a2 2058          	jra	L135
1534  02a4               L725:
1535                     ; 279     else if (can_page_filter == CAN_Page_Filter23) /* FCR2*/
1537  02a4 a103          	cp	a,#3
1538  02a6 262b          	jrne	L335
1539                     ; 282         CAN->Page.Config.FCR2 &= (uint8_t)~(uint8_t)( fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc ));
1541  02a8 7b04          	ld	a,(OFST-1,sp)
1542  02aa 5f            	clrw	x
1543  02ab 97            	ld	xl,a
1544  02ac a606          	ld	a,#6
1545  02ae 5d            	tnzw	x
1546  02af 2704          	jreq	L451
1547  02b1               L651:
1548  02b1 48            	sll	a
1549  02b2 5a            	decw	x
1550  02b3 26fc          	jrne	L651
1551  02b5               L451:
1552  02b5 1a03          	or	a,(OFST-2,sp)
1553  02b7 43            	cpl	a
1554  02b8 c45433        	and	a,21555
1555  02bb c75433        	ld	21555,a
1556                     ; 285         CAN->Page.Config.FCR2 |= (uint8_t)(CAN_FilterScale << fsc);
1558  02be 7b04          	ld	a,(OFST-1,sp)
1559  02c0 5f            	clrw	x
1560  02c1 97            	ld	xl,a
1561  02c2 7b0b          	ld	a,(OFST+6,sp)
1562  02c4 5d            	tnzw	x
1563  02c5 2704          	jreq	L061
1564  02c7               L261:
1565  02c7 48            	sll	a
1566  02c8 5a            	decw	x
1567  02c9 26fc          	jrne	L261
1568  02cb               L061:
1569  02cb ca5433        	or	a,21555
1570  02ce c75433        	ld	21555,a
1572  02d1 2029          	jra	L135
1573  02d3               L335:
1574                     ; 291         CAN->Page.Config.FCR3 &= (uint8_t)~(uint8_t)( fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc ));
1576  02d3 7b04          	ld	a,(OFST-1,sp)
1577  02d5 5f            	clrw	x
1578  02d6 97            	ld	xl,a
1579  02d7 a606          	ld	a,#6
1580  02d9 5d            	tnzw	x
1581  02da 2704          	jreq	L461
1582  02dc               L661:
1583  02dc 48            	sll	a
1584  02dd 5a            	decw	x
1585  02de 26fc          	jrne	L661
1586  02e0               L461:
1587  02e0 1a03          	or	a,(OFST-2,sp)
1588  02e2 43            	cpl	a
1589  02e3 c45434        	and	a,21556
1590  02e6 c75434        	ld	21556,a
1591                     ; 294         CAN->Page.Config.FCR3 |= (uint8_t)(CAN_FilterScale << fsc);
1593  02e9 7b04          	ld	a,(OFST-1,sp)
1594  02eb 5f            	clrw	x
1595  02ec 97            	ld	xl,a
1596  02ed 7b0b          	ld	a,(OFST+6,sp)
1597  02ef 5d            	tnzw	x
1598  02f0 2704          	jreq	L071
1599  02f2               L271:
1600  02f2 48            	sll	a
1601  02f3 5a            	decw	x
1602  02f4 26fc          	jrne	L271
1603  02f6               L071:
1604  02f6 ca5434        	or	a,21556
1605  02f9 c75434        	ld	21556,a
1606  02fc               L135:
1607                     ; 300     if (can_page_filter != CAN_Page_Filter45) /* FMR1*/
1609  02fc 7b02          	ld	a,(OFST-3,sp)
1610  02fe a104          	cp	a,#4
1611  0300 272d          	jreq	L735
1612                     ; 303         if (CAN_FilterMode == CAN_FilterMode_IdMask)
1614  0302 7b0a          	ld	a,(OFST+5,sp)
1615  0304 2608          	jrne	L145
1616                     ; 306             CAN->Page.Config.FMR1 &= (uint8_t)~(fmhl);
1618  0306 7b05          	ld	a,(OFST+0,sp)
1619  0308 43            	cpl	a
1620  0309 c45430        	and	a,21552
1622  030c 201c          	jp	LC004
1623  030e               L145:
1624                     ; 308         else if ( CAN_FilterMode == CAN_FilterMode_IdList)
1626  030e a101          	cp	a,#1
1627  0310 2607          	jrne	L545
1628                     ; 311             CAN->Page.Config.FMR1 |= (uint8_t)(fmhl);
1630  0312 c65430        	ld	a,21552
1631  0315 1a05          	or	a,(OFST+0,sp)
1633  0317 2011          	jp	LC004
1634  0319               L545:
1635                     ; 313         else if ( CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
1637  0319 a111          	cp	a,#17
1638  031b 2606          	jrne	L155
1639                     ; 316             CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
1641  031d 7b05          	ld	a,(OFST+0,sp)
1642  031f a455          	and	a,#85
1644  0321 2004          	jp	LC005
1645  0323               L155:
1646                     ; 321             CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
1648  0323 7b05          	ld	a,(OFST+0,sp)
1649  0325 a4aa          	and	a,#170
1650  0327               LC005:
1651  0327 ca5430        	or	a,21552
1652  032a               LC004:
1653  032a c75430        	ld	21552,a
1654  032d 202b          	jra	L555
1655  032f               L735:
1656                     ; 330         if (CAN_FilterMode == CAN_FilterMode_IdMask)
1658  032f 7b0a          	ld	a,(OFST+5,sp)
1659  0331 2608          	jrne	L755
1660                     ; 333             CAN->Page.Config.FMR2 &= (uint8_t)~(fmhl);
1662  0333 7b05          	ld	a,(OFST+0,sp)
1663  0335 43            	cpl	a
1664  0336 c45431        	and	a,21553
1666  0339 201c          	jp	LC002
1667  033b               L755:
1668                     ; 335         else if ( CAN_FilterMode == CAN_FilterMode_IdList)
1670  033b a101          	cp	a,#1
1671  033d 2607          	jrne	L365
1672                     ; 338             CAN->Page.Config.FMR2 |= (uint8_t)(fmhl);
1674  033f c65431        	ld	a,21553
1675  0342 1a05          	or	a,(OFST+0,sp)
1677  0344 2011          	jp	LC002
1678  0346               L365:
1679                     ; 340         else if ( CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
1681  0346 a111          	cp	a,#17
1682  0348 2606          	jrne	L765
1683                     ; 343             CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
1685  034a 7b05          	ld	a,(OFST+0,sp)
1686  034c a455          	and	a,#85
1688  034e 2004          	jp	LC003
1689  0350               L765:
1690                     ; 348             CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
1692  0350 7b05          	ld	a,(OFST+0,sp)
1693  0352 a4aa          	and	a,#170
1694  0354               LC003:
1695  0354 ca5431        	or	a,21553
1696  0357               LC002:
1697  0357 c75431        	ld	21553,a
1698  035a               L555:
1699                     ; 354     CAN->PSR = (uint8_t)can_page_filter;
1701  035a 7b02          	ld	a,(OFST-3,sp)
1702  035c c75427        	ld	21543,a
1703                     ; 355     if (fsc != 0)
1705  035f 7b04          	ld	a,(OFST-1,sp)
1706  0361 2603cc03f1    	jreq	L375
1707                     ; 358         if (CAN_FilterScale == CAN_FilterScale_8Bit)
1709  0366 7b0b          	ld	a,(OFST+6,sp)
1710  0368 260e          	jrne	L575
1711                     ; 360             CAN->Page.Filter.FR09 = CAN_FilterID1;
1713  036a 7b0c          	ld	a,(OFST+7,sp)
1714  036c c75430        	ld	21552,a
1715                     ; 361             CAN->Page.Filter.FR10 = CAN_FilterIDMask1;
1717  036f 7b10          	ld	a,(OFST+11,sp)
1718  0371 c75431        	ld	21553,a
1719                     ; 362             CAN->Page.Filter.FR11 = CAN_FilterID2;
1721  0374 7b0d          	ld	a,(OFST+8,sp)
1722                     ; 363             CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1723                     ; 364             CAN->Page.Filter.FR13 = CAN_FilterID3;
1724                     ; 365             CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
1725                     ; 366             CAN->Page.Filter.FR15 = CAN_FilterID4;
1726                     ; 367             CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1728  0376 2010          	jp	LC011
1729  0378               L575:
1730                     ; 369         else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
1732  0378 a102          	cp	a,#2
1733  037a 2622          	jrne	L106
1734                     ; 371             CAN->Page.Filter.FR09 = CAN_FilterID1;
1736  037c 7b0c          	ld	a,(OFST+7,sp)
1737  037e c75430        	ld	21552,a
1738                     ; 372             CAN->Page.Filter.FR10 = CAN_FilterID2;
1740  0381 7b0d          	ld	a,(OFST+8,sp)
1741  0383 c75431        	ld	21553,a
1742                     ; 373             CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
1744  0386 7b10          	ld	a,(OFST+11,sp)
1745                     ; 374             CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1747                     ; 375             CAN->Page.Filter.FR13 = CAN_FilterID3;
1749                     ; 376             CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
1751                     ; 377             CAN->Page.Filter.FR15 = CAN_FilterID4;
1753  0388               LC011:
1754  0388 c75432        	ld	21554,a
1756  038b 7b11          	ld	a,(OFST+12,sp)
1757  038d c75433        	ld	21555,a
1759  0390 7b0e          	ld	a,(OFST+9,sp)
1760  0392 c75434        	ld	21556,a
1762  0395 7b12          	ld	a,(OFST+13,sp)
1763  0397 c75435        	ld	21557,a
1765  039a 7b0f          	ld	a,(OFST+10,sp)
1766                     ; 378             CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1768  039c 2048          	jp	LC009
1769  039e               L106:
1770                     ; 380         else if (CAN_FilterScale == CAN_FilterScale_16Bit)
1772  039e a104          	cp	a,#4
1773  03a0 261d          	jrne	L506
1774                     ; 382             CAN->Page.Filter.FR09 = CAN_FilterID1;
1776  03a2 7b0c          	ld	a,(OFST+7,sp)
1777  03a4 c75430        	ld	21552,a
1778                     ; 383             CAN->Page.Filter.FR10 = CAN_FilterID2;
1780  03a7 7b0d          	ld	a,(OFST+8,sp)
1781  03a9 c75431        	ld	21553,a
1782                     ; 384             CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
1784  03ac 7b10          	ld	a,(OFST+11,sp)
1785  03ae c75432        	ld	21554,a
1786                     ; 385             CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1788  03b1 7b11          	ld	a,(OFST+12,sp)
1789  03b3 c75433        	ld	21555,a
1790                     ; 386             CAN->Page.Filter.FR13 = CAN_FilterID3;
1792  03b6 7b0e          	ld	a,(OFST+9,sp)
1793  03b8 c75434        	ld	21556,a
1794                     ; 387             CAN->Page.Filter.FR14 = CAN_FilterID4;
1796  03bb 7b0f          	ld	a,(OFST+10,sp)
1797                     ; 388             CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
1798                     ; 389             CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1800  03bd 2022          	jp	LC010
1801  03bf               L506:
1802                     ; 391         else if (CAN_FilterScale == CAN_FilterScale_32Bit)
1804  03bf a106          	cp	a,#6
1805  03c1 2703cc0476    	jrne	L316
1806                     ; 393             CAN->Page.Filter.FR09 = CAN_FilterID1;
1808  03c6 7b0c          	ld	a,(OFST+7,sp)
1809  03c8 c75430        	ld	21552,a
1810                     ; 394             CAN->Page.Filter.FR10 = CAN_FilterID2;
1812  03cb 7b0d          	ld	a,(OFST+8,sp)
1813  03cd c75431        	ld	21553,a
1814                     ; 395             CAN->Page.Filter.FR11 = CAN_FilterID3;
1816  03d0 7b0e          	ld	a,(OFST+9,sp)
1817  03d2 c75432        	ld	21554,a
1818                     ; 396             CAN->Page.Filter.FR12 = CAN_FilterID4;
1820  03d5 7b0f          	ld	a,(OFST+10,sp)
1821  03d7 c75433        	ld	21555,a
1822                     ; 397             CAN->Page.Filter.FR13 = CAN_FilterIDMask1;
1824  03da 7b10          	ld	a,(OFST+11,sp)
1825  03dc c75434        	ld	21556,a
1826                     ; 398             CAN->Page.Filter.FR14 = CAN_FilterIDMask2;
1828  03df 7b11          	ld	a,(OFST+12,sp)
1829                     ; 399             CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
1831  03e1               LC010:
1832  03e1 c75435        	ld	21557,a
1834  03e4 7b12          	ld	a,(OFST+13,sp)
1835                     ; 400             CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1837  03e6               LC009:
1838  03e6 c75436        	ld	21558,a
1842  03e9 7b13          	ld	a,(OFST+14,sp)
1843  03eb c75437        	ld	21559,a
1844  03ee cc0476        	jra	L316
1845  03f1               L375:
1846                     ; 406         if (CAN_FilterScale == CAN_FilterScale_8Bit)
1848  03f1 7b0b          	ld	a,(OFST+6,sp)
1849  03f3 260e          	jrne	L516
1850                     ; 408             CAN->Page.Filter.FR01 = CAN_FilterID1;
1852  03f5 7b0c          	ld	a,(OFST+7,sp)
1853  03f7 c75428        	ld	21544,a
1854                     ; 409             CAN->Page.Filter.FR02 = CAN_FilterIDMask1;
1856  03fa 7b10          	ld	a,(OFST+11,sp)
1857  03fc c75429        	ld	21545,a
1858                     ; 410             CAN->Page.Filter.FR03 = CAN_FilterID2;
1860  03ff 7b0d          	ld	a,(OFST+8,sp)
1861                     ; 411             CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
1862                     ; 412             CAN->Page.Filter.FR05 = CAN_FilterID3;
1863                     ; 413             CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
1864                     ; 414             CAN->Page.Filter.FR07 = CAN_FilterID4;
1865                     ; 415             CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
1867  0401 2010          	jp	LC008
1868  0403               L516:
1869                     ; 417         else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
1871  0403 a102          	cp	a,#2
1872  0405 2622          	jrne	L126
1873                     ; 419             CAN->Page.Filter.FR01 = CAN_FilterID1;
1875  0407 7b0c          	ld	a,(OFST+7,sp)
1876  0409 c75428        	ld	21544,a
1877                     ; 420             CAN->Page.Filter.FR02 = CAN_FilterID2;
1879  040c 7b0d          	ld	a,(OFST+8,sp)
1880  040e c75429        	ld	21545,a
1881                     ; 421             CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
1883  0411 7b10          	ld	a,(OFST+11,sp)
1884                     ; 422             CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
1886                     ; 423             CAN->Page.Filter.FR05 = CAN_FilterID3;
1888                     ; 424             CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
1890                     ; 425             CAN->Page.Filter.FR07 = CAN_FilterID4;
1892  0413               LC008:
1893  0413 c7542a        	ld	21546,a
1895  0416 7b11          	ld	a,(OFST+12,sp)
1896  0418 c7542b        	ld	21547,a
1898  041b 7b0e          	ld	a,(OFST+9,sp)
1899  041d c7542c        	ld	21548,a
1901  0420 7b12          	ld	a,(OFST+13,sp)
1902  0422 c7542d        	ld	21549,a
1904  0425 7b0f          	ld	a,(OFST+10,sp)
1905                     ; 426             CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
1907  0427 2045          	jp	LC006
1908  0429               L126:
1909                     ; 428         else if (CAN_FilterScale == CAN_FilterScale_16Bit)
1911  0429 a104          	cp	a,#4
1912  042b 261d          	jrne	L526
1913                     ; 430             CAN->Page.Filter.FR01 = CAN_FilterID1;
1915  042d 7b0c          	ld	a,(OFST+7,sp)
1916  042f c75428        	ld	21544,a
1917                     ; 431             CAN->Page.Filter.FR02 = CAN_FilterID2;
1919  0432 7b0d          	ld	a,(OFST+8,sp)
1920  0434 c75429        	ld	21545,a
1921                     ; 432             CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
1923  0437 7b10          	ld	a,(OFST+11,sp)
1924  0439 c7542a        	ld	21546,a
1925                     ; 433             CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
1927  043c 7b11          	ld	a,(OFST+12,sp)
1928  043e c7542b        	ld	21547,a
1929                     ; 434             CAN->Page.Filter.FR05 = CAN_FilterID3;
1931  0441 7b0e          	ld	a,(OFST+9,sp)
1932  0443 c7542c        	ld	21548,a
1933                     ; 435             CAN->Page.Filter.FR06 = CAN_FilterID4;
1935  0446 7b0f          	ld	a,(OFST+10,sp)
1936                     ; 436             CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
1937                     ; 437             CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
1939  0448 201f          	jp	LC007
1940  044a               L526:
1941                     ; 439         else if (CAN_FilterScale == CAN_FilterScale_32Bit)
1943  044a a106          	cp	a,#6
1944  044c 2628          	jrne	L316
1945                     ; 441             CAN->Page.Filter.FR01 = CAN_FilterID1;
1947  044e 7b0c          	ld	a,(OFST+7,sp)
1948  0450 c75428        	ld	21544,a
1949                     ; 442             CAN->Page.Filter.FR02 = CAN_FilterID2;
1951  0453 7b0d          	ld	a,(OFST+8,sp)
1952  0455 c75429        	ld	21545,a
1953                     ; 443             CAN->Page.Filter.FR03 = CAN_FilterID3;
1955  0458 7b0e          	ld	a,(OFST+9,sp)
1956  045a c7542a        	ld	21546,a
1957                     ; 444             CAN->Page.Filter.FR04 = CAN_FilterID4;
1959  045d 7b0f          	ld	a,(OFST+10,sp)
1960  045f c7542b        	ld	21547,a
1961                     ; 445             CAN->Page.Filter.FR05 = CAN_FilterIDMask1;
1963  0462 7b10          	ld	a,(OFST+11,sp)
1964  0464 c7542c        	ld	21548,a
1965                     ; 446             CAN->Page.Filter.FR06 = CAN_FilterIDMask2;
1967  0467 7b11          	ld	a,(OFST+12,sp)
1968                     ; 447             CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
1970  0469               LC007:
1971  0469 c7542d        	ld	21549,a
1973  046c 7b12          	ld	a,(OFST+13,sp)
1974                     ; 448             CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
1976  046e               LC006:
1977  046e c7542e        	ld	21550,a
1981  0471 7b13          	ld	a,(OFST+14,sp)
1982  0473 c7542f        	ld	21551,a
1983  0476               L316:
1984                     ; 457     CAN->PSR = CAN_Page_Config;
1986  0476 35065427      	mov	21543,#6
1987                     ; 458     if (CAN_FilterActivation != DISABLE)
1989  047a 7b07          	ld	a,(OFST+2,sp)
1990  047c 2728          	jreq	L336
1991                     ; 460         if ((CAN_FilterNumber & 0x06) == 0x00) /* FCR1*/
1993  047e 7b06          	ld	a,(OFST+1,sp)
1994  0480 a506          	bcp	a,#6
1995  0482 260a          	jrne	L536
1996                     ; 461         {   CAN->Page.Config.FCR1 |= (uint8_t)fact;
1998  0484 c65432        	ld	a,21554
1999  0487 1a03          	or	a,(OFST-2,sp)
2000  0489 c75432        	ld	21554,a
2002  048c 2018          	jra	L336
2003  048e               L536:
2004                     ; 463         else if ((CAN_FilterNumber & 0x06) == 0x02) /*FCR2*/
2006  048e a406          	and	a,#6
2007  0490 a102          	cp	a,#2
2008  0492 260a          	jrne	L146
2009                     ; 464         { CAN->Page.Config.FCR2 |= (uint8_t)fact;
2011  0494 c65433        	ld	a,21555
2012  0497 1a03          	or	a,(OFST-2,sp)
2013  0499 c75433        	ld	21555,a
2015  049c 2008          	jra	L336
2016  049e               L146:
2017                     ; 467         { CAN->Page.Config.FCR3 |= (uint8_t)fact;
2019  049e c65434        	ld	a,21556
2020  04a1 1a03          	or	a,(OFST-2,sp)
2021  04a3 c75434        	ld	21556,a
2022  04a6               L336:
2023                     ; 470     CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
2025  04a6 a601          	ld	a,#1
2026  04a8 cd0991        	call	_CAN_OperatingModeRequest
2028                     ; 472     CAN_SelectPage(can_page);
2030  04ab 7b01          	ld	a,(OFST-4,sp)
2031  04ad cd0d76        	call	_CAN_SelectPage
2033                     ; 473 }
2036  04b0 5b07          	addw	sp,#7
2037  04b2 81            	ret	
2178                     ; 481 void CAN_ITConfig(CAN_IT_TypeDef CAN_IT, FunctionalState NewState)
2178                     ; 482 {
2179                     	switch	.text
2180  04b3               _CAN_ITConfig:
2182  04b3 89            	pushw	x
2183  04b4 5203          	subw	sp,#3
2184       00000003      OFST:	set	3
2187                     ; 483     uint8_t tmperrorinterrupt = 0;
2189                     ; 484     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2191  04b6 cd0d72        	call	_CAN_GetSelectedPage
2193  04b9 6b02          	ld	(OFST-1,sp),a
2195                     ; 488     assert_param(IS_CAN_IT_CONFIG_OK(CAN_IT));
2197  04bb 1e04          	ldw	x,(OFST+1,sp)
2198  04bd 270a          	jreq	L402
2199  04bf 01            	rrwa	x,a
2200  04c0 a470          	and	a,#112
2201  04c2 01            	rrwa	x,a
2202  04c3 a4b0          	and	a,#176
2203  04c5 01            	rrwa	x,a
2204  04c6 5d            	tnzw	x
2205  04c7 270e          	jreq	L602
2206  04c9               L402:
2207  04c9 ae01e8        	ldw	x,#488
2208  04cc 89            	pushw	x
2209  04cd 5f            	clrw	x
2210  04ce 89            	pushw	x
2211  04cf ae0008        	ldw	x,#L572
2212  04d2 cd0000        	call	_assert_failed
2214  04d5 5b04          	addw	sp,#4
2215  04d7               L602:
2216                     ; 489     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2218  04d7 7b08          	ld	a,(OFST+5,sp)
2219  04d9 2711          	jreq	L612
2220  04db 4a            	dec	a
2221  04dc 270e          	jreq	L612
2222  04de ae01e9        	ldw	x,#489
2223  04e1 89            	pushw	x
2224  04e2 5f            	clrw	x
2225  04e3 89            	pushw	x
2226  04e4 ae0008        	ldw	x,#L572
2227  04e7 cd0000        	call	_assert_failed
2229  04ea 5b04          	addw	sp,#4
2230  04ec               L612:
2231                     ; 491     tmperrorinterrupt = (uint8_t)(((uint16_t)CAN_IT) >>7);
2233  04ec 1e04          	ldw	x,(OFST+1,sp)
2234  04ee 4f            	clr	a
2235  04ef 01            	rrwa	x,a
2236  04f0 48            	sll	a
2237  04f1 59            	rlcw	x
2238  04f2 9f            	ld	a,xl
2239  04f3 6b03          	ld	(OFST+0,sp),a
2241                     ; 492     tmperrorinterrupt = (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0xF0) | 
2241                     ; 493                                   (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0x0F) >>1));
2243  04f5 a40f          	and	a,#15
2244  04f7 44            	srl	a
2245  04f8 6b01          	ld	(OFST-2,sp),a
2247  04fa 7b03          	ld	a,(OFST+0,sp)
2248  04fc a4f0          	and	a,#240
2249  04fe 1a01          	or	a,(OFST-2,sp)
2250  0500 6b03          	ld	(OFST+0,sp),a
2252                     ; 495     CAN->PSR = CAN_Page_Config;
2254  0502 35065427      	mov	21543,#6
2255                     ; 496     if (NewState != DISABLE)
2257  0506 7b08          	ld	a,(OFST+5,sp)
2258  0508 270f          	jreq	L527
2259                     ; 499         CAN->IER |= (uint8_t)(CAN_IT);
2261  050a c65425        	ld	a,21541
2262  050d 1a05          	or	a,(OFST+2,sp)
2263  050f c75425        	ld	21541,a
2264                     ; 500         CAN->Page.Config.EIER |= (uint8_t)(tmperrorinterrupt);
2266  0512 c65429        	ld	a,21545
2267  0515 1a03          	or	a,(OFST+0,sp)
2269  0517 200f          	jra	L727
2270  0519               L527:
2271                     ; 505         CAN->IER &= (uint8_t)~(uint8_t)((uint16_t)CAN_IT);
2273  0519 7b05          	ld	a,(OFST+2,sp)
2274  051b 43            	cpl	a
2275  051c c45425        	and	a,21541
2276  051f c75425        	ld	21541,a
2277                     ; 506         CAN->Page.Config.EIER &= (uint8_t)~(tmperrorinterrupt);
2279  0522 7b03          	ld	a,(OFST+0,sp)
2280  0524 43            	cpl	a
2281  0525 c45429        	and	a,21545
2282  0528               L727:
2283  0528 c75429        	ld	21545,a
2284                     ; 509     CAN_SelectPage(can_page);
2286  052b 7b02          	ld	a,(OFST-1,sp)
2287  052d cd0d76        	call	_CAN_SelectPage
2289                     ; 510 }
2292  0530 5b05          	addw	sp,#5
2293  0532 81            	ret	
2353                     ; 519 void CAN_ST7CompatibilityCmd(CAN_ST7Compatibility_TypeDef CAN_ST7Compatibility)
2353                     ; 520 {
2354                     	switch	.text
2355  0533               _CAN_ST7CompatibilityCmd:
2357  0533 88            	push	a
2358       00000000      OFST:	set	0
2361                     ; 522     assert_param(IS_CAN_ST7_COMPATIBILITY_OK(CAN_ST7Compatibility));
2363  0534 4d            	tnz	a
2364  0535 2712          	jreq	L232
2365  0537 a110          	cp	a,#16
2366  0539 270e          	jreq	L232
2367  053b ae020a        	ldw	x,#522
2368  053e 89            	pushw	x
2369  053f 5f            	clrw	x
2370  0540 89            	pushw	x
2371  0541 ae0008        	ldw	x,#L572
2372  0544 cd0000        	call	_assert_failed
2374  0547 5b04          	addw	sp,#4
2375  0549               L232:
2376                     ; 524     CAN->DGR &= (uint8_t)(~CAN_DGR_TXM2E);
2378  0549 72195426      	bres	21542,#4
2379                     ; 527     CAN->DGR |= (uint8_t)CAN_ST7Compatibility;
2381  054d c65426        	ld	a,21542
2382  0550 1a01          	or	a,(OFST+1,sp)
2383  0552 c75426        	ld	21542,a
2384                     ; 528 }
2387  0555 84            	pop	a
2388  0556 81            	ret	
2436                     ; 535 void CAN_TTComModeCmd(FunctionalState NewState)
2436                     ; 536 {
2437                     	switch	.text
2438  0557               _CAN_TTComModeCmd:
2440  0557 88            	push	a
2441  0558 88            	push	a
2442       00000001      OFST:	set	1
2445                     ; 537     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2447  0559 cd0d72        	call	_CAN_GetSelectedPage
2449  055c 6b01          	ld	(OFST+0,sp),a
2451                     ; 539     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2453  055e 7b02          	ld	a,(OFST+1,sp)
2454  0560 2711          	jreq	L642
2455  0562 4a            	dec	a
2456  0563 270e          	jreq	L642
2457  0565 ae021b        	ldw	x,#539
2458  0568 89            	pushw	x
2459  0569 5f            	clrw	x
2460  056a 89            	pushw	x
2461  056b ae0008        	ldw	x,#L572
2462  056e cd0000        	call	_assert_failed
2464  0571 5b04          	addw	sp,#4
2465  0573               L642:
2466                     ; 540     if (NewState != DISABLE)
2468  0573 7b02          	ld	a,(OFST+1,sp)
2469  0575 2726          	jreq	L1001
2470                     ; 543         CAN->MCR |= CAN_MCR_TTCM;
2472  0577 721e5420      	bset	21536,#7
2473                     ; 545         CAN->PSR = CAN_Page_TxMailBox0;
2475  057b 725f5427      	clr	21543
2476                     ; 546         CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2478  057f 721e5429      	bset	21545,#7
2479                     ; 547         CAN->PSR = CAN_Page_TxMailBox1;
2481  0583 35015427      	mov	21543,#1
2482                     ; 548         CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2484  0587 721e5429      	bset	21545,#7
2485                     ; 549         CAN->PSR = CAN_Page_TxMailBox2;
2487  058b 35055427      	mov	21543,#5
2488                     ; 550         CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2490  058f 721e5429      	bset	21545,#7
2491                     ; 551         CAN->PSR = CAN_Page_RxFifo;
2493  0593 35075427      	mov	21543,#7
2494                     ; 552         CAN->Page.RxFIFO.MDLCR |= CAN_MDLCR_TGT;
2496  0597 721e5429      	bset	21545,#7
2498  059b 2023          	jra	L3001
2499  059d               L1001:
2500                     ; 557         CAN->MCR &= ((uint8_t)~CAN_MCR_TTCM);
2502  059d 721f5420      	bres	21536,#7
2503                     ; 559         CAN->PSR = CAN_Page_TxMailBox0;
2505  05a1 c75427        	ld	21543,a
2506                     ; 560         CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2508  05a4 721f5429      	bres	21545,#7
2509                     ; 561         CAN->PSR = CAN_Page_TxMailBox1;
2511  05a8 35015427      	mov	21543,#1
2512                     ; 562         CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2514  05ac 721f5429      	bres	21545,#7
2515                     ; 563         CAN->PSR = CAN_Page_TxMailBox2;
2517  05b0 35055427      	mov	21543,#5
2518                     ; 564         CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2520  05b4 721f5429      	bres	21545,#7
2521                     ; 565         CAN->PSR = CAN_Page_RxFifo;
2523  05b8 35075427      	mov	21543,#7
2524                     ; 566         CAN->Page.RxFIFO.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2526  05bc 721f5429      	bres	21545,#7
2527  05c0               L3001:
2528                     ; 569     CAN_SelectPage(can_page);
2530  05c0 7b01          	ld	a,(OFST+0,sp)
2531  05c2 cd0d76        	call	_CAN_SelectPage
2533                     ; 570 }
2536  05c5 85            	popw	x
2537  05c6 81            	ret	
2739                     .const:	section	.text
2740  0000               L272:
2741  0000 20000000      	dc.l	536870912
2742  0004               L203:
2743  0004 00000800      	dc.l	2048
2744                     ; 581 CAN_TxStatus_TypeDef CAN_Transmit(uint32_t CAN_Id,
2744                     ; 582                                   CAN_Id_TypeDef CAN_IDE,
2744                     ; 583                                   CAN_RTR_TypeDef CAN_RTR,
2744                     ; 584                                   uint8_t CAN_DLC,
2744                     ; 585                                   uint8_t *CAN_Data)
2744                     ; 586 {
2745                     	switch	.text
2746  05c7               _CAN_Transmit:
2748  05c7 5206          	subw	sp,#6
2749       00000006      OFST:	set	6
2752                     ; 587     CAN_TxStatus_TypeDef CAN_TxStatus = CAN_TxStatus_NoMailBox;
2754                     ; 588     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2756  05c9 cd0d72        	call	_CAN_GetSelectedPage
2758  05cc 6b05          	ld	(OFST-1,sp),a
2760                     ; 590     assert_param(IS_CAN_IDTYPE_OK(CAN_IDE));
2762  05ce 7b0d          	ld	a,(OFST+7,sp)
2763  05d0 2712          	jreq	L462
2764  05d2 a140          	cp	a,#64
2765  05d4 270e          	jreq	L462
2766  05d6 ae024e        	ldw	x,#590
2767  05d9 89            	pushw	x
2768  05da 5f            	clrw	x
2769  05db 89            	pushw	x
2770  05dc ae0008        	ldw	x,#L572
2771  05df cd0000        	call	_assert_failed
2773  05e2 5b04          	addw	sp,#4
2774  05e4               L462:
2775                     ; 591     if (CAN_IDE != CAN_Id_Standard)
2777  05e4 0d0d          	tnz	(OFST+7,sp)
2778  05e6 96            	ldw	x,sp
2779  05e7 2713          	jreq	L3111
2780                     ; 593         assert_param(IS_CAN_EXTID_OK(CAN_Id));
2782  05e9 1c0009        	addw	x,#OFST+3
2783  05ec cd0000        	call	c_ltor
2785  05ef ae0000        	ldw	x,#L272
2786  05f2 cd0000        	call	c_lcmp
2788  05f5 2521          	jrult	L403
2789  05f7 ae0251        	ldw	x,#593
2792  05fa 2011          	jp	LC012
2793  05fc               L3111:
2794                     ; 597         assert_param(IS_CAN_STDID_OK(CAN_Id));
2796  05fc 1c0009        	addw	x,#OFST+3
2797  05ff cd0000        	call	c_ltor
2799  0602 ae0004        	ldw	x,#L203
2800  0605 cd0000        	call	c_lcmp
2802  0608 250e          	jrult	L403
2803  060a ae0255        	ldw	x,#597
2805  060d               LC012:
2806  060d 89            	pushw	x
2807  060e 5f            	clrw	x
2808  060f 89            	pushw	x
2809  0610 ae0008        	ldw	x,#L572
2810  0613 cd0000        	call	_assert_failed
2811  0616 5b04          	addw	sp,#4
2812  0618               L403:
2813                     ; 599     assert_param(IS_CAN_RTR_OK(CAN_RTR));
2815  0618 7b0e          	ld	a,(OFST+8,sp)
2816  061a 2712          	jreq	L413
2817  061c a120          	cp	a,#32
2818  061e 270e          	jreq	L413
2819  0620 ae0257        	ldw	x,#599
2820  0623 89            	pushw	x
2821  0624 5f            	clrw	x
2822  0625 89            	pushw	x
2823  0626 ae0008        	ldw	x,#L572
2824  0629 cd0000        	call	_assert_failed
2826  062c 5b04          	addw	sp,#4
2827  062e               L413:
2828                     ; 600     assert_param(IS_CAN_DLC_OK(CAN_DLC));
2830  062e 7b0f          	ld	a,(OFST+9,sp)
2831  0630 a109          	cp	a,#9
2832  0632 250e          	jrult	L223
2833  0634 ae0258        	ldw	x,#600
2834  0637 89            	pushw	x
2835  0638 5f            	clrw	x
2836  0639 89            	pushw	x
2837  063a ae0008        	ldw	x,#L572
2838  063d cd0000        	call	_assert_failed
2840  0640 5b04          	addw	sp,#4
2841  0642               L223:
2842                     ; 602     if ((CAN->TPR & CAN_TPR_TME0) == CAN_TPR_TME0)
2844  0642 7205542303    	btjf	21539,#2,L7111
2845                     ; 604         CAN_TxStatus = CAN_TxStatus_MailBox0Ok;
2847  0647 4f            	clr	a
2849  0648 2014          	jra	LC013
2850  064a               L7111:
2851                     ; 606     else if ((CAN->TPR & CAN_TPR_TME1) == CAN_TPR_TME1)
2853  064a 7207542304    	btjf	21539,#3,L3211
2854                     ; 608         CAN_TxStatus = CAN_TxStatus_MailBox1Ok;
2856  064f a601          	ld	a,#1
2858  0651 200b          	jp	LC013
2859  0653               L3211:
2860                     ; 610     else if ((CAN->TPR & CAN_TPR_TME2) == CAN_TPR_TME2)
2862  0653 7209542304    	btjf	21539,#4,L7211
2863                     ; 612         CAN_TxStatus = CAN_TxStatus_MailBox2Ok;
2865  0658 a605          	ld	a,#5
2867  065a 2002          	jp	LC013
2868  065c               L7211:
2869                     ; 616         CAN_TxStatus = CAN_TxStatus_NoMailBox;
2871  065c a6f4          	ld	a,#244
2872  065e               LC013:
2873  065e 6b06          	ld	(OFST+0,sp),a
2875                     ; 618     if (CAN_TxStatus != CAN_TxStatus_NoMailBox)
2877  0660 a1f4          	cp	a,#244
2878  0662 2603cc071c    	jreq	L3311
2879                     ; 620         CAN->PSR = (uint8_t)CAN_TxStatus;
2881  0667 c75427        	ld	21543,a
2882                     ; 622         if (CAN_IDE != CAN_Id_Standard)
2884  066a 7b0d          	ld	a,(OFST+7,sp)
2885  066c 273b          	jreq	L5311
2886                     ; 624             CAN_Id &= (uint32_t)CAN_EXTID_SIZE;
2888  066e 7b09          	ld	a,(OFST+3,sp)
2889  0670 a41f          	and	a,#31
2890  0672 6b09          	ld	(OFST+3,sp),a
2891                     ; 625             CAN->Page.TxMailbox.MIDR4 = (uint8_t)(CAN_Id);
2893  0674 7b0c          	ld	a,(OFST+6,sp)
2894  0676 c7542d        	ld	21549,a
2895                     ; 626             CAN_Id = CAN_Id>>8;
2897  0679 96            	ldw	x,sp
2898  067a 1c0009        	addw	x,#OFST+3
2899  067d a608          	ld	a,#8
2900  067f cd0000        	call	c_lgursh
2902                     ; 627             CAN->Page.TxMailbox.MIDR3 = (uint8_t)(CAN_Id);
2904  0682 7b0c          	ld	a,(OFST+6,sp)
2905  0684 c7542c        	ld	21548,a
2906                     ; 628             CAN_Id = CAN_Id>>8;
2908  0687 96            	ldw	x,sp
2909  0688 1c0009        	addw	x,#OFST+3
2910  068b a608          	ld	a,#8
2911  068d cd0000        	call	c_lgursh
2913                     ; 629             CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id);
2915  0690 7b0c          	ld	a,(OFST+6,sp)
2916  0692 c7542b        	ld	21547,a
2917                     ; 630             CAN_Id = CAN_Id>>8;
2919  0695 96            	ldw	x,sp
2920  0696 1c0009        	addw	x,#OFST+3
2921  0699 a608          	ld	a,#8
2922  069b cd0000        	call	c_lgursh
2924                     ; 631             CAN->Page.TxMailbox.MIDR1 = (uint8_t)(CAN_Id |CAN_IDE | CAN_RTR);
2926  069e 7b0c          	ld	a,(OFST+6,sp)
2927  06a0 1a0d          	or	a,(OFST+7,sp)
2928  06a2 1a0e          	or	a,(OFST+8,sp)
2929  06a4 c7542a        	ld	21546,a
2931  06a7 2036          	jra	L7311
2932  06a9               L5311:
2933                     ; 635             CAN_Id &= (uint16_t)CAN_STDID_SIZE;
2935  06a9 7b0b          	ld	a,(OFST+5,sp)
2936  06ab a407          	and	a,#7
2937  06ad 6b0b          	ld	(OFST+5,sp),a
2938  06af 0f0a          	clr	(OFST+4,sp)
2939  06b1 0f09          	clr	(OFST+3,sp)
2940                     ; 636             CAN->Page.TxMailbox.MIDR1 = (uint8_t)((CAN_Id>>6) | (CAN_RTR)) ;
2942  06b3 7b0e          	ld	a,(OFST+8,sp)
2943  06b5 b703          	ld	c_lreg+3,a
2944  06b7 3f02          	clr	c_lreg+2
2945  06b9 3f01          	clr	c_lreg+1
2946  06bb 3f00          	clr	c_lreg
2947  06bd 96            	ldw	x,sp
2948  06be 5c            	incw	x
2949  06bf cd0000        	call	c_rtol
2952  06c2 96            	ldw	x,sp
2953  06c3 1c0009        	addw	x,#OFST+3
2954  06c6 cd0000        	call	c_ltor
2956  06c9 a606          	ld	a,#6
2957  06cb cd0000        	call	c_lursh
2959  06ce 96            	ldw	x,sp
2960  06cf 5c            	incw	x
2961  06d0 cd0000        	call	c_lor
2963  06d3 550003542a    	mov	21546,c_lreg+3
2964                     ; 637             CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id<<2);
2966  06d8 7b0c          	ld	a,(OFST+6,sp)
2967  06da 48            	sll	a
2968  06db 48            	sll	a
2969  06dc c7542b        	ld	21547,a
2970  06df               L7311:
2971                     ; 641         CAN->Page.TxMailbox.MDLCR &= (uint8_t)0xF0;
2973  06df c65429        	ld	a,21545
2974  06e2 a4f0          	and	a,#240
2975  06e4 c75429        	ld	21545,a
2976                     ; 643         CAN->Page.TxMailbox.MDLCR |= CAN_DLC;
2978  06e7 c65429        	ld	a,21545
2979  06ea 1a0f          	or	a,(OFST+9,sp)
2980  06ec c75429        	ld	21545,a
2981                     ; 645         CAN->Page.TxMailbox.MDAR1 = CAN_Data[0];
2983  06ef 1e10          	ldw	x,(OFST+10,sp)
2984  06f1 f6            	ld	a,(x)
2985  06f2 c7542e        	ld	21550,a
2986                     ; 646         CAN->Page.TxMailbox.MDAR2 = CAN_Data[1];
2988  06f5 e601          	ld	a,(1,x)
2989  06f7 c7542f        	ld	21551,a
2990                     ; 647         CAN->Page.TxMailbox.MDAR3 = CAN_Data[2];
2992  06fa e602          	ld	a,(2,x)
2993  06fc c75430        	ld	21552,a
2994                     ; 648         CAN->Page.TxMailbox.MDAR4 = CAN_Data[3];
2996  06ff e603          	ld	a,(3,x)
2997  0701 c75431        	ld	21553,a
2998                     ; 649         CAN->Page.TxMailbox.MDAR5 = CAN_Data[4];
3000  0704 e604          	ld	a,(4,x)
3001  0706 c75432        	ld	21554,a
3002                     ; 650         CAN->Page.TxMailbox.MDAR6 = CAN_Data[5];
3004  0709 e605          	ld	a,(5,x)
3005  070b c75433        	ld	21555,a
3006                     ; 651         CAN->Page.TxMailbox.MDAR7 = CAN_Data[6];
3008  070e e606          	ld	a,(6,x)
3009  0710 c75434        	ld	21556,a
3010                     ; 652         CAN->Page.TxMailbox.MDAR8 = CAN_Data[7];
3012  0713 e607          	ld	a,(7,x)
3013  0715 c75435        	ld	21557,a
3014                     ; 654         CAN->Page.TxMailbox.MCSR |= CAN_MCSR_TXRQ;
3016  0718 72105428      	bset	21544,#0
3017  071c               L3311:
3018                     ; 657     CAN_SelectPage(can_page);
3020  071c 7b05          	ld	a,(OFST-1,sp)
3021  071e cd0d76        	call	_CAN_SelectPage
3023                     ; 658     return (CAN_TxStatus_TypeDef)CAN_TxStatus;
3025  0721 7b06          	ld	a,(OFST+0,sp)
3028  0723 5b06          	addw	sp,#6
3029  0725 81            	ret	
3114                     ; 666 CAN_TxStatus_TypeDef CAN_TransmitStatus(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
3114                     ; 667 {
3115                     	switch	.text
3116  0726               _CAN_TransmitStatus:
3118  0726 88            	push	a
3119  0727 88            	push	a
3120       00000001      OFST:	set	1
3123                     ; 669     CAN_TxStatus_TypeDef tstate = CAN_TxStatus_Failed;
3125                     ; 670     uint8_t tmpstate=0;
3127  0728 0f01          	clr	(OFST+0,sp)
3129                     ; 673     assert_param(IS_CAN_TRANSMITMAILBOX_OK(CAN_TransmitMailbox));
3131  072a 4d            	tnz	a
3132  072b 2716          	jreq	L633
3133  072d a101          	cp	a,#1
3134  072f 2712          	jreq	L633
3135  0731 a105          	cp	a,#5
3136  0733 270e          	jreq	L633
3137  0735 ae02a1        	ldw	x,#673
3138  0738 89            	pushw	x
3139  0739 5f            	clrw	x
3140  073a 89            	pushw	x
3141  073b ae0008        	ldw	x,#L572
3142  073e cd0000        	call	_assert_failed
3144  0741 5b04          	addw	sp,#4
3145  0743               L633:
3146                     ; 675     switch (CAN_TransmitMailbox)
3148  0743 7b02          	ld	a,(OFST+1,sp)
3150                     ; 688         break;
3151  0745 2709          	jreq	L1411
3152  0747 4a            	dec	a
3153  0748 2714          	jreq	L3411
3154  074a a004          	sub	a,#4
3155  074c 271f          	jreq	L5411
3156                     ; 686     default:
3156                     ; 687         tstate = CAN_TxStatus_Failed;
3158                     ; 688         break;
3160  074e 2031          	jra	L3221
3161  0750               L1411:
3162                     ; 677     case (CAN_TransmitMailBox_0): tmpstate = (uint8_t)((CAN->TSR & (uint8_t)(CAN_TSR_RQCP0|CAN_TSR_TXOK0)));
3164  0750 c65422        	ld	a,21538
3165  0753 a411          	and	a,#17
3166  0755 6b01          	ld	(OFST+0,sp),a
3168                     ; 678         tmpstate |= (uint8_t)((CAN->TPR & CAN_TPR_TME0));
3170  0757 c65423        	ld	a,21539
3171  075a a404          	and	a,#4
3172                     ; 679         break;
3174  075c 201f          	jp	LC014
3175  075e               L3411:
3176                     ; 680     case (CAN_TransmitMailBox_1): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP1|CAN_TSR_TXOK1))>>1);
3178  075e c65422        	ld	a,21538
3179  0761 a422          	and	a,#34
3180  0763 44            	srl	a
3181  0764 6b01          	ld	(OFST+0,sp),a
3183                     ; 681         tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME1) >> 1);
3185  0766 c65423        	ld	a,21539
3186  0769 a408          	and	a,#8
3187                     ; 682         break;
3189  076b 200f          	jp	LC015
3190  076d               L5411:
3191                     ; 683     case (CAN_TransmitMailBox_2): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP2|CAN_TSR_TXOK2))>>2);
3193  076d c65422        	ld	a,21538
3194  0770 a444          	and	a,#68
3195  0772 44            	srl	a
3196  0773 44            	srl	a
3197  0774 6b01          	ld	(OFST+0,sp),a
3199                     ; 684         tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME2) >> 2);
3201  0776 c65423        	ld	a,21539
3202  0779 a410          	and	a,#16
3203  077b 44            	srl	a
3204  077c               LC015:
3205  077c 44            	srl	a
3206  077d               LC014:
3207  077d 1a01          	or	a,(OFST+0,sp)
3208  077f 6b01          	ld	(OFST+0,sp),a
3210                     ; 685         break;
3212  0781               L3221:
3213                     ; 691     switch (tmpstate)
3215  0781 7b01          	ld	a,(OFST+0,sp)
3217                     ; 707         break;
3218  0783 270f          	jreq	L1511
3219  0785 a004          	sub	a,#4
3220  0787 2717          	jreq	L7511
3221  0789 4a            	dec	a
3222  078a 270c          	jreq	L3511
3223  078c a010          	sub	a,#16
3224  078e 270c          	jreq	L5511
3225                     ; 705     default:
3225                     ; 706         tstate = CAN_TxStatus_Failed;
3227  0790 a6f0          	ld	a,#240
3229                     ; 707         break;
3231  0792 200e          	jra	L7221
3232  0794               L1511:
3233                     ; 694     case (0x00): tstate = CAN_TxStatus_Pending;
3235  0794 a6f2          	ld	a,#242
3237                     ; 695         break;
3239  0796 200a          	jra	L7221
3240  0798               L3511:
3241                     ; 697     case (0x05): tstate = CAN_TxStatus_Failed;
3243  0798 a6f0          	ld	a,#240
3245                     ; 698         break;
3247  079a 2006          	jra	L7221
3248  079c               L5511:
3249                     ; 700     case (0x15): tstate = CAN_TxStatus_Ok;
3251  079c a6f1          	ld	a,#241
3253                     ; 701         break;
3255  079e 2002          	jra	L7221
3256  07a0               L7511:
3257                     ; 703     case (0x04): tstate = CAN_TxStatus_MailBoxEmpty;
3259  07a0 a6f5          	ld	a,#245
3261                     ; 704         break;
3263  07a2               L7221:
3264                     ; 710     return (CAN_TxStatus_TypeDef)tstate;
3268  07a2 85            	popw	x
3269  07a3 81            	ret	
3318                     ; 718 void CAN_CancelTransmit(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
3318                     ; 719 {
3319                     	switch	.text
3320  07a4               _CAN_CancelTransmit:
3322  07a4 88            	push	a
3323  07a5 88            	push	a
3324       00000001      OFST:	set	1
3327                     ; 720     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
3329  07a6 cd0d72        	call	_CAN_GetSelectedPage
3331  07a9 6b01          	ld	(OFST+0,sp),a
3333                     ; 722     assert_param(IS_CAN_TRANSMITMAILBOX_OK(CAN_TransmitMailbox));
3335  07ab 7b02          	ld	a,(OFST+1,sp)
3336  07ad 2718          	jreq	L253
3337  07af a101          	cp	a,#1
3338  07b1 2714          	jreq	L253
3339  07b3 a105          	cp	a,#5
3340  07b5 2710          	jreq	L253
3341  07b7 ae02d2        	ldw	x,#722
3342  07ba 89            	pushw	x
3343  07bb 5f            	clrw	x
3344  07bc 89            	pushw	x
3345  07bd ae0008        	ldw	x,#L572
3346  07c0 cd0000        	call	_assert_failed
3348  07c3 5b04          	addw	sp,#4
3349  07c5 7b02          	ld	a,(OFST+1,sp)
3350  07c7               L253:
3351                     ; 724     CAN->PSR = (uint8_t)CAN_TransmitMailbox;
3353  07c7 c75427        	ld	21543,a
3354                     ; 726     CAN->Page.TxMailbox.MCSR |= CAN_MCSR_ABRQ;
3356  07ca 72125428      	bset	21544,#1
3357                     ; 728     CAN_SelectPage(can_page);
3359  07ce 7b01          	ld	a,(OFST+0,sp)
3360  07d0 cd0d76        	call	_CAN_SelectPage
3362                     ; 729 }
3365  07d3 85            	popw	x
3366  07d4 81            	ret	
3389                     ; 736 void CAN_FIFORelease(void)
3389                     ; 737 {
3390                     	switch	.text
3391  07d5               _CAN_FIFORelease:
3395                     ; 739     CAN->RFR = CAN_RFR_RFOM; /*rc-w1*/
3397  07d5 35205424      	mov	21540,#32
3398                     ; 740 }
3401  07d9 81            	ret	
3475                     ; 746 CAN_NbrPendingMessage_TypeDef CAN_MessagePending(void)
3475                     ; 747 {
3476                     	switch	.text
3477  07da               _CAN_MessagePending:
3479  07da 88            	push	a
3480       00000001      OFST:	set	1
3483                     ; 748     CAN_NbrPendingMessage_TypeDef msgpending = CAN_NbrPendingMessage_0;
3485                     ; 749     msgpending = (CAN_NbrPendingMessage_TypeDef)(CAN->RFR & CAN_RFR_FMP01);
3487  07db c65424        	ld	a,21540
3488  07de a403          	and	a,#3
3490                     ; 750     return (CAN_NbrPendingMessage_TypeDef)msgpending;
3494  07e0 5b01          	addw	sp,#1
3495  07e2 81            	ret	
3560                     ; 761 void CAN_Receive(void)
3560                     ; 762 {
3561                     	switch	.text
3562  07e3               _CAN_Receive:
3564  07e3 520d          	subw	sp,#13
3565       0000000d      OFST:	set	13
3568                     ; 763     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
3570  07e5 cd0d72        	call	_CAN_GetSelectedPage
3572  07e8 6b01          	ld	(OFST-12,sp),a
3574                     ; 764     uint32_t temp1 = 0, temp2 = 0, temp3 = 0;
3580                     ; 767     CAN->PSR = CAN_Page_RxFifo;
3582  07ea 35075427      	mov	21543,#7
3583                     ; 770     _IDE = (uint8_t)(CAN->Page.RxFIFO.MIDR1 & CAN_Id_Extended);
3585  07ee c6542a        	ld	a,21546
3586  07f1 a440          	and	a,#64
3587  07f3 c70004        	ld	__IDE,a
3588                     ; 771     if (_IDE != CAN_Id_Standard)
3590  07f6 725d0004      	tnz	__IDE
3591  07fa 2773          	jreq	L1431
3592                     ; 773       temp1 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR3) << 8);
3594  07fc c6542c        	ld	a,21548
3595  07ff 5f            	clrw	x
3596  0800 97            	ld	xl,a
3597  0801 90ae0100      	ldw	y,#256
3598  0805 cd0000        	call	c_umul
3600  0808 96            	ldw	x,sp
3601  0809 1c0006        	addw	x,#OFST-7
3602  080c cd0000        	call	c_rtol
3605                     ; 774       temp2 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR2) << 16);  
3607  080f c6542b        	ld	a,21547
3608  0812 b703          	ld	c_lreg+3,a
3609  0814 3f02          	clr	c_lreg+2
3610  0816 3f01          	clr	c_lreg+1
3611  0818 3f00          	clr	c_lreg
3612  081a a610          	ld	a,#16
3613  081c cd0000        	call	c_llsh
3615  081f 96            	ldw	x,sp
3616  0820 1c000a        	addw	x,#OFST-3
3617  0823 cd0000        	call	c_rtol
3620                     ; 775       temp3 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 24);
3622  0826 c6542a        	ld	a,21546
3623  0829 b703          	ld	c_lreg+3,a
3624  082b 3f02          	clr	c_lreg+2
3625  082d 3f01          	clr	c_lreg+1
3626  082f 3f00          	clr	c_lreg
3627  0831 a41f          	and	a,#31
3628  0833 b703          	ld	c_lreg+3,a
3629  0835 3f02          	clr	c_lreg+2
3630  0837 3f01          	clr	c_lreg+1
3631  0839 3f00          	clr	c_lreg
3632  083b a618          	ld	a,#24
3633  083d cd0000        	call	c_llsh
3635  0840 96            	ldw	x,sp
3636  0841 1c0002        	addw	x,#OFST-11
3637  0844 cd0000        	call	c_rtol
3640                     ; 777       _Id = (uint32_t)CAN_EXTID_SIZE & ((CAN->Page.RxFIFO.MIDR4) | temp1 | temp2 | temp3 );
3642  0847 c6542d        	ld	a,21549
3643  084a b703          	ld	c_lreg+3,a
3644  084c 3f02          	clr	c_lreg+2
3645  084e 3f01          	clr	c_lreg+1
3646  0850 3f00          	clr	c_lreg
3647  0852 96            	ldw	x,sp
3648  0853 1c0006        	addw	x,#OFST-7
3649  0856 cd0000        	call	c_lor
3651  0859 96            	ldw	x,sp
3652  085a 1c000a        	addw	x,#OFST-3
3653  085d cd0000        	call	c_lor
3655  0860 96            	ldw	x,sp
3656  0861 1c0002        	addw	x,#OFST-11
3657  0864 cd0000        	call	c_lor
3659  0867 b600          	ld	a,c_lreg
3660  0869 a41f          	and	a,#31
3661  086b b700          	ld	c_lreg,a
3664  086d 2044          	jra	L3431
3665  086f               L1431:
3666                     ; 781         temp1 = (uint16_t)((uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 6));
3668  086f c6542a        	ld	a,21546
3669  0872 a41f          	and	a,#31
3670  0874 5f            	clrw	x
3671  0875 02            	rlwa	x,a
3672  0876 58            	sllw	x
3673  0877 58            	sllw	x
3674  0878 58            	sllw	x
3675  0879 58            	sllw	x
3676  087a 58            	sllw	x
3677  087b 58            	sllw	x
3678  087c cd0000        	call	c_uitolx
3680  087f 96            	ldw	x,sp
3681  0880 1c0006        	addw	x,#OFST-7
3682  0883 cd0000        	call	c_rtol
3685                     ; 782         temp2 = (uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR2 >> 2)&0x3F);
3687  0886 c6542b        	ld	a,21547
3688  0889 5f            	clrw	x
3689  088a 97            	ld	xl,a
3690  088b 54            	srlw	x
3691  088c 54            	srlw	x
3692  088d 9f            	ld	a,xl
3693  088e a43f          	and	a,#63
3694  0890 5f            	clrw	x
3695  0891 cd0000        	call	c_uitol
3697  0894 96            	ldw	x,sp
3698  0895 1c000a        	addw	x,#OFST-3
3699  0898 cd0000        	call	c_rtol
3702                     ; 784       _Id = (uint16_t)CAN_STDID_SIZE & (temp1 | temp2 );
3704  089b 96            	ldw	x,sp
3705  089c 1c0006        	addw	x,#OFST-7
3706  089f cd0000        	call	c_ltor
3708  08a2 96            	ldw	x,sp
3709  08a3 1c000a        	addw	x,#OFST-3
3710  08a6 cd0000        	call	c_lor
3712  08a9 b602          	ld	a,c_lreg+2
3713  08ab a407          	and	a,#7
3714  08ad b702          	ld	c_lreg+2,a
3715  08af 3f01          	clr	c_lreg+1
3716  08b1 3f00          	clr	c_lreg
3718  08b3               L3431:
3719  08b3 ae0000        	ldw	x,#__Id
3720  08b6 cd0000        	call	c_rtol
3721                     ; 787     _RTR = (uint8_t)((uint8_t)0x20 & CAN->Page.RxFIFO.MIDR1);
3723  08b9 c6542a        	ld	a,21546
3724  08bc a420          	and	a,#32
3725  08be c70005        	ld	__RTR,a
3726                     ; 790     _DLC = (uint8_t)(CAN->Page.RxFIFO.MDLCR & (uint8_t)0x0F);
3728  08c1 c65429        	ld	a,21545
3729  08c4 a40f          	and	a,#15
3730  08c6 c70006        	ld	__DLC,a
3731                     ; 793     _FMI = CAN->Page.RxFIFO.MFMI;
3733  08c9 555428000f    	mov	__FMI,21544
3734                     ; 796     _Data[0] = CAN->Page.RxFIFO.MDAR1;
3736  08ce 55542e0007    	mov	__Data,21550
3737                     ; 797     _Data[1] = CAN->Page.RxFIFO.MDAR2;
3739  08d3 55542f0008    	mov	__Data+1,21551
3740                     ; 798     _Data[2] = CAN->Page.RxFIFO.MDAR3;
3742  08d8 5554300009    	mov	__Data+2,21552
3743                     ; 799     _Data[3] = CAN->Page.RxFIFO.MDAR4;
3745  08dd 555431000a    	mov	__Data+3,21553
3746                     ; 800     _Data[4] = CAN->Page.RxFIFO.MDAR5;
3748  08e2 555432000b    	mov	__Data+4,21554
3749                     ; 801     _Data[5] = CAN->Page.RxFIFO.MDAR6;
3751  08e7 555433000c    	mov	__Data+5,21555
3752                     ; 802     _Data[6] = CAN->Page.RxFIFO.MDAR7;
3754  08ec 555434000d    	mov	__Data+6,21556
3755                     ; 803     _Data[7] = CAN->Page.RxFIFO.MDAR8;
3757  08f1 555435000e    	mov	__Data+7,21557
3758                     ; 806     CAN_FIFORelease();
3760  08f6 cd07d5        	call	_CAN_FIFORelease
3762                     ; 808     CAN_SelectPage(can_page);
3764  08f9 7b01          	ld	a,(OFST-12,sp)
3765  08fb cd0d76        	call	_CAN_SelectPage
3767                     ; 809 }
3770  08fe 5b0d          	addw	sp,#13
3771  0900 81            	ret	
3795                     ; 819 uint32_t CAN_GetReceivedId(void)
3795                     ; 820 {
3796                     	switch	.text
3797  0901               _CAN_GetReceivedId:
3801                     ; 821     return (_Id);
3803  0901 ae0000        	ldw	x,#__Id
3807  0904 cc0000        	jp	c_ltor
3832                     ; 832 CAN_Id_TypeDef CAN_GetReceivedIDE(void)
3832                     ; 833 {
3833                     	switch	.text
3834  0907               _CAN_GetReceivedIDE:
3838                     ; 834     return (CAN_Id_TypeDef)(_IDE);
3840  0907 c60004        	ld	a,__IDE
3843  090a 81            	ret	
3868                     ; 845 CAN_RTR_TypeDef CAN_GetReceivedRTR(void)
3868                     ; 846 {
3869                     	switch	.text
3870  090b               _CAN_GetReceivedRTR:
3874                     ; 847     return (CAN_RTR_TypeDef)(_RTR);
3876  090b c60005        	ld	a,__RTR
3879  090e 81            	ret	
3903                     ; 858 uint8_t CAN_GetReceivedDLC(void)
3903                     ; 859 {
3904                     	switch	.text
3905  090f               _CAN_GetReceivedDLC:
3909                     ; 860     return (_DLC);
3911  090f c60006        	ld	a,__DLC
3914  0912 81            	ret	
3949                     ; 872 uint8_t CAN_GetReceivedData(uint8_t CAN_DataIndex)
3949                     ; 873 {
3950                     	switch	.text
3951  0913               _CAN_GetReceivedData:
3953  0913 88            	push	a
3954       00000000      OFST:	set	0
3957                     ; 874     assert_param(IS_CAN_DLC_OK(CAN_DataIndex));
3959  0914 a109          	cp	a,#9
3960  0916 250e          	jrult	L014
3961  0918 ae036a        	ldw	x,#874
3962  091b 89            	pushw	x
3963  091c 5f            	clrw	x
3964  091d 89            	pushw	x
3965  091e ae0008        	ldw	x,#L572
3966  0921 cd0000        	call	_assert_failed
3968  0924 5b04          	addw	sp,#4
3969  0926               L014:
3970                     ; 875     return (_Data[CAN_DataIndex]);
3972  0926 7b01          	ld	a,(OFST+1,sp)
3973  0928 5f            	clrw	x
3974  0929 97            	ld	xl,a
3975  092a d60007        	ld	a,(__Data,x)
3978  092d 5b01          	addw	sp,#1
3979  092f 81            	ret	
4003                     ; 886 uint8_t CAN_GetReceivedFMI(void)
4003                     ; 887 {
4004                     	switch	.text
4005  0930               _CAN_GetReceivedFMI:
4009                     ; 888     return (_FMI);
4011  0930 c6000f        	ld	a,__FMI
4014  0933 81            	ret	
4059                     ; 896 uint16_t CAN_GetMessageTimeStamp(void)
4059                     ; 897 {
4060                     	switch	.text
4061  0934               _CAN_GetMessageTimeStamp:
4063  0934 5203          	subw	sp,#3
4064       00000003      OFST:	set	3
4067                     ; 898     uint16_t timestamp = 0;
4069                     ; 899     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
4071  0936 cd0d72        	call	_CAN_GetSelectedPage
4073  0939 6b01          	ld	(OFST-2,sp),a
4075                     ; 902     CAN->PSR = CAN_Page_RxFifo;
4077  093b 35075427      	mov	21543,#7
4078                     ; 904     timestamp = CAN->Page.RxFIFO.MTSRL;
4080  093f c65436        	ld	a,21558
4081  0942 5f            	clrw	x
4082  0943 97            	ld	xl,a
4083  0944 1f02          	ldw	(OFST-1,sp),x
4085                     ; 905     timestamp |= (uint16_t)(((uint16_t)CAN->Page.RxFIFO.MTSRH)<<8);
4087  0946 c65437        	ld	a,21559
4088  0949 5f            	clrw	x
4089  094a 97            	ld	xl,a
4090  094b 7b03          	ld	a,(OFST+0,sp)
4091  094d 01            	rrwa	x,a
4092  094e 1a02          	or	a,(OFST-1,sp)
4093  0950 01            	rrwa	x,a
4094  0951 1f02          	ldw	(OFST-1,sp),x
4096                     ; 908     CAN_SelectPage(can_page);
4098  0953 7b01          	ld	a,(OFST-2,sp)
4099  0955 cd0d76        	call	_CAN_SelectPage
4101                     ; 910     return (uint16_t)(timestamp);
4103  0958 1e02          	ldw	x,(OFST-1,sp)
4106  095a 5b03          	addw	sp,#3
4107  095c 81            	ret	
4163                     ; 918 CAN_Sleep_TypeDef CAN_Sleep(void)
4163                     ; 919 {
4164                     	switch	.text
4165  095d               _CAN_Sleep:
4167  095d 88            	push	a
4168       00000001      OFST:	set	1
4171                     ; 921     CAN_Sleep_TypeDef sleepstatus = CAN_Sleep_Failed;
4173  095e 0f01          	clr	(OFST+0,sp)
4175                     ; 924     CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
4177  0960 c65420        	ld	a,21536
4178  0963 a4fe          	and	a,#254
4179  0965 aa02          	or	a,#2
4180  0967 c75420        	ld	21536,a
4181                     ; 927     if ((CAN->MSR & (CAN_MSR_SLAK|CAN_MSR_INAK)) == CAN_MSR_SLAK)
4183  096a c65421        	ld	a,21537
4184  096d a403          	and	a,#3
4185  096f a102          	cp	a,#2
4186  0971 2604          	jrne	L7741
4187                     ; 930         sleepstatus =  CAN_Sleep_Ok;
4189  0973 a601          	ld	a,#1
4190  0975 6b01          	ld	(OFST+0,sp),a
4192  0977               L7741:
4193                     ; 934     return (CAN_Sleep_TypeDef) sleepstatus;
4195  0977 7b01          	ld	a,(OFST+0,sp)
4198  0979 5b01          	addw	sp,#1
4199  097b 81            	ret	
4255                     ; 942 CAN_WakeUp_TypeDef CAN_WakeUp(void)
4255                     ; 943 {
4256                     	switch	.text
4257  097c               _CAN_WakeUp:
4259  097c 88            	push	a
4260       00000001      OFST:	set	1
4263                     ; 944     CAN_WakeUp_TypeDef wakeupstatus = CAN_WakeUp_Failed;
4265  097d 0f01          	clr	(OFST+0,sp)
4267                     ; 947     CAN->MCR &= (uint8_t)(~CAN_MCR_SLEEP);
4269  097f 72135420      	bres	21536,#1
4270                     ; 950     if ((CAN->MSR & CAN_MSR_SLAK) != CAN_MSR_SLAK)
4272  0983 7202542104    	btjt	21537,#1,L7251
4273                     ; 953         wakeupstatus = CAN_WakeUp_Ok;
4275  0988 a601          	ld	a,#1
4276  098a 6b01          	ld	(OFST+0,sp),a
4278  098c               L7251:
4279                     ; 957     return (CAN_WakeUp_TypeDef)wakeupstatus;
4281  098c 7b01          	ld	a,(OFST+0,sp)
4284  098e 5b01          	addw	sp,#1
4285  0990 81            	ret	
4389                     ; 969 CAN_ModeStatus_TypeDef CAN_OperatingModeRequest(CAN_OperatingMode_TypeDef CAN_OperatingMode)
4389                     ; 970 {
4390                     	switch	.text
4391  0991               _CAN_OperatingModeRequest:
4393  0991 88            	push	a
4394  0992 5203          	subw	sp,#3
4395       00000003      OFST:	set	3
4398                     ; 972     uint16_t timeout = CAN_ACKNOWLEDGE_TIMEOUT;
4400  0994 aeffff        	ldw	x,#65535
4401  0997 1f02          	ldw	(OFST-1,sp),x
4403                     ; 973     uint8_t modestatus = 0;
4405                     ; 975     assert_param(IS_CAN_OPERATINGMODE_OK(CAN_OperatingMode));
4407  0999 4d            	tnz	a
4408  099a 2716          	jreq	L634
4409  099c a101          	cp	a,#1
4410  099e 2712          	jreq	L634
4411  09a0 a102          	cp	a,#2
4412  09a2 270e          	jreq	L634
4413  09a4 ae03cf        	ldw	x,#975
4414  09a7 89            	pushw	x
4415  09a8 5f            	clrw	x
4416  09a9 89            	pushw	x
4417  09aa ae0008        	ldw	x,#L572
4418  09ad cd0000        	call	_assert_failed
4420  09b0 5b04          	addw	sp,#4
4421  09b2               L634:
4422                     ; 977     if (CAN_OperatingMode == CAN_OperatingMode_Initialization)
4424  09b2 7b04          	ld	a,(OFST+1,sp)
4425  09b4 2623          	jrne	L5751
4426                     ; 980         CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_SLEEP)) | CAN_MCR_INRQ);
4428  09b6 c65420        	ld	a,21536
4429  09b9 a4fd          	and	a,#253
4430  09bb aa01          	or	a,#1
4431  09bd c75420        	ld	21536,a
4433  09c0 2003          	jra	L3061
4434  09c2               L7751:
4435                     ; 985             timeout--;
4437  09c2 5a            	decw	x
4438  09c3 1f02          	ldw	(OFST-1,sp),x
4440  09c5               L3061:
4441                     ; 983         while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK) && (timeout != 0))
4443  09c5 c65421        	ld	a,21537
4444  09c8 a403          	and	a,#3
4445  09ca 4a            	dec	a
4446  09cb 2704          	jreq	L7061
4448  09cd 1e02          	ldw	x,(OFST-1,sp)
4449  09cf 26f1          	jrne	L7751
4450  09d1               L7061:
4451                     ; 987         if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK)
4453  09d1 c65421        	ld	a,21537
4454  09d4 a403          	and	a,#3
4455  09d6 4a            	dec	a
4456                     ; 989           modestatus = CAN_ModeStatus_Failed;
4458  09d7 204e          	jp	LC018
4459                     ; 993           modestatus = CAN_ModeStatus_Success;  
4460  09d9               L5751:
4461                     ; 997     else  if (CAN_OperatingMode == CAN_OperatingMode_Normal)
4463  09d9 a101          	cp	a,#1
4464  09db 2623          	jrne	L7161
4465                     ; 1000         CAN->MCR &= (uint8_t)(~(CAN_MCR_SLEEP|CAN_MCR_INRQ));
4467  09dd c65420        	ld	a,21536
4468  09e0 a4fc          	and	a,#252
4469  09e2 c75420        	ld	21536,a
4471  09e5 2003          	jra	L3261
4472  09e7               L1261:
4473                     ; 1005             timeout--;
4475  09e7 5a            	decw	x
4476  09e8 1f02          	ldw	(OFST-1,sp),x
4478  09ea               L3261:
4479                     ; 1003         while (((CAN->MSR & CAN_MODE_MASK) != 0) && (timeout!=0))
4481  09ea c65421        	ld	a,21537
4482  09ed a503          	bcp	a,#3
4483  09ef 2704          	jreq	L7261
4485  09f1 1e02          	ldw	x,(OFST-1,sp)
4486  09f3 26f2          	jrne	L1261
4487  09f5               L7261:
4488                     ; 1007         if ((CAN->MSR & CAN_MODE_MASK) != 0)
4490  09f5 c65421        	ld	a,21537
4491  09f8 a503          	bcp	a,#3
4492                     ; 1009           modestatus = CAN_ModeStatus_Failed;
4494  09fa 262d          	jrne	L7361
4495  09fc               L1361:
4496                     ; 1013           modestatus = CAN_ModeStatus_Success;  
4500  09fc a601          	ld	a,#1
4502  09fe 202a          	jra	L5161
4503  0a00               L7161:
4504                     ; 1016     else  if (CAN_OperatingMode == CAN_OperatingMode_Sleep)
4506  0a00 a102          	cp	a,#2
4507  0a02 2625          	jrne	L7361
4508                     ; 1019         CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
4510  0a04 c65420        	ld	a,21536
4511  0a07 a4fe          	and	a,#254
4512  0a09 aa02          	or	a,#2
4513  0a0b c75420        	ld	21536,a
4515  0a0e 2003          	jra	L5461
4516  0a10               L1461:
4517                     ; 1024             timeout--;
4519  0a10 5a            	decw	x
4520  0a11 1f02          	ldw	(OFST-1,sp),x
4522  0a13               L5461:
4523                     ; 1022         while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK) && (timeout!=0))
4525  0a13 c65421        	ld	a,21537
4526  0a16 a403          	and	a,#3
4527  0a18 a102          	cp	a,#2
4528  0a1a 2704          	jreq	L1561
4530  0a1c 1e02          	ldw	x,(OFST-1,sp)
4531  0a1e 26f0          	jrne	L1461
4532  0a20               L1561:
4533                     ; 1026         if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK)
4535  0a20 c65421        	ld	a,21537
4536  0a23 a403          	and	a,#3
4537  0a25 a102          	cp	a,#2
4538  0a27               LC018:
4539  0a27 27d3          	jreq	L1361
4540                     ; 1028            modestatus = CAN_ModeStatus_Failed;  
4542                     ; 1032            modestatus = CAN_ModeStatus_Success;  
4543  0a29               L7361:
4544                     ; 1037          modestatus = CAN_ModeStatus_Failed;
4549  0a29 4f            	clr	a
4551  0a2a               L5161:
4552                     ; 1039   return (CAN_ModeStatus_TypeDef)(modestatus);
4556  0a2a 5b04          	addw	sp,#4
4557  0a2c 81            	ret	
4676                     ; 1047 CAN_ErrorCode_TypeDef CAN_GetLastErrorCode(void)
4676                     ; 1048 {
4677                     	switch	.text
4678  0a2d               _CAN_GetLastErrorCode:
4680  0a2d 89            	pushw	x
4681       00000002      OFST:	set	2
4684                     ; 1049     CAN_ErrorCode_TypeDef errcode = CAN_ErrorCode_NoErr;
4686                     ; 1050     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
4688  0a2e cd0d72        	call	_CAN_GetSelectedPage
4690  0a31 6b01          	ld	(OFST-1,sp),a
4692                     ; 1052     CAN->PSR = CAN_Page_Config;
4694  0a33 35065427      	mov	21543,#6
4695                     ; 1053     errcode = (CAN_ErrorCode_TypeDef)((CAN->Page.Config.ESR) & (CAN_ESR_LEC));
4697  0a37 c65428        	ld	a,21544
4698  0a3a a470          	and	a,#112
4699  0a3c 6b02          	ld	(OFST+0,sp),a
4701                     ; 1056     CAN_SelectPage(can_page);
4703  0a3e 7b01          	ld	a,(OFST-1,sp)
4704  0a40 cd0d76        	call	_CAN_SelectPage
4706                     ; 1058     return (CAN_ErrorCode_TypeDef)(errcode);
4708  0a43 7b02          	ld	a,(OFST+0,sp)
4711  0a45 85            	popw	x
4712  0a46 81            	ret	
4843                     ; 1073 void CAN_ClearFlag(CAN_FLAG_TypeDef CAN_Flag)
4843                     ; 1074 {
4844                     	switch	.text
4845  0a47               _CAN_ClearFlag:
4847  0a47 89            	pushw	x
4848  0a48 88            	push	a
4849       00000001      OFST:	set	1
4852                     ; 1075     CAN_Page_TypeDef can_page = (CAN_Page_TypeDef)0;
4854                     ; 1077     assert_param(IS_CAN_FLAG_CLEAR_OK(CAN_Flag));
4856  0a49 a33401        	cpw	x,#13313
4857  0a4c 272c          	jreq	L654
4858  0a4e a33402        	cpw	x,#13314
4859  0a51 2727          	jreq	L654
4860  0a53 a33404        	cpw	x,#13316
4861  0a56 2722          	jreq	L654
4862  0a58 a33208        	cpw	x,#12808
4863  0a5b 271d          	jreq	L654
4864  0a5d a33210        	cpw	x,#12816
4865  0a60 2718          	jreq	L654
4866  0a62 a33108        	cpw	x,#12552
4867  0a65 2713          	jreq	L654
4868  0a67 a33070        	cpw	x,#12400
4869  0a6a 270e          	jreq	L654
4870  0a6c ae0435        	ldw	x,#1077
4871  0a6f 89            	pushw	x
4872  0a70 5f            	clrw	x
4873  0a71 89            	pushw	x
4874  0a72 ae0008        	ldw	x,#L572
4875  0a75 cd0000        	call	_assert_failed
4877  0a78 5b04          	addw	sp,#4
4878  0a7a               L654:
4879                     ; 1078     if (((uint16_t)CAN_Flag & 0x0700)!= RESET)
4881  0a7a 7b02          	ld	a,(OFST+1,sp)
4882  0a7c a507          	bcp	a,#7
4883  0a7e 272d          	jreq	L3002
4884                     ; 1080         if (((uint16_t)CAN_Flag & 0x020B)!= RESET)
4886  0a80 1e02          	ldw	x,(OFST+1,sp)
4887  0a82 01            	rrwa	x,a
4888  0a83 a40b          	and	a,#11
4889  0a85 01            	rrwa	x,a
4890  0a86 a402          	and	a,#2
4891  0a88 01            	rrwa	x,a
4892  0a89 5d            	tnzw	x
4893  0a8a 2707          	jreq	L5002
4894                     ; 1083             CAN->RFR = (uint8_t)(CAN_Flag);
4896  0a8c 7b03          	ld	a,(OFST+2,sp)
4897  0a8e c75424        	ld	21540,a
4899  0a91 202a          	jra	L5102
4900  0a93               L5002:
4901                     ; 1085         else if (((uint16_t)CAN_Flag & 0x0403)!= RESET)
4903  0a93 1e02          	ldw	x,(OFST+1,sp)
4904  0a95 01            	rrwa	x,a
4905  0a96 a403          	and	a,#3
4906  0a98 01            	rrwa	x,a
4907  0a99 a404          	and	a,#4
4908  0a9b 01            	rrwa	x,a
4909  0a9c 5d            	tnzw	x
4910  0a9d 2707          	jreq	L1102
4911                     ; 1088             CAN->TSR = (uint8_t)(CAN_Flag);
4913  0a9f 7b03          	ld	a,(OFST+2,sp)
4914  0aa1 c75422        	ld	21538,a
4916  0aa4 2017          	jra	L5102
4917  0aa6               L1102:
4918                     ; 1093             CAN->MSR = (uint8_t)(CAN_Flag);
4920  0aa6 7b03          	ld	a,(OFST+2,sp)
4921  0aa8 c75421        	ld	21537,a
4922  0aab 2010          	jra	L5102
4923  0aad               L3002:
4924                     ; 1099         can_page = CAN_GetSelectedPage();
4926  0aad cd0d72        	call	_CAN_GetSelectedPage
4928  0ab0 6b01          	ld	(OFST+0,sp),a
4930                     ; 1102         CAN->PSR = CAN_Page_Config;
4932  0ab2 35065427      	mov	21543,#6
4933                     ; 1103         CAN->Page.Config.ESR = (uint8_t)RESET;
4935  0ab6 725f5428      	clr	21544
4936                     ; 1106         CAN_SelectPage(can_page);
4938  0aba cd0d76        	call	_CAN_SelectPage
4940  0abd               L5102:
4941                     ; 1108 }
4944  0abd 5b03          	addw	sp,#3
4945  0abf 81            	ret	
5024                     ; 1115 FlagStatus CAN_GetFlagStatus(CAN_FLAG_TypeDef CAN_Flag)
5024                     ; 1116 {
5025                     	switch	.text
5026  0ac0               _CAN_GetFlagStatus:
5028  0ac0 89            	pushw	x
5029  0ac1 89            	pushw	x
5030       00000002      OFST:	set	2
5033                     ; 1117     FlagStatus bitstatus = RESET;
5035                     ; 1118     CAN_Page_TypeDef can_page = (CAN_Page_TypeDef)0;
5037                     ; 1121     assert_param(IS_CAN_FLAG_STATUS_OK(CAN_Flag));
5039  0ac2 a33401        	cpw	x,#13313
5040  0ac5 2740          	jreq	L474
5041  0ac7 a33402        	cpw	x,#13314
5042  0aca 273b          	jreq	L474
5043  0acc a33404        	cpw	x,#13316
5044  0acf 2736          	jreq	L474
5045  0ad1 a31203        	cpw	x,#4611
5046  0ad4 2731          	jreq	L474
5047  0ad6 a33208        	cpw	x,#12808
5048  0ad9 272c          	jreq	L474
5049  0adb a33210        	cpw	x,#12816
5050  0ade 2727          	jreq	L474
5051  0ae0 a33108        	cpw	x,#12552
5052  0ae3 2722          	jreq	L474
5053  0ae5 a31001        	cpw	x,#4097
5054  0ae8 271d          	jreq	L474
5055  0aea a31002        	cpw	x,#4098
5056  0aed 2718          	jreq	L474
5057  0aef a31004        	cpw	x,#4100
5058  0af2 2713          	jreq	L474
5059  0af4 a33070        	cpw	x,#12400
5060  0af7 270e          	jreq	L474
5061  0af9 ae0461        	ldw	x,#1121
5062  0afc 89            	pushw	x
5063  0afd 5f            	clrw	x
5064  0afe 89            	pushw	x
5065  0aff ae0008        	ldw	x,#L572
5066  0b02 cd0000        	call	_assert_failed
5068  0b05 5b04          	addw	sp,#4
5069  0b07               L474:
5070                     ; 1123     if (((uint16_t)CAN_Flag & 0x0700)!= RESET)
5072  0b07 7b03          	ld	a,(OFST+1,sp)
5073  0b09 a507          	bcp	a,#7
5074  0b0b 2753          	jreq	L5502
5075                     ; 1125         if (((uint16_t)CAN_Flag & 0x020B)!= RESET)
5077  0b0d 1e03          	ldw	x,(OFST+1,sp)
5078  0b0f 01            	rrwa	x,a
5079  0b10 a40b          	and	a,#11
5080  0b12 01            	rrwa	x,a
5081  0b13 a402          	and	a,#2
5082  0b15 01            	rrwa	x,a
5083  0b16 5d            	tnzw	x
5084  0b17 2711          	jreq	L7502
5085                     ; 1128             if ((CAN->RFR & (uint16_t)CAN_Flag )!= RESET)
5087  0b19 c65424        	ld	a,21540
5088  0b1c 5f            	clrw	x
5089  0b1d 97            	ld	xl,a
5090  0b1e 01            	rrwa	x,a
5091  0b1f 1404          	and	a,(OFST+2,sp)
5092  0b21 01            	rrwa	x,a
5093  0b22 1403          	and	a,(OFST+1,sp)
5094  0b24 01            	rrwa	x,a
5095  0b25 5d            	tnzw	x
5096  0b26 2734          	jreq	L7702
5097                     ; 1131                 bitstatus = SET;
5099  0b28 202c          	jp	LC020
5100                     ; 1136                 bitstatus = RESET;
5101  0b2a               L7502:
5102                     ; 1140         else if (((uint16_t)CAN_Flag & 0x0403)!= RESET)
5104  0b2a 1e03          	ldw	x,(OFST+1,sp)
5105  0b2c 01            	rrwa	x,a
5106  0b2d a403          	and	a,#3
5107  0b2f 01            	rrwa	x,a
5108  0b30 a404          	and	a,#4
5109  0b32 01            	rrwa	x,a
5110  0b33 5d            	tnzw	x
5111  0b34 2711          	jreq	L7602
5112                     ; 1143             if ((CAN->TSR & (uint16_t)CAN_Flag )!= RESET)
5114  0b36 c65422        	ld	a,21538
5115  0b39 5f            	clrw	x
5116  0b3a 97            	ld	xl,a
5117  0b3b 01            	rrwa	x,a
5118  0b3c 1404          	and	a,(OFST+2,sp)
5119  0b3e 01            	rrwa	x,a
5120  0b3f 1403          	and	a,(OFST+1,sp)
5121  0b41 01            	rrwa	x,a
5122  0b42 5d            	tnzw	x
5123  0b43 2717          	jreq	L7702
5124                     ; 1146                 bitstatus = SET;
5126  0b45 200f          	jp	LC020
5127                     ; 1151                 bitstatus = RESET;
5128  0b47               L7602:
5129                     ; 1157             if ((CAN->MSR & (uint16_t)CAN_Flag )!= RESET)
5131  0b47 c65421        	ld	a,21537
5132  0b4a 5f            	clrw	x
5133  0b4b 97            	ld	xl,a
5134  0b4c 01            	rrwa	x,a
5135  0b4d 1404          	and	a,(OFST+2,sp)
5136  0b4f 01            	rrwa	x,a
5137  0b50 1403          	and	a,(OFST+1,sp)
5138  0b52 01            	rrwa	x,a
5139  0b53 5d            	tnzw	x
5140  0b54 2706          	jreq	L7702
5141                     ; 1160                 bitstatus = SET;
5143  0b56               LC020:
5146  0b56 a601          	ld	a,#1
5147  0b58 6b02          	ld	(OFST+0,sp),a
5150  0b5a 2029          	jra	L3012
5151  0b5c               L7702:
5152                     ; 1165                 bitstatus = RESET;
5156  0b5c 0f02          	clr	(OFST+0,sp)
5158  0b5e 2025          	jra	L3012
5159  0b60               L5502:
5160                     ; 1172         can_page = CAN_GetSelectedPage();
5162  0b60 cd0d72        	call	_CAN_GetSelectedPage
5164  0b63 6b01          	ld	(OFST-1,sp),a
5166                     ; 1174         CAN->PSR = CAN_Page_Config;
5168  0b65 35065427      	mov	21543,#6
5169                     ; 1175         if ((CAN->Page.Config.ESR & (uint16_t)CAN_Flag) != RESET)
5171  0b69 c65428        	ld	a,21544
5172  0b6c 5f            	clrw	x
5173  0b6d 97            	ld	xl,a
5174  0b6e 01            	rrwa	x,a
5175  0b6f 1404          	and	a,(OFST+2,sp)
5176  0b71 01            	rrwa	x,a
5177  0b72 1403          	and	a,(OFST+1,sp)
5178  0b74 01            	rrwa	x,a
5179  0b75 5d            	tnzw	x
5180  0b76 2706          	jreq	L5012
5181                     ; 1178             bitstatus = SET;
5183  0b78 a601          	ld	a,#1
5184  0b7a 6b02          	ld	(OFST+0,sp),a
5187  0b7c 2002          	jra	L7012
5188  0b7e               L5012:
5189                     ; 1183             bitstatus = RESET;
5191  0b7e 0f02          	clr	(OFST+0,sp)
5193  0b80               L7012:
5194                     ; 1186         CAN_SelectPage(can_page);
5196  0b80 7b01          	ld	a,(OFST-1,sp)
5197  0b82 cd0d76        	call	_CAN_SelectPage
5199  0b85               L3012:
5200                     ; 1191     return  (FlagStatus)bitstatus;
5202  0b85 7b02          	ld	a,(OFST+0,sp)
5205  0b87 5b04          	addw	sp,#4
5206  0b89 81            	ret	
5266                     ; 1199 ITStatus CAN_GetITStatus(CAN_IT_TypeDef CAN_IT)
5266                     ; 1200 {
5267                     	switch	.text
5268  0b8a               _CAN_GetITStatus:
5270  0b8a 89            	pushw	x
5271  0b8b 89            	pushw	x
5272       00000002      OFST:	set	2
5275                     ; 1201     ITStatus pendingbitstatus = RESET;
5277                     ; 1202     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
5279  0b8c cd0d72        	call	_CAN_GetSelectedPage
5281  0b8f 6b01          	ld	(OFST-1,sp),a
5283                     ; 1205     assert_param(IS_CAN_IT_STATUS_OK(CAN_IT));
5285  0b91 1e03          	ldw	x,(OFST+1,sp)
5286  0b93 a30001        	cpw	x,#1
5287  0b96 273d          	jreq	L415
5288  0b98 a30002        	cpw	x,#2
5289  0b9b 2738          	jreq	L415
5290  0b9d a30004        	cpw	x,#4
5291  0ba0 2733          	jreq	L415
5292  0ba2 a30008        	cpw	x,#8
5293  0ba5 272e          	jreq	L415
5294  0ba7 a30080        	cpw	x,#128
5295  0baa 2729          	jreq	L415
5296  0bac a34000        	cpw	x,#16384
5297  0baf 2724          	jreq	L415
5298  0bb1 a30100        	cpw	x,#256
5299  0bb4 271f          	jreq	L415
5300  0bb6 a30200        	cpw	x,#512
5301  0bb9 271a          	jreq	L415
5302  0bbb a30400        	cpw	x,#1024
5303  0bbe 2715          	jreq	L415
5304  0bc0 a30800        	cpw	x,#2048
5305  0bc3 2710          	jreq	L415
5306  0bc5 ae04b5        	ldw	x,#1205
5307  0bc8 89            	pushw	x
5308  0bc9 5f            	clrw	x
5309  0bca 89            	pushw	x
5310  0bcb ae0008        	ldw	x,#L572
5311  0bce cd0000        	call	_assert_failed
5313  0bd1 5b04          	addw	sp,#4
5314  0bd3 1e03          	ldw	x,(OFST+1,sp)
5315  0bd5               L415:
5316                     ; 1208     switch (CAN_IT)
5319                     ; 1321         break;
5320  0bd5 5a            	decw	x
5321  0bd6 273a          	jreq	L1112
5322  0bd8 5a            	decw	x
5323  0bd9 2747          	jreq	L3112
5324  0bdb 1d0002        	subw	x,#2
5325  0bde 2752          	jreq	L5112
5326  0be0 1d0004        	subw	x,#4
5327  0be3 275a          	jreq	L7112
5328  0be5 1d0078        	subw	x,#120
5329  0be8 2764          	jreq	L1212
5330  0bea 1d0080        	subw	x,#128
5331  0bed 2603cc0c76    	jreq	L5212
5332  0bf2 1d0100        	subw	x,#256
5333  0bf5 2603cc0c87    	jreq	L7212
5334  0bfa 1d0200        	subw	x,#512
5335  0bfd 2603cc0c9a    	jreq	L1312
5336  0c02 1d0400        	subw	x,#1024
5337  0c05 2603cc0cad    	jreq	L3312
5338  0c0a 1d3800        	subw	x,#14336
5339  0c0d 2754          	jreq	L3212
5340                     ; 1319     default :
5340                     ; 1320         pendingbitstatus = RESET;
5341                     ; 1321         break;
5343  0c0f cc0cbe        	jp	L5322
5344  0c12               L1112:
5345                     ; 1210     case CAN_IT_TME:
5345                     ; 1211         if ((CAN->IER & CAN_IER_TMEIE) !=RESET)
5347  0c12 7201542508    	btjf	21541,#0,L1712
5348                     ; 1213             pendingbitstatus = CheckITStatus(CAN->TSR, CAN_TSR_RQCP012);
5350  0c17 c65422        	ld	a,21538
5351  0c1a ae0007        	ldw	x,#7
5354  0c1d 203a          	jp	LC022
5355  0c1f               L1712:
5356                     ; 1217             pendingbitstatus = RESET;
5357  0c1f cc0cbe        	jp	L5322
5358  0c22               L3112:
5359                     ; 1221     case CAN_IT_FMP:
5359                     ; 1222         if ((CAN->IER & CAN_IER_FMPIE) !=RESET)
5361  0c22 7203542508    	btjf	21541,#1,L5712
5362                     ; 1224             pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FMP01);
5364  0c27 c65424        	ld	a,21540
5365  0c2a ae0003        	ldw	x,#3
5368  0c2d 202a          	jp	LC022
5369  0c2f               L5712:
5370                     ; 1228             pendingbitstatus = RESET;
5371  0c2f cc0cbe        	jp	L5322
5372  0c32               L5112:
5373                     ; 1231     case CAN_IT_FF:
5373                     ; 1232         if ((CAN->IER & CAN_IER_FFIE) !=RESET)
5375  0c32 7205542505    	btjf	21541,#2,L1022
5376                     ; 1234             pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FULL);
5378  0c37 c65424        	ld	a,21540
5381  0c3a 201a          	jp	LC023
5382  0c3c               L1022:
5383                     ; 1238             pendingbitstatus = RESET;
5384  0c3c cc0cbe        	jp	L5322
5385  0c3f               L7112:
5386                     ; 1241     case CAN_IT_FOV:
5386                     ; 1242         if ((CAN->IER & CAN_IER_FOVIE) !=RESET)
5388  0c3f 7207542508    	btjf	21541,#3,L5022
5389                     ; 1244             pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FOVR);
5391  0c44 c65424        	ld	a,21540
5392  0c47 ae0010        	ldw	x,#16
5395  0c4a 200d          	jp	LC022
5396  0c4c               L5022:
5397                     ; 1248             pendingbitstatus = RESET;
5398  0c4c 2070          	jp	L5322
5399  0c4e               L1212:
5400                     ; 1251     case CAN_IT_WKU:
5400                     ; 1252         if ((CAN->IER & CAN_IER_WKUIE) !=RESET)
5402  0c4e 720f54250e    	btjf	21541,#7,L1122
5403                     ; 1254             pendingbitstatus = CheckITStatus(CAN->MSR, CAN_MSR_WKUI);
5405  0c53 c65421        	ld	a,21537
5406  0c56               LC023:
5407  0c56 ae0008        	ldw	x,#8
5409  0c59               LC022:
5410  0c59 95            	ld	xh,a
5411  0c5a cd0d7a        	call	L3_CheckITStatus
5412  0c5d 6b02          	ld	(OFST+0,sp),a
5415  0c5f 205f          	jra	L7612
5416  0c61               L1122:
5417                     ; 1258             pendingbitstatus = RESET;
5418  0c61 205b          	jp	L5322
5419  0c63               L3212:
5420                     ; 1262     case CAN_IT_ERR:
5420                     ; 1263         CAN->PSR = CAN_Page_Config;
5422  0c63 35065427      	mov	21543,#6
5423                     ; 1264         if ((CAN->Page.Config.EIER & CAN_EIER_ERRIE) !=RESET)
5425  0c67 720f542908    	btjf	21545,#7,L5122
5426                     ; 1266             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF|CAN_ESR_EPVF|CAN_ESR_BOFF|CAN_ESR_LEC);
5428  0c6c c65428        	ld	a,21544
5429  0c6f ae0077        	ldw	x,#119
5432  0c72 20e5          	jp	LC022
5433  0c74               L5122:
5434                     ; 1270             pendingbitstatus = RESET;
5435  0c74 2048          	jp	L5322
5436  0c76               L5212:
5437                     ; 1274     case CAN_IT_EWG:
5437                     ; 1275         CAN->PSR = CAN_Page_Config;
5439  0c76 35065427      	mov	21543,#6
5440                     ; 1276         if ((CAN->Page.Config.EIER & CAN_EIER_EWGIE) !=RESET)
5442  0c7a 7201542906    	btjf	21545,#0,L1222
5443                     ; 1278             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF);
5445  0c7f c65428        	ld	a,21544
5446  0c82 5c            	incw	x
5449  0c83 20d4          	jp	LC022
5450  0c85               L1222:
5451                     ; 1282             pendingbitstatus = RESET;
5452  0c85 2037          	jp	L5322
5453  0c87               L7212:
5454                     ; 1286     case CAN_IT_EPV:
5454                     ; 1287         CAN->PSR = CAN_Page_Config;
5456  0c87 35065427      	mov	21543,#6
5457                     ; 1288         if ((CAN->Page.Config.EIER & CAN_EIER_EPVIE) !=RESET)
5459  0c8b 7203542908    	btjf	21545,#1,L5222
5460                     ; 1290             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EPVF);
5462  0c90 c65428        	ld	a,21544
5463  0c93 ae0002        	ldw	x,#2
5466  0c96 20c1          	jp	LC022
5467  0c98               L5222:
5468                     ; 1294             pendingbitstatus = RESET;
5469  0c98 2024          	jp	L5322
5470  0c9a               L1312:
5471                     ; 1297     case CAN_IT_BOF:
5471                     ; 1298         CAN->PSR = CAN_Page_Config;
5473  0c9a 35065427      	mov	21543,#6
5474                     ; 1299         if ((CAN->Page.Config.EIER & CAN_EIER_BOFIE) !=RESET)
5476  0c9e 7205542908    	btjf	21545,#2,L1322
5477                     ; 1301             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_BOFF);
5479  0ca3 c65428        	ld	a,21544
5480  0ca6 ae0004        	ldw	x,#4
5483  0ca9 20ae          	jp	LC022
5484  0cab               L1322:
5485                     ; 1305             pendingbitstatus = RESET;
5486  0cab 2011          	jp	L5322
5487  0cad               L3312:
5488                     ; 1308     case CAN_IT_LEC:
5488                     ; 1309         CAN->PSR = CAN_Page_Config;
5490  0cad 35065427      	mov	21543,#6
5491                     ; 1310         if ((CAN->Page.Config.EIER & CAN_EIER_LECIE) !=RESET)
5493  0cb1 7209542908    	btjf	21545,#4,L5322
5494                     ; 1312             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_LEC);
5496  0cb6 c65428        	ld	a,21544
5497  0cb9 ae0070        	ldw	x,#112
5500  0cbc 209b          	jp	LC022
5501  0cbe               L5322:
5502                     ; 1316             pendingbitstatus = RESET;
5514  0cbe 0f02          	clr	(OFST+0,sp)
5516  0cc0               L7612:
5517                     ; 1324     CAN_SelectPage(can_page);
5519  0cc0 7b01          	ld	a,(OFST-1,sp)
5520  0cc2 cd0d76        	call	_CAN_SelectPage
5522                     ; 1326     return  (ITStatus)pendingbitstatus;
5524  0cc5 7b02          	ld	a,(OFST+0,sp)
5527  0cc7 5b04          	addw	sp,#4
5528  0cc9 81            	ret	
5577                     ; 1344 void CAN_ClearITPendingBit(CAN_IT_TypeDef CAN_IT)
5577                     ; 1345 {
5578                     	switch	.text
5579  0cca               _CAN_ClearITPendingBit:
5581  0cca 89            	pushw	x
5582  0ccb 88            	push	a
5583       00000001      OFST:	set	1
5586                     ; 1346     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
5588  0ccc cd0d72        	call	_CAN_GetSelectedPage
5590  0ccf 6b01          	ld	(OFST+0,sp),a
5592                     ; 1348     assert_param(IS_CAN_IT_PENDING_BIT_OK(CAN_IT));
5594  0cd1 1e02          	ldw	x,(OFST+1,sp)
5595  0cd3 a30001        	cpw	x,#1
5596  0cd6 2738          	jreq	L655
5597  0cd8 a30004        	cpw	x,#4
5598  0cdb 2733          	jreq	L655
5599  0cdd a30008        	cpw	x,#8
5600  0ce0 272e          	jreq	L655
5601  0ce2 a30080        	cpw	x,#128
5602  0ce5 2729          	jreq	L655
5603  0ce7 a34000        	cpw	x,#16384
5604  0cea 2724          	jreq	L655
5605  0cec a30100        	cpw	x,#256
5606  0cef 271f          	jreq	L655
5607  0cf1 a30200        	cpw	x,#512
5608  0cf4 271a          	jreq	L655
5609  0cf6 a30400        	cpw	x,#1024
5610  0cf9 2715          	jreq	L655
5611  0cfb a30800        	cpw	x,#2048
5612  0cfe 2710          	jreq	L655
5613  0d00 ae0544        	ldw	x,#1348
5614  0d03 89            	pushw	x
5615  0d04 5f            	clrw	x
5616  0d05 89            	pushw	x
5617  0d06 ae0008        	ldw	x,#L572
5618  0d09 cd0000        	call	_assert_failed
5620  0d0c 5b04          	addw	sp,#4
5621  0d0e 1e02          	ldw	x,(OFST+1,sp)
5622  0d10               L655:
5623                     ; 1350     switch (CAN_IT)
5626                     ; 1393     default :
5626                     ; 1394         break;
5627  0d10 5a            	decw	x
5628  0d11 272a          	jreq	L1422
5629  0d13 1d0003        	subw	x,#3
5630  0d16 272b          	jreq	L3422
5631  0d18 1d0004        	subw	x,#4
5632  0d1b 272c          	jreq	L5422
5633  0d1d 1d0078        	subw	x,#120
5634  0d20 272d          	jreq	L7422
5635  0d22 1d0080        	subw	x,#128
5636  0d25 2736          	jreq	L3522
5637  0d27 1d0100        	subw	x,#256
5638  0d2a 2731          	jreq	L3522
5639  0d2c 1d0200        	subw	x,#512
5640  0d2f 272c          	jreq	L3522
5641  0d31 1d0400        	subw	x,#1024
5642  0d34 272d          	jreq	L1622
5643  0d36 1d3800        	subw	x,#14336
5644  0d39 271a          	jreq	L1522
5645  0d3b 202e          	jra	L1132
5646  0d3d               L1422:
5647                     ; 1352     case CAN_IT_TME:
5647                     ; 1353         CAN->TSR = CAN_TSR_RQCP012;/* rc_w1*/
5649  0d3d 35075422      	mov	21538,#7
5650                     ; 1354         break;
5652  0d41 2028          	jra	L1132
5653  0d43               L3422:
5654                     ; 1356     case CAN_IT_FF:
5654                     ; 1357         CAN->RFR = CAN_RFR_FULL; /* rc_w1*/
5656  0d43 35085424      	mov	21540,#8
5657                     ; 1358         break;
5659  0d47 2022          	jra	L1132
5660  0d49               L5422:
5661                     ; 1360     case CAN_IT_FOV:
5661                     ; 1361         CAN->RFR = CAN_RFR_FOVR; /* rc_w1*/
5663  0d49 35105424      	mov	21540,#16
5664                     ; 1362         break;
5666  0d4d 201c          	jra	L1132
5667  0d4f               L7422:
5668                     ; 1364     case CAN_IT_WKU:
5668                     ; 1365         CAN->MSR = CAN_MSR_WKUI;  /* rc_w1*/
5670  0d4f 35085421      	mov	21537,#8
5671                     ; 1366         break;
5673  0d53 2016          	jra	L1132
5674  0d55               L1522:
5675                     ; 1368     case CAN_IT_ERR:
5675                     ; 1369         CAN->PSR = CAN_Page_Config;
5677  0d55 35065427      	mov	21543,#6
5678                     ; 1370         CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
5680  0d59 725f5428      	clr	21544
5681                     ; 1371         CAN->MSR = CAN_MSR_ERRI;
5682                     ; 1372         break;
5684  0d5d               L3522:
5685                     ; 1374     case CAN_IT_EWG:
5685                     ; 1375         CAN->MSR = CAN_MSR_ERRI;
5686                     ; 1376         break;
5688                     ; 1378     case CAN_IT_EPV:
5688                     ; 1379         CAN->MSR = CAN_MSR_ERRI;
5689                     ; 1380         break;
5691                     ; 1382     case CAN_IT_BOF:
5691                     ; 1383         CAN->MSR = CAN_MSR_ERRI;
5696  0d5d 35045421      	mov	21537,#4
5697                     ; 1384         break;
5699  0d61 2008          	jra	L1132
5700  0d63               L1622:
5701                     ; 1386     case CAN_IT_LEC:
5701                     ; 1387         CAN->PSR = CAN_Page_Config;
5703  0d63 35065427      	mov	21543,#6
5704                     ; 1388         CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
5706  0d67 725f5428      	clr	21544
5707                     ; 1389         break;
5709                     ; 1393     default :
5709                     ; 1394         break;
5711  0d6b               L1132:
5712                     ; 1397     CAN_SelectPage(can_page);
5714  0d6b 7b01          	ld	a,(OFST+0,sp)
5715  0d6d ad07          	call	_CAN_SelectPage
5717                     ; 1398 }
5720  0d6f 5b03          	addw	sp,#3
5721  0d71 81            	ret	
5746                     ; 1405 CAN_Page_TypeDef CAN_GetSelectedPage(void)
5746                     ; 1406 {
5747                     	switch	.text
5748  0d72               _CAN_GetSelectedPage:
5752                     ; 1407     return (CAN_Page_TypeDef)(CAN->PSR);
5754  0d72 c65427        	ld	a,21543
5757  0d75 81            	ret	
5792                     ; 1415 void CAN_SelectPage(CAN_Page_TypeDef CAN_Page)
5792                     ; 1416 {
5793                     	switch	.text
5794  0d76               _CAN_SelectPage:
5798                     ; 1417     CAN->PSR = (uint8_t)CAN_Page;
5800  0d76 c75427        	ld	21543,a
5801                     ; 1418 }
5804  0d79 81            	ret	
5854                     ; 1426 static ITStatus CheckITStatus(uint8_t CAN_Reg, uint8_t It_Bit)
5854                     ; 1427 {
5855                     	switch	.text
5856  0d7a               L3_CheckITStatus:
5858  0d7a 89            	pushw	x
5859  0d7b 88            	push	a
5860       00000001      OFST:	set	1
5863                     ; 1428     ITStatus pendingbitstatus = RESET;
5865                     ; 1429     if ((CAN_Reg & It_Bit) != (uint8_t)RESET)
5867  0d7c 9f            	ld	a,xl
5868  0d7d 1402          	and	a,(OFST+1,sp)
5869  0d7f 2702          	jreq	L3632
5870                     ; 1432         pendingbitstatus = SET;
5872  0d81 a601          	ld	a,#1
5875  0d83               L3632:
5876                     ; 1437         pendingbitstatus = RESET;
5879                     ; 1439     return (ITStatus)pendingbitstatus;
5883  0d83 5b03          	addw	sp,#3
5884  0d85 81            	ret	
5954                     	xdef	__FMI
5955                     	xdef	__Data
5956                     	xdef	__DLC
5957                     	xdef	__RTR
5958                     	xdef	__IDE
5959                     	xdef	__Id
5960                     	xdef	_CAN_ClearITPendingBit
5961                     	xdef	_CAN_GetITStatus
5962                     	xdef	_CAN_ClearFlag
5963                     	xdef	_CAN_GetFlagStatus
5964                     	xdef	_CAN_SelectPage
5965                     	xdef	_CAN_GetSelectedPage
5966                     	xdef	_CAN_GetLastErrorCode
5967                     	xdef	_CAN_OperatingModeRequest
5968                     	xdef	_CAN_WakeUp
5969                     	xdef	_CAN_Sleep
5970                     	xdef	_CAN_GetMessageTimeStamp
5971                     	xdef	_CAN_GetReceivedFMI
5972                     	xdef	_CAN_GetReceivedData
5973                     	xdef	_CAN_GetReceivedDLC
5974                     	xdef	_CAN_GetReceivedRTR
5975                     	xdef	_CAN_GetReceivedIDE
5976                     	xdef	_CAN_GetReceivedId
5977                     	xdef	_CAN_Receive
5978                     	xdef	_CAN_MessagePending
5979                     	xdef	_CAN_FIFORelease
5980                     	xdef	_CAN_CancelTransmit
5981                     	xdef	_CAN_TransmitStatus
5982                     	xdef	_CAN_TTComModeCmd
5983                     	xdef	_CAN_Transmit
5984                     	xdef	_CAN_ST7CompatibilityCmd
5985                     	xdef	_CAN_ITConfig
5986                     	xdef	_CAN_FilterInit
5987                     	xdef	_CAN_Init
5988                     	xdef	_CAN_DeInit
5989                     	xref	_assert_failed
5990                     	switch	.const
5991  0008               L572:
5992  0008 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
5993  001a 6965735c7374  	dc.b	"ies\stm8s_stdperip"
5994  002c 685f64726976  	dc.b	"h_driver\src\stm8s"
5995  003e 5f63616e2e63  	dc.b	"_can.c",0
5996                     	xref.b	c_lreg
5997                     	xref.b	c_x
5998                     	xref.b	c_y
6018                     	xref	c_uitol
6019                     	xref	c_uitolx
6020                     	xref	c_llsh
6021                     	xref	c_umul
6022                     	xref	c_lor
6023                     	xref	c_rtol
6024                     	xref	c_lursh
6025                     	xref	c_lgursh
6026                     	xref	c_lcmp
6027                     	xref	c_ltor
6028                     	end
