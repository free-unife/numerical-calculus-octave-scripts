% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


clear all
close all

% Script that displays a function and its interpolating polinomials of 
% Lagrange using equally spaced values and Chebyshev nodes.
% The function is evaluated between -2 and 2, i.e: [-2, 2].

hold on

% Real function. @(x) means that a symbolic x is defined.
func = @(x) x + e .^ (1 ./ (1 + x.^2));
fplot (func, [-2 2], 'b');

% Lagrange polynomial has degree 6, i.e. 7 points. These points are selected in 
% equally spaaced in the interval.
observationX = linspace (-2, 2, 7);
observationY = observationX + e .^ (1 ./ (1 + observationX.^2));

evalPoints = [-2: 0.1: 2];
% Create Lagrange polynomial using the observation points. Since there are 7 
% points, the polynomial will be of degree 6. The polynomial is evaluated in 
% evalPoints and the value is returned in y1.
[y1] = lagrangePoly (observationX, observationY, evalPoints);
plot (evalPoints, y1, 'r');

% Find the Chebyshev nodes in [-2, 2] interval.
chebNodes = chebyshevNodes (-2, 2, 7);
chebY =  chebNodes + e .^ (1 ./ (1 + chebNodes.^2));
% Same as the previous one except that we changed the observation points. 
% Chebyshev nodes are used here because they are known to have the least error.
[y2] = lagrangePoly (chebNodes, chebY, evalPoints);
plot (evalPoints, y2, 'g');

% Create a new graph.
figure
hold on

% Calculate yNew = f(evalPoints).
yNew = evalPoints + e .^ (1 ./ (1 + evalPoints.^2));
% Calculate the absolute error between the real value of the function and the 
% two lagrange polynomials.
Ea = abs (yNew - y1);
Eb = abs (yNew - y2);

plot (evalPoints, Ea, 'b');
plot (evalPoints, Eb, 'r');

hold off
