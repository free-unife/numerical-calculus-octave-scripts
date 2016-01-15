% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


clear all
close all

% Script to test Newton's method.


format long

% Find a very rough soluton of f(x) = 0 using bisection method.
k = 0;

fun = @(x) sin (x) - (x / 2) ^ 2;
a = 1;
b = 2;

fprintf ('\n\nBisection Rsult:\n==========\n\n')
tol = 10^(-1)
[c, j] = bisect (fun, a, b, tol)

% Find much precise solutions using the fixed point method and a smaller
% tolerance.
maxIt = 32;
fprintf('--------------------\n\n');
accurateDecimalDigits = 9
tol = 10 ^ (- accurateDecimalDigits)

fprintf ('\n\nFixed point method:\n==========\n\n')
gFun = @(x) x + (sin (x) - (x / 2) ^ 2);
[x, it] = fixedPoint (gFun, c, tol, maxIt)

fprintf ('\n\nNewton''s method:\n==========\n\n')
der = @(x) cos (x) - (x / 2);
[x, it] = newton (fun, der, c, tol, tol, maxIt)

format
