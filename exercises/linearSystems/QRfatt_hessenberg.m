function [Q,R] = QRfatt_hessenberg(A);


[n,n] = size(A);
Q = eye(n);

for i = 1 : n-1
  G = generateGivensMatrix(i,i+1,A);
  A = G*A;
  Q = Q*G;
end;
  
R = triu(A)