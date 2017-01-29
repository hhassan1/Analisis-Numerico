function [t, u] = midispnolin(t0, tfin, N, a, b, ffxfy, TOL)
    s = (b - a)/(tfin - t0);
    x_0 = [a;s;0;1];
    [t, x] = feval('mirk4',t0,tfin,N+1,x_0,@fundispnolin,ffxfy);
    while (abs(x(1,end) - b) >= TOL)
        s = s - (x(1,end)-b)/x(3,end);
        x_0(2) = s;
        [~, x] = feval('mirk4',t0,tfin,N+1,x_0,@fundispnolin,ffxfy);
    end
    u = x(1,:);
end