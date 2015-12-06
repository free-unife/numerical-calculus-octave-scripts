% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [x, iterations] = iacobi (A, b, precision)
% [x, iterations] = iacobi (A, b, precision)
%
% Apply Iacobi's method to find the solutions of a linear system.
%
% I = { Coefficient matrix A, known terms b, precision is the number of wanted
% decimal digits of x not affected by error. }
% P = { A is a square matrix nxn, b is an nx1 array. }
% O = { array of the solutions x, number of iterations iterations needed to
% solve the linear system. }
% C = { A * x = b. }


[rows, cols] = size (A);

% Define our x array.
x = zeros (rows, 1);

% Find some components.
D = diag (diag (A));
L = - tril (A, -1);
U = - triu (A, 1);

invD = diagInv (D);

% Jacobi matrix.
J = invD * (L + U);
c = invD * b;

G = J;

getMaxIterations
iterativeLoop

iterations = i;
