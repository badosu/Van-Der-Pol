function demonstrativo(S,n,I,C,titulo)       % conjunto handle com S.dx(t,x,y) e S.dy(t,x), n�mero de itera��es, intervalo no formato [ti tf], conjunto de condi��es no formato [y0 x0]

    h = (I(2)-I(1))/n ;                       % calculo passo 
    
    t(1) = I(1);                              % condi��es iniciais
    xe(1) = C(1);                              % ------------------
    ye(1) = C(2);                              % ------------------
    xr(1) = C(1);                              % ------------------
    yr(1) = C(2);                              % ------------------
    
    [to,yo] = ode45(@vdp1,[I(1) I(2)],[C(2); C(1)]);
    
    figure
    subplot(2,1,1)                                          % ploto o primeiro ponto
        xlim([I(1) I(2)])
        plot(to,yo(:,2),'co')
        hold on
        b = plot(t,xr,'r','XDataSource','t','YDataSource','xr');
        c = plot(t,xe,'b','XDataSource','t','YDataSource','xe');               
        legend('x(t) ode45','x(t) Runge-Kutta','x(t) Euler melhorado')
        title(titulo)
        xlabel('t')                                         % ------------------      
    subplot(2,1,2)                                          % ploto o primeiro ponto
        plot(yo(:,1),yo(:,2),'co')
        hold on
        g = plot(yr,xr,'r','XDataSource','yr','YDataSource','xr');                            % ----------------- 
        a = plot(ye,xe,'b','XDataSource','ye','YDataSource','xe');                            % ----------------- 
        xlabel('y(t)')                                      % ------------------  
        ylabel('x(t)')                                      % ------------------  
        legend('ode45','Runge-Kutta','Euler melhorado')

    
    for i=1:n-1                               % fa�o as itera��es
        
        t(i+1) = t(i) + h ;                   % ----------------- 
        
        k(1) = S.dy(t(i),xr(i)) ;                 % calculo pr�ximo yr
        k(2) = S.dy(t(i)+h/2 ,xr(i)+(h/2)*k(1)) ; % -----------------      
        k(3) = S.dy(t(i)+h/2 ,xr(i)+(h/2)*k(2)) ; % -----------------      
        k(4) = S.dy(t(i)+h ,xr(i)+h*k(3)) ;       % -----------------      
        yr(i+1) = yr(i) + (h/6)*(k*[1 2 2 1]') ;   % -----------------  
        
        
        k(1) = S.dx(t(i),xr(i),yr(i)) ;                  % calculo pr�ximo xr
        k(2) = S.dx(t(i)+h/2 ,xr(i)+(h/2)*k(1) ,yr(i)) ; % -----------------      
        k(3) = S.dx(t(i)+h/2 ,xr(i)+(h/2)*k(2) ,yr(i)) ; % -----------------      
        k(4) = S.dx(t(i)+h ,xr(i)+h*k(3) ,yr(i)) ;       % -----------------      
        xr(i+1) = xr(i) + (h/6)*(k*[1 2 2 1]') ;         % -----------------     
        
        k(1) = S.dy(t(i),xe(i)) ;                 % calculo pr�ximo ye
        k(2) = S.dy(t(i)+h/2 ,xe(i)+(h/2)*k(1)) ; % -----------------      
        ye(i+1) = ye(i) + h*k(2) ;                 % -----------------      
        
        k(1) = S.dx(t(i),xe(i),ye(i)) ;                 % calculo pr�ximo xe
        k(2) = S.dx(t(i)+h/2 ,xe(i)+(h/2)*k(1),ye(i)) ; % -----------------      
        xe(i+1) = xe(i) + h*k(2) ;                      % -----------------      

        refreshdata(g,'caller')
        refreshdata(b,'caller')
        refreshdata(c,'caller')
        refreshdata(a,'caller')
        drawnow
        
    end 
    
end