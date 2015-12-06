% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [x, iterations] = iacobiParam (A, b, precision, omega)
% [x, iterations] = iacobiParam (A, b, precision, omega)
%
% Apply relaxed Iacobi method to find the solutions of a linear system.
%
% I = { Coefficient matrix A, known terms b, precision is the number of wanted
% decimal digits of x not affected by error, omega is the relaxation value. }
% P = { A is a square matrix nxn, b is a nx1 array, if omega is set to the
% 'NULL' string, then the optimal value of this variable is calculated. }
% O = { array of the solutions x, number of iterations iterations needed to
% solve the linear system. }
% C = { A * x = b. }


[rows, cols] = size (A);

% Define our x array.
x = zeros (rows, 1);

% Find some components.
D = diag (diag (A));

invD = diagInv (D);

c = omega * invD * b;
J = eye (rows) - (omega * invD * A);

G = J;
getMaxIterations
iterativeLoop

iterations = i;
