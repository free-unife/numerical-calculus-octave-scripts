function x = solUpper(R, b);

x = b;
n = length(x);

x(n) = b(n)/R(n,n);

for i = n-1 : -1 : 1
  x(i) = (b(i) -R(i, i+1 :n) * x( i+1 : n)) / R(i,i);

end;