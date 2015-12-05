function [x, iterations] = sor (A, b, precision, omega)
% [x, iterations] = sor (A, b, precision, omega)
%
% Apply relaxed Gauss Seidel method to find the solutions of a linear system.
%
%


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
