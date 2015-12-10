clear all
close all

% Script that displays a function and its interpolating polinomials of 
% Lagrange using equally spaced values and Chebyshev nodes.

hold on

% Real function. @(x) means that a symbolic x is defined.
func = @(x) x + e .^ (1 ./ (1 + x.^2));
fplot (func, [-2 2], 'b');

% Lagrange polynom has degree 6.
observationX = linspace (-2, 2, 7);
observationY = observationX + e .^ (1 ./ (1 + observationX.^2));

evalPoints = [-2: 0.1: 2];
[y1] = lagrangePoly (observationX, observationY, evalPoints);
plot (evalPoints, y1, 'r');


chebNodes = chebyshevNodes (-2, 2, 7)
chebY =  chebNodes + e .^ (1 ./ (1 + chebNodes.^2))
[y2] = lagrangePoly (chebNodes, chebY, evalPoints);
plot (evalPoints, y2, 'g');


figure
hold on


yNew = evalPoints + e .^ (1 ./ (1 + evalPoints.^2));
Ea = abs (yNew - y1)
Eb = abs (yNew - y2)

plot (evalPoints, Ea, 'b');
plot (evalPoints, Eb, 'r');

hold off
