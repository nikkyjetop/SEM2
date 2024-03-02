clc;

A = [3, 2, -1; 1, -2, 3; 2, 3, 2];
b = [1; 4; 3];

[x, U] = gauss_elim(A,b);

disp('Matica U (horny trojuholnikovy tvar):');
disp(U);
disp('Riešenie:');
disp(x);