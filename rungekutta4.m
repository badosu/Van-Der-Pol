function [t,x] = rungekutta4(f,n,I,xi)     % fun��o handle de x e t, n�mero de itera��es, intervalo no formato [ti tf], condi��o tal que x(ti)=xi
    h = (I(2)-I(1))/n ;                       % calculo passo 
    t(1) = I(1);                              % condi��es iniciais
    x(1) = xi  ;                              % ------------------
    for i=1:n-1                               % fa�o as itera��es
        t(i+1) = t(i) + h ;                   % -----------------      
        k(1) = f(t(i),x(i)) ;                 % calculo coeficientes
        k(2) = f(t(i)+h/2 ,x(i)+(h/2)*k(1)) ; % -----------------      
        k(3) = f(t(i)+h/2 ,x(i)+(h/2)*k(2)) ; % -----------------      
        k(4) = f(t(i)+h ,x(i)+h*k(3)) ;       % -----------------      
        x(i+1) = x(i) + (h/6)*(k*[1 2 2 1]') ;% calculo pr�ximo x
    end                                       % -----------------       
end                                           % fim