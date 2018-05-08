function s = horner_eval(a,x,y)

n = length(a);
if n == 1
	result = a(n);
else
	result = a(n)*(y - x(n-1)) + horner_eval(a(1:n-1),x(1:n-1),y);
end

s = result;

end
