function [L ,R ,P, deter] = gauss2BandaR (A, r);
% fattorizzazione di Gauss con pivoting parziale - II versione
%
% Ax = b
% PAx = Pb
% nota! PA = LR
% LRx = Pb
% Rx = y -> x = solUpper(R, y), prima dobbiamo ottenere y con solLower()
% Ly = Pb -> prima di invocare solLower() dobbiamo riordinare b usando P
% P in questo caso, NON È una matrice ma un vettore contenente lo storico delle permutazioni 
% se b ha dimensione n*1, allora è possibile riordinarlo con un singolo comando: b = [b(P(1:n))]
% eseguire quest'ultima operazione equivale a moltiplicare la matrice di permutazione P * b
% ora possiamo:
% Ly = b -> y = solLower(L, b)
%
%
% with 2 = r:
% AA=triu(tril(A,2),-2)
% or:
% A=triu(tril(round(rand(6)*9),2),-2)
% [L, R, P, deter] = gauss2BandaR(A, 2)

n = size (A ,1);
deter = 1;
temp = zeros (1 , size (A ,2));
P = 1: n ;
tol = eps * norm (A , inf );
for k = 1: n -1
  %% trovo l'elemento massimo nella colonna corrente
  [ amax , ind ] = max ( abs ( A ( k :n , k )));
  %% trasformazione da indice vettore colonna a indice matrice (globale)
  ind = ind +k -1;
  %% se [amax, ind] non è in posizione pivot, allora scambio le righe di A
%  if k ~= ind
%    error("caso complicato. E' necessario pivoting. TODO.");
 %   aux = P(k);
 %   P(k) = P ( ind );
 %   P(ind) = aux;
 %   deter = -deter;
 %   temp = A ( ind ,:);
 %   A(ind,:) = A(k,:);
 %   A (k ,:) = temp;
 % end ;

  % Il determinante si puo' ricavare dal rango.
  % det (A) = ((-1) ^ #permutazioni) * R(1:1:n, 1:1:n)
  deter = deter * A (k , k );
  % Se il pivot NON tende a zero...
  if abs ( A (k , k )) > tol

	% Trovo i moltiplicatori (L) fino ad r+1 compreso. Non e' necessario
	% andare oltre perche' i successivi nella k-esima colonna di A sono
	% uguali a zero.
	r + 1
%	A (k + 1 : r + 1, k) = A (k + 1: r + 1, k ) / A (k, k)
	% k - 1  in  k - 1 + r + 1 e' come fosse un offset. In questo modo ogni 
	% volta arrivo al corretto r+1 che si shifta di k ogni colonna se 
	% mantengo la stessa matrice iniziale...
	A (k + 1 : k - 1 + r + 1, k) = A (k + 1: k - 1 + r + 1, k ) / A (k, k)

	% Trovo la matrice ATilde che e' la sottomatrice corrente ancora da
	% eliminare con Gauss. Qui si fa l'operazione: ATilde = - (m * riga k)

%    ATilde = (- A (k + 1 : r + 1, k) * A (k , k + 1: r+1))
%	ATilde = (- A (k + 1 : k + 1 - (r + 1), k) * A (k , k + 1: k + 1 - (r + 1)))


	% In gauss2.m si faceva l'operazione tra 2 matrici. Qui devo arrivare
	% alla r+1 esima riga della colonna k e alla r + 1 colonna della riga 
	% k.

%    A ( k +1: end , k +1: end ) = A ( k +1: end , k +1: end ) + ATilde;
%	A (k + 1 : k + 1 - (r + 1), k + 1 : k + 1 - (r + 1)) = A (k + 1: k + 1 - (r + 1), k + 1 : k + 1 - (r + 1)) + ATilde;

  end ;
end ;
%deter = deter * A (n , n );
% la triangolare superiore R è posizionata nella triangolare superiore di A modificata
% R = DU
R = triu ( A );
% L invece si trova nella parte trangolare inferiore di A, ma ha 1 sulla diagonale
% L = L1^-1 * L2^-1 * Ln ^ -1 dove Li sono matrici di trasformazione elementare di gauss.
L = eye ( n )+ tril ( A (1: n ,1: n ) , -1);
