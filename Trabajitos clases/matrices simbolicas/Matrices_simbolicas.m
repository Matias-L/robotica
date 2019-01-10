clear all;
clc;

syms vx vy vz tita;
matriz_traslacion= [1 0 0 vx; 0 1 0 vy; 0 0 1 vz; 0 0 0 1];
rotacion_x = [1 0 0 0; 0 cos(tita) -sin(tita) 0; 0 sin(tita) cos(tita) 0; 0 0 0 1];
rotacion_z = [cos(tita) -sin(tita) 0 0; sin(tita) cos(tita) 0 0; 0 0 1 0; 0 0 0 1];
rotacion_y= [cos(tita) 0 sin(tita) 0; 0 1 0 0; -sin(tita) 0 cos(tita) 0; 0 0 0 1];
vector_estado=ones(4, 1);
enCiclo=true;

%Descometar al mostrar
%P=input('Ingrese punto inicial (Ingreselo dentro de corchetes) \n')
P=transpose([2 0 0 1])

while enCiclo
    disp('Ingrese accion:')
    disp('T[x y z] ->traslacion')
    disp('R[EJE, ANGULO] ->rotacion')
    disp('salir->termina el programa')
    
    comando=input('', 's'); %'s' es para que no valide como expresion la entrada
    comando=strsplit(comando, {' ', '[', ']' ','})
    
    if strcmp(comando(1), 'T')  %Se pidio una traslacion
        V_X=comando(2)
        V_Y=comando(3)
        V_Z=comando(4)
        
        matriz_traslacion=subs(matriz_traslacion, vx, V_X);
        matriz_traslacion=subs(matriz_traslacion, vy, V_Y);
        matriz_traslacion=subs(matriz_traslacion, vz, V_Z)
        
        vector_estado=matriz_traslacion*P        
    end
    
    
    if strcmp(comando(1), 'R') %Se pidio una rotacion
        eje=comando(2);
        a=comando(3);
        angulo=eval(a{1})   %Extrae el token de la celda y lo interpreta
                            %como expresion de matlab
        if strcmp(eje, 'x')
            matriz_rotacion=subs(rotacion_x, tita, angulo) 
        end
        
        if strcmp(eje, 'y')
            matriz_rotacion=subs(rotacion_y, tita, angulo) 
        end

        if strcmp(eje, 'z')
            matriz_rotacion=subs(rotacion_z, tita, angulo) 
        end
        
        vector_estado=matriz_rotacion*vector_estado

 
    end
    
    

    if strcmp(comando(1), 'salir')
       enCiclo=false;
       disp('Terminando programa') 
    end


end