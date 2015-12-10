clear all
close all

% Script that displays a function and its interpolating polinomials of 
% Lagrange using equally spaced values and Chebyshev nodes.

hold on

% Real function. @(x) means that a symbolic x is defined.
func = @(x) x + e .^ (1 ./ (1 + x.^2));
fplot (func, [-2 2], 'b');

% Lagrange polynom has degree 6.
observationX = [-2 : 0.5 : 2];
observationY = zeros (size (observationX));
x = observationX;
y = observationY;

% Calculate value of function in observation points.
y = x + e .^ (1 ./ (1 + x.^2));

% Get evaluation points in the lineary spaced interval between -2 and 2.
evalPointsL = linspace (-2, 2, 6);
[yL1] = polyVandermonde (x, y, evalPointsL);
plot (evalPointsL, yL1, 'r');

% Lagrange function with Chebishev nodes (degree 6).
evalPointsC = chebyshevNodes (-2, 2, 6)
%evalPoints = chebTest (6, 'Tn', [-2 2])
[yL2] = polyVandermonde (x, y, evalPointsC);
plot (evalPointsC, yL2, 'g');

hold off

% Create a new graphics window.
figure

hold on

% Calculate and plot errors for both cases.
y = evalPointsL + e .^ (1 ./ (1 + evalPointsL.^2));
El1 = abs (y - yL1)
plot (0 : 5, El1, 'g');

y = evalPointsC + e .^ (1 ./ (1 + evalPointsC.^2));
El2 = abs (y - yL2)
plot (0 : 5, El2, 'b');


hold off
