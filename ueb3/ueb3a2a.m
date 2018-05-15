function result = ueb3a2a(n)

% Initialisiere Variablen

% Anzahl Stuetzstellen
i = 0:1000;

% Funktionen
f = @sin;
p = @horner_eval;

% Intervallgrenzen
a = -5;
b = 5;



% Erstelle Stuetzstellen

% Erstelle aequidistante Stuetzstellen
x = a + i*(b - a)/n;

% Erstelle Tschebyschow Stuetzstellen
y = (b + a)/2 + ((b - a)/2) * cos(pi*(2*i + 1)/(2*(n+1)));



% Berechne Newton-Koeffizienten

% ... fuer aequidistante Stuetzstellen
m1 = divided_differences(f, x);

% Hole Koeffizienten aus Dreiecksmatrix
a1 = diag(m1);


% ... fuer Tschebyschow Stuetzstellen
m2 = divided_differences(f, y);

% Hole Koeffizienten aus Dreiecksmatrix
a2 = diag(m2);


% Berechne Funktionswerte fuer f und p 

% ... mit aequidistanten Stuetzstellen
zf1 = f(x);
for j = 1:length(x)
	zp1(j) = p(a1,x,x(j));
end

% ... mit Tschebyschow Stuetzstellen
zf2 = f(y);
for j = 1:length(y)
	zp2(j) = p(a1,y,y(j));
end


% Berechne Interpolationsfehler

fehler_aequi = max(abs(zf1-zp1))
fehler_tscheby = max(abs(zf2-zp2))

result = 0; %[fehler_aequi, fehler_tscheby];

fig = figure;
hold on;
plot(zf1, x);
plot(zf2, x);
plot(zp1, y);
plot(zp1, y);
figname =  strcat('n', n, '.png');

saveas(fig, figname)
hold
end
