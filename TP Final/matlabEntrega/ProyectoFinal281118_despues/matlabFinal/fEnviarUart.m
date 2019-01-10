%%
%Alumnos: Canaviri, Elio
%       Ceballos, Matias
%
%Funcion enviar por UART
%@param:    puerto: Objeto "serial" que describe al puerto UART
%           guiniada, cabezeo: Giro de los motores
%@return: respuestaArduino: Cadena de texto respuesta desde el 
%                           arduino


function [ respuestaArduino ] = fEnviarUart( puerto, guiniada, cabezeo )

%"enviar" es la variable a mandar por el UART
enviar=guiniada;
%Es necesario formatear el dato a enviar. "%u": entero
%                                          "\n": terminador LF
fprintf(puerto, '%u\n', enviar);
pause(0.01)
enviar=cabezeo;
fprintf(puerto, '%u\n', enviar);
pause(0.01)

%Esperamos la respuesta del arduino
respuestaArduino=fscanf(puerto);


end

