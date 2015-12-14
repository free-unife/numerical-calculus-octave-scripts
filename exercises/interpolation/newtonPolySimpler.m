% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [p] = newtonPolySimpler (x, y, evalPoints);
% [p] = newtonPolySimpler (x, y, evalPoints);
%
% Find the value of Newton's polynomial of degree n-1 (since there are n input
% points), for given evalPoints.
%
% I = { array x = observation points, array y = observed data at
% observation points x, array evalPoints represents the set of points where
% to evaluate the polynomial. }
% P = { x, y and evalPoins must be 1xn, 1xn and 1xm arrays respectively. All
% elements in x must be distinct. }
% O = { p is the array containing the value of the polynomial for each
% evalPoint. }
% C = { p is 1x(length (evalPoints). }


n = length (x);
p = zeros (1, length (evalPoints));
# In divided_diffs_table function there is the check for x and y input sizes.
dd = divided_diffs_table (x, y);

for k = 1 : length (evalPoints)
	pp = 0;
	pp = dd (1);
	for i = 2 : n
		pp = pp + (dd (i) * prod (evalPoints (k) - x (1 : i - 1)));
	end;
	p (k) = pp;
end;
