% Copyright © 2015, 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


close all
clear all

% Script that shows an example of a canonical polynomial approximation using
% linear regression method. In the second part a custom function is used to
% determine two coefficients (of a line function).

% t are [s], the independent variable.
x = [-5 -4 0 4 5];
% y are [m], the dependent variable.
y = [-6 -5 7 0 3];
evalPoints = [-5 : 0.01 : 5];

% Approximation polynomial degree.
degree = 3;

% A complete polynomial of degree 3 is built.
[a0, singleRes, r] = polyApprox (x, y, degree);
% Use our horner function to evaluate the polynomial.
[z0] = horner (a0, evalPoints);

squareOfResidues = sum(r.^2)
singleRes

hold on

plot (x, y, '+');
plot (evalPoints, z0, 'r');

hold off


% Second part.

% Since we have 2 functions, we have 2 unknowns, so the overall function degree
% is 1, even though the degree of e^x is Inf. This means that using the term
% degree here is pointless, because it's only valid for polynomial composite
% functions.
degree = 1;

m = length (x);
n = degree + 1;

% Custom function:
% f(x) = a1 + a2 * e^x
% f(x) = f1*a1 + f2*a2
f1 = ones (1, m);
f2 = e .^ x;

% Build the linear regression matrix.
A = zeros (m, n);
% Thanks to vectorial notation we can do the following.
A = [f1', f2'];

% Get and print the two coefficients.
[alpha] = linearRegression (A, y)
[z1] = horner (alpha, evalPoints);

pause

figure

hold on

plot (x, y, '+');
plot (evalPoints, z1, 'r');

hold off
