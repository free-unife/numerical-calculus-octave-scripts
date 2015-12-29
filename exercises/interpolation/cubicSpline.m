% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [p] = cubicSpline (C, x, xf)
%
% TODO
%


[n, l] = size (C);

for i = 1 : length (xf)
	ij = find (x > xf (i));
	if isempty (ij) && x (end) ~= xf (i)
		error ('An element of xf is out of bounds.');
	elseif xf (i) == x (end)
		k = n;
	else
		k = ij (1) - 1;
	end;

	% This seems very similar to hermitePiecewiseInterp.m
	p (i) = C (k, 1) * (xf (i) - x (k)) + C (k, 2);
	p (i) = p(i) * (xf (i) - x(k)) + C (k, 3);
	p (i) = p(i) * (xf (i) - x(k)) + C (k, 4);
end;
