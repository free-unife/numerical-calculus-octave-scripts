% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [p, a] = polyVandermonde (x, y, evalPoints);
% [p, a] = polyVandermonde (x, y, evalPoints);
%
% Polynomial interpolation using Vandermonde matrix.
% The problem of this method is that Vandermonde matrix is ill-conditioned
% which leads to bad results.
%
% I = { array x = observation points, array y = observed data at
% observation points x, array evalPoints represents the set of points where
% to evaluate the polynomial. }
% P = { x, y and evalPoins must be 1xn, 1xn and 1xm arrays respectively. }
% O = { p is the array containing the value of the polynomial for each
% evalPoint, a is the array of coefficients ordered from degree 0 to n - 1. }
% C = { y = f(x) = a .* x^(0 : n - 1) = interpolating function,
% p is 1x(length (evalPoints), a is 1x xRows. }


[xRows, xCols] = size(x);
[yRows, yCols] = size(y);

if xCols ~= yCols || (xRows ~= 1 && yRows ~= 1)
	error ('Size mismatch.');
end;

x = x';
y = y';

n = xCols;

% Find the Vandermonde matrix.
V = zeros (n);

for i = 1 : n
	V (i, 1 : n) = x (i) .^ (0 : n - 1);
end;
% The following for loop has the same effect as the latter.
%for i = 1 : n
%	for k = 1 : n
%		V (i, k) = x (i)^(k - 1);
%	end;
%end;

% Linear system resolution of V to find a.
[Lg, Rg, deter] = gauss1 (V);
yg = solLower (Lg, y);
a = solUpper (Rg, yg);

a = a';
for k = 1 : length (evalPoints)
	pv = 0;
	for i = 1 : length (a)
		pv = pv + (a (i) * (evalPoints(k) ^ (i - 1)));
	end;

	p (k) = pv;
end;
