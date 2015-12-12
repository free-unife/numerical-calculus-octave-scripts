% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [p] = lagrangePolySimpler (x, y, evalPoints);
% [p] = lagrangePolySimpler (x, y, evalPoints);
%
% Build and evaluate the Lagrange polynomial (of degree = length (x) - 1),
% using Lagrange bases, for every element of evalPoints.
%
% I = { array x = observation points, array y = observed data at
% observation points x, array evalPoints represents the set of points where
% to evaluate the polynomial. }
% P = { x, y and evalPoins must be 1xn, 1xn and 1xm arrays respectively. }
% O = { p is the array containing the value of the polynomial for each
% evalPoint. }
% C = { p is 1x(length (evalPoints) and p = sum (sum (L (i) * y (i))) }


n = length (x);
p = zeros (size (evalPoints));

for k = 1 : n
	% lagrangeBase is the array of the sum of all the lagrange bases (for
	% every evalPoint.
	lagrangeBase = ones (size (evalPoints));
        % Skip step when i == k, infact:
        % Lk (xi) = (evalPoints - xk) / (xk - xi)
        % where i must not be equal to k (otherwise the result
        % would be Inf).
        % lagrangeBase is similar to the one in the definition. The only
        % difference here is that it's already evaluated in x = x (i).
	for i = [1 : k - 1, k + 1 : n]
		lagrangeBase = ((evalPoints - x (i)) ./ (x(k) - x(i))) .* lagrangeBase;
	end;
	% Calculatate the value of the polynomial.
	% pn (x) = y0 * L0(x) + y1 * L1 (x) + ... yn * Ln (x).
	p = p + (lagrangeBase * y (k));
end;
