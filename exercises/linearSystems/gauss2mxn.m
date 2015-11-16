function [L, R, P , deter ]= gauss2mxn ( A );
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


[m, n] = size (A);
deter = 1;
temp = zeros (1 , n);
P = 1: m ;
tol = eps * norm (A , inf );
L = eye(m,m);
R = zeros(m,n);

for k = 1: min( m-1, n )
  %% trovo l'elemento massimo nella colonna corrente
  [ amax , ind ] = max ( abs ( A ( k : m , k )));
  %% trasformazione da indice vettore colonna a indice matrice (globale)
  ind = ind +k -1;
  %% se [amax, ind] non è in posizione pivot, allora scambio le righe di A
  if k ~= ind
    aux = P(k);
    P(k) = P ( ind );
    P(ind) = aux; 
    deter = -deter;
    temp = A ( ind ,:);
    A(ind,:) = A(k,:);
    A (k ,:) = temp;
  end ;

  % Il determinante si puo' ricavare dal rango.
  % det (A) = ((-1) ^ #permutazioni) * R(1:1:n, 1:1:n)
  deter = deter * A (k , k );
  % Se il pivot NON tende a zero...
  if abs ( A (k , k )) > tol
    % ...allora posso fattorizzare con gauss
    % creo i moltiplicatori di Lk^-1 ( L^-1 è la matrice di trasformazione elementare di gauss invertita).
    % i moltiplicatori non hanno il segno - poichè, data una matrice triangolare inferiore con 1 sulla diagonale L,
    % la sua inversa ha tutti gli elementi (tranne gli 1 sulla diagonale) invertiti di segno.
    A( k +1: end , k ) = A ( k +1: end , k )/ A (k , k );
    % Aggiorno la sottomatrice Atilde al passo k... come?
    % prendiamo il vettore contenente i moltiplicatori generati al passo precedente ed aggiungiuamo il segno -
    % successivamente con un prodotto tra vettore colonna ( moltiplicatori con -) e vettore riga ( k°esima riga senza pivot)
    % e otteniamo una matrice contenente -mk volte la k riga, questa matrice si somma a quella originale.
    A ( k +1: end , k +1: end ) = A ( k +1: end , k +1: end ) + (- A ( k +1: end , k )* A (k , k +1: end ));
  end ;
end ;

% la triangolare superiore R è posizionata nella triangolare superiore di A modificata
% R = DU
%R = triu ( A );
% L invece si trova nella parte trangolare inferiore di A, ma ha 1 sulla diagonale
% L = L1^-1 * L2^-1 * Ln ^ -1 dove Li sono matrici di trasformazione elementare di gauss.
%L = eye ( n )+ tril ( A (1: n ,1: n ) , -1);

L = tril(A, -1);

if( m > n)
  deter = deter * A (n , n );
  L = [L zeros(m,m-n)];
  L = L + eye(m);
else
  deter = deter * A(m , m);
  L = L(1:m, 1:m);
  L = L + eye(m);
end
R = triu( A ); 