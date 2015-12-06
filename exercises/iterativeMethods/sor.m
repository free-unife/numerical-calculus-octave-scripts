% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [x, iterations] = sor (A, b, precision, omega)
% [x, iterations] = sor (A, b, precision, omega)
%
% Apply relaxed Gauss Seidel method to find the solutions of a linear system.
%
% I = { Coefficient matrix A, known terms b, precision is the number of wanted
% decimal digits of x not affected by error, omega is the relaxation value. }
% P = { A is a square matrix nxn, b is a nx1 array, if omega is set to the
% 'NULL' string, then the optimal value of this variable is calculated. }
% O = { array of the solutions x, number of iterations iterations needed to
% solve the linear system. }
% C = { A * x = b. }


[rows, cols] = size (A);

x = zeros (rows, 1);
D = diag (diag (A));

findOmega

L = - tril (A, -1);
U = - triu (A, 1);

Gs = invTril (D - (omega * L)) * (((1 - omega) * D) + (omega * U));
c = invTril (D - omega * L) * omega * b;

G = Gs;
getMaxIterations
iterativeLoop

iterations = i;
