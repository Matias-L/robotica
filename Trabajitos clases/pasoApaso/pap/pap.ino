int paso=8;
int direccion=9;


void setup() {
  pinMode(paso, OUTPUT);
  pinMode(direccion, OUTPUT);
  digitalWrite(direccion, HIGH);
}

void loop() {
  
  digitalWrite(paso, HIGH);
  delayMicroseconds(1500);
  digitalWrite(paso, LOW);
  delayMicroseconds(1500);
  }
