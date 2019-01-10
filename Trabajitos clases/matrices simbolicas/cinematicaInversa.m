clc;


Lz=0.7;
L1=0.5;
L2=0.3;

q1min=0;
q1max=pi;
q2min=0;
q2max=pi/2;
q3min=0;
q3max=pi/2;

Px=input('Px=')
Py=input('Py=')
Pz=input('Pz=')
alfa=input('alfa=')
beta=input('beta=')

q1=beta
coseno=acos((Px^2+Py^2+Pz^2-L1^2*L2^2)/(2*L1*L2));
senoPos=sqrt(1-coseno);
senoNeg=-senoPos;

q3=atan(senoPos/senoNeg)

q2=alfa-q3


