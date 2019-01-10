%% Ejercicios de DH
%Denavit Hartember de tres grados de libertad 
close all; clear all; clc
syms q1 q2 q3 L1 L2 real 

% Parámetros de DH del archivo de word
q=[0 q1 q2];
d=[q3 0 0];
a=[0 L1 L2];
alfa=[0 0 pi];

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

L1=30;  
L2=20;



i=1;
while q3<=100
    Aux=eval(T);
    % De cada paso tomo la posición
    x(i)=Aux(1,4);        %Eje x
    y(i)=Aux(2,4);        %Eje y
    z(i)=Aux(3,4);        %Eje z
    q3=q3+0.5;
    q1=q1+0.05;
    q2=q2+0.05;
    i=i+1;
end
plot3(x,y,z);grid
xlabel('x');ylabel('y');zlabel('z')