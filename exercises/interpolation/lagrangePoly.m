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
for i = 1 : n1
	% Skip step when i == k.
	a (i) = y (i) / prod (x (i) - x ([1 : i - 1, i + 1 : n1]));
end;

% Calculate the polynomial value with each evaluation point.
for k = 1 : length (evalPoints)
	ij = find (evalPoints (k) == x)
	if isempty (ij)
		temp = prod (evalPoints (k) - x)
		p (k) = temp * sum (a ./ (evalPoints (k) - x))
	else
		p (k) = y (ij(1))
	end;
end;

