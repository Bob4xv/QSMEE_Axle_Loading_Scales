EESchema Schematic File Version 4
LIBS:QsmeeScales-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Solar Powered Wheel Scales"
Date "2019-09-27"
Rev "1.0"
Comp "QSMEE"
Comment1 "QSMEE Solar Powered Wheel Loading Scales"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Solar_Cells SC1
U 1 1 5D8DEEB3
P 795 2360
F 0 "SC1" H 903 2406 50  0000 L CNN
F 1 "Solar_Cells" H 903 2315 50  0000 L CNN
F 2 "" V 795 2420 50  0001 C CNN
F 3 "~" V 795 2420 50  0001 C CNN
	1    795  2360
	1    0    0    -1  
$EndComp
$Comp
L Sensor:Load_cell U1
U 1 1 5D955F8C
P 10195 4255
F 0 "U1" H 10790 4345 50  0000 L CNN
F 1 "Load_cell" H 10790 4245 50  0000 L CNN
F 2 "" H 10195 3555 50  0001 C TNN
F 3 "http://www.robotshop.com/media/files/pdf/datasheet-3134.pdf" H 10195 3455 50  0001 C TNN
	1    10195 4255
	1    0    0    -1  
$EndComp
$Comp
L Sensor:Load_cell U2
U 1 1 5D957F51
P 10195 5685
F 0 "U2" H 10800 5750 50  0000 L CNN
F 1 "Load_cell" H 10800 5650 50  0000 L CNN
F 2 "" H 10195 4985 50  0001 C TNN
F 3 "http://www.robotshop.com/media/files/pdf/datasheet-3134.pdf" H 10195 4885 50  0001 C TNN
	1    10195 5685
	1    0    0    -1  
$EndComp
Wire Notes Line
	4990 6870 5880 6870
Wire Notes Line
	3750 6795 4450 6795
Wire Notes Line
	1350 2130 1835 2130
Wire Notes Line
	1835 2130 1835 2625
Wire Notes Line
	1835 2625 1350 2625
Wire Notes Line
	1350 2625 1350 2130
Text Notes 1360 2425 0    25   ~ 0
Input 9-30V\n Inverter \noutput 8.50V
Wire Notes Line
	2510 2220 3005 2220
Wire Notes Line
	3005 2220 3005 2720
Wire Notes Line
	3005 2720 2510 2720
Wire Notes Line
	2510 2720 2510 2220
Text Notes 2540 2485 0    25   ~ 0
LiPo Ballance\nCharger
Wire Notes Line
	4450 6270 3750 6270
Wire Notes Line
	4450 6795 4450 6270
Wire Notes Line
	3750 6270 3750 6795
Text Notes 3765 6770 0    50   ~ 0
LC4103-K100\n\n  Red  -->E+\n  White -->E-\n  Blue  -->A-\n  Green -->A+
Text Label 6710 3175 0    50   ~ 0
Led_CS
Text Label 6720 3375 0    50   ~ 0
Led_Data
Wire Wire Line
	6435 4945 6790 4945
Wire Wire Line
	6435 3175 6435 4945
Wire Wire Line
	6560 3375 6560 4845
Wire Wire Line
	6790 4845 6560 4845
Wire Wire Line
	3805 1635 3910 1635
$Comp
L Device:D_Schottky D2
U 1 1 5D919B49
P 3655 1635
F 0 "D2" H 3610 1910 50  0000 C CNN
F 1 "50SQ30" H 3610 1810 50  0000 C CNN
F 2 "" H 3655 1635 50  0001 C CNN
F 3 "~" H 3655 1635 50  0001 C CNN
	1    3655 1635
	-1   0    0    -1  
$EndComp
Wire Notes Line
	5880 6230 4990 6230
Wire Notes Line
	5880 6870 5880 6230
Wire Notes Line
	4990 6230 4990 6870
Text Notes 4895 6845 0    50   ~ 0
            Red--->E+\n            Black-->E-\n            White-->A-\n    Green/Blue-->A+\n        Yellow ->Shield
Text Notes 5205 6395 0    50   ~ 0
Common Load\nCell Colours
Connection ~ 6635 4745
Wire Wire Line
	5515 5995 6400 5995
Wire Wire Line
	5515 4745 5515 5995
Wire Wire Line
	6635 4745 5515 4745
Wire Wire Line
	5585 5895 6400 5895
Wire Wire Line
	5585 2575 5585 5895
Wire Wire Line
	5655 2675 7105 2675
Wire Wire Line
	5655 5795 6400 5795
Wire Wire Line
	5655 2675 5655 5795
Connection ~ 6715 4355
Wire Wire Line
	6290 5695 6400 5695
Wire Wire Line
	6290 4355 6290 5695
Wire Wire Line
	6715 4355 6290 4355
Wire Notes Line
	8240 5425 6410 5425
Wire Notes Line
	8240 6190 8240 5425
Wire Notes Line
	6410 6190 8240 6190
Wire Notes Line
	6410 5425 6410 6190
Text Notes 7940 6150 0    50   ~ 0
E+
Text Notes 7940 6035 0    50   ~ 0
E-
Text Notes 7935 5935 0    50   ~ 0
A-
Text Notes 7935 5840 0    50   ~ 0
A+
Text Notes 7930 5740 0    50   ~ 0
B-
Text Notes 7920 5640 0    50   ~ 0
B+
Text Notes 6615 6035 0    50   ~ 0
Gnd
Text Notes 6630 5930 0    50   ~ 0
DT
Text Notes 6625 5825 0    50   ~ 0
Sck
Text Notes 6620 5725 0    50   ~ 0
VCC
$Comp
L Connector:Conn_01x06_Male J12
U 1 1 5D9395D5
P 8065 5820
F 0 "J12" H 8110 6150 50  0000 C CNN
F 1 "Load Cell" H 7715 5990 50  0000 C CNN
F 2 "" H 8065 5820 50  0001 C CNN
F 3 "~" H 8065 5820 50  0001 C CNN
	1    8065 5820
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J10
U 1 1 5D937C6D
P 6600 5795
F 0 "J10" H 6565 6095 50  0000 R CNN
F 1 "HX711 Load cell A/D" H 6415 5705 50  0000 R CNN
F 2 "" H 6600 5795 50  0001 C CNN
F 3 "~" H 6600 5795 50  0001 C CNN
	1    6600 5795
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6715 4355 6715 4645
Wire Wire Line
	9075 4355 6715 4355
Wire Wire Line
	9075 1430 9075 4355
Wire Wire Line
	7805 1430 9075 1430
Wire Wire Line
	6560 3375 7105 3375
Wire Notes Line
	8055 4550 6775 4550
Wire Notes Line
	8055 5140 8055 4550
Wire Notes Line
	6775 5140 8055 5140
Wire Notes Line
	6775 4550 6775 5140
Wire Wire Line
	6635 4100 7505 4100
Connection ~ 6635 4100
Wire Wire Line
	6635 4745 6635 4100
Wire Wire Line
	6790 4745 6635 4745
Wire Wire Line
	6715 4645 6790 4645
Wire Wire Line
	7805 1775 7805 1430
Wire Wire Line
	7105 3175 6435 3175
Wire Wire Line
	6500 5045 6790 5045
Wire Wire Line
	6500 3275 6500 5045
Text Notes 7005 5075 0    50   ~ 0
CLK
Text Notes 7005 4980 0    50   ~ 0
LOAD
Text Notes 7005 4875 0    50   ~ 0
Din
Text Notes 6995 4775 0    50   ~ 0
GND
Text Notes 6995 4680 0    50   ~ 0
VCC
$Comp
L Connector:Conn_01x05_Male J11
U 1 1 5D910D3D
P 6990 4845
F 0 "J11" H 6470 4895 50  0000 R CNN
F 1 "7 Seg Display" H 6620 4800 50  0000 R CNN
F 2 "" H 6990 4845 50  0001 C CNN
F 3 "~" H 6990 4845 50  0001 C CNN
	1    6990 4845
	-1   0    0    -1  
$EndComp
Connection ~ 7505 4100
Wire Wire Line
	8775 4100 7505 4100
Text Label 6710 3275 0    50   ~ 0
Led_Clk
Wire Wire Line
	7105 3275 6500 3275
Text Label 6845 2675 0    50   ~ 0
SCK
Text Label 6830 2575 0    50   ~ 0
DOUT
Wire Wire Line
	5245 1635 7505 1635
Connection ~ 5245 1635
Wire Wire Line
	5245 1080 5245 1635
Wire Wire Line
	5065 1080 5245 1080
Wire Wire Line
	4525 1635 4660 1635
Connection ~ 4525 1635
Wire Wire Line
	4525 1080 4525 1635
Wire Wire Line
	4665 1080 4525 1080
$Comp
L Switch:SW_Push SW2
U 1 1 5D8FFC7B
P 5160 3710
F 0 "SW2" H 5170 4020 50  0000 C CNN
F 1 "Zero" H 5170 3920 50  0000 C CNN
F 2 "" H 5160 3910 50  0001 C CNN
F 3 "~" H 5160 3910 50  0001 C CNN
	1    5160 3710
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 5D8FE41E
P 4865 1080
F 0 "SW1" H 4880 1385 50  0000 C CNN
F 1 "Power on" H 4880 1285 50  0000 C CNN
F 2 "" H 4865 1280 50  0001 C CNN
F 3 "~" H 4865 1280 50  0001 C CNN
	1    4865 1080
	1    0    0    -1  
$EndComp
Wire Wire Line
	4260 3260 5510 3260
Wire Wire Line
	4260 3035 4260 3260
Wire Wire Line
	7505 1635 7505 1775
Wire Wire Line
	5060 1635 5245 1635
Connection ~ 4860 3090
Wire Wire Line
	7505 4100 7505 3875
Wire Wire Line
	4860 3090 4860 3710
Wire Wire Line
	4510 3090 4860 3090
Connection ~ 4510 3090
Wire Wire Line
	4510 3035 4510 3090
Wire Wire Line
	4510 2735 4560 2735
Connection ~ 4510 2735
Wire Wire Line
	4260 2735 4510 2735
Wire Wire Line
	4860 3090 4860 2935
Wire Wire Line
	4860 2085 4860 2535
Connection ~ 4860 2085
Wire Wire Line
	4260 2085 4860 2085
Wire Wire Line
	4860 1935 4860 2085
Wire Wire Line
	4260 1635 4525 1635
Connection ~ 4260 1635
Wire Wire Line
	4260 1785 4260 1635
Wire Wire Line
	4210 1635 4260 1635
$Comp
L Device:Q_PMOS_GDSD Q2
U 1 1 5D92279A
P 4860 1735
F 0 "Q2" V 5310 1735 50  0000 C CNN
F 1 "IRF9630" V 5210 1735 50  0000 C CNN
F 2 "" H 5060 1835 50  0001 C CNN
F 3 "~" H 4860 1735 50  0001 C CNN
	1    4860 1735
	0    1    -1   0   
$EndComp
Wire Wire Line
	3360 2385 3360 2405
$Comp
L Transistor_BJT:BC548 Q1
U 1 1 5D8EA471
P 4760 2735
F 0 "Q1" H 4951 2781 50  0000 L CNN
F 1 "BC548" H 4951 2690 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4960 2660 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 4760 2735 50  0001 L CNN
	1    4760 2735
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse F1
U 1 1 5D90EE37
P 4060 1635
F 0 "F1" V 3810 1635 50  0000 C CNN
F 1 "1A" V 3910 1635 50  0000 C CNN
F 2 "" V 3990 1635 50  0001 C CNN
F 3 "~" H 4060 1635 50  0001 C CNN
	1    4060 1635
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5D8FE896
P 4260 2885
F 0 "R2" H 4330 2931 50  0000 L CNN
F 1 "R" H 4330 2840 50  0000 L CNN
F 2 "" V 4190 2885 50  0001 C CNN
F 3 "~" H 4260 2885 50  0001 C CNN
	1    4260 2885
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5D8FE381
P 4510 2885
F 0 "R3" H 4610 2935 50  0000 L CNN
F 1 "10k" H 4610 2885 50  0000 L CNN
F 2 "" V 4440 2885 50  0001 C CNN
F 3 "~" H 4510 2885 50  0001 C CNN
	1    4510 2885
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5D8FDD47
P 4260 1935
F 0 "R1" H 4330 1981 50  0000 L CNN
F 1 "100k" H 4330 1890 50  0000 L CNN
F 2 "" V 4190 1935 50  0001 C CNN
F 3 "~" H 4260 1935 50  0001 C CNN
	1    4260 1935
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery_Cell BT2
U 1 1 5D8DD84B
P 3360 2630
F 0 "BT2" H 3510 2775 50  0000 L CNN
F 1 "18650" H 3510 2675 50  0000 L CNN
F 2 "" V 3360 2690 50  0001 C CNN
F 3 "~" V 3360 2690 50  0001 C CNN
	1    3360 2630
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery_Cell BT1
U 1 1 5D8DCC9C
P 3360 2285
F 0 "BT1" H 3510 2385 50  0000 L CNN
F 1 "18650" H 3495 2305 50  0000 L CNN
F 2 "" V 3360 2345 50  0001 C CNN
F 3 "~" V 3360 2345 50  0001 C CNN
	1    3360 2285
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D1
U 1 1 5DBB2D8C
P 2175 2270
F 0 "D1" H 2130 2545 50  0000 C CNN
F 1 "50SQ30" H 2130 2445 50  0000 C CNN
F 2 "" H 2175 2270 50  0001 C CNN
F 3 "~" H 2175 2270 50  0001 C CNN
	1    2175 2270
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5510 2375 5510 3260
Wire Wire Line
	5510 2375 7105 2375
Wire Wire Line
	5875 2475 7105 2475
$Comp
L Switch:SW_SP3T SW3
U 1 1 5DBC808E
P 5975 3815
F 0 "SW3" V 6030 3610 50  0000 R CNN
F 1 "Mem+Clr Mem" V 5890 3750 50  0000 R CNN
F 2 "" H 5350 3990 50  0001 C CNN
F 3 "~" H 5350 3990 50  0001 C CNN
	1    5975 3815
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4860 4100 5975 4100
Wire Wire Line
	5975 4015 5975 4100
Connection ~ 5975 4100
Wire Wire Line
	5975 4100 6635 4100
Wire Wire Line
	5875 2475 5875 3615
Text Label 6075 3500 0    25   ~ 0
Mem+
Text Label 5875 3500 0    25   ~ 0
MemClr
Wire Wire Line
	9645 4255 9645 5685
Wire Wire Line
	10745 4255 10745 5685
Wire Wire Line
	10195 3705 9555 3705
Wire Wire Line
	9555 3705 9555 5135
Wire Wire Line
	9555 5135 10195 5135
Wire Wire Line
	10195 4805 9470 4805
Wire Wire Line
	9470 4805 9470 6020
Wire Wire Line
	9470 6235 10195 6235
Wire Wire Line
	8265 6020 9470 6020
Connection ~ 9470 6020
Wire Wire Line
	9470 6020 9470 6235
Wire Wire Line
	9555 5135 9555 6120
Wire Wire Line
	9555 6120 8265 6120
Connection ~ 9555 5135
Wire Wire Line
	8265 5920 9385 5920
Wire Wire Line
	9385 5920 9385 6325
Wire Wire Line
	9385 6325 10745 6325
Wire Wire Line
	10745 6325 10745 5685
Connection ~ 10745 5685
Wire Wire Line
	8265 5820 9645 5820
Wire Wire Line
	9645 5820 9645 5685
Connection ~ 9645 5685
$Comp
L arduino:Arduino_Uno_Shield XA1
U 1 1 5DBFB0AE
P 2885 4870
F 0 "XA1" H 2905 6300 60  0000 C CNN
F 1 "Arduino_Uno_Shield" H 2905 6200 60  0000 C CNN
F 2 "" H 4685 8620 60  0001 C CNN
F 3 "https://store.arduino.cc/arduino-uno-rev3" H 4685 8620 60  0001 C CNN
	1    2885 4870
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J2
U 1 1 5DC7EDBC
P 1435 2270
F 0 "J2" H 1390 2285 50  0000 R CNN
F 1 "In+" H 1500 2355 50  0000 R CNN
F 2 "" H 1435 2270 50  0001 C CNN
F 3 "~" H 1435 2270 50  0001 C CNN
	1    1435 2270
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J1
U 1 1 5DC800D8
P 1430 2495
F 0 "J1" H 1405 2495 50  0000 R CNN
F 1 "In-" H 1495 2450 50  0000 R CNN
F 2 "" H 1430 2495 50  0001 C CNN
F 3 "~" H 1430 2495 50  0001 C CNN
	1    1430 2495
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J3
U 1 1 5DC816A3
P 1765 2270
F 0 "J3" H 1690 2275 50  0000 C CNN
F 1 "Out+" H 1725 2350 50  0000 C CNN
F 2 "" H 1765 2270 50  0001 C CNN
F 3 "~" H 1765 2270 50  0001 C CNN
	1    1765 2270
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J4
U 1 1 5DC82563
P 1765 2495
F 0 "J4" H 1685 2530 50  0000 C CNN
F 1 "Out-" H 1720 2440 50  0000 C CNN
F 2 "" H 1765 2495 50  0001 C CNN
F 3 "~" H 1765 2495 50  0001 C CNN
	1    1765 2495
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J5
U 1 1 5DC82F38
P 2575 2330
F 0 "J5" H 2500 2360 50  0000 R CNN
F 1 "P+" H 2630 2395 50  0000 R CNN
F 2 "" H 2575 2330 50  0001 C CNN
F 3 "~" H 2575 2330 50  0001 C CNN
	1    2575 2330
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J6
U 1 1 5DC84027
P 2585 2585
F 0 "J6" H 2520 2620 50  0000 R CNN
F 1 "P-" H 2635 2530 50  0000 R CNN
F 2 "" H 2585 2585 50  0001 C CNN
F 3 "~" H 2585 2585 50  0001 C CNN
	1    2585 2585
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J7
U 1 1 5DC84AD6
P 2930 2325
F 0 "J7" H 2850 2335 50  0000 C CNN
F 1 "B+" H 2940 2385 50  0000 C CNN
F 2 "" H 2930 2325 50  0001 C CNN
F 3 "~" H 2930 2325 50  0001 C CNN
	1    2930 2325
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J9
U 1 1 5DC85523
P 2945 2605
F 0 "J9" H 2870 2620 50  0000 C CNN
F 1 "B-" H 2940 2555 50  0000 C CNN
F 2 "" H 2945 2605 50  0001 C CNN
F 3 "~" H 2945 2605 50  0001 C CNN
	1    2945 2605
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J8
U 1 1 5DC86347
P 2940 2480
F 0 "J8" H 2860 2545 50  0000 C CNN
F 1 "BM" H 2865 2475 50  0000 C CNN
F 2 "" H 2940 2480 50  0001 C CNN
F 3 "~" H 2940 2480 50  0001 C CNN
	1    2940 2480
	1    0    0    -1  
$EndComp
Wire Wire Line
	795  2160 1235 2160
Wire Wire Line
	1235 2160 1235 2270
Wire Wire Line
	795  2560 1230 2560
Wire Wire Line
	1230 2560 1230 2495
Wire Wire Line
	1965 2270 2025 2270
Wire Wire Line
	2325 2270 2375 2270
Wire Wire Line
	2375 2270 2375 2330
Wire Wire Line
	1965 2495 2385 2495
Wire Wire Line
	2385 2495 2385 2585
Wire Wire Line
	3130 2325 3130 2085
Wire Wire Line
	3130 2085 3360 2085
Wire Wire Line
	3140 2480 3275 2480
Wire Wire Line
	3275 2480 3275 2405
Wire Wire Line
	3275 2405 3360 2405
Connection ~ 3360 2405
Wire Wire Line
	3360 2405 3360 2430
Wire Wire Line
	3145 2605 3205 2605
Wire Wire Line
	3205 2605 3205 2725
Wire Wire Line
	3205 2725 3360 2725
Wire Wire Line
	4960 3710 4860 3710
Connection ~ 4860 3710
Wire Wire Line
	4860 3710 4860 4100
Wire Wire Line
	7105 2875 6180 2875
Wire Wire Line
	6180 2875 6180 3340
Wire Wire Line
	6180 3340 5490 3340
Wire Wire Line
	5490 3340 5490 3710
Wire Wire Line
	5490 3710 5360 3710
Wire Wire Line
	2385 2585 2385 3090
Wire Wire Line
	2385 3090 4510 3090
Connection ~ 2385 2585
Wire Wire Line
	2375 1635 2375 2270
Wire Wire Line
	2375 1635 3505 1635
Connection ~ 2375 2270
Wire Wire Line
	5585 2575 7105 2575
$Comp
L MCU_Module:Arduino_UNO_R3 A1
U 1 1 5D8DB932
P 7605 2775
F 0 "A1" H 7605 3956 50  0000 C CNN
F 1 "Arduino_UNO_R3" H 7605 3865 50  0000 C CNN
F 2 "Module:Arduino_UNO_R3" H 7755 1725 50  0001 L CNN
F 3 "https://www.arduino.cc/en/Main/arduinoBoardUno" H 7405 3825 50  0001 C CNN
	1    7605 2775
	1    0    0    -1  
$EndComp
Wire Wire Line
	7105 2775 6075 2775
Wire Wire Line
	6075 2775 6075 3615
$EndSCHEMATC
