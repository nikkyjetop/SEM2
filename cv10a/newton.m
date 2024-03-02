function [x,res,k] = newton(f, fp, x0, tol, maxit)
    x = x0;
    k = 0;
    while k < maxit
        k = k + 1;
        x_new = x - f(x) / fp(x);
        res = abs(x_new - x);
        x = x_new;
        if res < tol
            return;
        end
    end
end