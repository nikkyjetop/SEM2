function [x, U] = gauss_elim(A,b)

[n,~] = size(A);
U = A;
x = zeros(n,1);

for k = 1:n-1
     % riadkova pivotacia
     [max_val, max_idx] = max(abs(U(k:end, k)));
     max_idx = max_idx + k - 1;

     if max_val == 0
        error('Matrix is singular.');
     end
    % Výmena riadkov v matici U a vektori b
        U([k, max_idx], :) = U([max_idx, k], :);
        b([k, max_idx]) = b([max_idx, k]);

        for i = k+1:n
            factor = U(i, k) / U(k, k);
            U(i, k:end) = U(i, k:end) - factor * U(k, k:end);
            b(i) = b(i) - factor * b(k);
        end
end
    % Spätná substitúcia
x(n) = b(n) / U(n, n);
for i = n-1:-1:1
    x(i) = (b(i) - sum(U(i, i+1:end) * x(i+1:end))) / U(i, i);
end

