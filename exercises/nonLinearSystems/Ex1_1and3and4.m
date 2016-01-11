% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


clear all
close all

% ...TODO...
% TODO
% TODO

pkg load all

syms x
sFun = cos (2 * x) * sin (2 * x);
a = 0.5;
b = 1;

fun = @(x) cos (2 * x) * sin (2 * x);

if sign (fun (a)) * sign (fun (b)) < 0
	fprintf ('Bisection method can be applied for the function fun.\n');
else
	fprintf ('Bisection method CANNOT be applied for the function fun.\n');
end;


% ...TODO...
tol = 10^(-5);

tic
[c, k] = bisect (fun, a, b, tol)
toc

tolerance = (1 / (2^k)) * (b - a)


hold on

ezplot (sFun, [0.5 1]);
plot (c, 0, 'r+');

hold off



