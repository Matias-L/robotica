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


q1=input('Q1=');
q2=input('Q2=');
q3=input('Q3=');

if (q1<q1min)||(q1>q1max)||(q2<q2min)||(q2>q2max)||(q3<q3min)||(q3>q3max)
    prompt('Error: Valores fuera de rango.')

else
    Px=cos(q1)*(L1*cos(q2)+L2*cos(q2+q3))
    Py=sin(q1)*(L1*cos(q2)+L2*cos(q2+q3))
    Pz=Lz+L1*sin(q2)+L2*sin(q3)

    alfa=q2+q3;
    beta=q1;
    
end