function [diagA, minA, maxA] = fiveDiagMinMax (A);
% Find the diagonal, max and min of an input matrix.
%
% I = { matrix A }
% P = { A belongs to R, A is nxn }
% O = { diag, min, max }
% C = { diag = diagonal(A), min=min(A), max=max(A) }

% Check if A is a square matrix..
[xRows, xCols] = size (A);
if (xRows != xCols)
	error ('A is not a valid square matrix.');
end;

% Very simple using the native functions.
diagA = diag (A);
% Min and max work by columns if input is a matrix,
% so we have to call them twice.
minA = min (min (A));
maxA = max (max (A));

end;
