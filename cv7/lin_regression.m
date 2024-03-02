function [k, q] = lin_regression(x, y)
    x = x(:); % Zabezpečíme, že x je vektor
    y = y(:); % Zabezpečíme, že y je vektor
    N = length(x);
    
    % Sestavenie normálnej matice
    A = [x, ones(N, 1)];
    
    % Výpočet parametrov k a q
    params = A \ y;
    k = params(1);
    q = params(2);
end