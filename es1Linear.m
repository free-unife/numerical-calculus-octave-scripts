close all;
clear all;

L = [ 2 0 0 0; 3 4 0 0; 6 1 5 0; 7 7 8 4]

[rows, cols] = size(L);

ident = eye(cols);

x = zeros(cols);

for i = 1 : 1 : cols
  x(:,i) = solLower(L, ident(:,i));
end;

