function [Q,R] = QRfatt_new(A);

[m,n] = size(A);
Q = eye(m);

for j = 1:n-1
	for i = n : -1: j+1
    G = generateGivensMatrix(j,i,A);
    A = G*A;
    Q = Q*G;
  end;
end;

R = triu(A)

