#include <Servo.h>

#include <Servo.h>


  int entrante;
  const int TAM=2;    //Tamaño del arreglo de servos
  int servos[TAM];
  int indice=0; //Indice para recorrer el arreglo de servos
  int aux;      //Usado para limpiar el buffer
  Servo cabeceo;      //altura
  Servo guiniada;     //base

  
  void setup() {
  Serial.begin(9600);
  cabeceo.attach(9);
  guiniada.attach(10);
  }

void loop() {

if(Serial.available()>0){
  servos[indice]=Serial.parseInt(); //Interpreta como entero el valor ingresado por UART
  indice++;
  aux=Serial.read();    //Limpia el buffer de salto de linea y retorno de carro
  aux=Serial.read();
    
  }
  if(indice==TAM){
      Serial.print("Guiñada: ");
      Serial.println(servos[0], DEC);
      guiniada.write(servos[0]);
  
      Serial.print("Cabeceo: ");
      Serial.println(servos[1], DEC);
      cabeceo.write(servos[1]);
      indice=0;
    } 
}//Fin loop

