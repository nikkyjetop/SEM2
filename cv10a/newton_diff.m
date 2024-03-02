
function [x,res,k] = newton_diff(f, x0, x1, tol, maxit)
    x = x0;
    x_prev = x1;
    k = 0;
    while k < maxit
        k = k + 1;
        x_new = x - (f(x) * (x - x_prev)) / (f(x) - f(x_prev));
        res = abs(x_new - x);
        x_prev = x;
        x = x_new;
        if res < tol
            return;
        end
    end
end
