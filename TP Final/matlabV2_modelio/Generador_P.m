%%generacion de Trayectorias de posición y velocidad y grafica posición y
%%velocidad
%close all; clear all; clc;


addpath(genpath('D:\Inginieria Electronica\Optativas\Robotica y Animatronica\generaciontrayectorias'))% en genpah agrega todos los archivos 


q1i=0;      % los valores  de los angulos iniciales y finales de las dos articulaciones 
q1f=input('¿q1f?')
%q1f=-pi/4;       % estos valores son para probar las gráficas de las posiciones y velocidades
q2i=0;       % luego se hará una función generador_02.m donde entre el vector definido de los q´s
q2f=input('¿q2f?')
%q2f=pi/4;
q3i=20;       % luego se hará una función generador_02.m donde entre el vector definido de los q´s
q3f=input('¿q3f?')
%q3f=20;
qi=[q1i q2i q3i];
qf=[q1f q2f q3f];

parametrosFisicos;  % esta es la parte de la rutina parametros_fisicos donde se definen las wmax
                     % wmax=[pi/10 pi/12 0.01];% maximas  velocidades de los
                     % actuadoressacadas de parametros_fisicos 
% calculo del tiempo
Tmax=max(abs((qf-qi)./wmax)); % calcula el tiempo maximo que tardará todo el movimiento
w=(qf-qi)./Tmax;  % luego este Tmax me calcula la w (velocidad) de las dos articulaciones que serán vectores velocidades  
                  % recordar que Tmax es un escalar 
h=0.1; % es el paso de la iteraccion 
taux=0; % es el tiempo auxiliar 
i=1;
while taux<=Tmax      % Taux guarda el avance 
    qq(:,i)=qi+w*taux; % es la ecuación de q en este caso las dos, acá cargamos el vector q1 y q2 con los valores de posición calculada
    Dq(:,i)=w;        % Dq es la velocidad (derivada de q) correspondiente a los dos desplazamiento de q1 y q2 que la sacamos de w que está cargada 
    i=i+1;    % incremento el indice de uno en uno 
    taux=taux+h;      % incremento el paso de 0.01 en 0.01
end
pasos=i-1;
                      % tener en cuaenta si los incrementos de h llegan a
                      % los valores que correspondan a q final es posible
                      % definir el while con el q para que llegue al q
                      % final
%t=0:h:Tmax;
%subplot(211);plot3(t,q(1,:),t,q(2,:),t,q(3,:))   % recordar que 211 se va a dibiujar dos filas por una columna, dibujando en la primera fila 
%subplot(212);plot3(t,Dq(1,:),t,Dq(2,:),t,Dq(2,:)) % recordar que 211 se va a dibiujar dos filas por una columna, dibujando en la segunda fila
                                       % ploteando en x el t osea el tiempo
                                       % y en y las dos q o sea los
                                       % angulos 
                                       % en x el tiempo y en y las dos
                                       % velocidades
                                       
% en este caso las velocidades w son constantes en ambos casos   Dq(:,i)=w; , pero en
% general pueden variar 