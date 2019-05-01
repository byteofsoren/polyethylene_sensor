#include "Arduino.h"

#define MAX_X 10
#define MAX_Y 10
#define PINOFSETX 0
#define PINOFSETY 4



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
    return 0;
}

void setup()
{
    Serial.begin(9600);
}

void loop()
{

}
