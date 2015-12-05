function [x, iterations] = iacobiParam (A, b, precision, omega)
% [x, iterations] = iacobiParam (A, b, precision, omega)
%
% Apply relaxed Iacobi method to find the solutions of a linear system.

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
