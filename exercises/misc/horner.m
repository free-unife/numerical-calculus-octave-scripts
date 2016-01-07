% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [s] = horner (a, evalPoints);
% [s] = horner (a, evalPoints);
%
% Evaluation of a complete polynomial using Horner's method.
%
% I = { Array coefficients a in decreasing degree order, array of evaluation
% points evalPoints. }
% P = { a = 1xn, evalPoints = 1xm. }
% O = { The array s corresponds to the evaluated polynomial in every
% evaluation point.}
% C = { s = 1xm. }


% The following is just a formality to show what degree and n are.
% Get the degree.
degree = length (a) - 1;
% Number of elements is degree + 1.
n = degree + 1;

m = length (evalPoints);
s = zeros (1, m);

for k = 1 : m
	s (k) = a (1);
	for i = 2 : n
		s (k) = (s (k) * evalPoints (k)) + a (i);
	end;
end;
