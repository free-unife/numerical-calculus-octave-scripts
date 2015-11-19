% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [L, R ,P, deter] = gauss2BandaR (A, r);
% [L, R ,P, deter] = gauss2BandaR (A, r);
%
% Optimized version of Gauss factorization for band matrix with
% bandwidth r. Patrial pivoting is used.
%
% I = { matrix A nxn, bandwidth r. }
% P = { A has row and column bandwidth r. }
% O = { L lower triangular matrix with: lower bandwidth r
% || maximum number of non zero elements for each column is r,
% R upper triangular matrix with: upper bandwidth r || upper bandwidth 2 * r
% (L and R fist case = no pivoting; second case = at least one pivoting.)
% , row permutation vector P, matrix determinant deter. }
% C = { A = L * R }

n = size (A ,1);
deter = 1;
temp = zeros (1, size (A ,2));
P = 1: n ;
tol = eps * norm (A, inf);

% Get matrix bandwidth in another variable.
dimBanda = r;

for k = 1: n -1
	% Get max element in the current column.
	[ amax , ind ] = max (abs (A (k : n, k)));
	ind = ind + k - 1;
	% if the maximum element of the current column is not in pivoting
	% position, then we must exchange the the row with the maximum element,
	% with the pivot row.
	if k ~= ind
		% If at least one line must be exchanged, then the
		% factorization matrix R chages propriety. Infact R has an
		% upper bandwidth of 2r. On the other hand if input matrix A
		% did not need pivoting then R would have remained with an
		% upper bandwidth of r.
		dimBanda = 2 * r;
		% Do the row exchange. Please have a look at gauss2.m for
		% comments on this part.
		aux = P (k);
		P (k) = P (ind);
		P (ind) = aux;
		deter = - deter;
		temp = A (ind, :);
		A (ind, :) = A (k, :);
		A (k, :) = temp;
	end;

	deter = deter * A (k , k );
	if abs (A (k, k)) > tol
		% Here we find our multiplicators, i.e. the factorization
		% matrix L.
		% If no row exchange has been made, L has exactly r nonzero
		% multiplicators, i.e. it has bandwidth r.
		% If there has been at least one exchange, then L has up to r
		% nonzero multiplicators, MAXIMUM.
		% In both cases the number of (nonzero) multiplicators of
		% each column (represented by the variable counter) is <= r.
		% If we reach r, it would be useless to go on, so there is a
		% break in the for loop.
		counter = 0;
		% We have to use a traditional for notation and not the
		% native vectorial notation because we have to check element by
		% element.
		for i = 1 : (n - k)
			A (k + i, k) = A (k + i, k) / A (k, k);
			% If we have a no zero multiplicator...
			if A (k + i, k) > tol
				% ...count it
				counter = counter + 1;
			end;
			% If the number of nonzero multiplicators is r then
			% there is no need to go on: exit the for loop.
			if counter >= r
				break;
			end;
		end;

		% If we have exactly r multiplicators we are in the first case,
		% so we can skip all the zero elements on the row k (as well
		% as the multiplicators).
		if k <= n - dimBanda
% This counts also the zero multiplicators.
%A (k + 1 : end, k + 1 : k + dimBanda) = A (k + 1 : end, k + 1 : k + dimBanda) + (- A ( k + 1: end, k) * A (k, k + 1 : k + dimBanda));

% This seems to work as well ans seems more efficient.
% Try the following A with both instructions: A = [ 3 4 0 0; 1 4 1 0; 0 2 3 4; 0 0 1 3]; r = 1
A (k + 1 : k + dimBanda, k + 1 : k + dimBanda) = A (k + 1 : k + dimBanda, k + 1 : k + dimBanda) + (- A ( k + 1: k + dimBanda, k) * A (k, k + 1 : k + dimBanda));
		% If we are in the other case, we must go through all the
		% multiplicators because the structure of the original matrix
		% gets "destroyed", so we don't have any information of where
		% the zeros are on the rows. Can we do something more here?
		else
A ( k + 1 : end, k + 1: end) = A (k + 1 : end, k + 1 : end) + (- A (k + 1 : end, k) * A (k, k + 1 : end));
	 	end;
  	end;
end;

deter = deter * A (n, n);
R = triu (A);
L = eye (n) + tril (A (1 : n, 1 : n), - 1);
