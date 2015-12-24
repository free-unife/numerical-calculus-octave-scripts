% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [p] = hermitePiecewiseInterp (x, y, derivative, evalPoints)
% [p] = hermitePiecewiseInterp (x, y, evalPoints, derivative)
%
% Function that calculates
%
% TODO
%


% If input function arguments are three (i.e. no dervative value has been
% given)
if isempty (derivative)
	% Usually derivatives are unkown, so they can be estimated using
	% Bessel's formula.
	% TODO
	estimatedValue = zeros (1, length (x));
	derivative = estimatedValue;
end;


m = length (evalPoints);
n = length (x);

p = [ ];
dd = [ ];
% Get Hermite's divided differences diagonal.
% We can calculate them here because they do not depend from evalPoints.
for i = 1 : n - 1
	[d] = dividedDiffsHermite (x(i:i+1), y(i:i+1), derivative(i:i+1));
	dd = [dd, d];
end;

ePCounter = 1;
j = 1;
for i = 1 : n - 1
	ij = find (evalPoints < x (i + 1));

	for k = ePCounter : ij (end)
		if (evalPoints (k) < x(i)) || (evalPoints (k) > x (i + 1))
			error ('OUT OF BOUNDS');
		end;
		pp = (dd (j + 3) * (evalPoints (k) - x (i + 1))) + dd (j + 2);
		pp = (pp * (evalPoints (k) - x (i))) + dd (j + 1);
		pp = (pp * (evalPoints (k) - x (i))) + dd (j + 0);
		p = [p, pp];
	end;

	j = j + 4;
	ePCounter = ij (end) + 1;

end;
