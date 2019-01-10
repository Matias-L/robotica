%%
%Alumnos: Canaviri, Elio
%       Ceballos, Matias
%
%Cinematica inversa
%
%Dibujo volumen trabajo


Q3=20;
Q1=Q1_MIN;
Q2=Q2_MIN;
i=1;
while Q2<Q2_MAX
   [p_x(i), p_y(i), p_z(i)]=fCineDirecta(Q1, Q2, Q3, T);
   Q2=Q2+0.1;
   i=i+1;
 
end

hold on;
plot3(p_x, p_y, p_z);grid
xlabel('x');ylabel('y');zlabel('z');axis equal;axis([-20 30 -20 30 -20 30 ])


Q1=Q1_MIN;
Q2=Q2_MAX;
i=1;
while Q1<Q1_MAX
   [p_x(i), p_y(i), p_z(i)]=fCineDirecta(Q1, Q2, Q3, T);
   Q1=Q1+0.1;
   i=i+1;
 
end

plot3(p_x, p_y, p_z);axis equal;axis([-20 30 -20 30 -20 30 ])

Q1=Q1_MAX;
Q2=Q2_MAX;
i=1;
while Q2>Q2_MIN
   [p_x(i), p_y(i), p_z(i)]=fCineDirecta(Q1, Q2, Q3, T);
   Q2=Q2-0.1;
   i=i+1;
 
end

plot3(p_x, p_y, p_z);axis equal;axis([-20 30 -20 30 -20 30 ])

Q1=Q1_MAX;
Q2=Q2_MIN;
i=1;
while Q1>Q1_MIN
   [p_x(i), p_y(i), p_z(i)]=fCineDirecta(Q1, Q2, Q3, T);
   Q1=Q1-0.1;
   i=i+1;
 
end

plot3(p_x, p_y, p_z);axis equal;axis([-20 30 -20 30 -20 30 ])

hold off;

