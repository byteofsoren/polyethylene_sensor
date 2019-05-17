EESchema Schematic File Version 4
LIBS:polythene_sensor-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Entry Wire Line
	6700 3600 6800 3700
Entry Wire Line
	6700 3700 6800 3800
Entry Wire Line
	6700 3800 6800 3900
Entry Wire Line
	6700 3900 6800 4000
Entry Wire Line
	2300 3600 2200 3700
Entry Wire Line
	2300 3700 2200 3800
Entry Wire Line
	2300 3800 2200 3900
Entry Wire Line
	2300 3900 2200 4000
Entry Wire Line
	6700 3200 6800 3300
Wire Wire Line
	2300 3600 2600 3600
Wire Wire Line
	2300 3700 2600 3700
Wire Wire Line
	2300 3800 2600 3800
Wire Wire Line
	2300 3900 2600 3900
$Comp
L 74xx:CD74HC4067M Uin1
U 1 1 5CCDB80B
P 3100 3700
F 0 "Uin1" H 3100 4150 50  0000 C CNN
F 1 "CD74HC4067M" V 3100 3650 50  0000 C CNN
F 2 "Package_SO:SOIC-24W_7.5x15.4mm_P1.27mm" H 4000 2700 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/cd74hc4067.pdf" H 2750 4550 50  0001 C CNN
	1    3100 3700
	1    0    0    -1  
$EndComp
Entry Wire Line
	2300 4300 2200 4400
Wire Wire Line
	2300 4300 2600 4300
Wire Bus Line
	6800 5200 2200 5200
Connection ~ 6800 5200
Text Label 6500 3200 0    50   ~ 0
EN
Text Label 2400 4300 0    50   ~ 0
EN
Text Label 6500 3600 0    50   ~ 0
S0
Text Label 6500 3700 0    50   ~ 0
S1
Text Label 6500 3800 0    50   ~ 0
S2
Text Label 6500 3900 0    50   ~ 0
S3
Text Label 2400 3600 0    50   ~ 0
S4
Text Label 2400 3700 0    50   ~ 0
S5
Text Label 2400 3800 0    50   ~ 0
S6
Text Label 2400 3900 0    50   ~ 0
S7
Wire Wire Line
	3600 3000 4300 3000
Wire Wire Line
	3600 3100 4300 3100
Wire Wire Line
	3600 3200 4300 3200
Wire Wire Line
	3600 3300 4300 3300
Wire Wire Line
	3600 3400 4300 3400
Wire Wire Line
	3600 3500 4300 3500
Wire Wire Line
	3600 3600 4300 3600
Wire Wire Line
	3600 3700 4300 3700
Wire Wire Line
	3600 3800 4300 3800
Wire Wire Line
	3600 3900 4300 3900
Wire Wire Line
	3600 4000 4300 4000
Wire Wire Line
	3600 4100 4300 4100
Wire Wire Line
	3600 4200 4300 4200
Wire Wire Line
	3600 4300 4300 4300
Wire Wire Line
	3600 4400 4300 4400
Wire Wire Line
	3600 4500 4300 4500
$Comp
L Diode:BZT52Bxx Dprot1
U 1 1 5CDA8F07
P 6550 4450
F 0 "Dprot1" V 6504 4529 50  0000 L CNN
F 1 "BZT52Bxx" V 6595 4529 50  0000 L CNN
F 2 "Diodes_SMD:D_SOD-123" H 6550 4275 50  0001 C CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bzt52b2v4.pdf" H 6550 4450 50  0001 C CNN
	1    6550 4450
	0    1    1    0   
$EndComp
$Comp
L Device:R Rref1
U 1 1 5CDBA01B
P 7150 4450
F 0 "Rref1" H 7220 4496 50  0000 L CNN
F 1 "R" H 7220 4405 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7080 4450 50  0001 C CNN
F 3 "~" H 7150 4450 50  0001 C CNN
	1    7150 4450
	1    0    0    -1  
$EndComp
Connection ~ 6550 4300
Wire Wire Line
	6550 4600 6550 4700
Wire Wire Line
	7150 4700 7150 4600
Wire Wire Line
	6550 4300 7150 4300
Connection ~ 7150 4300
$Comp
L power:GND #PWR07
U 1 1 5CDC317B
P 7000 4800
F 0 "#PWR07" H 7000 4550 50  0001 C CNN
F 1 "GND" H 7005 4627 50  0000 C CNN
F 2 "" H 7000 4800 50  0001 C CNN
F 3 "" H 7000 4800 50  0001 C CNN
	1    7000 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4500 5450 4500
Wire Wire Line
	4800 4400 5450 4400
Wire Wire Line
	4800 4300 5450 4300
Wire Wire Line
	4800 4200 5450 4200
Wire Wire Line
	4800 4100 5450 4100
Wire Wire Line
	4800 4000 5450 4000
Wire Wire Line
	4800 3900 5450 3900
Wire Wire Line
	4800 3700 5450 3700
Wire Wire Line
	4800 3600 5450 3600
Wire Wire Line
	4800 3500 5450 3500
Wire Wire Line
	4800 3400 5450 3400
Wire Wire Line
	4800 3800 5450 3800
Wire Wire Line
	4800 3300 5450 3300
Wire Wire Line
	4800 3200 5450 3200
Wire Wire Line
	4800 3100 5450 3100
Wire Wire Line
	4800 3000 5450 3000
Wire Wire Line
	6450 3200 6700 3200
Wire Wire Line
	6450 3700 6700 3700
Wire Wire Line
	6450 3600 6700 3600
Wire Wire Line
	5950 2600 5950 2700
Wire Wire Line
	6450 3800 6700 3800
Wire Wire Line
	6450 3900 6700 3900
Wire Wire Line
	6450 4300 6550 4300
$Comp
L 74xx:CD74HC4067M Uout1
U 1 1 5CCDC541
P 5950 3800
F 0 "Uout1" H 5950 3350 50  0000 C CNN
F 1 "CD74HC4067M" V 5900 3800 50  0000 C CNN
F 2 "Package_SO:SOIC-24W_7.5x15.4mm_P1.27mm" H 6850 2800 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/cd74hc4067.pdf" H 5600 4650 50  0001 C CNN
	1    5950 3800
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 Jfpow1
U 1 1 5CD4E46C
P 1950 3200
F 0 "Jfpow1" H 1868 3417 50  0000 C CNN
F 1 "Conn_01x02" H 1868 3326 50  0000 C CNN
F 2 "polythene_sensor:MOLEX_104188" H 1950 3200 50  0001 C CNN
F 3 "~" H 1950 3200 50  0001 C CNN
	1    1950 3200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2150 3200 2600 3200
$Comp
L power:GND #PWR0104
U 1 1 5CD80D9F
P 5950 2600
F 0 "#PWR0104" H 5950 2350 50  0001 C CNN
F 1 "GND" H 5955 2427 50  0000 C CNN
F 2 "" H 5950 2600 50  0001 C CNN
F 3 "" H 5950 2600 50  0001 C CNN
	1    5950 2600
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5CDA49EE
P 3800 5000
F 0 "#PWR0107" H 3800 4750 50  0001 C CNN
F 1 "GND" H 3805 4827 50  0000 C CNN
F 2 "" H 3800 5000 50  0001 C CNN
F 3 "" H 3800 5000 50  0001 C CNN
	1    3800 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 4700 7000 4700
Wire Wire Line
	7000 4800 7000 4700
Connection ~ 7000 4700
Wire Wire Line
	7000 4700 7150 4700
$Comp
L power:GND #PWR0108
U 1 1 5CDBFF1F
P 2400 3350
F 0 "#PWR0108" H 2400 3100 50  0001 C CNN
F 1 "GND" H 2405 3177 50  0000 C CNN
F 2 "" H 2400 3350 50  0001 C CNN
F 3 "" H 2400 3350 50  0001 C CNN
	1    2400 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4800 3100 4900
Wire Wire Line
	3100 4900 3800 4900
Wire Wire Line
	3800 4900 3800 5000
Wire Wire Line
	2150 3300 2400 3300
Wire Wire Line
	2400 3300 2400 3350
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5CE879D2
P 7150 4700
F 0 "#FLG01" H 7150 4775 50  0001 C CNN
F 1 "PWR_FLAG" V 7150 4828 50  0000 L CNN
F 2 "" H 7150 4700 50  0001 C CNN
F 3 "~" H 7150 4700 50  0001 C CNN
	1    7150 4700
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 5CE919FA
P 5650 4950
F 0 "#PWR01" H 5650 4800 50  0001 C CNN
F 1 "+5V" H 5665 5123 50  0000 C CNN
F 2 "" H 5650 4950 50  0001 C CNN
F 3 "" H 5650 4950 50  0001 C CNN
	1    5650 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4950 5650 5050
Wire Wire Line
	5650 5050 5950 5050
Wire Wire Line
	5950 5050 5950 4800
$Comp
L power:+5V #PWR02
U 1 1 5CE9BBAC
P 3100 2550
F 0 "#PWR02" H 3100 2400 50  0001 C CNN
F 1 "+5V" H 3115 2723 50  0000 C CNN
F 2 "" H 3100 2550 50  0001 C CNN
F 3 "" H 3100 2550 50  0001 C CNN
	1    3100 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 2550 3100 2700
Text Notes 7350 7500 0    50   ~ 0
Polythene sensor sheald for Arduino
Text Notes 8150 7650 0    50   ~ 0
12 May 2019
Text Notes 8500 6700 2    50   ~ 0
MUX to arduino connection sheame.
Connection ~ 7150 4700
Wire Bus Line
	6800 5200 7800 5200
$Comp
L Connector_Generic:Conn_02x18_Odd_Even J1
U 1 1 5CEEFA8E
P 4500 3700
F 0 "J1" H 4550 4717 50  0000 C CNN
F 1 "Conn_02x18_Odd_Even" H 4550 4626 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x18_P2.54mm_Vertical_SMD" H 4500 3700 50  0001 C CNN
F 3 "~" H 4500 3700 50  0001 C CNN
	1    4500 3700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J2
U 1 1 5CF151F3
P 8850 3850
F 0 "J2" H 8900 4367 50  0000 C CNN
F 1 "Conn_02x08_Odd_Even" H 8900 4276 50  0000 C CNN
F 2 "" H 8850 3850 50  0001 C CNN
F 3 "~" H 8850 3850 50  0001 C CNN
	1    8850 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5CF15D69
P 8500 4450
F 0 "#PWR04" H 8500 4200 50  0001 C CNN
F 1 "GND" H 8505 4277 50  0000 C CNN
F 2 "" H 8500 4450 50  0001 C CNN
F 3 "" H 8500 4450 50  0001 C CNN
	1    8500 4450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 5CF16B03
P 8250 3350
F 0 "#PWR03" H 8250 3200 50  0001 C CNN
F 1 "+5V" H 8265 3523 50  0000 C CNN
F 2 "" H 8250 3350 50  0001 C CNN
F 3 "" H 8250 3350 50  0001 C CNN
	1    8250 3350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 5CF172C7
P 9400 3350
F 0 "#PWR05" H 9400 3200 50  0001 C CNN
F 1 "+5V" H 9415 3523 50  0000 C CNN
F 2 "" H 9400 3350 50  0001 C CNN
F 3 "" H 9400 3350 50  0001 C CNN
	1    9400 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5CF179B3
P 9650 4500
F 0 "#PWR06" H 9650 4250 50  0001 C CNN
F 1 "GND" H 9655 4327 50  0000 C CNN
F 2 "" H 9650 4500 50  0001 C CNN
F 3 "" H 9650 4500 50  0001 C CNN
	1    9650 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 3350 8250 3550
Wire Wire Line
	8250 3550 8650 3550
Wire Wire Line
	8500 4450 8500 4250
Wire Wire Line
	8500 4250 8650 4250
Wire Wire Line
	9400 3350 9400 4250
Wire Wire Line
	9400 4250 9150 4250
Wire Wire Line
	9650 3550 9150 3550
Wire Wire Line
	9650 3550 9650 4500
Connection ~ 7800 5200
Wire Bus Line
	7800 5200 10050 5200
Entry Wire Line
	9950 3650 10050 3750
Entry Wire Line
	9950 3750 10050 3850
Entry Wire Line
	9950 3850 10050 3950
Entry Wire Line
	9950 3950 10050 4050
Wire Wire Line
	9150 3650 9950 3650
Wire Wire Line
	9150 3750 9950 3750
Wire Wire Line
	9150 3850 9950 3850
Wire Wire Line
	9150 3950 9950 3950
Entry Wire Line
	7900 4150 7800 4250
Entry Wire Line
	7900 4050 7800 4150
Entry Wire Line
	7900 3950 7800 4050
Entry Wire Line
	7900 3850 7800 3950
Wire Wire Line
	7900 4150 8650 4150
Wire Wire Line
	7900 4050 8650 4050
Wire Wire Line
	7900 3950 8650 3950
Wire Wire Line
	7900 3850 8650 3850
Wire Wire Line
	7150 2900 8050 2900
Wire Wire Line
	10150 2900 10150 4150
Wire Wire Line
	7150 2900 7150 4300
Wire Wire Line
	8650 3650 8050 3650
Wire Wire Line
	8050 3650 8050 2900
Connection ~ 8050 2900
Wire Wire Line
	8050 2900 10150 2900
Entry Wire Line
	9950 4050 10050 4150
Entry Wire Line
	7900 3750 7800 3850
Wire Wire Line
	7900 3750 8650 3750
Wire Wire Line
	9950 4050 9150 4050
Text Label 8350 4150 0    50   ~ 0
S0
Text Label 8350 4050 0    50   ~ 0
S1
Text Label 8350 3950 0    50   ~ 0
S2
Text Label 8350 3850 0    50   ~ 0
S3
Text Label 8350 3750 0    50   ~ 0
EN
Text Label 9200 3650 0    50   ~ 0
S7
Text Label 9200 3750 0    50   ~ 0
S6
Text Label 9200 3850 0    50   ~ 0
S5
Text Label 9200 3950 0    50   ~ 0
S4
Text Label 9200 4050 0    50   ~ 0
EN
NoConn ~ 4300 2900
NoConn ~ 4800 2900
NoConn ~ 4300 4600
NoConn ~ 4800 4600
Wire Wire Line
	9150 4150 10150 4150
Wire Bus Line
	2200 3700 2200 5200
Wire Bus Line
	6800 3200 6800 5200
Wire Bus Line
	10050 3700 10050 5200
Wire Bus Line
	7800 3700 7800 5200
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5CE2AD6B
P 8250 3350
F 0 "#FLG0101" H 8250 3425 50  0001 C CNN
F 1 "PWR_FLAG" V 8150 3600 50  0000 L CNN
F 2 "" H 8250 3350 50  0001 C CNN
F 3 "~" H 8250 3350 50  0001 C CNN
	1    8250 3350
	0    1    1    0   
$EndComp
Connection ~ 8250 3350
$EndSCHEMATC
