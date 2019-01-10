% %(
% Parcial robótica y animatrónica_Generacion de trayectorias
% Integrantes:  Canaviri, Elio
%               Ceballos, Matias Lionel
% Octubre 2018
%
% 
% %)
%% Obtención de la cinemática directa mediante Denavit-Hartemberg
%3 grados de libertad
close all; 
clear all; 
clc
syms q1 q2 q3 L1 L2 L3 real 

%q1: Rotación brazo L1 (de 0 a 2 pi)
%q2: Rotación brazo L2 (de 0 a 2 pi)
%q3: Desplazamiento sobre L3 (de 0 a 1000 mm)

% Parámetros de DH del archivo de word
L3=10;
i=1;
j=1;
generador_01;
j=1;
    while j<=pasos
    P=cinematicadirecta03([q(1,j),q(2,j),q(3,j)]);
%   % De cada paso tomo la posición
    x(j)=P(1,1);        %Eje x
    y(j)=P(1,2);        %Eje y
    z(j)=P(1,3);        %Eje z
    j=j+1;
    end
plot3(x,y,z);grid
xlabel('x');ylabel('y');zlabel('z')

