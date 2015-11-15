function [L, R, deter] = gauss1(A);
n = max(size(A))
for k=1:n-1
  if abs(A(k,k))< eps * norm(A,inf)
    error('non si fa la fattorizzazione')
  else
    %% qui genero gli elementi di inverse(Lk)
    A(k+1:n, k) = A(k+1:n, k) ./ A(k,k);
    
    A(k+1:n, k+1:n) = A(k+1:n, k+1:n) - A(k+1:n,k) * A(k,k+1:n);
  end;
end;
deter=prod(diag(A))
R=triu(A)
L = eye(n)+(A-R)  