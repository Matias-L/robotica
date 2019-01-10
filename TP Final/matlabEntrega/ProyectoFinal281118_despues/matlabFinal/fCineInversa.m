%%
%Alumnos: Canaviri, Elio
%       Ceballos, Matias
%
%Cinematica inversa
%
%Resolución de los motores: 1°

function [ q1, q2, q3] = fCineInversa(px,py,pz)
parametrosFisicos;
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%l: proyeccion sobre el plano x-y del radio vector.
%L: altura desde el piso hasta el centro del "disparo"
%q1:Guiñada (plano x-y)
%q2:Cabezeo (inclinacion vertical)

l=sqrt(px^2 + py^2);
q1Aux=atan(py/px);
%atan computa para angulos agudos. Si el pz esta por encima de L
%el angulo da mayor a 90 (mas alla de que luego se le reste el 45°)
%por eso, si el punto pz esta por encima de L, calculo el angulo que se
%forma por encima de la horizontal (es decir, el angulo por encima de
%L), y le sumo luego 90 grados

q2Aux=atan((pz-L1)/l);    

%q1Aux=atan(l/(L-pz))-pi/4; %El cero del motor 2 se inclina a 45 grados de la normal con el piso
%q1Aux=atan(l/(L-pz))
q3Aux=-sin(q2Aux)*(L1-pz)+cos(q2Aux)*l;

%paso los resultados de radianes a grados
q1deg=rad2deg(q1Aux);
q2deg=rad2deg(q2Aux);

%Redondeo los angulos al entero mas cercano.
%Esto es asi puesto que los motores tienen una resolucion de 1 grado
%y se envian los datos por puerto serie como enteros sin signo 
%de 8 bits
q1=round(q1deg);
q2=round(q2deg);
q3=q3Aux;

end