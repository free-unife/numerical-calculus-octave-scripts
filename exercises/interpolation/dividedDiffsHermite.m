% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [d] = dividedDiffsHermite (x, y, derivative);
% [d] = dividedDiffsHermite (x, y, derivative);
%
% Function that calculates the diagonal of the table of the divided
% differences for Hermite's polynomial. x, y and derivative are the input 
% conditions that this polynomial must observe.
%
% I = { x and y are the arrays containing the interpolation points of Hermite, 
% derivative is an array containing the vale of the derivative of the function 
% in the corresponding point xi. }
% P = { x = 1xn, y = 1xn, derivative = 1xn. }
% O = { d = diagonal of the table. }
% C = { length (d) = length (x) = length (y) = length (derivative). }


if length (x) ~= length (y)
	error ('Vector lengths must match.');
end;

n = length (x);

z = zeros ((n * 2), 1);
a = zeros ((n * 2), (n * 2));

% THIS CODE IS NASTY TO READ, BUT IT'S JUST PSEUDOCODE CONVERTED IN OCTAVE 
% LANGUAGE. IT WORKS.
% Setup of the divided differences table (first and part of the second column).
for i = 0 : n - 1
	z ((2 * i) + 1) = x (i + 1);
	z ((2 * i) + 2) = x (i + 1);

	a ((2 * i) + 1, 1) = y (i + 1);
	a ((2 * i) + 2, 1) = y (i + 1);

	a ((2 * i) + 2, 2) = derivative (i + 1);
end;

% Calculate the rest of the second column of the table.
for i = 1 : n - 1
	a ((2 * i) + 1, 2) = (a ((2 * i) + 1, 1) - a (2 * i, 1)) / (z ((2 * i) + 1) - z (2 * i));
end;

for j = 2 : (2 * (n - 1)) + 1
	for i = j : (2 * (n - 1)) + 1
		a (i + 1, j + 1) = (a (i, j) - a (i + 1, j)) / (z (i - j + 1) - z (i + 1));
	end;
end;

% Get the diagonal only.
d = diag(a)';

