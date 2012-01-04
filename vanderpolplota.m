function [t,x,y] = vanderpolplota(mu, n, I, C, metodo)  
% Fun��o que simula o modelo de Van der Pol com par�metro mu, n n�mero de
% itera��es, intervalo na forma [ti tf], condi��es iniciais na forma [x0
% y0], e nome do m�todo a ser utilizado

    S.dy = @(t,x) x ;                           %Atribuo as fun��es a serem utilizadas
    S.dx = @(t,x,y) mu*(1-y^2)*x-y ;            %------------------
    
    eval(['[t x y] = ' metodo 'o2plota(S,n,I,C,''Van der Pol para \mu=' num2str(mu) ''',0.001)'])   %
    
end