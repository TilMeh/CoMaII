f = @(x) cos(x);
n = 5;
x = linspace(0,2*pi,n);

%Neville Matrix
M = divided_differences(f,x);
a = zeros(1,n);
for i=1:n
	a(i) = M(i,i);
end

%um das polynom zu plotten, nehme 100 stutzstelle 
% und berechne mittels Horner Schema die y
xs = linspace(0,2*pi,100);
ys = zeros(1,100);
for i=1:100
	ys(i) = horner_eval(a,x,i);
end

figure1 = figure;
fplot(f, [0,2*pi]); hold on;
plot(xs,ys);
saveas(figure1, 'comparison.png');
