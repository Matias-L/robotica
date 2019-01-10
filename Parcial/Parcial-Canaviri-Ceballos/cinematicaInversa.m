% %(
% Parcial rob�tica y animatr�nica
% Integrantes:  Canaviri, Elio
%               Ceballos, Matias Lionel
% Octubre 2018
%
% %)

%% Obtenci�n de la cinem�tica inversa mediante m�todos geom�tricos

close all; 
clear all; 
clc

%Par�metros del robot
L1=30;  
L2=20;
L3=1000;
radioInt=L1-L2;
radioExt=L1+L2;

salir=0;        %Llave para hacer un control basico en el bucle



while salir==0
    px=input('�Px?: ');
    py=input('�Py?: ');
    pz=input('�Pz?: ');
    radio=sqrt(px^2+py^2);
    
    %Compruebo que la coordenada ingresada esta dentro del volumen de trabajo.
    if (pz<0)||(pz>1000)||(radio<radioInt)||(radio>radioExt)
     disp('ERROR: Valores fuera de los l�mites permitidos');
     salir=1;
    else
        %C�lculos de la cinem�tica inversa.
        q3=pz

        cosq2=(px^2+py^2-L1^2-L2^2)/(2*L1*L2);
        senq2=sqrt(1-cosq2^2);
        q2=atan(senq2/cosq2)

        q1=atan(py/px)-atan((L2*senq2)/(L1+L2*cosq2))
    end
end

