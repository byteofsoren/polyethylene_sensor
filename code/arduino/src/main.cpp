#include "Arduino.h"

#define PINOFSETX 0
#define PINOFSETY 4
#define MAXDATA 40

int data[MAXDATA];


/* -------------------------------------------------- */
/* setmux sets selected pins dependent on the ofset */
/* and the length of the settins */
/* I.e setmux(2,4,6) will set the pattern 0010 to */
/* pins six to ten on the arduino. */
/* -------------------------------------------------- */


void setmux(char data,int len, int offset)
{
    int counter = offset;
    for (int pid = 0; pid < len; pid++) {
        digitalWrite(counter, data&(1 << pid));
        counter++;
    }

}

int read_data(char x, char y)
{
    setmux(x,4,PINOFSETX);
    setmux(y,4,PINOFSETY);
    return analogRead(A0);
}


/* insert_start */
void getdata(){
	data[0] = read_data(1,1);
	data[1] = read_data(1,2);
	data[2] = read_data(1,4);
	data[3] = read_data(2,2);
	data[4] = read_data(2,3);
	data[5] = read_data(2,5);
	data[6] = read_data(3,1);
	data[7] = read_data(3,4);
	data[8] = read_data(3,6);
	data[9] = read_data(4,2);
	data[10] = read_data(4,4);
	data[11] = read_data(4,5);
	data[12] = read_data(4,7);
	data[13] = read_data(5,3);
	data[14] = read_data(5,5);
	data[15] = read_data(5,8);
	data[16] = read_data(6,4);
	data[17] = read_data(6,6);
	data[18] = read_data(6,7);
	data[19] = read_data(6,9);
	data[20] = read_data(7,5);
	data[21] = read_data(7,7);
	data[22] = read_data(7,8);
	data[23] = read_data(7,10);
	data[24] = read_data(8,6);
	data[25] = read_data(8,9);
	data[26] = read_data(8,11);
	data[27] = read_data(9,7);
	data[28] = read_data(9,9);
	data[29] = read_data(9,10);
	data[30] = read_data(9,12);
	data[31] = read_data(10,8);
	data[32] = read_data(10,10);
	data[33] = read_data(10,13);
	data[34] = read_data(11,9);
	data[35] = read_data(11,11);
	data[36] = read_data(11,12);
	data[37] = read_data(12,10);
	data[38] = read_data(12,12);
	data[39] = read_data(12,13);
}
/* insert_stop */

void setup()
{
    Serial.begin(9600);
    /* Set up the pins for the muxses */
    for (int i = PINOFSETX; i < PINOFSETX + 8; i++) {
        pinMode(i,OUTPUT);
    }

}

void loop()
{
    getdata();
    int row = 0;
    if (Serial.available()) {
        Serial.print("[");
        for (row = 0; row < MAXDATA - 1; row++) {
            Serial.print(data[row]);
            Serial.print(",");
        }
        Serial.print(data[row]);
        Serial.println("]");
    } else {
        delay(1);
    }
}
