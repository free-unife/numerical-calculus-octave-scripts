% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


clear all
close all


% Plot and find the zero of the function fun using the bisection method.
% Instead of making a new bisection function (because the exercise states
% to do that) we just use the already existing one, since there would be
% just little changes to make.


pkg load all

syms x
sFun = cos (2 * x) * sin (2 * x);
a = 0.5;
b = 1;

fun = @(x) cos (2 * x) * sin (2 * x);

% If fun (a) and fun (b) have opposite signs, then bisection method can be
% applied. This is the Bolzano theorem. The convergence of this method is slow:
% you get 1 correct decimal digit every 3 iterations, so it should be used to
% get the small interval that contains the zero, not the zero itself. A more
% efficient method should be applied afterwards.
if sign (fun (a)) * sign (fun (b)) < 0
	fprintf ('Bisection method can be applied for the function fun.\n');
else
	error ('Bisection method CANNOT be applied for the function fun.\n');
end;

tol = 1e-5;

[alpha, it] = bisect (fun, a, b, tol)
funOfAlpha = fun (alpha)

hold on

ezplot (sFun, [0.5 1]);
plot (alpha, funOfAlpha, 'm+');

hold off
