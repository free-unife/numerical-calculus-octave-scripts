% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [x] = solLower (L, b);
% [x] = solLower (L, b);
%
% Solve a lower trianglar system Lx = b using forward elimination algorithm.
% This function is very similar to solUpper.m. Please refer to that code for
% detailed comments.
%
% I = { Lower triangular matrix L nxn, array b nx1. }
% P = { L is a coefficient matrix, b is an array of known terms. }
% O = { array x nx1. }
% C = { Lx = b -> x = L^-1 * b }


x = b;
n = length (b);

x (1) = b (1) / L (1, 1);

for i = 2 : 1 : n
	x (i) = (x (i) - L (i, 1 : i - 1) * x (1 : i - 1)) / L (i, i);
end;

