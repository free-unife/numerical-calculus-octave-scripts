function [X] = es3solLower (L, A);

if ~istril(L)
  error("L non è triangolare inferiore");
end;

if ~isempty(find(diag(L) == 0))
  error("L è singolare!");
end;

[n, m] = size(A);
X = zeros(n , m);

for j = 1 : 1 : m
  % creo il primo elemento della colonna m di X
  X(1,j) = A(1,j) / L(1,1);
  
  for i = 2 : 1 : n
    X(i,j) = (A(i,j) - (L(i, 1:i-1) * X(1:i-1 , j))) / L(i,i);
  end;
 
end;

endfunction
