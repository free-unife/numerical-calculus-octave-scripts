function x = soldiag( A, b );
if isempty(find((diag(A)==0)))
  x = b ./ diag(A);
else
  error("la matrice è singolare");
end;