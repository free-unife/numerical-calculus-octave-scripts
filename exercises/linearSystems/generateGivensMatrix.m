function [G] = generateGivensMatrix(i,j,A);
%% The G output matrix multiplied to A, allows to put one zero inside Aji

[m,n] = size(A);

%% So che con G(1,2) annullo l'elemento A(2,1), ho la certezza di avere la presenza dell'elemento diagionale != 0
%% dunque il mio vettore sarà x = [A(1,1), A(2,1)] e voglio annullare l'elemento in posizione A(2,1)
%% avendo G(i,j) il vettore è dunque x=[A(i,i), A(j,i)]

[c,s] = rotateGivens (A(i,i), A(j,i));
G = eye(m);
G(i,i) = c;
G(i,j) = s;
G(j,i) = -s;
G(j,j) = c;

end;
