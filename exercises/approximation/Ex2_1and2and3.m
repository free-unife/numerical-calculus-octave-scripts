% Copyright © 2015, 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


close all
clear all

% Exercise about the interpolation and approximation of Boyle's law.

% Boyle's law:
% [P] = [k] / [V]
% Since pressure depends on volume out independent variable (x) is V, and our
% dependent variable (y) is P.

V = [6 : 2 : 20];
P = [167 125 100 84 72 64 58 52];
evalPoints = [6 : 0.1 : 20];

[p0, r0] = polyApprox (V, P, 2);
[p1, r1] = polyApprox (V, P, 4);
% Use our horner function to evaluate the polynomials.
[z0] = horner (p0, evalPoints);
[z1] = horner (p1, evalPoints);

fprintf ('The best approximating polynomial between p0 (degree 2, red) and p1 (degree 4, green) is ');
if r0 < r1
	fprintf ('p0 with r0 = %g\n', r0);
else
	fprintf ('p1 with r1 = %g\n', r1);
end;

[S] = spline (V, P, evalPoints);

% Calculate Boyle's law values knowing that:
% [K] = 10^3 * [Pa] * [cm^3]
% This means that: [K] = [P] * [V]

% My estimation of K based on the data:
% K = sum (P .* V) / length (V);

% K given by the text problem:
K = 1010;

yB = K ./ evalPoints;

% Maximum errors between zx and Boyle's law.
maxErr0 = norm (z0 - yB, 2)
maxErr1 = norm (z1 - yB, 2)

hold on

plot (evalPoints, yB, 'b');
plot (evalPoints, z0, 'r');
plot (evalPoints, z1, 'g');
plot (evalPoints, S, 'm');

hold off
