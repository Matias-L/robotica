function [q]=cinematicainversa03(p) 
parametros_fisicos;
q=[0 0]; % ponemos a cero el vector de entrada q para borrar los calculos anteriores de q
e=1e-3; % el error mínimo admisible. el radio del vector del entorno para validar 
% comienza el cálculo de la cinematica inversa 

addpath(genpath('D:\Inginieria Electronica\Optativas\Robotica y Animatronica\generaciontrayectorias'))


cosq2=((p(1)^2+p(2)^2-l1^2-l2^2)/(2*l1*l2));

if(cosq2>1);
    cosq2=1;
end;

if(cosq2<-1);
    cosq2=-1;
end;

senq2(1)=sqrt(1-cosq2^2); % me genera dos valores de senq2 este con signo positivo de la raiz
senq2(2)=-sqrt(1-cosq2^2);% y este con signo negativo de la raiz

q2=atan2(senq2,cosq2);
beta=atan(p(2)/p(1));% calcula auxiliar para lograr q(1)
alfa=atan2((l2*senq2),(l1+l2*cosq2));% aparecen dos valores de alfa debido a 
q1=beta-alfa;
% correccion del segundo y tercer cuadrante 
if p(1)<0 
    q1=q1+[pi pi]; q2=q2+[0 0];
end
if (p(1)<0 && p(2)<0)
    q1=q1+[0 0]; q2=q2+[0 0];
end


paux1=cinematicadirecta03([q1(1) q2(1)]);
paux2=cinematicadirecta03([q1(2) q2(2)]);

% if sum(abs(p-paux2))<e && sum(abs(p-paux1))<e % hay  que modificarlo para que se fije en los angulos y no en las posiciones a comparar
%     %disp('son iguales ');rad2deg([q1(2) q2(2)])
%     q=[q1(1) q2(1)];
    
    
    if sum(abs(p-paux1))<e
        if sum(abs(p-paux2))<=sum(abs(p-paux1))
            %     STRING=['la combinacion siguiente elegida es: ',num2str(rad2deg([q1(2) q2(2)]))];
            %     disp(STRING);
            q=[q1(2) q2(2)];
        else
            %      disp('la combinacion siguiente es elegida');rad2deg([q1(1) q2(1)])
            q=[q1(1) q2(1)];
        end
        
    else
        if sum(abs(p-paux2))<e
            %         disp('la combinacion siguiente es elegida');rad2deg([q1(2) q2(2)])
            q=[q1(2) q2(2)];
        else
        disp('ERROR. Punto  fuera de alcance')
        q=[NaN NaN]; % not a number , no es un número ra hacer notar que hay un error en el ingreo y que no se pueden calcular los q´s
            
        end
    end


end % este end se relaciona con el if sum(abs(p-paux2))<e & sum(abs(p-paux1))<e
 % para compro