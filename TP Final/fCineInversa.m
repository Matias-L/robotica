%%
%Alumnos: Canaviri, Elio
%       Ceballos, Matias
%
%Cinematica inversa

function [ q1, q2 ] = fCineInversa( L,px,py,pz)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%l: proyeccion sobre el plano x-y del radio vector.
%L: altura desde el piso hasta el centro del "disparo"

l=sqrt(px^2 + py^2);
q2=atan(py/px);
q1=atan(l/(L-pz))-pi/4; %El cero del motor 2 se inclina a 45 grados de la normal con el piso



end

