function [L ,R ,P, deter] = gauss2BandaR (A, r);
% Fattorizzazione ottimizzata di matrici a banda con pivoting parziale

n = size (A ,1);
deter = 1;
temp = zeros (1 , size (A ,2));
P = 1: n ;
tol = eps * norm (A , inf );
dimBanda = r;

for k = 1: n -1
  %% trovo l'elemento massimo nella colonna corrente
  [ amax , ind ] = max ( abs ( A ( k :n , k )));
  %% trasformazione da indice vettore colonna a indice matrice (globale)
  ind = ind +k -1;
  %% se [amax, ind] non è in posizione pivot, allora scambio le righe di A
  if k ~= ind
    dimBanda = 2*r;
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
  
    %% creo i moltiplicatori di L
    % A ( k + (1: end) , k ) = A ( k +1: end , k )/ A (k , k );
    
    %% L nel caso non avvenga lo scambio di righe ha esattamente r moltiplicatori.
    % nel caso vi sia almeno uno scambio ha al massimo r moltiplicatori.
    % in ogni caso avra sempre n_moltiplicatori <= r diversi da 0, se raggiungiamo questo limite usciamo dal ciclo.
    %% counter contiene il numero di moltiplicatori != 0.    
    counter = 0;
    for i = 1 : (n - k)
      A ( k + i, k) = A(k + i, k) / A( k, k );
      if A( k + i, k) > tol
        counter = counter + 1;
      end;
      if counter >= r
        break;
      end;
    end;
    
    %% Qui creo l'eliminazione, nella prima condizione, salto tutti gli elementi che sarebbero nulli nella moltiplicazione tra li ed aj
    %% in questo caso il trucco vale
    if k <= n - dimBanda
      A( k + 1: end , k + 1: k + dimBanda ) = A( k + 1: end , k + 1: k + dimBanda ) + (- A ( k +1: end , k )* A (k , k +1: k + dimBanda ));
    else %% qui non vale più
      A ( k +1: end , k +1: end ) = A ( k +1: end , k +1: end ) + (- A ( k +1: end , k )* A (k , k +1: end ));
    end;
    
    
  end ;
end ;
deter = deter * A (n , n );
% la triangolare superiore R è posizionata nella triangolare superiore di A modificata
% R = DU
R = triu ( A );
% L invece si trova nella parte trangolare inferiore di A, ma ha 1 sulla diagonale
% L = L1^-1 * L2^-1 * Ln ^ -1 dove Li sono matrici di trasformazione elementare di gauss.
L = eye ( n )+ tril ( A (1: n ,1: n ) , -1);
