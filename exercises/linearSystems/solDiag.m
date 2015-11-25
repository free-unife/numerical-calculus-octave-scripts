% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function x = solDiag (A, b);
% Find the solution of a linear system Ax = b
% where A is a diagonal matrix.
%
%
% I = { matrix A, array b. }
% P = { A is nxn, with non-zero elements on the diagonal and zero on the
% non-diagonal indices, b is nx1. }
% O = { Array x of size nx1. }
% C = { x is the solution of the equation Ax = b. }


% Check that on the diagonal there are all non-zero elements.
% If that is the case the we can find the system solution x.
% Otherwise there is no solution to the system.
if isempty (find ((diag (A) == 0)))
	% x is a nx1 array obtained by dividing b with the diagonal of A,
	% element by element. Infact if we have: Ax = b -> x = A^-1 * b.
	% Just in the case of a diagonal matrix, its inverse is still a
	% diagonal matrix with the inverse elements of the original matrix.
	% So if we do A^-1 * b we simply do: xi = 1 / A(i,i) * bi.
	x = b ./ diag(A);
else
	error ("Input matrix A is singular.");
end;

