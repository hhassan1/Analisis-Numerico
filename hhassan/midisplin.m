function [t, u] = midisplin(t0, tfin, N, a, b, pqr, C1, C2)
    t = zeros(1,N+2);
    u = zeros(2,N+2);
    switch C1
        case 0
            v1_0 = [a;0];
            v2_0 = [0;1];
        case 1
            v1_0 = [0;a];
            v2_0 = [1;0];
        otherwise
            disp('Error parametro C1.');
            return
    end
    [t, v1] = feval('mirk4',t0,tfin,N+1,v1_0,@fundisplin1,pqr);
    [~, v2] = feval('mirk4',t0,tfin,N+1,v2_0,@fundisplin2,pqr);
    switch C2
        case 0
            if (v2(1,end) ~= 0)
                u = v1 + (((b - v1(1,end))/v2(1,end)).*v2);
            elseif (v1(end) == b)
                disp('Infinitas soluciones.');
                u = v1;
            end
        case 1
            if (v2(2,end) ~= 0)
                u = v1 + (((b - v1(2,end))/v2(2,end)).*v2);
            elseif (v1(end) == b)
                disp('Infinitas soluciones.');
                u = v1;
            end
        otherwise
            disp('Error parametro C2.');
            return
    end
end