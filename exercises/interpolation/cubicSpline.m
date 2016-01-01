% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [p] = cubicSpline (C, nodes, evalPoints, derivativeOrder)
% [p] = cubicSpline (C, nodes, evalPoints, derivativeOrder)
%
% Evaluation of cubic splines between nodes(0) and nodes(end), using
% coefficient matrix C, in evalPoints.
%
% I = { Coefficient matrix C, array of nodes nodes (used to find the
% intervals), array evalPoints (it tells where to evaluate the cubic
% spline(s)), derivativeOrder is an integer that establishes the order of the
% derivative of the output spline(s). }
% P = { C = (n-1)x4, nodes = 1xn, evalPoints = 1xm,
% int derivativeOrder = 0 || 1. }
% O = { Evaluated polynomial(s) p (a series of cubic splines) in evalPoints. }
% C = { p = 1xm. }


if derivativeOrder ~= 0 && derivativeOrder ~= 1
	error ('Derivative order must be 0 or 1.');
end;

[n, l] = size (C);

for i = 1 : length (evalPoints)
	ij = find (nodes > evalPoints (i));
	if isempty (ij) && nodes (end) ~= evalPoints (i)
		error ('An element of evalPoints is out of bounds.');
	elseif evalPoints (i) == nodes (end)
		k = n;
	else
		k = ij (1) - 1;
	end;

	% This is very similar to hermitePiecewiseInterp.m
	p (i) = C (k, 1) * (evalPoints (i) - nodes (k)) + C (k, 2);
	p (i) = p(i) * (evalPoints (i) - nodes(k)) + C (k, 3);
	% To calculate the first order derivative we don't need to do the
	% following multiplication.
	if derivativeOrder == 0
		p (i) = p(i) * (evalPoints (i) - nodes(k)) + C (k, 4);
	end;
end;
