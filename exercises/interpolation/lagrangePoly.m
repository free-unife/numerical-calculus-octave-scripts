function [p, a] = lagrangePoly (x, y, evalPoints);
%
%
% I = { array evalPoints represents the set of points where to evaluate the
% polynomial. }
% P = {}
% O = {}
% C = {}


n1 = length (y);
a = zeros (size (x));
p = zeros (size (evalPoints));

% Since X * a = y
% and we need to find A:
% a = y / X
% where a is the coefficient array,
% y is the array of the known values.
% X is the matrix of the Ls (plural L).
% The following are not the real coefficients... TODO
for i = 1 : n1
	% Skip step when i == k.
	%
	%
	% WARNING
	% SOMETHING IS WRONG HERE!!!
	a(i) = y(i)/prod (x(i)-x([1:i-1,i+1:n1]));
	%
	%
end;

% Calculate the polynomial value with each evaluation point.
for k = 1 : length (evalPoints)
	% Check if the value of f(x) in evalPoint must be found or has already
	% been given in input with x(index), y(index).
	ij = find (evalPoints (k) == x);
	if isempty (ij)
		% Find the numerator of the Lagrange formula.
		% Using mathematical notation:
		% temp = (evalPoint - x0) * (evalPoint - x1) * ... * (evalPoint - xn)
		temp = prod (evalPoints (k) - x);
		% Find the denominator.
		% temp * (a0                 ...   an       )
		%        (---------------- + ... + ---------)
		%        ((evalPoint - x0)   ...   (.. - xn))
		p (k) = temp * sum (a ./ (evalPoints (k) - x));
	else
		% If the current evalPoint is the same as one of the x points,
		% then we already know the value of that y since it has been
		% given in input.
		p (k) = y (ij (1));
	end;
end;

