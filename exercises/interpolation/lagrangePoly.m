% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [p, a] = lagrangePoly (x, y, evalPoints);
% [p, a] = lagrangePoly (x, y, evalPoints);
%
% This is an optimized version of lagrangePolySimpler which avoids the 
% recalculation of part of the Lagrange polynomial for each evalPoint. Once the 
% coefficients a are found at the beginning, they are used length(evalPOints) 
% times.
%
% I = { array x = observation points, array y = observed data at
% observation points x, array evalPoints represents the set of points where
% to evaluate the polynomial. }
% P = { x, y and evalPoins must be 1xn, 1xn and 1xm arrays respectively. }
% O = { p is the array containing the value of the polynomial for each
% evalPoint, a is the array of the coefficients which remain constant for 
% every evalPoints in input. }
% C = { p is 1x(length (evalPoints) and p = sum (sum (L (i) * y (i))), a is 
% 1xlength (y). }


n1 = length (y);
a = zeros (size (x));
p = zeros (size (evalPoints));

% Lagrange formula is applied in a different way.
for i = 1 : n1
	% Skip step when i == k.
	a(i) = y(i)/prod (x(i)-x([1:i-1,i+1:n1]));
end;

% Calculate the polynomial value for each evaluation point.
for k = 1 : length (evalPoints)
	% Check if the value of f(x) in evalPoint must be found or has already
	% been given in input with x(index), y(index).
	ij = find (evalPoints (k) == x);
	if isempty (ij)
		% Find the numerator of the Lagrange formula.
		% Using mathematical notation:
		% temp = (evalPoint - x0) * (evalPoint - x1) * ... * (evalPoint - xn)
		temp = prod (evalPoints (k) - x);
		%
		% ...COMMENT TO BE CORRECTED:...
		%
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

