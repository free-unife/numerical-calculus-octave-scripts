clear all
close all


hold on

%
%
% Real function
func = @(x) x + e .^ (1 ./ (1 + x.^2));
fplot (func, [-2 2]);
%
%
%

%
%
% Lagrange polynom has degree 6.
observationX = [-2 : 0.5 : 2];
observationY = zeros (size (observationX));
x = observationX;
y = observationY;

% Calculate value of function in observation points.
y = x + e .^ (1 ./ (1 + x.^2));

% Get evaluation points in the lineary spaced interval between -2 and 2.
evalPoints = linspace (-2, 2, 6);
[yL] = polyVandermonde (x, y, evalPoints);
plot (evalPoints, yL, 'r');
%
%
%

%
%
% Lagrange function with Chebishev nodes (degree 6).

hold off;
