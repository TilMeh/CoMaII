function result = ueb3a2a(n)

% Initialisiere Variablen

% Anzahl Stuetzstellen
i = 0:n;

% Funktionen
f = @(x) sin(x);
p = @horner_eval;

% Intervallgrenzen
a = -5;
b = 5;



% Erstelle Stuetzstellen

% Erstelle aequidistante Stuetzstellen
xis = a + i*(b - a)/n;

% Erstelle Tschebyschow Stuetzstellen
y = (b + a)/2 + ((b - a)/2) * cos(pi*(2*i + 1)/(2*(n+1)));



% Berechne Newton-Koeffizienten

% ... fuer aequidistante Stuetzstellen
m1 = divided_differences(f, xis);

% Hole Koeffizienten aus Dreiecksmatrix
a1 = diag(m1);


% ... fuer Tschebyschow Stuetzstellen
m2 = divided_differences(f, y);

% Hole Koeffizienten aus Dreiecksmatrix
a2 = diag(m2);


% Berechne Funktionswerte fuer f und p 

% ... mit aequidistanten Stuetzstellen
zf1 = f(xis);
xis
zf1
for j = 1:length(xis)
	zp1(j) = p(a1,xis,xis(j));
end

% ... mit Tschebyschow Stuetzstellen
zf2 = f(y);
for j = 1:length(y)
	zp2(j) = p(a2,y,y(j));
end


% Berechne Interpolationsfehler

fehler_aequi = max(abs(zf1-zp1))
fehler_tscheby = max(abs(zf2-zp2))

result = 0; %[fehler_aequi, fehler_tscheby];

fig = figure;
hold on;
%axis([-5 5])
plot(xis, zf1);
plot(xis, zf2);
plot(y, zp1);
plot(y, zp2);
legend('f(x) Aeq. Stuetz.', 'Interpol', 'f(x) Tscheb', 'Interpol');
figname =  strcat('2a_n', num2str(n), '.png');
saveas(fig, figname);
hold off;
end
