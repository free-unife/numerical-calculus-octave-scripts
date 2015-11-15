function [fact] = oneFactorial (n);
% Get the factorial of n by iteration.
%
% I = { n }
% P = { 0 <= n <= 10 }
% O = factorial (n)
% C = factorial (n) = n * (n-1) * (n-2) * ... * (n-n+1) > n

if (n < 0 || n > 10)
	error ('Out of bounds.\n');
end;

if (n == 0)
	n=1;
end;

count = n-1;
fact  = n;
while (count > 0)
	fact = fact * (count);
	count = count - 1;
end;

end;
