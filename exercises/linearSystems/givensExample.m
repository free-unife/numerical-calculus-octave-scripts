function [B, c, s] = givensElimination(i , j , A);

[m,n] = size(A);

[c,s] = rotateGivens( A(i,i), A(j,i));

tol = eps * norm(A,inf);

for l = 1:n
  for k = 1:m
    if (k != i) || (k!=j)
      B(k,l) = A(k,l);
    end;
  end;
  B(i,l) = c*A(i,l) + s*A(j,l);
  B(j,l) = -s*A(i,l) + c*A(j,l);
  if abs(B(j,l)) <= tol
    B(j,l) = 0;
  end;
end;