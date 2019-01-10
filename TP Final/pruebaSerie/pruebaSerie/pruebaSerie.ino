#include <Servo.h>

 int byteLeido=0;
  void setup() {
  Serial.begin(115200);
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, LOW);
  Serial.println("Listo");
  }

void loop() {

if(Serial.available()>0){
  digitalWrite(LED_BUILTIN, HIGH);
  delay(500);
  byteLeido=Serial.read();
  Serial.println(byteLeido);
  digitalWrite(LED_BUILTIN, LOW);
    } 
}//Fin loop

