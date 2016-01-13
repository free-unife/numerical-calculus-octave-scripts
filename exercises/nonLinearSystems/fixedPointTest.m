% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


clear all
close all


% Script to test the fixed point method.


k = 0;

fun = @(x) (x^3) + (4 * x^2) - 10;
a = 1;
b = 2;
tol = 10^(-1);

format long

fprintf ('\n\nBisection Rsult:\n==========\n\n')
[c, j] = bisect (fun, a, b, tol)

tolerance = (1 / (2^j)) * (b - a)
maxIt = 32;
tol = 10^-9

fprintf ('\n\ng fun 0:\n==========\n\n')
gFun = @(x) x + ((x^3) + (4 * x^2) - 10);
[x, it] = fixedPoint (gFun, c, tol, maxIt)

fprintf ('\n\ng fun 1:\n==========\n\n')
gFun = @(x) ((10 / x) - (4 * x)) ^ 0.5;
[x, it] = fixedPoint (gFun, c, tol, maxIt)

fprintf ('\n\ng fun 2:\n==========\n\n')
gFun = @(x) 0.5 * (10 - x^3) ^ 0.5;
[x, it] = fixedPoint (gFun, c, tol, maxIt)

fprintf ('\n\ng fun 3:\n==========\n\n')
gFun = @(x) (10 / (x + 4)) ^ 0.5;
[x, it] = fixedPoint (gFun, c, tol, maxIt)

fprintf ('\n\ng fun 4:\n==========\n\n')
gFun = @(x) x - (((x^3) + (4 * x^2) - 10) / ((3 * x^2) + (8 * x)));
[x, it] = fixedPoint (gFun, c, tol, maxIt)

format

