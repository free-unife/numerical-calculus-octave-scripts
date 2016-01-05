% Copyright © 2015, 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


close all
clear all

% TOBEFINISHED.

x = 0 : 0.25 : 3;
y = [6.3806 7.1338 9.1662 11.5545 15.6414 22.7371 32.0696 47.0756 73.1596 111.4684 175.9895 278.5550 446.4441];
evalPoints = [0 : 0.1 : 3];

degree = 3;

[a, residue, r] = polyApprox (x, y, degree);
% TODO: User Horner evaluation instead of polyval.
[z0] = polyval (a, evalPoints);

% Using Octaves' native functions.
% Build a polynomial of degree 3
[p] = polyfit (x, y, degree);
% Evaluate it in evalPoints.
[z1] = polyval (p, evalPoints);

hold on

plot (x, y, 'b');
plot (evalPoints, z1, 'r');
plot (evalPoints, z0, 'g');

hold off
