function [B, G, c, s] = givensElimination(A, i, j);

[m,n] = size(A);
[c,s] = rotate( A(j,j), A(i,j));

G = eye(m);
G(j,j) = c;
G(j,i) = s;
G(i,j) = -s;
G(i,i) = c;

tol = eps * norm(A,inf);

for l = 1:n
  for k = 1:m
    if (k != i) || (k!=j)
      B(k,l) = A(k,l);
    end;
  end;
  B(j,l) = c*A(j,l) + s*A(i,l);
  B(i,l) = -s*A(j,l) + c*A(i,l);
  if abs(B(i,l)) <= tol
    B(i,l) = 0;
  end;
end;