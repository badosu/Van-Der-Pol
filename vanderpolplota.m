function [t,x,y] = vanderpolplota(mu, n, I, C, metodo)  
% Função que simula o modelo de Van der Pol com parâmetro mu, n número de
% iterações, intervalo na forma [ti tf], condições iniciais na forma [x0
% y0], e nome do método a ser utilizado

    S.dy = @(t,x) x ;                           %Atribuo as funções a serem utilizadas
    S.dx = @(t,x,y) mu*(1-y^2)*x-y ;            %------------------
    
    eval(['[t x y] = ' metodo 'o2plota(S,n,I,C,''Van der Pol para \mu=' num2str(mu) ''',0.001)'])   %
    
end