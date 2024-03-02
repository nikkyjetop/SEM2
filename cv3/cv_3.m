clc

% Vytvorenie matíc A a vektora b
A1 = full(gallery('poisson', 5));
A2 = full(gallery('lehmer', 20));
A3 = full(gallery('dorr', 5));

% Pravá strana - vektor jednotiek
b1 = ones(size(A1, 1), 1); % Pravá strana - vektor jednotiek pre A1
b2 = ones(size(A2, 1), 1); % Pravá strana - vektor jednotiek pre A2
b3 = ones(size(A3, 1), 1); % Pravá strana - vektor jednotiek pre A3

% Nastavenie parametrov pre metódu pcg
tol = 1e-8;
maxit = 5000;

% Riešenie pomocou metódy pcg
[x1, ~, rr1] = pcg(A1, b1, tol, maxit);
[x2, ~, rr2] = pcg(A2, b2, tol, maxit);
[x3, ~, rr3] = pcg(A3, b3, tol, maxit);

% Riešenie pomocou Jacobiho metódy
[x_jacobi1, ~, rr_jacobi1] = jacobi(A1, b1, tol, maxit);
[x_jacobi2, ~, rr_jacobi2] = jacobi(A2, b2, tol, maxit);
[x_jacobi3, ~, rr_jacobi3] = jacobi(A3, b3, tol, maxit);

% Riešenie pomocou Gauss-Seidelovej metódy
[x_gs1, ~, rr_gs1] = gauss_seidel(A1, b1, tol, maxit);
[x_gs2, ~, rr_gs2] = gauss_seidel(A2, b2, tol, maxit);
[x_gs3, ~, rr_gs3] = gauss_seidel(A3, b3, tol, maxit);

% Vytvorenie konvergenčného grafu
figure;
semilogy(1:length(rr1), rr1, '-o', 'DisplayName', 'PCG');
hold on;
semilogy(1:length(rr_jacobi1), rr_jacobi1, '-x', 'DisplayName', 'Jacobi');
semilogy(1:length(rr_gs1), rr_gs1, '-s', 'DisplayName', 'Gauss-Seidel');
xlabel('Počet iterácií');
ylabel('Residuum');
legend('Location', 'best');
title('Konvergencia - Matrica Poisson');

% Uloženie grafu
saveas(gcf, 'graph_poisson.png');

figure;
semilogy(1:length(rr2), rr2, '-o', 'DisplayName', 'PCG - Lehmer');
hold on;
semilogy(1:length(rr_jacobi2), rr_jacobi2, '-x', 'DisplayName', 'Jacobi - Lehmer');
semilogy(1:length(rr_gs2), rr_gs2, '-s', 'DisplayName', 'Gauss-Seidel - Lehmer');
xlabel('Počet iterácií');
ylabel('Residuum');
legend('Location', 'best');
title('Konvergencia - Matrica Lehmer');

% Uloženie grafu
saveas(gcf, 'graph_lehmer.png');

figure;
semilogy(1:length(rr3), rr3, '-o', 'DisplayName', 'PCG - Dorr');
hold on;
semilogy(1:length(rr_jacobi3), rr_jacobi3, '-x', 'DisplayName', 'Jacobi - Dorr');
semilogy(1:length(rr_gs3), rr_gs3, '-s', 'DisplayName', 'Gauss-Seidel - Dorr');
xlabel('Počet iterácií');
ylabel('Residuum');
legend('Location', 'best');
title('Konvergencia - Matrica Dorr');

% Uloženie grafu
saveas(gcf, 'graph_dorr.png');