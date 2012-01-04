demonstrativo(S,n,I,C,titulo,v)       % conjunto handle com S.dx(t,x,y) e S.dy(t,x), número de iterações, intervalo no formato [ti tf], conjunto de condições no formato [y0 x0]

    h = (I(2)-I(1))/n ;                       % calculo passo 
    
    t(1) = I(1);                              % condições iniciais
    y(1) = C(2);                              % ------------------
    x(1) = C(1);                              % ------------------
    
    [tr,yr] = ode45(@vdp1,[I(1) I(2)],[C(2); C(1)]);
    
    figure
    subplot(2,1,1)                                          % ploto o primeiro ponto
        xlim([I(1) I(2)])
        plot(tr,yr(:,2),'c.',tr,yr(:,1),'co')
        hold on
        b = plot(t,x,'r','XDataSource','t','YDataSource','x');
        c = plot(t,y,'b','XDataSource','t','YDataSource','y');               
        legend('x(t) ode45','y(t) ode45','x(t)','y(t)')                               % ------------------  
        title(titulo)
        xlabel('t')                                         % ------------------      
    subplot(2,1,2)                                          % ploto o primeiro ponto
        plot(yr(:,1),yr(:,2),'c.')
        hold on
        g = plot(y,x,'b','XDataSource','y','YDataSource','x');                            % ----------------- 
        xlabel('y(t)')                                      % ------------------  
        ylabel('x(t)')                                      % ------------------  

    
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

%        subplot(2,1,1)                                          % ploto o próximo ponto
%            plot(t(i+1),x(i+1),'r',t(i+1),y(i+1),'b')           % -----------------       
%        subplot(2,1,2)                                          % -----------------       
%            plot(y(i+1),x(i+1),'b')                             % ----------------- 

refreshdata(g,'caller')
refreshdata(b,'caller')
refreshdata(c,'caller')
drawnow
                
        %pause(v)                                       % pauso por v segundos
        
    end                                                                          