clc

% Definujeme polynom
p = [1, -4, 2, 2, 1, 6];

% Zavoláme funkci find_int_roots
[x, M] = find_int_roots(p);

% Výstupy
disp('Celočíselné kořeny:');
disp(x);

disp('Kroky Hornerova schématu:');
disp(M);
