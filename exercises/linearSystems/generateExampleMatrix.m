function [A] = generateExampleMatrix(n);

tildeDiag = 1:1:n-1;
diagonale = 2: 2 : 2*n;

A = zeros(n);
A = A + diag(diag(diagonale));
A(1:n,1:n-1) = A(1:n,1:n-1) + diag(diag(tildeDiag),-1);
A(2:n,1:n) = A(2:n,1:n) + diag(diag(tildeDiag), 1);