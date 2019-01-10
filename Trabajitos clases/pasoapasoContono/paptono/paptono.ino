#include <Tone.h>

int paso=8;
int direccion=9;
Tone tone1;

void setup()
{
  tone1.begin(paso);
  pinMode(paso, OUTPUT);
  pinMode(direccion, OUTPUT);
  digitalWrite(direccion, HIGH);
  tone1.play(400);
}

void loop()
{
  


}
