% Funkcia má tiež vstupy A matica, 
% b vektor pravej strany, tol tolerancia pre konvergenciu, 
% a maxit maximálny počet iterácií. 
% Výstupy sú x odhad riešenia, flag indikátor konvergencie, 
% rr hodnoty residua a rv hodnoty relatívnych zmien medzi iteráciami.

function [x, flag, rr, it, rv] = gauss_seidel(A, b, tol, maxit)
    % Inicializace proměnných
    n = length(b);
    x = zeros(n, 1);
    flag = 1; % Nastavení flagu na 1 před začátkem iterací, předpokládáme konvergenci
    rr = zeros(maxit, 1);
    rv = zeros(maxit, 1);
    % Iterace
    for it = 1:maxit
        for i = 1:n
            sum1 = A(i, 1:i - 1) * x(1:i - 1);
            sum2 = A(i, i + 1:n) * x(i + 1:n);
            x(i) = (b(i) - sum1 - sum2) / A(i, i);
        end
        % Výpočet residuí
        rr(it) = norm(b - A * x);
        rv(it) = norm(x);
        % Kontrola konvergence
        if rr(it) < tol
            flag = 0; % Indikace, že metoda konvergovala
            break;
        end
    end
end

