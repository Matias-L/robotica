//definicion de pins
const int motorPin1 = 8;    // mPaP In1 A
const int motorPin2 = 9;    // mPaP In2 B
const int motorPin3 = 10;   // mPaP In3 C
const int motorPin4 = 11;   // mPaP In4 D
                   
//definicion variables
int motorSpeed = 2000;   //variable para fijar la velocidad(entre 2000 y 9000)
int stepCounter = 0;     // contador para los pasos
int pasos = 400;  // pasos para una vuelta completa
 
//tablas con la secuencia de encendido (descomentar la que necesiteis)
//secuencia 1-fase
const int numSteps = 4;
const int stepsLookup[4] = { B1000, B0100, B0010, B0001 };
 
//secuencia 2-fases
//const int numSteps = 4;
//const int stepsLookup[4] = { B1100, B0110, B0011, B1001 };
 
//secuencia media fase
//const int numSteps = 8;
//const int stepsLookup[8] = { B1000, B1100, B0100, B0110, B0010, B0011, B0001, B1001 };
 
 
void setup()
{
  //declarar pines como salida
  pinMode(motorPin1, OUTPUT);
  pinMode(motorPin2, OUTPUT);
  pinMode(motorPin3, OUTPUT);
  pinMode(motorPin4, OUTPUT);
}
 
void loop()
{
  for (int i = 0; i < pasos ; i++)
  {
    GiroHorario();
    delayMicroseconds(motorSpeed);
  }
  for (int i = 0; i < pasos ; i++)
  {
    GiroAntiHorario();
    delayMicroseconds(motorSpeed);
  }
  delay(1000);
}
 
void GiroHorario()
{
  stepCounter++;
  if (stepCounter >= numSteps) stepCounter = 0;
  setOutput(stepCounter);
  
}
 
void GiroAntiHorario()
{
  stepCounter--;
  if (stepCounter < 0) stepCounter = numSteps - 1;
  setOutput(stepCounter);
}
 
void setOutput(int step)
{
  digitalWrite(motorPin1, bitRead(stepsLookup[step], 0));
  delayMicroseconds(50);
  digitalWrite(motorPin2, bitRead(stepsLookup[step], 1));
  delayMicroseconds(50);
  digitalWrite(motorPin3, bitRead(stepsLookup[step], 2));
  delayMicroseconds(50);
  digitalWrite(motorPin4, bitRead(stepsLookup[step], 3));
  delayMicroseconds(50);
  //delayMicroseconds(10000);
}
