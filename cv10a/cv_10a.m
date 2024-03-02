clear;
clc;

a = 1;
b = 0.5;
tol = 1e-7;
maxit = 1000;

g = @(x)log(x + 0.5);
f = @(x) (x.^2 / a.^2) + (log(x + 0.5).^2 / b.^2) - 1;
fp = @(x) (2.*x / a^2) + (2 .* g(x)) / (b.^2 .* (x + 0.5));

%vykreslenie elipsy
clf;
hold on;
xlim([-1.5 1.5]);
ylim([-1.5 1.5]);
yline(0);
xline(0);
[xx,yy] = elipsa(a,b);
plot(xx,yy,'r');

%vysetrenie bodov
x1 = calc(f, fp, g, 0, 0.25, tol, maxit);
x2 = calc(f, fp, g, 0.25, 1, tol, maxit);
saveas(gcf, "graph.png");


function [x] = calc(f,fp, g, a, b, tol, maxit)
[bi_x] = bisection(f,a,b,tol,maxit);
[ne_x] = newton(f, fp, a, tol, maxit);
[ned_x] = newton_diff(f, a, b, tol, maxit);
plot([bi_x ne_x ned_x], [g(bi_x) g(ne_x) g(ned_x)], '.', 'markersize', 24);
plot([bi_x ne_x ned_x], [f(bi_x) f(ne_x) f(ned_x)], '.', 'markersize', 24);
x = (bi_x + ne_x + ned_x) / 3;
end

%metoda pre vytvorenie elipsy
function [x, y] = elipsa(a, b)
    t = linspace(0, 2 * pi);
    x = a * cos(t);
    y = b * sin(t);
end
