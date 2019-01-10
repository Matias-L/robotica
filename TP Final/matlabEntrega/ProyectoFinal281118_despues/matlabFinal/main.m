%%
%Alumnos: Canaviri, Elio
%         Ceballos, Matias
%
%Script principal
%Archivos asociados:
%abrirUART.m
%cerrarUART.m
%fEnviarUart.m
%parametrosFisicos.m
%fCineInversa.m

clear all; 
clc;

%%Carga de parametros físicos
parametrosFisicos;

%%Apertura puerto serie
puertoCom='COM6';
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
    disp('Programa Principal del Proyecto')
    disp('1-Cinematica directa')
    disp('2-Cinematica inversa')
    disp('3-Dibujo de trajectoria')
    disp('4-Dibujo volumen trabajo')
    disp('5-Salir')
    opcion=input('Ingrese un número de opcion=');
       
    switch opcion
        case 1
            %Cinematica directa
           Q1=input('¿Q1?')
           Q2=input('¿Q2?')
           %Q3=input('¿Q3?')
           Q3=20;
           [PX, PY, PZ]=fCineDirecta(Q1, Q2, Q3, T);
           disp('P(x y z)=')
           disp([PX,PY,PZ])
           Q1=Q1+pi/4;
           Q1aux=rad2deg(Q1);
           Q1=round(Q1aux);
           Q2=Q2+pi/4;
           Q2aux=rad2deg(Q2);
           Q2=round(Q2aux);
           respuestArduino=fEnviarUart(s, Q1, Q2)

        case 2
            %cinematica inversa
            %AGREGAR: Comprobación de entrada (que el punto ingresado
            %este dentro del volumen de trabajo)
            px=input('¿Px?');
            py=input('¿Py?');
            pz=input('¿Pz?');
            [q1, q2, q3]=fCineInversa(px, py, pz);
            disp('Q(q1 q2 L3)=')
            disp([q1,q2,q3])
            q1=q1+45
            q2=q2+45
            respuestArduino=fEnviarUart(s, q2, q1)
            
        case 3
            
            %Dibujo de una trayectoria
            fDibujatrayectoria;
        case 4
            %Dibujo volumen de trabajo
            volumenTrabajo;
        case 5 
            %salir
            salir=true;
            disp('Gracias, vuelva prontos')
        otherwise
            disp('***OPCION NO VÁLIDA***')
    end
    
    
end

cerrarUART;








