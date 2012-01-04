function [t,x,y] = vanderpol(mu, n, I, C, metodo)  
% Função que simula o modelo de Van der Pol com parâmetro mu, n número de
% iterações, intervalo na forma [ti tf], condições iniciais na forma [x0
% y0], e nome do método a ser utilizado

    S.dy = @(t,x) x ;
    S.dx = @(t,x,y) mu*(1-y^2)*x-y ;
    
    eval(['[t x y] = ' metodo 'o2plota(S,n,I,C,''Van der Pol para \mu=' num2str(mu) ''')'])
    
    subplot(2,1,1)
    plot(t,x,'r',t,y,'b')
    legend('x(t)','y(t)')
    xlabel('t')
    
    subplot(2,1,2)
    plot(x,y)
    xlabel('x(t)')
    ylabel('y(t)')
end