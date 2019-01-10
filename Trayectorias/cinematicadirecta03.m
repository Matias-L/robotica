function [p]=cinematicadirecta03(q)
%% cinematica directa de un robot de tres grados de libertad
%entrada como matriz
%ENTRADAvector de articulaciones en radianes y mm q como vector
%SALIDA coordenadas del efector final como vector p
% se han cambiado los valores de l1 y l2 porque ahora se consideran los
% parámetros físicos del robot en un scrip parametros_fisicos


addpath(genpath('D:\Inginieria Electronica\Optativas\Robotica y Animatronica\generaciontrayectorias'))

parametros_fisicos; % Carga los parámetros físicos del robot.

n=size(q,1);  % es la dimension de la matriz q , coespondiente al numero de filas que corresponde a la canidad de puntos que se van a calcular la cinemática directa 
i=1;

while i<=n    % este bucle calcula la cd de un vector pero punto a punto , o sea viene i deun programa ageno y toma el [qi1 qi2] para calcularla 
    
    T=...
        [cos(q(i,2))*cos(q(i,3))-sin(q(i,2))*sin(q(i,3)) cos(q(i,2))*sin(q(i,3))+cos(q(i,3))*sin(q(i,2)) 0 l2*cos(q(i,2))*cos(q(i,3))+l1*cos(q(i,2))-l2*sin(q(i,2))*sin(q(i,3));...
        cos(q(i,3))*sin(q(i,2))+cos(q(i,2))*sin(q(i,3)) -cos(q(i,2))*cos(q(i,3))+sin(q(i,2))*sin(q(i,3)) 0 l1*sin(q(i,2))+l2*cos(q(i,2))*sin(q(i,3))+l2*cos(q(i,3))*sin(q(i,2));...
        0 0 -1 q(i,1);...
        0 0 0 1];
    
    p(i,1)=T(1,4);
    p(i,2)=T(2,4);
    p(i,3)=T(3,4);
    i=i+1;
    
end
 