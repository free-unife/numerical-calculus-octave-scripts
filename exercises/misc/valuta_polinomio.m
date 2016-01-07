% ---------------------------- ESERCIZIO 2 --------------------------------

%------------------------input di polinomio p(x)---------------------------

grado_p = input ( 'grado del polinomio?\n' );                               % prendiamo in input il grado del polinomio

while (grado_p <= 0 )                                                       % controllo che il grado, del polinomio, sia 
 grado_p = input ( 'ERRORE!, reinserisci\n' );                              % superiore a zero
end

p = zeros ( 1, grado_p + 1 );                                               % inizializziamo tutti gli elementi del vettore a 0

for i = grado_p + 1 : -1 : 1                                                % inseriamo in sequenza decrescente tutti i coeficienti
 fprintf ( 'l''elemento in p(%d)\n', i - 1 );                               % del polinomio , descrescente cioé da x^n a x^0
 p (( grado_p + 2 ) - i ) = input ( '-> :' );
end

%------------- valutazione di un polinomio di grado n e le ----------------
%-------------  sue derivate non nulle in un punto x = a   ----------------

alfa = input ( 'Introduci alfa\n-> :' );  
a = [ 1, -alfa ];                                                           % qui costruiamo (x - alfa) che utilizzeremo con la funzione deconv

for i = 0 : grado_p
	[q , r ]= deconv (p , a );
	ris ( i + 1) = r( length ( p ))* factorial ( i );
	p=q;
end;        

fprintf ( " Risultati =\ n " );
fprintf ( "% g \ n " , ris );