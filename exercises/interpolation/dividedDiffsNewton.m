% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [d] = dividedDiffsNewton (x, y);
% [d] = dividedDiffsNewton (x, y);
%
% Function that calculates the diagonal of the table of the divided
% differences. This is used because if we have a polynomial of degree n and we
% want to find the polinomial of degree n+1 (it has a new point (x(n+1),
% y(n+1)), we can use previous calculation (from degree 0 to n, to find n+1),
% instead of recalculating everything (all n+1).
%
% I = { x and y are the arrays containing the interpolation points of Newton. }
% P = { x = 1xn, y = 1xn. }
% O = { d = diagonal of the table. }
% C = { length (d) = length (x) = length (y) }


if length (x) ~= length (y)
	error ('Vector lengths must match.');
end;

n = length (x);
d = y;

% The divided differences are calculated column by column.
% See :
% https://quitter.no/file/8d47e3d69e2871b713a8a7ddd3c608fb9f598da8ab940889342cabaa43b40699.jpg
% for an example.
for i = 2 : n
	d (i : n) = (d (i - 1 : n - 1) - d (i : n)) ./ (x (1 : n - (i - 1)) - x 
(i : n));
end;
