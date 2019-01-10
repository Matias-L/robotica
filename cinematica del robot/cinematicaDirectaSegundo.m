clc
clear all

%Parametro
L=1;

%Variables de articulacion
qmin=0;
qmax=pi;
dmin=0;
dmax=0.7;

%vectores
resolucion=100;
%Px=zeros(1, resolucion);
%Py=zeros(1, resolucion);


%Prompt
prompt = '¿Q? ';
q = input(prompt)
prompt = '¿D? ';
d = input(prompt)
if (d<dmin)||(d>dmax) || (q>qmax) ||(q<qmin)
   prompt = 'ERROR: Valores fuera del rango'
else

px=(L+d)*cos(q)
py=(L+d)*sin(q)
orientacion=q
    
%curva exterior
angulo=qmin:1/resolucion:qmax;
modulo=L+dmax;
[x, y]= pol2cart(angulo, modulo);

figure
plot (x, y)
title('Volumen de trabajo')
xlabel('Px')
ylabel('Py')
grid
axis equal
hold on

%curva interior

angulo=qmin:1/resolucion:qmax;
modulo=L+dmin;
[x, y]= pol2cart(angulo, modulo);
plot (x, y)

%limite izquierdo
ang=qmax;
mod= L:1/resolucion:L+dmax;
[x, y]= pol2cart(ang, mod);
plot (x, y)

%limite derecho
ang=qmin;
mod= L:1/resolucion:L+dmax;
[x, y]= pol2cart(ang, mod);
plot (x, y)


plot(px, py, 'r*')
plot([0 px*1.9], [0 py*1.9])
end





