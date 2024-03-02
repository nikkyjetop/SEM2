function [x,res,k] = bisection(f, a, b, tol, maxit)
    if f(a) * f(b) >= 0
        error('Funkcia nespĺňa podmienku pre metódu bisekcie.');
    end
    k = 0;
    while k < maxit
        k = k + 1;
        x = (a + b) / 2;
        res = (b - a) / 2;
        if res < tol
            return;
        end
        if f(x) == 0
            return;
        elseif f(a) * f(x) < 0
            b = x;
        else
            a = x;
        end
    end
end