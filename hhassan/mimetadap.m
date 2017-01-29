function [t, u, H, ERROR, rechazo] = mimetadap(t0, tfin, x0, h0, hmin, TOL, f, par, mono, ord)
    u(:,1) = x0;
    t(1) = t0;
    rechazo = 0;
    i = 1;
    fac = 0.7;
    facmax = 5;
    h = h0;
    hmax = h0;
    while(t(i) < tfin)
        [~, aux_un_salto]  = feval(mono,t(i),t(i) + h, 1,u(:,i),f,par);
        [~, aux_dos_saltos]  = feval(mono,t(i),t(i) + h, 2,u(:,i),f,par);
        ERR = norm((aux_dos_saltos(:,end) - aux_un_salto(:,end))/h);
        if(h < hmin)
            disp 'Error: Salto óptimo menor que el mínimo.'
            return
        elseif (ERR <= TOL)
            u(:,i+1) = aux_dos_saltos(:,end);
            t(i+1) = t(i) + h;
            H(i) = h;
            ERROR(i) = ERR;
            i=i+1;
            hmax = max(hmax,h);
        else
            rechazo = rechazo + 1;
        end
        h = min(hmax, h*min(facmax, fac*nthroot((TOL/ERR),ord)));
    end
end