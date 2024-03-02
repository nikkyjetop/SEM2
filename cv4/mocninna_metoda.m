function [vec, lambda] = mocninna_metoda(A, y0, tol, maxit)
    for j = 1:maxit
        u = y0 / norm(y0);
        y0 = A * u;
        lambda = u' * y0;
        vec = y0 / norm(y0);
        if norm(lambda * u - y0) < tol
            break;
        end
    end
end

% u je počáteční vektor, který inicializujeme na y0 normovaný na  délku y0. 
% Získame tím vektor s délkou 1
% iterace se opakuje maxit krát nebo dokud není dosaženo tolerance
% pomocí vynásobení u maticí A dostaneme vektor y0 a aktualizujeme odhad vlastního vektoru
% lambda je vypočteno jako skalární součin mezi původním vektorem u a novým vektorem y0. 
% lambda představuje aproximaci dominantního vlastního čísla matica A
% kontrola konvergence - kontrolujeme zda se aproximace dominantního 
% vlastního čísla lambda zmenšila o méně než tol mezi iteracemi. 
% Pokud ano, algoritmus se ukončí