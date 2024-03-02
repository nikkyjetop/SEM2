function [x, flag, rr, it, rv] = jacobi(A, b, tol, maxit)
    % Inicializace proměnných
    n = length(b);
    x = zeros(n, 1);
    flag = 1; % Nastavení flagu na 1 před začátkem iterací, předpokládáme konvergenci
    rr = zeros(maxit, 1);
    rv = zeros(maxit, 1);
    
    % Iterace
    for it = 1:maxit
        x_old = x; % Uložení starého řešení
        
        for i = 1:n
            sum1 = A(i, 1:i - 1) * x_old(1:i - 1);
            sum2 = A(i, i + 1:n) * x_old(i + 1:n);
            x(i) = (b(i) - sum1 - sum2) / A(i, i);
        end
        
        % Výpočet residuů
        rv(it) = norm(b - A * x);
        rv(it) = norm(b - A * x)/norm(b); % Změna vzhledem k aktuálnímu řešení
        
        % Kontrola konvergence
        if rr(it) < tol || rv(it) < tol
            flag = 0; % Indikace, že metoda konvergovala
            break;
        end
    end
end
