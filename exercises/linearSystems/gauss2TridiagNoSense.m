% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [L ,R ,P , deter ]= gauss2TridiagNoSense ( A );
% TODO
% fattorizzazione di Gauss senza pivoting per matrici tridiagonali con implementazione dell'algoritmo di Thomas.
% La matrice dev'essere tridiagonale strettamente diagonale dominante per righe(colonne)
% Questo algoritmo non ha molto senso...


n = size (A ,1);
deter = 1;
temp = zeros (1 , size (A ,2));
P = 1: n ;
tol = eps * norm (A , inf );
for k = 2 : n
  %% trovo l'elemento massimo nella colonna corrente
  [ amax , ind ] = max ( abs ( A ( k :n , k )));
  %% trasformazione da indice vettore colonna a indice matrice (globale)
  ind = ind +k -1;
  %% se [amax, ind] non è in posizione pivot, allora scambio le righe di A
  if k ~= ind
    error("La matrice tridiagonale non è fattorizzabile come L bidiagonale inferiore ed R bidiagonale superiore.");
  end ;

  % Il determinante si puo' ricavare dal rango.
  % det (A) = ((-1) ^ #permutazioni) * R(1:1:n, 1:1:n)
  deter = deter * A (k , k );
  % Se il pivot NON tende a zero...
  if abs ( A (k , k )) > tol
    %% let's calc li
    A( k, k-1 ) =  A( k, k-1 ) / A(k - 1, k - 1);
    %% let's calc ui
    A ( k, k ) = A( k, k ) + (- A( k, k - 1 ) * A( k - 1, k ));
  else
    error("Division by 0.");
  end;
end ;
deter = deter * A (n , n );
% la triangolare superiore R è posizionata nella triangolare superiore di A modificata
% R = DU
R = triu ( A );
% L invece si trova nella parte trangolare inferiore di A, ma ha 1 sulla diagonale
% L = L1^-1 * L2^-1 * Ln ^ -1 dove Li sono matrici di trasformazione elementare di gauss.
L = eye ( n )+ tril ( A (1: n ,1: n ) , -1);
