function [L, R, P, Q, deter] = gauss2PAQ (A);
% Full pivoting Gauss factorization.
%
% Ax = b
%
% PAQ x = PbQ
% LR = PAQ -> LRx = PbQ -> x = solUpper (R, y) % third thing.
% y = Rx -> Ly = PbQ -> y = solLower (L, b) % second thing.
% Order rows of array b like this: b = [b(P)] % first thing.
% We can't order b columns since b is an nx1 array so saying: PbQ = Pb holds.
%
%
% I = { nxn matrix A. }
% P = { A must be a non-zero matrix. }
% O = { matrix L nxn, matrix R nxn, P array 1xn, Q array 1xn, deter which is
%       the determinant of A calcuklated using the rank method. }
% C = { A (P, Q) = L * R }


% Get the matrix size.
n = size (A ,1);

deter = 1;

% Generate two arrays, P and Q, which represent the permutated rows and columns
% respectively. Each number in the array corresponds to a premutated row or
% column number. The array index instead represents the real row or column.
% You can compare index and number to get the premutations.
tempP = zeros (1, size (A, 2));
tempQ = zeros (1, size (A, 2));
P = 1 : n;
Q = 1 : n;

% Find the minimum number that the computer can "feel" as non-zero.
% If a number is lower than tol then it's considered zero.
tol = eps * norm (A, inf);

for k = 1 : n - 1
	% In the PA factorization we set the biggest element
	% of the current column (k) as the pivot. We do this for two reasons:
	% 	0) avoid errors when dividing with a small number.
	% 	1) To be able to continue the factorization (infact it cannot
	% 	   be continued if zero is in the pivot position.
	% The PAQ algorith is just an extesion of the latter concept except
	% that the maximum element is selected from the whole matrix.
	% Of course there are more cavetas.
	% If there are multiple equal maximum elements, the first one found is
	% selected.
	% Get the maximum element by column of current A matrix.
	[amax, riga] = max (abs (A (k : n, k : n)));
	% Get the maximum element of the array of the maximum by cols, amax.
	% trash and colonna are returned, but we are interested only in
	% colonna, which is the column index. trash is the maximum element of
	% the whole matrix because it is the maximum by columns, and the
	% maximum of that. For these reasons two scalars are returned.
	[trash, colonna] = max (amax);
	% To get the row index riga we use the row indices of the whole
	% maximum elements (riga again sic.).
	% We get: riga (colonna) which means get the maximum index of the
	% maximum row index.
	riga = riga (colonna);

	% An offset k - 1 must be added in order to transorm local indices (of
	% the current A matrix) into global indices (of the whole A matrix).
	riga = riga + k -1;
	colonna = colonna + k - 1;

	% To know which kind of permutations we needd we have to distinguish
	% four cases, where 0 = needs permutation; 1 = no permutation needed:
	% P and Q permutations = [0 0]
	% P permutation = [0 1]
	% Q permutation = [1 0]
	% no permutation = [1 1]
	%
	% pq is an array containing one of these four configurations.
	% The following means: is current A(max) in pivoting position?
	% If not, do we need to exchange a row, a column or both?
	%
	% To avoid code repetition you can also check two conditions:
	% 0) do we need a row exchage? yes, then do that
	% 1) do we need a column exchage? yes then do that.
	% This covers all cases like our pq array.
	pq = [[k, k] == [riga, colonna]];

	if [pq(1), pq(2)] == [0 0] % Exhange lines and columns.
		% Row exchage. This code is the same in earlier gauss2*.m
		aux = P (k);
		P (k) = P (riga);
		P (riga) = aux;
		deter = - deter;
		temp = A (riga, :);
		A (riga, :) = A (k, :);
		A (k, :) = temp;

		% Column exchage
		aux = Q (k);
		Q (k) = Q (colonna);
		Q (colonna) = aux;
    		deter = - deter;
		temp = A (:, colonna);
		A (:, colonna) = A (:, k);
		A (:, k) = temp;

	elseif [pq(1), pq(2)] == [0 1] % Row exchage only.
		aux = P (k);
		P (k) = P (riga);
		P (riga) = aux;
		deter = - deter;
		temp = A (riga, :);
		A (riga,:) = A (k, :);
		A (k ,:) = temp;

	elseif [pq(1), pq(2)] == [1 0] % Column exchage only.
		aux = Q (k);
		Q (k) = Q (colonna);
		Q (colonna) = aux;
		deter = - deter;
		temp = A (:, colonna);
		A (:, colonna) = A (:, k);
		A (: ,k) = temp;

	else % Maximum element is already in pivot position. Nothing to do.
	end;

	% The following code is the same as in some earlier gauss2*.m
	% Plese have a look at those files for comments.

	deter = deter * A (k , k );
	if abs (A (k, k)) > tol
		A (k + 1: end, k) = A (k + 1 : end, k) /  A (k, k);
		A (k + 1 : end, k + 1 : end) = A (k + 1 : end, k + 1: end) + (- A (k + 1 : end, k) * A (k, k + 1 : end));
	end;
end;

deter = deter * A (n, n);
R = triu (A);
L = eye (n) + tril (A (1 : n, 1 : n), - 1);

% As you can see from this the solution is perturbated.
% Have a look at: http://www.netlib.org/lapack/lug/node75.html
HowBadIsTheRelativeError = norm ((L * R) - (A (P, Q)), Inf) / norm (A (P, Q), Inf);
HowBadIsTheRelativeError = HowBadIsTheRelativeError * 100;
fprintf ('Relative error = %g %%\n', HowBadIsTheRelativeError);
