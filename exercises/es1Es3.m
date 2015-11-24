clc
close all
clear all

values = [ 5, 20, 50, 100 ];

for n = values
  subDiagA = (1: 1 : n-1);
  diagA = (2 : 2 : 2*n);

  A = zeros(n);
  A = A + diag(diagA);
  A(2 : n, 1 : n-1) = A(2 : n, 1 : n-1) + diag(subDiagA);
  A(1 : n-1, 2 : n) = A(1 : n-1, 2 : n) + diag(subDiagA);

  if any((2*diag(A) -sum(A,2)) > 0) ~= 1
    error("matrice non strettamente diagonale dominante");
  end;

  tic
  [L, R] = lu(A);

  b = eye(n);
  y = zeros(n,1);
  X = zeros(n);

  for i = 1 : n
    y = solLower(L,b(:,i));
    X(:,i) = solUpper(R, y);
  end;

  tempo = toc;
  printf("Per il calcolo di A(%g) : %g\n", n, tempo);

end;