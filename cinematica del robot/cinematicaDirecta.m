clc
clear all

%primer robot
%parametros

l1=1;
l2=0.7;

%Variables de articulacion
q1max=pi/2;
q1min=0;
q2max=pi/4;
q2min=-pi/4;

%vectores
resolucion=100;
Px=zeros(1, resolucion);
Py=zeros(1, resolucion);


%Prompt
prompt = '¿Q1? ';
q1 = input(prompt)
prompt = '¿Q2? ';
q2 = input(prompt)
px=l1*cos(q1)+l2*cos(q1+q2);
py=l1*sin(q1)+l2*sin(q1+q2);
orientacion=q1+q2;   %ESTO ESTA MAL. CONSULTAR EN CLASES!!!!!!!







if (q1>q1max) || (q1<q1min) || (q2>q2max)||(q2<q2min)
prompt = 'ERROR: Valores fuera del rango'

else

%Primero calculo las coordenadas de los brazos
b1x=l1*cos(q1);
b1y=l1*sin(q1);
b2x=l2*cos(q1+q2)+b1x;
b2y=l2*sin(q1+q2)+b1y;




%Luego grafico los limites de trabajo
%para alcanze maximo (azul)
q2=0;
q1=q1min;

for i=1:resolucion
    Px(i)=l1*cos(q1)+l2*cos(q1+q2);
    Py(i)=l1*sin(q1)+l2*sin(q1+q2);
    q1=q1+q1max/resolucion;
end

figure
plot(Px, Py, 'Color', 'blue')
title('Volumen de trabajo')
xlabel('Px')
ylabel('Py')
grid
axis equal
hold on

%cola izquierda (rojo)
q2=0;
q1=q1max;

for i=1:resolucion
    Px(i)=l1*cos(q1)+l2*cos(q1+q2);
    Py(i)=l1*sin(q1)+l2*sin(q1+q2);
    q2=q2+q2max/resolucion;
end
plot(Px, Py, 'Color', 'red')

%Alcanze minimo (amarillo)
q2=q2max;
q1=q1max;

for i=1:resolucion
    Px(i)=l1*cos(q1)+l2*cos(q1+q2);
    Py(i)=l1*sin(q1)+l2*sin(q1+q2);
    q1=q1-q1max/resolucion;
end
plot(Px, Py, 'Color', 'yellow')

q2=q2min;
q1=q1max;

%cola derecha (negro)
for i=1:resolucion
    Px(i)=l1*cos(q1)+l2*cos(q1+q2);
    Py(i)=l1*sin(q1)+l2*sin(q1+q2);
    q1=q1-q1max/resolucion;
end
plot(Px, Py, 'Color', 'black')

q2=0;
q1=q1min;

%cola derecha (verde)
for i=1:resolucion
    Px(i)=l1*cos(q1)+l2*cos(q1+q2);
    Py(i)=l1*sin(q1)+l2*sin(q1+q2);
    q2=q2-abs(q2min/resolucion);
end
plot(Px, Py, 'Color', 'green')


plot (px, py, 'r*')
%grafico las articulaciones
plot ([0 b1x], [0 b1y])
plot([b1x b2x], [b1y b2y])





hold off;

end

