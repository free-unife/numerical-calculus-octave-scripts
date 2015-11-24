function [Yn2] = ricorrence2(n);

Yn2 = log(5)/4;
for i = 1 : 1 : n
  Yn2 = 1/4*(1/i - Yn2);
end;