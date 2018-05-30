function [S,A] = summed_newton_cotes(a,b,f,k,n)

	h = abs(b - a)/n;

	switch(k)
	case 1
		fprintf('Trapez Rule');
		a = 0;
		sum = 0;
		for i=0:(n-1)
			sum = sum + f(i) + f(i+1);
			a = a + 2;
		end
		res = sum * h/2
		a
	case 2
		fprintf('Simpson Rule\n');
		a = 0;
		sum = 0;
		for i=0:(n-1)
			sum = sum + f(2*i) + 4*f(2*i + 1) + f(2*i + 2);
			a = a + 3;
		end
		res = sum * h / 6
		a
	case 6
		fprintf('Weddle Rule\n');
		a = 0;
		sum = 0;
		for i=0:(n-1)
			sum = f(6*i) + f(6*i + 1) + f(6*i + 2) + f(6*i + 3) + f(6*i + 4) + f(6*i + 5) + f(6*i + 6);
			a = a + 6;
		end
		res = sum * h / 240
		a
	otherwise
		fprint('k should be either 1,2 or 6');
	end

end
