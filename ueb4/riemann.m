function y = riemann(I, f, n, q)
% Zerlegen des Intervalls. x ist ein Vektor mit den neuen Intervallgrenzen
% I(1) ist die linke Grenze des Ursprungsintervalls, I(2) ist die rechte.
x = I(1):(1/n):I(2);
xi = [];
sum = 0;
for k = 1:n
    xi(k+1) = x(k) + q*(x(k+1) - x(k));
    sum = sum + f(xi(k+1))*(x(k+1) - x(k));
end

y = sum;