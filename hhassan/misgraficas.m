figure(1)
aux = size(u,1);
if(aux == 1)
    title('Grafica');
    plot(t,u,'r')
end
if(aux == 2)
    subplot(2,1,1)
    plot(t,u(1,:),'r')
    title('Graficas parciales');
    legend('x1')
    subplot(2,1,2)
    plot(t,u(2,:),'g')
    legend('x2')
    pause(0.1);
    figure(2)
    plot(u(1,:),u(2,:),'r')
    title('Grafica de flujo');
end
if(aux == 3)
    subplot(3,1,1)
    plot(t,u(1,:),'r')
    title('Graficas parciales');
    legend('x1')
    subplot(3,1,2)
    plot(t,u(2,:),'g')
    legend('x2')
    subplot(3,1,3)
    plot(t,u(3,:),'b')
    legend('x2')
    pause(0.1);
    figure(2)
    plot3(u(1,:),u(2,:),u(3,:),'r')
    title('Grafica de flujo');
end
    
