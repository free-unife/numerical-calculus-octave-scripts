% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


clear all
close all


% Script that plots the function and its two lagrange polynomials (lineary
% spaced x and Chebyshev nodes) for different degrees. You can notice how bad
% is the Runge phenomenon in this case.

% WARNING: To be able to use this script on GNU Octave:
% From your package manager install: python-sympy
% Once you start your Octave instance: pkg install -forge symbolic
% Load the package: pkg load all
% You can put pkg load all in Octave's config file so that when it starts, it
% loads all packages (like this one) automatically.

%pkg load all
% Declare a symbolic x.
syms x
% Calculate the original function. This is done once because it remains the
% same throughout every iteration.
func = cos (x) ./ (cos (x) + (4 * sin (x)) + 5);

% Lagrange polynomial degrees.
degrees = [2, 5, 10, 20 ,30];
for i = 1 : 1 : length (degrees)
	% Create a new graph for each iteration.
	figure
	hold on

	% Plot the original function.
	ezplot (func, [-2*pi pi]);

	% Equally spaced elements between -2pi and pi. Each iteration we must
	% have degree(i) + 1 points.
	observationX = linspace (-2 * pi, pi, degrees (i) + 1);
	observationY = cos (observationX) ./ (cos (observationX) + (4 * sin (observationX)) + 5);
	% Interpolation points plot.
	plot (observationX,  observationY, '*');

	evalPoints = [- 2 * pi : 0.1 : pi];

	[y1] = lagrangePoly (observationX, observationY, evalPoints);
	% Lagrange evaluated polynomial plot.
	plot (evalPoints, y1, 'r');

	% Find the Chebyshev nodes in [-2*pi, pi] interval.
	% degree (i) + 1 nodes, just like before.
	chebNodes = chebyshevNodes (-2 * pi, pi, degrees (i) + 1);
	chebY = cos (chebNodes) ./ (cos (chebNodes) + (4 * sin (chebNodes)) + 5);
	[y2] = lagrangePoly (chebNodes, chebY, evalPoints);
	% Lagrange evaluated polynomial plot using Chebyshev nodes.
	plot (evalPoints, y2, 'g');

	% Chebyshev interpolation points plot.
	plot (chebNodes,  chebY, 'x');

	fprintf ('Plotting degree %g. Press enter to continue.\n', degrees(i));
	pause

	hold off
end;

