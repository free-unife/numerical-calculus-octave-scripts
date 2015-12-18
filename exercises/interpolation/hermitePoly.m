% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [p, dd] = hermitePoly (x, y, derivative, evalPoints);
% [p, dd] = hermitePoly (x, y, derivative, evalPoints);
%
% Find the value of Hermite's polynomial for given evalPoints.
%
% I = { array x = observation points, array y = observed data at
% observation points x, array derivatives represents the derivative value 
% condition for each point x(i), array evalPoints represents the set of points 
% where to evaluate the polynomial. }
% P = { x, y, derivative and evalPoins must be 1xn, 1xn, 1xn and 1xm arrays 
% respectively. All elements in x must be distinct. }
% O = { p is an array containing the value of the polynomial for each 
% evalPoint, dd is the array of the divided differences. }
% C = { zeta is 1x(length (evalPoints), dd is 1xlength(x). }


n = length (x);
dd = dividedDiffsHermite (x, y, derivative);
p = zeros (1, length (evalPoints));

for k = 1 : length (evalPoints)
	% Horner's rule is applied to find the value of the polynomial.
	pp = dd (2 * n);
	for i = (2 * n) : - 1 : 1
		pp = (pp * (evalPoints (k) - x (round(i / 2)))) + dd (i);
	end;
	p (k) = pp;
end;
