function [t, u, H, ERROR, rechazo] = mirkf45(t0,tfin, x0, h0, hmin, TOL, f, par)
    u(:,1) = x0;
    t(1) = t0;
    a = [0,         0,              0,              0,              0;
        1/4,        0,              0,              0,              0;
        3/32,       9/32,           0,              0,              0;
        1932/2197,  -7200/2197,     7296/2197,      0,              0;
        439/216,    -8,             3680/513,       -845/4104,      0;
        -8/27,      2,              -3544/2565,     1859/4104,      -11/40]';
    c = [0; 1/4; 3/8; 12/13; 1; 1/2];
    b = [25/216, 0, 1408/2565, 2197/4104, -1/5, 0]';
    b_tilde = [16/135, 0, 6656/12825, 28561/56430, -9/50, 2/55]';
    err_coefs = b_tilde - b;
    rechazo = 0;
    rechazo_local = 0;
    i = 1;
    fac = 0.7;
    facmax = 5;
    h = h0;
    hmax = h0;
    while(t(i) < tfin)
        if(rechazo_local == 0)
            K(:,1) = f(t(i),u(:,i),par);
        end
        for j=2:6
            K(:,j) = f(t(i) + h*c(j), u(:,i) + h*(K(:,1:j-1)*a(1:j-1,j)),par);
        end
        ERR = norm(K*err_coefs);
        if (ERR <= TOL)
            u(:,i+1) = u(:,i) + h*(K*b);
            t(i+1) = t(i) + h;
            i=i+1;
            hmax = max(hmax,h);
            H(i) = h;
            ERROR(i) = ERR;
            rechazo_local = 0;
        elseif(h < hmin)
            disp 'Error: Salto óptimo menor que el mínimo.'
            return
        else
            rechazo = rechazo + 1;
            rechazo_local = 1;
        end
        h = min(hmax, h*min(facmax, fac*nthroot((TOL/ERR),4)));
    end
end