%%
%Alumnos: Canaviri, Elio
%       Ceballos, Matias
%
%Comunicacion serie
%Andando al 17/11. Version 1.1
%.ino asociado: "servoV1punto1"

clear all
clc
%%borrar objetos series previos en ese puerto
delete(instrfind({'Port'},{'COM9'}));
%crear objeto serie, recordar dejar el terminador como 'LF'
s = serial('COM9','BaudRate',115200, 'Terminator', 'LF');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');

%abrir puerto
fopen(s);

%get(s) %Devuelve informacion del puerto serie. Descomentar si necesario
%Cambiamos el timeout por defecto de 10 segundos a 2 segundos
set(s, 'TimeOut', 2)

datoEntrante=fscanf(s)  %Espera el "listo"


%pause(1)
%enviar=uint8(75)
%fwrite(s, enviar)
%pause(1.5)
%enviar=char(10)
%fwrite(s, enviar)
%pause(1.5)
%enviar=uint8(12)
%fwrite(s, enviar)
%pause(1.5)
%enviar=char(10)
%fwrite(s, enviar)

%"enviar" es la variable a mandar por el UART
enviar=180
%Es necesario formatear el dato a enviar. "%u": entero
%                                          "\n": terminador LF
fprintf(s, '%u\n', enviar)
pause(0.01)
enviar=175
fprintf(s, '%u\n', enviar)
pause(0.01)

%Esperamos la respuesta del arduino
datoEntrante=fscanf(s)



%% Limpiar la escena del crimen
fclose(s);
delete(s);
clear s;