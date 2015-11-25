function [A, G, c, s] = givensElimination(A, i, j);

[m,n] = size(A);
[c,s] = rotateGivens( A(j,j), A(i,j));

G = eye(m);
G(i,i) = c;
G(i,j) = s;
G(j,i) = -s;
G(j,j) = c;

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