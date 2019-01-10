clc
clear all
syms P_xyz P_x P_y P_z T_xyz q1 Mat_X Mat_Y Mat_Z Mat_H q1 q2 q3;
%Parametro
Mat_X=[
[1,0,0,0];
[0,cos(q1*pi/180),-sin(q1*pi/180),0];
[0,sin(q1*pi/180),cos(q1*pi/180),0];
[0,0,0,1]];
disp('Matriz rotacion X')
pretty(simplify(Mat_X))

Mat_Y=[
[cos(q2*pi/180),0,sin(q2*pi/180),0];
[0,1,0,0];
[-sin(q2*pi/180),0,cos(q2*pi/180),0];
[0,0,0,1]];
disp('Matriz rotacion Y')
pretty(simplify(Mat_Y))

Mat_Z=[
[cos(q3*pi/180),-sin(q3*pi/180),0,0];
[sin(q3*pi/180),cos(q3*pi/180),0,0];
[0,0,1,0];
[0,0,0,1]];
disp('Matriz rotacion Z')
pretty(simplify(Mat_Z))

Mat_H=(Mat_X*Mat_Y)*Mat_Z;
disp('Matriz H')
pretty(simplify(Mat_H))

%Prompt
prompt = 'ingrese valor ¿q1? entre 0 y 380 grados';
q1 = input(prompt)
prompt = 'ingrese valor ¿q2? entre 0 y 380 grados';
q2 = input(prompt)
prompt = 'ingrese valor ¿q3? entre 0 y 380 grados';
q3 = input(prompt)
Mat_X=[
[1,0,0,0];
[0,cos(q1*pi/180),-sin(q1*pi/180),0];
[0,sin(q1*pi/180),cos(q1*pi/180),0];
[0,0,0,1]];
disp('Matriz rotacion X')
Mat_X

Mat_Y=[
[cos(q2*pi/180),0,sin(q2*pi/180),0];
[0,1,0,0];
[-sin(q2*pi/180),0,cos(q2*pi/180),0];
[0,0,0,1]];
disp('Matriz rotacion Y')
Mat_Y

Mat_Z=[
[cos(q3*pi/180),-sin(q3*pi/180),0,0];
[sin(q3*pi/180),cos(q3*pi/180),0,0];
[0,0,1,0];
[0,0,0,1]];
disp('Matriz rotacion Z')
Mat_Z

Mat_H=(Mat_X*Mat_Y)*Mat_Z;
disp('Matriz H')
Mat_H
%Prompt
prompt = 'ingrese valor ¿P_x? ';
P_x = input(prompt)
prompt = 'ingrese valor ¿P_y? ';
P_y = input(prompt)
prompt = 'ingrese valor ¿P_z? ';
P_z = input(prompt)
P_xyz=[P_x;P_y;P_z;1];

disp('Punto de ubicacion luego de rotar')
T=Mat_H*P_xyz