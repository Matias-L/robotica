% %(
% Proyecto robótica y animatrónica_Generacion de trayectorias
% Integrantes:  Canaviri, Elio
%               Ceballos, Matias Lionel
% Octubre 2018
%
% 
% %)
%% Trayectoria a partir de un Q(q1,q2,q3)
%3 grados de libertad

%q1: Rotación yaw(guiñada)(eje Z) (de 0 a pi/4)
%q2: Rotación pitch(cabeceo) (eje x)(de 0 a pi/4)
%q3: Desplazamiento sobre L3 (de 0 a 20)

% Parámetros de DH del archivo de word
%syms q1 q2 q3 L1 L3 real
Generador_P;
j=1;
    while j<=pasos
        Q1=qq(1,j);
        Q2=qq(2,j);
        Q3=qq(3,j);
    [PX, PY, PZ]=fCineDirecta(Q1, Q2, Q3, T);
%   % De cada paso tomo la posición
    x(j)=PX;        %Eje x
    y(j)=PY;        %Eje y
    z(j)=PZ;        %Eje z
    j=j+1;
               Q1=Q1+pi/4;
           Q1aux=rad2deg(Q1);
           Q1=round(Q1aux);
           Q2=Q2+pi/4;
           Q2aux=rad2deg(Q2);
           Q2=round(Q2aux);
    fEnviarUart(s, Q1, Q2);
    pause(0.01);
    end
plot3(x,y,z);grid
xlabel('x');ylabel('y');zlabel('z')
