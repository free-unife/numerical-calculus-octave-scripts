% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


clear all
close all


% Script to test bisection method functions.


k = 0;

fprintf ('Example 0:\n==========\n\n')

% A very simple example where we know for certain that the bisection method 
% converges to the correct value in a few steps.
fun = @(x) (x^2)  - 4;
a = 0;
b = 4;
% Set steps to inf to show that what really stops the algorithm is that it 
% finds the exact value of x so that fun (x) = 0. 
steps = Inf;

[c, j] = bisectSimple (fun, a, b, k, steps)

tolerance = (1 / (2^j)) * (b - a)


fprintf ('\n\nExample 1:\n==========\n\n')

fun = @(x) (x^2)  - 78.8;
a = 6;
b = 12;
steps = round (log2 ((b - a) / (0.03)));

[c, j] = bisectSimple (fun, a, b, k, steps)

tolerance = (1 / (2^j)) * (b - a)


fprintf ('\n\nExample 2:\n==========\n\n')

fun = @(x) (x^3) + (4 * x^2) - 10;
a = 1;
b = 2;
steps = round (log2 (10^5));

tic
[c, j] = bisectSimple (fun, a, b, k, steps)
toc

tolerance = (1 / (2^j)) * (b - a)


fprintf ('\n\nExample 3:\n==========\n\n')

fun = @(x) (x^3) + (4 * x^2) - 10;
a = 1;
b = 2;
tol = 10^(-5);

tic
[c, j] = bisect (fun, a, b, tol)
toc

tolerance = (1 / (2^j)) * (b - a)


