% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


clear all
close all

% Script to test the fixed point method.


format long

% Find a very rough soluton of f(x) = 0 using bisection method.
k = 0;

fun = @(x) (x^3) + (4 * x^2) - 10;
a = 1;
b = 2;

fprintf ('\n\nBisection Rsult:\n==========\n\n')
tol = 10^(-1)
[c, j] = bisect (fun, a, b, tol)

% Find much precise solutions using the fixed point method and a smaller
% tolerance. The last gFun is the best one to arrive to the most correct
% solution in the least number of steps (although it's difficult to set up in
% the first place.
maxIt = 32;
fprintf('--------------------\n\n');
accurateDecimalDigits = 9
tol = 10 ^ (- accurateDecimalDigits)

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

