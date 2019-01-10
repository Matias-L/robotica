
s = serial('COM9');
set(s,'BaudRate',9600)
fopen(s);
fprintf(s,'%s','0')
respuesta=fread(s, 20)

%fclose(s);
%delete(s)
%clear s