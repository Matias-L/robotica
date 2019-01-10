function [ PX,PY,PZ ] = fCineDirecta( Q1,Q2,Q3, T )
%NOTA: uso MAYUSCULA para cinematica directa, asi no se confunden las
%variables en otras funciones

    Aux=eval(T);
    PX=Aux(1,4);        %Eje x
    PY=Aux(2,4);        %Eje y
    PZ=Aux(3,4);        %Eje z
end

