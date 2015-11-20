function [Q,R] = QRfatt_new(A);

[m,n] = size(A);
Q = eye(m);

for j = 1 : m - 1
  for i = j+1 : n
    G = generateGivensMatrix(j,i,A);
    A = G*A;
    Q = Q*G;
  end;
end;

R = triu(A)

