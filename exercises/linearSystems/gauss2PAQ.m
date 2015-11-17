function [L ,R ,P, Q , deter ]= gauss2PAQ ( A );
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


n = size (A ,1);
deter = 1;
tempP = zeros (1 , size (A ,2));
tempQ = zeros (1 , size (A ,2));
P = 1: n ;
Q = 1: n;
tol = eps * norm (A , inf );
for k = 1: n -1
  %% trovo l'elemento massimo nella colonna corrente
  %[ amax , ind ] = max ( abs ( A ( k :n , k : n )));
  
  [amax, riga] = max(abs(A( k : n, k : n)));
  [bmax, colonna] = max(amax);
  riga = riga(colonna);
  
  %% trasformazione da indice vettore colonna a indice matrice (globale)
  riga = riga +k -1;
  colonna = colonna + k - 1;
  
  %% se [amax, ind] non è in posizione pivot, allora scambio le righe di A
  pq = [[k, k] == [riga, colonna]]
  
  if [pq(1), pq(2)] == [0 0] %% scambio sia righe che colonne
    %% scambio le righe
    aux = P(k);
    P(k) = P ( riga );
    P(riga) = aux; 
    deter = -deter;
    temp = A ( riga ,:);
    A(riga,:) = A(k,:);
    A (k ,:) = temp;
    
    %% scambio le colonne
    aux = Q(k);
    Q(k) = Q ( colonna );
    Q(colonna) = aux; 
    deter = -deter;
    temp = A ( : ,colonna);
    A(:,colonna) = A(:,k);
    A (: ,k) = temp;
  elseif [pq(1), pq(2)] == [0 1] %% scambio le righe
    aux = P(k);
    P(k) = P ( riga );
    P(riga) = aux; 
    deter = -deter;
    temp = A ( riga ,:);
    A(riga,:) = A(k,:);
    A (k ,:) = temp;
  elseif [pq(1), pq(2)] == [1 0] %% scambio le colonne
    aux = Q(k);
    Q(k) = Q ( colonna );
    Q(colonna) = aux; 
    deter = -deter;
    temp = A ( : ,colonna);
    A(:,colonna) = A(:,k);
    A (: ,k) = temp;
  else %% nessuna operazione, l'elemento massimo è gia in posizione pivot
  
  end;
  

  % Il determinante si puo' ricavare dal rango.
  % det (A) = ((-1) ^ #permutazioni) * R(1:1:n, 1:1:n)
  deter = deter * A (k , k );
  % Se il pivot NON tende a zero...
  if abs ( A (k , k )) > tol
    % ...allora posso fattorizzare con gauss
    % creo i moltiplicatori di Lk^-1 ( L^-1 è la matrice di trasformazione elementare di gauss invertita).
    % i moltiplicatori non hanno il segno - poichè, data una matrice triangolare inferiore con 1 sulla diagonale L,
    % la sua inversa ha tutti gli elementi (tranne gli 1 sulla diagonale) invertiti di segno.
    A ( k +1: end , k ) = A ( k +1: end , k )/ A (k , k );
    % Aggiorno la sottomatrice Atilde al passo k... come?
    % prendiamo il vettore contenente i moltiplicatori generati al passo precedente ed aggiungiuamo il segno -
    % successivamente con un prodotto tra vettore colonna ( moltiplicatori con -) e vettore riga ( k°esima riga senza pivot)
    % e otteniamo una matrice contenente -mk volte la k riga, questa matrice si somma a quella originale.
    A ( k +1: end , k +1: end ) = A ( k +1: end , k +1: end ) + (- A ( k +1: end , k )* A (k , k +1: end ));
  end ;
end ;
deter = deter * A (n , n );
% la triangolare superiore R è posizionata nella triangolare superiore di A modificata
% R = DU
R = triu ( A );
% L invece si trova nella parte trangolare inferiore di A, ma ha 1 sulla diagonale
% L = L1^-1 * L2^-1 * Ln ^ -1 dove Li sono matrici di trasformazione elementare di gauss.
L = eye ( n )+ tril ( A (1: n ,1: n ) , -1);