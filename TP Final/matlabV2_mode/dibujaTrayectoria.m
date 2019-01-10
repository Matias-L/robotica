%Dibujamos un recorrido de base de -45 a 45 grados.
i=1;
q3=20;
q1=-pi/4;
q2=0;

hold on;
while q1<=pi/4
    Aux=eval(T);
%   % De cada paso tomo la posición
    x(i)=Aux(1,4);        %Eje x
    y(i)=Aux(2,4);        %Eje y
    z(i)=Aux(3,4);        %Eje z
    %q3=q3+0.5;
    q1=q1+0.05;
    %q2=q2+0.05;
    i=i+1;
end
plot3(x,y,z);grid
xlabel('x');ylabel('y');zlabel('z')
%%
q1=0
q2=-pi/4
while q2<=pi/4
    Aux=eval(T);
%   % De cada paso tomo la posición
    x(i)=Aux(1,4);        %Eje x
    y(i)=Aux(2,4);        %Eje y
    z(i)=Aux(3,4);        %Eje z
    %q3=q3+0.5;
    %q1=q1+0.05;
    q2=q2+0.05;
    i=i+1;
end
plot3(x,y,z);grid
xlabel('x');ylabel('y');zlabel('z')
hold off;