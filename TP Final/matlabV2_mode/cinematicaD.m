% %(
% Proyecto robótica y animatrónica
% Integrantes:  Canaviri, Elio
%               Ceballos, Matias Lionel
% Octubre 2018
%
% cinematica directa
% %)


%% Obtención de la cinemática directa mediante Denavit-Hartemberg
%3 grados de libertad
close all; 
clear all; 
clc
syms q1 q2 q3 L1 L2 real 

%q1: Rotación brazo L1 (de 0 a 2 pi)
%q2: Rotación brazo L2 (de 0 a 2 pi)
%q3: Desplazamiento sobre L3 (de 0 a 1000 mm)

% Parámetros de DH del archivo de word
q=[q1 (q2-pi/2) 0];
d=[L1 0 q3];
a=[0 0 0];
alfa=[pi/2 -pi/2 0];

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


T=A01*A12*A13;
eval(T)


q1=0;
q2=0;
q3=20;

%Parámetros del robot
L1=12;  
L3=20;
eval(T)
%Dibujamos un recorrido de base de -45 a 45 grados.
i=1;
q3=20;
q1=-pi/4;
q2=0;

while q1<=pi/4
    Aux=eval(T);
%   % De cada paso tomo la posición
    x(i)=Aux(1,4);        %Eje x
    y(i)=Aux(2,4);        %Eje y
    z(i)=Aux(3,4);        %Eje z
    %q3=q3+0.5;
    q1=q1+0.05;
    %q2=q2+0.05;
    i=i+1;
end
plot3(x,y,z);grid
xlabel('x');ylabel('y');zlabel('z')
%%
q1=0
q2=-pi/4
while q2<=pi/4
    Aux=eval(T);
%   % De cada paso tomo la posición
    x(i)=Aux(1,4);        %Eje x
    y(i)=Aux(2,4);        %Eje y
    z(i)=Aux(3,4);        %Eje z
    %q3=q3+0.5;
    %q1=q1+0.05;
    q2=q2+0.05;
    i=i+1;
end
plot3(x,y,z);grid
xlabel('x');ylabel('y');zlabel('z')