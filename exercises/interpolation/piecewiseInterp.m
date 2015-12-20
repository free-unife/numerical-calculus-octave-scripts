% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [p, evalPoints] = piecewiseInterp (x, y, degreeOfSubpolys, evalPointsStep);
% [p, evalPoints] = piecewiseInterp (x, y, degreeOfSubpolys, evalPointsStep);
%
% Function that calculates the polynomials (# >= 1 && # < #OfNodes), each of degree
% degreeOfSubpolys. The evaluation points are chosen between each sub-interval
% (depending on the polynomial number) with a step of evalPointsStep.
% The output of this function is an array p containing all the
% evaluated sub-polynomials, and another array evalPoints with all the
% evalPoints in each sub interval. This method is used to avoid Runge's
% phenomenon.
%
% I = { array x and y of nodes, degree of each sub-polynomial: degreeOfSubpolys,
% step of the lineary spaced evaluation points: evalPointsStep. }
% P = { x = 1xn, y = 1xn, 1 <= degreeOfSubpolys < length (x). }
% O = { p is the array containing all the pK (k-th evaluated polynomial
% between x(base) and x(limit)), evalPoints is the array containing all the
% evalPointsK (k-th array of evalPoints bewteen x(base) and x(limit)). }
% C = { p = [pI with: I = 0 : (at most) iterationNum], same for evalPoints. }


% Input check.
numberOfNodes = length (x);
if (degreeOfSubpolys < 1) || (degreeOfSubpolys >= numberOfNodes)
	error ('degreeOfSubpolys must be between 1 and the number of nodes - 1.');
end;

% Final data structures which can be plotted from a calling script.
p = [ ];
evalPoints = [ ];

% Find the correct number of polynoms, based on the chosen degree and the
% number of input points. The following control is done to avoid index
% overflow. Remember that the iterations start from zero so 1 must be
% subtracted.
iterationNum = floor (numberOfNodes / degreeOfSubpolys) - 1;

for i = 0 : iterationNum
	% Find the boundary limits for the values of x and y in order to
	% correctly evaluate each polynomial.
        base = (degreeOfSubpolys * i) + 1;
        limit = base + degreeOfSubpolys;
        % Avoids index overflows, although the last polynomial will not have
	% the correct degree if limit > #nodes.
        if limit > numberOfNodes
		while limit ~= numberOfNodes
			limit = limit - 1;
		end;
        end;

	% Choose the evalPoints in the sub-interval between base and limit.
	% These are equally spaced, so the error is quite high. For a more
	% accurate evaluation Chebyshev nodes should be used intead.
        evalPointsK = [x(base) : evalPointsStep : x(limit)];
	% Build and evaluate the polynomials, each of degree degreeOfSubpolys,
	% from a correct subset of x and y.
	% Since: limit - base = degreeOfSubpolys, then degreeOfSubpolys + 1
	% nodes are passed to Newton's function.
        [pK] = newtonPolySimpler (x (base:limit), y (base:limit), evalPointsK);

	% Final data structure update.
        evalPoints = [evalPoints, evalPointsK];
        p = [p, pK];
end;

