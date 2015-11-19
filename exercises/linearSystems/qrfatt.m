function [Q, R] = qrfatt(A);
% fattorizzazione QR con rotazione di Givens
%

[m,n] = size(A);
r = min([m-1 n]);
Q = eye(m);
temp = zeros(2,n);

for i = 1 : r
  for j = i+1 : m
    if A(j,i) ~= 0
      [c, s] = rotate(A(i,i), A(j,i));
      %A([i, j],i:n) = [c s; -s c] * A([i, j], i:n);
      temp(:,i:n) = A([i,j], i:n);
      A([i, j],i:n) = [c s; -s c] * temp(:,i:n);
      Q(:, [i j]) = Q(:, [i j]) * [c s; -s c];
    end;
  end;
end;
R = triu(A);

for i = 1 : min(m,n)
  if R(i,i) < 0 
    R(i,i:n) = -R(i,i:n);
    Q(: , i) = -Q(: , i);
  end;
end;