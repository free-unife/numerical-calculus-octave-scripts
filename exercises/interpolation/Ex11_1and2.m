% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


close all
clear all

% Plot Runge function cubic splines and f(x) = e^(-2*x) cubic splines.
% Plot also first order derivative of Runge function and f(x) cubic spline
% first order derivative.

n = 100;
x0 = linspace (1, 2, n);
y0 = 1 ./ (1 + (25 * x0.^2));
evalPoints0 = linspace (1, 2, 1000);
[S0] = spline (x0 ,y0, evalPoints0);

n = 10;
x1 = linspace (1, 2, n);
y1 = e .^ (- 2 * x1);
evalPoints1 = linspace (1, 2, 1000);
[S1] = spline (x1 ,y1, evalPoints1);

% Plot the two spline functions.
hold on;

plot (evalPoints0, S0, 'r');
plot (evalPoints1, S1, 'g');

hold off;


% Derivatives.

% Runge function derivative.
d0 = (- 50 * x0) ./ (((25 * x0.^2) + 1) .^ 2);

% Get f(x) spline structure.
[SplineStruct1] = spline (x1 ,y1);
% Get coefficient matrix C.
[nodes, C] = unmkpp (SplineStruct1);

% Calculation of the first order derivative coefficients.
% Since our cubic spline expression is like this:
% d * (x - xi)^3 + c * (x - xi)^2 + b * (x - xi) + a
% the first order derivative is:
% 3 * d  * (x - xi)^2 + 2 * c * (x - xi) + b
% with:
% x = nodes,
% xi = evalPoints
% { a, b, c, d } = { C(:, 4), C(:, 3), C(:, 2), C(:, 1) }
% We can calculate the static coefficients and overwite C.
% By doing this it is possible to calculate easily the first derivarive of the
% spline using cubicSpline.
C (:, 1) = C (:, 1) * 3;
C (:, 2) = C (:, 2) * 2;
C (:, 3) = C (:, 3);
C (:, 4) = 0;

% Get the first order derivative.
[d1] = cubicSpline (C, x1, evalPoints1, 1);

% Plot first derivative of Runge's function and of S1.
figure;

hold on;

plot (x0, d0, 'r');
plot (evalPoints1, d1, 'g');

hold off;
