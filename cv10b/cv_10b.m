% Pozice satelitu
x1 = [20180; 21800; 24600];
x2 = [25300; 21400; 23000];
x3 = [22200; 20200; 22600];
% Vzdálenost od satelitu
d1 = 3.853416925275540e+04;
d2 = 4.030272199244115e+04;
d3 = 3.753709365414429e+04;
% Funkcia pre vzdialenost
distance = @(a, b) norm(a - b);
% Funkcia F(x)
F = @(x) [
    distance(x, x1) - d1;
    distance(x, x2) - d2;
    distance(x, x3) - d3
];
% Jacobiova matica J(x)
J = @(x) [
    (x(1) - x1(1)) / distance(x, x1), (x(2) - x1(2)) / distance(x, x1), (x(3) - x1(3)) / distance(x, x1);
    (x(1) - x2(1)) / distance(x, x2), (x(2) - x2(2)) / distance(x, x2), (x(3) - x2(3)) / distance(x, x2);
    (x(1) - x3(1)) / distance(x, x3), (x(2) - x3(2)) / distance(x, x3), (x(3) - x3(3)) / distance(x, x3)
];
% Počiatočný odhad
x0 = [0; 0; 0];
% Tolerancia pre konvergenciu
tol = 1e-7;
% Maximálny počet iterácií
maxit = 100;
% Newton-Raphsonova metóda
[x, k] = newton_raphson(F, J, x0, tol, maxit);
% Výsledok
fprintf('Moje řešení:    [%f, %f, %f]\n', x(1), x(2), x(3));
fprintf('Správné řešení: [10, 20, 30]\n');


% Conclusion text
% Ak by sme mali k dispozicii data z viacerych satelitov, zostavili by sme system 
% nelinearnych rovnic s vacsim poctom rovnic, kde kazda rovnica  by predstavovala 
% vzdialenost od jedneho zo satelitov.
% Na riesenie rozsirenie sustavy rovnic by sme ale mohli pouzit Newton - Raphsonovu metodu
% alebo ine numericke metody - napriklad metodu Levenberga-Marquardta.
% Tento pristup k rieseniu GPS sledovania s viacerymi satelitmi je bezny
% v realinych aplikaciach a zabezpecuje vysoku presnost urcovania polohy
% a casoveho posunu.
