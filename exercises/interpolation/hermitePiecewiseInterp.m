% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [p] = hermitePiecewiseInterp (x, y, derivative, evalPoints);
% [p] = hermitePiecewiseInterp (x, y, evalPoints, derivative);
%
% Function that calculates the value of each Hermite cubic polynomial with
% given nodes, derivatives and evalPoints. If derivative is set to 'NULL' then
% the derivatives are calculated using Bessel's formula.
% It is assumed that all input arrays are ordered.
%
% Usually the derivatives are unknown because the original function is unknown.
%
% I = { Array x of nodes, array y of the function values corresponding to the
% nodes, array of the evaluation points evalPoints, array of first order
% derivatives derivative. }
% P = { x=1xn && x must be ordered, y=1xn, derivative=1xn, evalPoins=1xm with m
% >= n-1 && evalPoints must be ordered. }
% O = { p is the array of all the evaluated Hermite cubic polynomials, each
% one evaluated in the correct subset of evalPOints. }
% C = { p=1xlength (evalPoints). }


% If input function arguments are three (i.e. no dervative value has been
% given)
if isempty (derivative)
	% Usually derivatives are unkown, so they can be estimated using
	% Bessel's formula.
	error ('Not implemented.');
end;

m = length (evalPoints);
n = length (x);

p = [ ];
dd = [ ];
% Get Hermite's divided differences diagonal.
% We can calculate them here because they do not depend from evalPoints.
for i = 1 : n - 1
	[d] = dividedDiffsHermite (x(i:i+1), y(i:i+1), derivative(i:i+1));
	% dd is an array containing the arrays of all the divided differences.
	dd = [dd, d];
end;

ePCounter = 1;
j = 1;
% Nodes loop.
for i = 1 : n - 1
	% Find the indices of evalPoints less than the next node.
	ij = find (evalPoints < x (i + 1));
	% If there are no indices then it means that we have don't have
	% any information in that interval so no calculations can be made.
	if isempty (ij)
		error ('Not enough evaluation points.');
	end;

	% evalPoints loop. Get the last valid index of evalPoints = ij(end)
	% (the last evalPoint that is in the current interval).
	for k = ePCounter : ij (end)
		% Check range of each evalPoint.
		if (evalPoints (k) < x(i)) || (evalPoints (k) > x (i + 1))
			error ('Evaluation point out of nodes bounds.');
		end;
		% Horner's method.
		pp = (dd (j + 3) * (evalPoints (k) - x (i + 1))) + dd (j + 2);
		pp = (pp * (evalPoints (k) - x (i))) + dd (j + 1);
		pp = (pp * (evalPoints (k) - x (i))) + dd (j + 0);
		p = [p, pp];
	end;

	j = j + 4;
	% ePCounter = first index of the new interval.
	ePCounter = ij (end) + 1;

end;
