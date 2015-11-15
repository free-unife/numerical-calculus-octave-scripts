function x = solLower(L, b);

x = b;
n = length(b);

%% Calcolo il primo x1
x(1) = b(1)/L(1,1);
%% Calcolo i restanti xi
for i = 2 : 1 : n
  x(i) = (x(i) - L(i, 1 : i-1) * x(1 : i-1)) / L(i,i);
end;

