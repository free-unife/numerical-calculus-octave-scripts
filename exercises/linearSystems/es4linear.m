close all;
clear all;

n = input("Inserisci l'ordine della matrice A");

C = round( -5 + 10 * rand(n));

A = C'*C;

for i = 1 : n
  if det(A(1:1:i,1:1:i) == 0)
    error("Non si fa la fattorizzazione!");
  end;
end;

[Ldool,Rdool] = lu(A)

% troviamo i di grazie a magic
di = zeros(1,n);

Ltrans = transpose(Ldool);
for i = 1 : n
  for j = i : n
    d(i) = Rdool(i,j) / Ltrans(i,j);
  end;
end;

Ltilde = zeros(n);

for i = 1 : n
  for j = 1 : n
    Ltilde(i,j) = Ldool(i,j) * d(j);
  end;
end;

Lcrout = Ltilde
Rcrout = Ltrans
