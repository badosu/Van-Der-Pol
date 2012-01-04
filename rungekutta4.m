function [t,x] = rungekutta4(f,n,I,xi)     % função handle de x e t, número de iterações, intervalo no formato [ti tf], condição tal que x(ti)=xi
    h = (I(2)-I(1))/n ;                       % calculo passo 
    t(1) = I(1);                              % condições iniciais
    x(1) = xi  ;                              % ------------------
    for i=1:n-1                               % faço as iterações
        t(i+1) = t(i) + h ;                   % -----------------      
        k(1) = f(t(i),x(i)) ;                 % calculo coeficientes
        k(2) = f(t(i)+h/2 ,x(i)+(h/2)*k(1)) ; % -----------------      
        k(3) = f(t(i)+h/2 ,x(i)+(h/2)*k(2)) ; % -----------------      
        k(4) = f(t(i)+h ,x(i)+h*k(3)) ;       % -----------------      
        x(i+1) = x(i) + (h/6)*(k*[1 2 2 1]') ;% calculo próximo x
    end                                       % -----------------       
end                                           % fim