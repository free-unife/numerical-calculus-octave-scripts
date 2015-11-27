% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [L, R, deter] = gauss1 (A);
% [L, R, deter] = gauss1 (A);
%
% Gauss factorization of an nxn matrix without pivoting.
% This algorith like all the others uses a compact form. This means that all
% the intermediate results are saved in (a copy of) the matrix, then are
% extracted from that matrix.
%
% I = { Matrix A nxn. }
% P = { In order that the factorization reaches an end, all the pivots,
% calculated progressively must be non-zero. Only the last one can be zero. }
% O = { L nxn matrix , R nxn matrix, deter }
% C = { A = L * R, deter != 0 if A is not singular || deter == 0 if A is
% singular. }


n = max (size(A));

for k=1:n-1
	% If there is a zero in pivoting position...
	if abs (A (k, k)) < eps * norm (A, inf);
		% ... the algorithm must stop.
		error ('Cannot factorize matrix A. Machine precision zero in pivoting position.')
	else
		% Get the multiplier.
		A (k + 1 : n, k) = A (k + 1 : n, k) ./ A (k, k);
		% Get the next submatrix like this:
		% current submatrix k + 1:n = itself + (- multiplier(s) * current row k).
		A (k + 1 : n, k + 1 : n) = A (k + 1 : n, k + 1 : n) + (- A (k + 1 : n, k) * A (k, k + 1 : n));
	end;
end;

% Since there is no pivoting we can find the determinant directly.
% This is the product of all the pivots.
% If the last pivot: A (n, n) != 0, then A is non-singular (i.e. it has the
% inverse).
deter = prod (diag (A));
%if (deter ~= 0)
%	fprintf ('Matrix A is NOT singular.\n');
%else
%	fprintf ('Matrix A is singular.\n');
%end;

% R is simply the upper triangular part of A.
R = triu (A);

% L is the identity matrix with its multipliers (i.e. the lower part of A).
L = eye (n) + (A - R);

end;
