% %(
% Proyecto rob�tica y animatr�nica
% Integrantes:  Canaviri, Elio
%               Ceballos, Matias Lionel
% Octubre 2018
%
% cinematica directa
% %)


%% Obtenci�n de la cinem�tica directa mediante Denavit-Hartemberg
%Obtiene solamente las matrices para tenerlas disponibles luego en el 
%workspace
%3 grados de libertad
syms q1 q2 q3 L1 L2 real 

%q1: Rotaci�n brazo L1 (de 0 a 2 pi)
%q2: Rotaci�n brazo L2 (de 0 a 2 pi)
%q3: Desplazamiento sobre L3 (de 0 a 1000 mm)

% Par�metros de DH del archivo de word
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

