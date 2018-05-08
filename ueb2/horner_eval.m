function s = horner_eval(a,x,y)

n = length(a);
if n == 1
  result = a(1);
else
  result = a(1) + (y - x(1)) * horner_eval(a(2:n),x(2:n),y);
end

s = result;

end
