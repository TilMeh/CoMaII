function A = divided_differences(f,x)

n = length(x);
m = zeros(n,n);

% j = spalte i = zeile
%erste spalte
for j = 1:n
    m(j,1) = f(x(j));
end

% j = spalte i = zeile
for i = 2:n
    for j = 2:i
	k = abs(i-j);
        m(i,j) = (m(i,j-1) - m(i-1,j-1)) / (x(i) - x(k+1));
    end
end

A = m;
end
