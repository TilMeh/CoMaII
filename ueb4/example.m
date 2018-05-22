sums = [];
errors1 = [];
errors2 = [];
I = [0, 1];
f = @(x) exp(-(x^2));
q = 0;
for n = 1:500
    sums(n) = riemann(I, f, n, q);
end
errors1 = abs((0.5 * erf(1) * sqrt(pi)) - sums);

q = 0.5;
for n = 1:500
    sums(n) = riemann(I, f, n, q);
end
errors2 = abs((0.5 * erf(1) * sqrt(pi)) - sums);

figure1 = figure;
%subplot(2,1,1);
semilogx(errors1); hold on;
title('Riemann Error');
%subplot(2,1,2);
semilogx(errors2);
%title();
legend('q = 0', 'q = 0.5');
saveas(figure1, 'riemann_error.png');

% Beobachtung: Der Fehler ist für q = 0.5 geringer
