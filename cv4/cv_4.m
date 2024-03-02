% Generování matice M
M = [0, 1, 1, 1, 1; 
     1, 0, 1, 0, 0; 
     1, 1, 0, 0, 1; 
     1, 0, 1, 0, 1; 
     0, 0, 1, 0, 0];

% Normalizace matice M
for i = 1:size(M, 1)
    M(:, i) = M(:, i) / sum(M(:, i));
end

% Počáteční vektor y0
y0 = ones(size(M, 1), 1) / size(M, 1);

% Spuštění mocninové metody
maxit = 1000;
tol = 1e-7;
[vec, lambda] = mocninna_metoda(M, y0, tol, maxit);

% Seřazení stránek podle PageRank
stranky = ['A', 'B', 'C', 'D', 'E'];
[~, indexy] = sort(vec);
webs = stranky(indexy);