close all;
clear all;

A = round( -20 +40 *rand(6));

RR = triu(A);

B = round(rand(6) * 5);

if (det(B) | det(A)) == 0
  error("Una delle due matrici è singolare!!");
end;

[rows, cols] = size(B);

x = zeros(cols);

for i = 1 : 1 : cols
   x(:,i) = solUpper(RR, B(:,i))
end;

