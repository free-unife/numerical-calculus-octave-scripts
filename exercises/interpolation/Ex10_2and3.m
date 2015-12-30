% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


close all
clear all

pkg load all

x = linspace (-1,1,10);
y = 1 ./ (1 + x.^2);
initDer = (- 2 * x(1)) / (x(1)^2 + 1)^2;
finDer = (- 2 * x(end)) / (x(end)^2 + 1)^2;

% Since we know the function we can calculate the derivatives in every point so
% that we can use piecewise Hermite interpolation and compare it to cubic
% splines.
wholeDers = (- 2 * x) ./ (x.^2 + 1).^2;

[C] = getCubicSplineCoeffs (x, y, initDer, finDer);


evalPoints = linspace (-0.99, 0.99, 1000);

[p] = cubicSpline (C, x, evalPoints);
[pH] = hermitePiecewiseInterp (x, y, wholeDers, evalPoints);
% native Octave function.
[S] = spline (x,y,evalPoints);

% Real function.
syms xx;
fun = 1 / (1 + xx^2);

hold on;

ezplot (fun, [-1 1]);
plot (evalPoints, p, 'r');
plot (evalPoints, pH, 'g');
plot (evalPoints, S, 'm');

hold off;
