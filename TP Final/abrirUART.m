%%
%Alumnos: Canaviri, Elio
%       Ceballos, Matias
%
%Apertura puerto serie

puertoCom='COM9';
baudR=9600;
s = serial(puertoCom); %Antes de ejecutar el código, verificar.
set(s,'BaudRate',baudR)
fileId=fopen(s);
disp('Abierto puerto serie en')
disp(puertoCom)

s=25;
fwrite(s,'%s','0')
pause(1);
s=40
fwrite(s,'%s','0')

respuesta=fread(s, 20)
respuesta=fread(s, 20)

fclose(s);
delete(s)
clear s