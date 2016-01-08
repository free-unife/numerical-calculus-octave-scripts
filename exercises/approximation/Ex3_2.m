% Copyright © 2015, 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


close all
clear all

% Script that shows an example of a canonical polynomial approximation using
% linear regression method. Lagrange polynomial is obtained by setting
% m = n.
% This pdf file seems related to the problem:
% http://www.dmf.unisalento.it/LaureeScientificheFisica/Download/fisicamoderna/MinimiQuadrati.pdf

% t are [s], the independent variable.
t = [0 : 0.2 : 1.6];
% y are [m], the dependent variable.
y = [0.0000 0.0401 0.1720 0.3300 0.5800 0.8410 1.1000 1.4200 1.6200];
evalPoints = [0 : 0.01 : 1.62];

% Approximation polynomial degree.
degree = 2;

% A complete polynomial of degree 3 is built.
[a0, singleRes, r] = polyApprox (t, y, degree);
% Use our horner function to evaluate the polynomial.
[z0] = horner (a0, evalPoints);

% To get Lagrange polynomial (or any interpolating polynomial), m = n.
m = length (t);
n = m;
degree = n - 1;
% Using the two Octaves' native functions.
% Build the polynomial of degree equal to three.
[a1] = polyfit (t, y, degree);
% Evaluate it in evalPoints.
[z1] = polyval (a1, evalPoints);

% Build the traditional Lagrange polynomial.
[z2] = lagrangePoly (t, y, evalPoints);

% Check if the second approximating polynomial is equal to Lagrange polynomial
% up to a certain decimal digit (the digit in precisionDIgit position is
% rounded).
% If the control is true it means that the two polynomials differ.
precisionDigit = 3;
fprintf ('Second approximating polynomial (z1) is ');
if any (((round (z1 .* 10^precisionDigit) ./ 10^precisionDigit) == (round (z2 .* 10^precisionDigit) ./ 10^precisionDigit)) == 0)
	fprintf ('NOT ');
end;
fprintf ('equal to Lagrange polynomial (z2).\n');

% Print first and last coefficients of the two polynomials.
fprintf ('a0 (0) = %g\na1 (0) = %g\na0 (end) = %g\na1 (end) = %g\n', a0 (1), a1 (1), a0 (end), a1 (end));

squareOfResidues = sum(r.^2)
singleRes

hold on

plot (t, y, '+');
plot (evalPoints, z0, 'g');
% As you can see red and magenta lines superimpose.
plot (evalPoints, z1, 'r');
plot (evalPoints, z2, 'm');

hold off
