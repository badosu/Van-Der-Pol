function [t,x,y] = eulermelhoradoo2(S,n,I,C)       % conjunto handle com S.dx(t,x,y) e S.dy(t,x), n�mero de itera��es, intervalo no formato [ti tf], conjunto de condi��es no formato [y0 x0]
   
    h = (I(2)-I(1))/n ;                       % calculo passo 
    
    t(1) = I(1);                              % condi��es iniciais
    y(1) = C(2);                              % ------------------
    x(1) = C(1);                              % ------------------
    
    for i=1:n-1                               % fa�o as itera��es
        
        t(i+1) = t(i) + h ;                      % -----------------      
        
        k(1) = S.dy(t(i),x(i)) ;                 % calculo pr�ximo y
        k(2) = S.dy(t(i)+h/2 ,x(i)+(h/2)*k(1)) ; % -----------------      
        y(i+1) = y(i) + h*k(2) ;                 % -----------------      
        
        k(1) = S.dx(t(i),x(i),y(i)) ;                 % calculo pr�ximo x
        k(2) = S.dx(t(i)+h/2 ,x(i)+(h/2)*k(1),y(i)) ; % -----------------      
        x(i+1) = x(i) + h*k(2) ;                      % -----------------      
        
    end                                       % -----------------  
    
end                                          