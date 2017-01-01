function [t, u] = mi2metadap(t0, tfin, x0, h0, N, hmin, TOL, f, par, mono_uno, ord_uno, mono_dos, ord_dos)
    u(:,1) = x0;
    t(1) = t0;
    rechazo = 0;
    i = 1;
    fac = 0.7;
    facmax = 5;
    h = h0;
    hmax = h0;
    ord_min = min(ord_uno, ord_dos)
    while(t(i) < tfin)
        [~, aux_mono_uno]  = mono_uno(t(i),t(i) + h, 1,u(:,i),f,par);
        [~, aux_mono_dos]  = mono_dos(t(i),t(i) + h, 2,u(:,i),f,par);
        ERR = norm((aux_u(N+1) - aux_u(1))/h);
        if(h < hmin)
            disp 'Error: Salto óptimo menor que el mínimo.'
            return
        elseif (ERR <= TOL)
            u(:,i+1) = aux_u(N+1);
            t(i+1) = t(i) + h;
            i=i+1;
            hmax = max(hmax,h);
            H(i) = h;
            ERROR(i) = ERR;
        else
            rechazo = rechazo + 1;
        end
        h = min(hmax, h*min(facmax, fac*nthroot((TOL/ERR),ord_min)));
    end
end