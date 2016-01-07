% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


close all
clear all


% TODO

% Draw a circle using two splines. TODO.

% Domain (evaluation points).
theta = linspace (0, 2 * pi, 5);

% Circle ray.
R = 1;

% xt and yt are the values of the function x(theta) and y(theta) respectively.
xt = R .* cos (theta);
yt = R .* sin (theta);

n = length (xt);

% Base condition.
theta (1) = 0;

for i = 2 : n
	theta (i) = theta (i - 1) + sqrt ((xt (i) - xt (i - 1)) ^ 2 + (yt (i) - yt (i - 1)) ^ 2);
end;

evalPoints = linspace (0, 2 * pi, 100);

% S0 (theta (i)) = xt (i)
% S1 (theta (i)) = yt (i)
% for every i = 0 : n
%
% Periodic condition in theta (0) and theta (n); this means that periodic
% splines must be implemented.
%
% TODO.
[S0] = spline (theta, xt, evalPoints);
[S1] = spline (theta, yt, evalPoints);
