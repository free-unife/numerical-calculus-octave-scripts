function [Q, R] = qrFactorization(A);
%% QR factorization equivalent to qrfatt.m

[m,n] = size(A);
r = min(m-1,n);
R = zeros(m,n);
Q = eye(m);

%% We have to obtain an R matrix upper triangular.
%% to do this, we have to rotate the A matrix in order to have zeroes below the main diagonal.
for i = 1 : r
  for j = i+1 : m
    G = eye(m);
    [A, c, s] = givensExample(i, j, A);
    G(i,i) = c;
    G(i,j) = s;
    G(j,i) = -s;
    G(j,j) = c;
    Q = Q * G;
  end;
end;

R = triu(A);


for i = 1 : min(m,n)
  if R(i,i) < 0 
    R(i,i:n) = -R(i,i:n);
    Q(: , i) = -Q(: , i);
  end;
end;
