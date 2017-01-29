function [t, u] = midispnolin(t0, tfin, N, a, b, ffxfy, TOL, C1, C2)
    if (C1 == 0 && C2 == 0)
        s = (b - a)/(tfin - t0);
    elseif (C1 == 0 && C2 == 1)
        s = b;
    elseif (C1 == 1 && C2 == 0)
        s = b - a(tfin - t0);
    else
        disp('Combinación no aceptada.')
    end
    if (C1 == 0)
        x_0 = [a;s;0;1];
    else
        x_0 = [s;a;0;1];
    end
    [t, x] = feval('mirk4',t0,tfin,N+1,x_0,@fundispnolin,ffxfy);
    while (abs(x(1,end) - b) >= TOL)
        s = s - (x(1,end)-b)/x(3,end);
        x_0(2) = s;
        [~, x] = feval('mirk4',t0,tfin,N+1,x_0,@fundispnolin,ffxfy);
    end
    u = x(1,:);
end