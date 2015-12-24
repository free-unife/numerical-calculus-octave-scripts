% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


clear all
close all


pkg load all

%x = [-2, -1, 1, 2, 3];
x = [-1, -0.5, 0, 0.5, 1];

% In the real world you have to put the corresponding observation points since
% you don't know the function;
%y = x.^2 + x + 1;
y = 1 ./ (1 + (25 * x.^2));

% Usually you also don't know the derivatives which must be estimated. But we
% assume we know them for learning sake.
%derivative = 2 .* x + 1;
derivative = (- 50 * x) ./ (((25 * x.^2) + 1).^2)

%evalPoints = [-2.0000 -1.8000 -1.5000 -0.8000 -0.5000 1.2000 1.8000 1.9000 2.5000 2.7000 2.9000];
evalPoints = [-0.99 -0.95 -0.8 -0.7 -0.6 -0.5 -0.4 -0.2 -0.1 0 0.1 0.2 0.3 0.4 0.6 0.7 0.8 0.999];

[p] = hermitePiecewiseInterp (x, y, derivative, evalPoints);

syms xx
% fun = xx^2 + xx + 1;
fun = 1 / (1 + 25 *xx^2);

hold on

ezplot (fun, [-1 1]);
%ezplot (fun, [-2 3]);
plot (x, y, 'r');
plot (evalPoints, p, 'g');

hold off
