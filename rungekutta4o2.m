function [t,x,y] = rungekutta4o2(S,n,I,C)       % conjunto handle com S.dx(t,x,y) e S.dy(t,x), número de iterações, intervalo no formato [ti tf], conjunto de condições no formato [y0 x0]

    h = (I(2)-I(1))/n ;                       % calculo passo 
    
    t(1) = I(1);                              % condições iniciais
    x(1) = C(1);                              % ------------------
    y(1) = C(2);                              % ------------------
    
    for i=1:n-1                               % faço as iterações
        
        t(i+1) = t(i) + h ;                   % ----------------- 
        
        k(1) = S.dy(t(i),x(i)) ;                 % calculo próximo y
        k(2) = S.dy(t(i)+h/2 ,x(i)+(h/2)*k(1)) ; % -----------------      
        k(3) = S.dy(t(i)+h/2 ,x(i)+(h/2)*k(2)) ; % -----------------      
        k(4) = S.dy(t(i)+h ,x(i)+h*k(3)) ;       % -----------------      
        y(i+1) = y(i) + (h/6)*(k*[1 2 2 1]') ;   % -----------------      
        
        k(1) = S.dx(t(i),x(i),y(i)) ;                  % calculo próximo x
        k(2) = S.dx(t(i)+h/2 ,x(i)+(h/2)*k(1) ,y(i)) ; % -----------------      
        k(3) = S.dx(t(i)+h/2 ,x(i)+(h/2)*k(2) ,y(i)) ; % -----------------      
        k(4) = S.dx(t(i)+h ,x(i)+h*k(3) ,y(i)) ;       % -----------------      
        x(i+1) = x(i) + (h/6)*(k*[1 2 2 1]') ;         % -----------------      
        
    end                                      
    
end                                           