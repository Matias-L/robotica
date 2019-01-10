
%Denavit Hartember_ejer.doc   de dos grados de libertad pantografo
close all; clear all; clc
syms q1 q2 real %Variables reales. Mejora rendimiento

% Par�metros de DH del archivo de word
q=[q1 q2];
d=[0 0];
a=[3 1.5];
alfa=[0 0];

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

T=A01*A12;

%q1=pi/2;q2=0
%eval(T)

%% Evoluci�n de la posici�n del efector final
%q1=0;
%q2=0;
%i=1;
%while q1<=2*pi
%    Aux=eval(T);
    % De cada paso tomo la posici�n
%    x(i)=Aux(1,4);        %Eje x
%    y(i)=Aux(2,4);        %Eje y
%    z(i)=Aux(3,4);        %Eje z
%    q1=q1+0.05;
    %q2=q2+0.1;
%    i=i+1;
%end
 
%plot3(x,y,z);grid
%xlabel('x');ylabel('y');zlabel('z')
