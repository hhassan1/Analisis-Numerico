
dim=size(x0,1);
figure(1)
if dim==1
    plot(t,u, 'r')
    title('x(t)')
elseif dim==2
    subplot(2,1,1)    
    plot(t,u(1,:), 'r')
    title('x(t)')
    
    subplot(2,1,2)
    plot(t,u(2,:), 'g')
    title('y(t)')
elseif dim==3
    subplot(3,1,1)
    plot(t,u(1,:), 'r')
    title('x(t)')
    
    subplot(3,1,2)
    plot(t,u(2,:), 'g')
    title('y(t)')
       
    subplot(3,1,3)
    plot(t,u(3,:), 'b')
    title('z(t)')    
end

pause(1)

if dim==2
    figure(2)    
    plot(u(1,:),u(2,:))
    title('F(x,y)')
elseif dim==3
    figure(2)
    plot3(u(1,:),u(2,:),u(3,:))
    title('F(x,y,z)')    
end

pause(1)

if or(size(ERROR,2)>1,size(H,2)>1)
   figure(3)
   
   ERROR(:,1)=ERROR(:,2);
   H(:,1)=H(:,2);
   
   subplot(2,1,1)   
   plot(t,ERROR, 'r')
   title('ERROR(t)')
   
   subplot(2,1,2)   
   plot(t,H, 'g')
   title('H(t)')
end