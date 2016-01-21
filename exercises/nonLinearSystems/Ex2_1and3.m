% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


clear all
close all


% Using the fixed point method to calculate the solution of f(x) = sinh(x).

pkg load all

% All the following data is given by the problem.
syms x
sFun0 = sinh (x);
x1 = [-1 1];
y1 = [0 0];
a = -1;
b = 1;

x0 = 0.800;
c = 2.000;
gFun = @(x) x - (e ^ (c * x) * (e^x - e^-x) / 2);
tol = 1e-9;
Nmax = 1000;

[x, it] = fixedPoint (gFun, x0, tol, Nmax)

hold on

ezplot (sFun0, [a b]);
plot (x1, y1);
% Plot the point where y ~= 0.
plot (x, 0, '+r')

hold off
