function [x, iterations] = iacobi (A, b, precision)
% [x, iterations] = iacobi (A, b, precision)
%
% Apply Iacobi's method to find the solutions of a linear system.
%
% I = { precision is the number of decimal digits without error. }
% P = {}
% O = {}
% C = {}


[rows, cols] = size (A);

% Define our x array.
x = zeros (rows, 1);

% Find some components.
D = diag (diag (A));
L = - tril (A, -1);
U = - triu (A, 1);

diagInv

% Jacobi matrix.
J = invD * (L + U);
c = invD * b;

G = J;
% Check if matrix is converging.
[trash, trash, iteration] = convSpeedStep (G);
maxIterations = abs (round (iteration) * precision);

iterativeLoop

iterations = i;
