% Cinematica Inversa del Robot 2
% Conocida una posicion inicial, se deben obtener q1 y q2 (angulos que
% forman las articulaciones respecto de la horizontal (q1) y del primer
% brazo (q2)
% La longitud de los brazos L1 y L2 son conocidas, mientras que se requiere
% que el usuario ingrese las coordenadas en el plano ((Posx y Posy) de la 
% posicion inicial del robot.
prompt = 'Ingrese posicion (x primero, y segundo): ';
x= input(prompt);
y= input(prompt);
L1 = 1;
L2 = 0.7;
% Se calcula L, siendo la hipotenusa del triangulo formado por ella y los
% brazos
L = sqrt((x)^2 + (y^2));
% Aplicando el teorema del coseno para calcular el angulo phi interno y
% adyacente a q2, despues del despeje obtenemos su valor en grados
% (mediante la funcion acosd)
phi = acosd((((L)^2 -(L1)^2 -(L2)^2)/L1*L2));
% Como el angulo q2 es adyacente a phi, obtenemos su valor de la resta de
% phi con 180
q2 = 180 - phi
% Como el triangulo compuesto por los lados L, L1 y L2 tienen tres angulos,
% los denominamos phi (previamente calculado) A y E, donde A es el angulo
% formado por L y L2 mientras que E es el formado por L y L1
% Procedemos a calcular el angulo A
A = acosd(((L1)^2-(L)^2 -(L2)^2)/L*L2);
% Obtenido A, podemos conocer a su angulo complementario tita
tita = 90 - A;
% Conocido el angulo A, estamos en condiciones de conocer el tercer angulo
% de este triangulo, el E.
E = 180 - phi - A;
% La importancia de E radica en que es complementario del angulo Q1, por lo
% tanto el Q1 puede hallarse como la diferencia entre 180 grados menos la
% sumatoria de todos los otros angulos internos previamente calculados (a
% excepcion de phi) 
q1 = 180 - 90 - A - tita - E