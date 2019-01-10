%%
%Alumnos: Canaviri, Elio
%       Ceballos, Matias
%
%Script principal

clear all; %#ok<CLSCR>
clc;

%%Carga de parametros físicos
parametrosFisicos;

%%Apertura puerto serie
puertoCom=input('Ingrese puerto COM a usar')
abrirUART;

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
    opcion=input();
    
    
    
    switch opcion
        case 1
        case 2
        case 3
        case 4
        case 5 
            salir=true;
            disp('Gracias, vuelva prontos')
        otherwise
            disp('***OPCION NO VÁLIDA***')
    end
    
    
end










