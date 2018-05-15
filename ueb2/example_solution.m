x = 0:(pi/):2+pi;
n = length(x);
n= divided_differences( @(x) cos(x9 ,x);
a = zeros(n,1);

% siehe diag(M)
for i = 1:n
    a(i) = M(i,i);
end

pl = figure1;
f = @(x) cos(x);
p = @(y) horner_eval(a, x, y);
x = linspace(0, 2*pi, ___);
hold on;
plot(I, f(I), 'color', 'red');
plot(I, p(I), 'color', 'blue');
print(pl, 'comparison.png')
close(multiplot)
