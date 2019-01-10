% %(
% Parcial robótica y animatrónica
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
syms q1 q2 q3 L1 L2 real 

%q1: Rotación brazo L1 (de 0 a 2 pi)
%q2: Rotación brazo L2 (de 0 a 2 pi)
%q3: Desplazamiento sobre L3 (de 0 a 100 mm)

% Parámetros de DH del archivo de word
q=[0 q1 q2];
d=[q3 0 0];
a=[0 L1 L2];
alfa=[0 0 pi];

%Parámetros del robot
L1=30;  
L2=20;
L3=1000;

i=1;
A01=[cos(q(i)) -cos(alfa(i))*sin(q(i))  sin(alfa(i))*sin(q(i)) a(i)*cos(q(i));...
   sin(q(i))  cos(alfa(i))*cos(q(i)) -sin(alfa(i))*cos(q(i)) a(i)*sin(q(i));...
   0          sin(alfa(i))            cos(alfa(i))           d(i);...
   0 0 0 1]

i=2;
A12=[cos(q(i)) -cos(alfa(i))*sin(q(i))  sin(alfa(i))*sin(q(i)) a(i)*cos(q(i));...
   sin(q(i))  cos(alfa(i))*cos(q(i)) -sin(alfa(i))*cos(q(i)) a(i)*sin(q(i));...
   0          sin(alfa(i))            cos(alfa(i))           d(i);...
   0 0 0 1]
i=3;
A13=[cos(q(i)) -cos(alfa(i))*sin(q(i))  sin(alfa(i))*sin(q(i)) a(i)*cos(q(i));...
   sin(q(i))  cos(alfa(i))*cos(q(i)) -sin(alfa(i))*cos(q(i)) a(i)*sin(q(i));...
   0          sin(alfa(i))            cos(alfa(i))           d(i);...
   0 0 0 1]


T=A01*A12*A13
eval(T)


q1=0;
q2=0;
q3=0;


AuxL1=eval(A01);
    
%Coordenadas punto final eslabon L1
pfl1(1)=AuxL1(1,4);        %Coordenada en x
pfl1(2)=AuxL1(2,4);        %Coordenada en y
pfl1(3)=AuxL1(3,4);        %Coordenada en z

%Coordenadas punto inicial eslabon L1
pil1(1)=0;
pil1(2)=0;
pil1(3)=0;

%vector que guarda ambos puntos que determinaran la recta a dibujar
xL1=[pil1(1) pfl1(1)];
yL1=[pil1(2) pfl1(2)];
zL1=[pil1(3) pfl1(3)];

%hold on;
plot3(xL1, yL1,zL1);grid
xlabel('x');ylabel('y');zlabel('z')