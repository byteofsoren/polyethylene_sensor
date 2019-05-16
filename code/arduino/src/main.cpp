#include "Arduino.h"

#define MAX_X 10
#define MAX_Y 10
#define PINOFSETX 0
#define PINOFSETY 4
#define UNIQUE(M,N) 2*M*N - N - M



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
    char toPC[1000];
    /* Acquire foam data */
    int last = 0;
    sprintf(toPC + last, "[");
    last++;
    for (char x = 0; x < MAX_X; x++) {
        for (char y = 0; y < MAX_Y; y++) {
            last += sprintf(toPC + last, "%d,%d,%d;",x,y,read_data(x,y));
        }
    }
    sprintf(toPC + last, "]");

    Serial.print(toPC);
}
