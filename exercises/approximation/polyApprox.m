% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [a, res, r] = polyApprox (x, y, degree);
%
% TOBEFINISHED.
%
% Polynomial approximation using linear regression.

n = degree + 1;
m = length (x);

% A is an mxn matrix containing all the x, in increasing index order by rows
% and increasing degree order by columns.
A = zeros (m, n);
for i = 1 : m
        A (i, 1 : n) = x (i) .^ (0 : n - 1);
end;

[a, res, r] = linearRegression (A, y);
