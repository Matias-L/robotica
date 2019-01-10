


  //int entrante;
  const int TAM=2;    //Tamaño del arreglo de servos
  int servos[TAM];
  int indice=0; //Indice para recorrer el arreglo de servos
  int aux;      //Usado para limpiar el buffer

  
  void setup() {
  Serial.begin(9600);
  }

void loop() {

if(Serial.available()>0){
  servos[indice]=Serial.parseInt(); //Interpreta como entero el valor ingresado por UART
  indice++;
  aux=Serial.read();    //Limpia el buffer de salto de linea y retorno de carro
  aux=Serial.read();
    
  }
  if(indice==TAM){
      Serial.print("servo1: ");
      Serial.println(servos[0], DEC);
  
      Serial.print("servo2: ");
      Serial.println(servos[1], DEC);
      indice=0;
    } 
}//Fin loop

