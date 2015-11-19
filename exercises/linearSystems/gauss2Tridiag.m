% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [L, R, deter] = gauss2Tridiag (A);
% [L, R, deter] = gauss2Tridiag (A);
%
% Gauss factorization for tridiagonal matrices implemented with Thomas's
% algorithm. To apply this algorithm, pivoting cannot be used otherwise the
% matrix structure gets "destroyed".
%
% I = { Matrix A nxn }
% P = { A is tridiagonal strict diagonally dominant || non singular and
% diagonally dominant || positive definite. }
% O = { Lower triangular matrix L nxn with (lower) bandwidth 1, upper
% triangular matrix R nxn with (upper) bandwidth 1. }
% C = { A = L * R }


n = size (A ,1);
deter = 1;
temp = zeros (1, size (A, 2));
tol = eps * norm (A, inf);
for k = 2 : n
	% Get maximum index of current column.
	[amax , ind] = max (abs (A (k : n,  k)));
	% Local to global (matrix) indices.
	ind = ind + k - 1;

	% If the following is true it means that input matrix A doesn't have
	% some of the stated proprieties so it cannot be solved with Thomas's
	% algorithm.
	k
	ind
	if k ~= ind
		error("Tridiagonal matrix A does not have a factorization with L and R lower and upper bi-diagonal matrices respectively.");
	end;

	deter = deter * A (k, k);
	% A has ...TODO...
	% R has ui (diagonal) and si (upper diagonal) elements.
	% L has ones (diagonal) and li (lower diagonal).
	% As usual, we are using compact forms so we overwrite (a copy
	% of) matrix A with our results.
	if abs ( A (k , k)) > tol
		% si elements are the same so ignore them.
		% li elements:
		A (k, k - 1) =  A (k, k - 1) / A (k - 1, k - 1);
		% ui elements:
		A (k, k) = A(k, k) + (- A (k, k - 1) * A (k - 1, k));
	else
		% Where is the division of something by A (k, k) ?
    		error("Division by 0.");
	end;
end;

deter = deter * A (n, n);
R = triu (A);
L = eye (n) + tril (A (1 : n, 1 : n), - 1);

end;
