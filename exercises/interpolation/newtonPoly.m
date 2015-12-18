% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [zeta, dd] = newtonPoly (x, y, evalPoints);
% [zeta, dd] = newtonPoly (x, y, evalPoints);
%
% Find the value of Newton's polynomial for given evalPoints.
%
% I = { array x = observation points, array y = observed data at
% observation points x, array evalPoints represents the set of points where
% to evaluate the polynomial. }
% P = { x, y and evalPoins must be 1xn, 1xn and 1xm arrays respectively. All
% elements in x must be distinct. }
% O = { zeta is the array containing the value of the polynomial for each
% evalPoint, dd is the array of the divided differences. }
% C = { zeta is 1x(length (evalPoints), d is 1xlength(x). }


% TODO COMENTS.

n = length (x);
% In divided_diffs_table function there is the check for x and y input sizes.
dd = dividedDiffsNewton (x, y);
zeta = dd (n) * ones (size (evalPoints));

for i = n - 1 : - 1 : 1
	zeta = zeta .* (evalPoints - x (i)) + dd(i);
end;
