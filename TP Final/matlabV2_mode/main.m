%%
%Alumnos: Canaviri, Elio
%       Ceballos, Matias
%
%Script principal
%Archivos asociados:
%abrirUART.m
%cerrarUART.m
%fEnviarUart.m
%parametrosFisicos.m
%fCineInversa.m


clear all; %#ok<CLSCR>
clc;

%%Carga de parametros físicos
parametrosFisicos;

%%Apertura puerto serie
puertoCom='COM5';
baudR=115200;
abrirUART;

%Carga la matriz D-H
 cDinicial;
 
%%Menú de selección
%1-Cinematica directa (graficar las articulaciones tambien)
%2-Cinematica inversa
%3-Dibujo de trajectoria
%4-Dibujo volumen de trabajo
%5-Salir

salir=false;

while ~salir
    disp('Ingrese un número de opcion')
    disp('1-Cinematica directa')
    disp('2-Cinematica inversa')
    disp('3-Dibujo de trajectoria')
    disp('4-Dibujo volumen trabajo')
    disp('5-Salir')
    opcion=input('');
    
    
    
    switch opcion
        case 1
            %Cinematica directa
           Q1=input('¿Q1?')
           Q2=input('¿Q2?')
           Q3=input('¿Q3?')
           [PX, PY, PZ]=fCineDirecta(Q1, Q2, Q3, T)
           %respuestArduino=fEnviarUart(s, q1, q2)

        case 2
            %cinematica inversa
            %AGREGAR: Comprobación de entrada (que el punto ingresado
            %este dentro del volumen de trabajo)
            px=input('¿Px?');
            py=input('¿Py?');
            pz=input('¿Pz?');
            [q1, q2]=fCineInversa(L, px, py, pz)
            respuestArduino=fEnviarUart(s, q1, q2)
            
        case 3
            %Dibujo de una trayectoria
            dibujaTrayectoria;
        case 4
        case 5 
            %salir
            salir=true;
            disp('Gracias, vuelva prontos')
        otherwise
            disp('***OPCION NO VÁLIDA***')
    end
    
    
end

cerrarUART;








