
dim=size(x0,1);

if fex(t(1)) == 123456789
	figure(1)
	plot(t,u(1,:),'b')
	title('x(t)')
	
	if size(ERROR,2)>1
		figure(2)
		plot(1:numiter,ERROR(1:numiter), 'r')
		title('ERROR por iteracion')
	end
	
else

	fexv = zeros(1,N+1);
	for i=1:N+1
		fexv(i) = fex(t(i));
	end

	figure(1)
	plot(t,fexv, 'g',t,u(1,:), 'b')
	title('fex(t) green, x(t) blue')

	pause(1)

	if size(ERROR,2)>1
		figure(2)
		
		subplot(2,1,1)
		plot(1:numiter,ERROR(1:numiter), 'r')
		title('ERROR por iteracion')
		
		subplot(2,1,2)
		plot(t,u(1,:)-fexv, 'r')
		title('x(t)-fex(t)')
	end
end

