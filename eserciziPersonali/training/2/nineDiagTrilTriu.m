function [L, M, N] = nineDiagTrilTriu (A);
% [L, M, N] = nineDiagTrilTriu (A);
%
% Get the diagonal, opposite lower and opposite upper matrices of A.
%
% I = { matrix A. }
% P = { A is a nxn matrix with elements belonging to R. }
% O = { matrices L, M, N}
% C = { L, M, N are nxn matrices. L = diag(A), M = -tril(A), N = -triu(A) }

% Get A's diagonal with diag then use diag again to put those elements into an 
% nxn matrix with 0 on the non diagonal elements.
L = diag (diag (A));

% Get the lower triangular matrix of A excluding the diagonal (-1).
M = -tril (A,-1);

% Get the upper triangular matrix of A excluding the diagonal (+1).
N = -triu (A,1);

end;
