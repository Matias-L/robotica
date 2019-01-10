% Conocida una posicion inicial, se deben obtener q1 y q2: El angulo que
% forman la articulacion respecto de la horizontal (q1) y la longitud del 
% brazo extensor (q2)
% La longitud de los brazos L1 y L2 son conocidas, mientras que se requiere
% que el usuario ingrese las coordenadas en el plano ((x e y) de la 
% posicion inicial del robot.
prompt = 'Ingrese posicion (x primero, y segundo): ';
x= input(prompt);
y= input(prompt);
L1 = 1;
L2 = 0.7;
% Se calcula L (largo del brazo), siendo la hipotenusa del triangulo
%formado por ella y la posicion del brazo
L = sqrt((x)^2 + (y^2));
Q1 = abs (L -L1 - L2)
% se calcula Q1 (en grados) mediante el coseno del angulo que el brazo forma con la 
% horizontal dado que se conoce L
Q2 = acosd (x/L)