function [t,x] = euler(f,n,I,xi)            % função handle de x e t, número de iterações, intervalo no formato [ti tf], condição tal que x(ti)=xi
    h = (I(2)-I(1))/n ;                     % calculo passo 
    t(1) = I(1);                            % condições iniciais
    x(1) = xi  ;                            % -----------------          
    for i=1:n-1                             % faço as iterações
        t(i+1) = t(i) + h ;                 % -----------------      
        x(i+1) = x(i) + h*f(t(i),x(i)) ;    % calculo próximo x
    end                                     % -----------------      
end                                         % retorna t e x