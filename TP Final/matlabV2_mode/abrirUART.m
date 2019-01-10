%%
%Alumnos: Canaviri, Elio
%       Ceballos, Matias
%
%Apertura puerto serie


%%borrar objetos series previos en ese puerto
delete(instrfind({'Port'},{puertoCom}));
%crear objeto serie, recordar dejar el terminador como 'LF'
s = serial(puertoCom,'BaudRate',baudR, 'Terminator', 'LF');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');

%abrir puerto
fopen(s);

%get(s) %Devuelve informacion del puerto serie. Descomentar si necesario
%Cambiamos el timeout por defecto de 10 segundos a 2 segundos
set(s, 'TimeOut', 2)

datoEntrante=fscanf(s)  %Espera el "listo"
