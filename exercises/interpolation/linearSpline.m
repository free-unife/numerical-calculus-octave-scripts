% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [s] = linearSpline (x, y, evalPoints)
%
%
% Evaluation of a linear (degree = 1) spline in evaPoints.
%
% I = {}
% P = {}
% O = {}
% C = {}


for i = 1 : length (evalPoints)

	% Condition : a <= x(1:end)~=evalPoints(1:end) <= b
	% where a and b are respectively the lower and upper bounds of
	% the whole interval.
	if (evalPoints (i) < x (1)) || (evalPoints (i) > x (end))
		error ('Invalid evalPoints (out of interpolation interval bounds).');
	end;

	% Get the indices of x where evalPoints are equal to x.
	ij = find (x == evalPoints (i));
	% If those indices are not empty then the current evalPoint is equal to
	% a node and the spline evaluation does not need to be calculated since
	% we already have the value of y in that point.
	if ~ isempty (ij)
		s (i) = y (ij (1));
	else
		% s(i) must be in [a, b] interval. The following
		% instructions check if that is true.
		% x(v-1) <= evalPoints(i) <= x(v)
		% x(v) <= evalPoints(i) <= x(v+1)
		ij = find (x > evalPoints (i));
		if length (ij) == 0
			error ('Invalid evalPoints (out of interpolation interval bounds).');
		else
			% Since there may be more than 1 element in evalPoints
			% we need to gest the first result always
			k = ij (1);
			% Denominator.
			temp = x (k - 1) - x (k);
			% Direct application of the formula.
			s (i) = (y (k - 1) * (evalPoints (i) - x (k)) - (y (k) 
* (evalPoints (i) - x (k - 1)))) / temp;
		end;
	end;
end;

