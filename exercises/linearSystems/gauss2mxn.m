% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [L, R, P, deter]= gauss2mxn (A);
% [L, R, P, deter]= gauss2mxn (A);
%
% Gauss factorization with partial pivoting for mxn (non-squared) matrices.
%
% I = { Matrix A mxn. }
% P = { m <= n || m > n, nonzero pivoting elements. }
% O = { L mxm matrix, R mxn matrix, P 1xm array, determinant deter. }
% C = { L * R = A (P, :) which means P * A = L * R }


[m, n] = size (A);
deter = 1;
temp = zeros (1, n);
P = 1 : m;
tol = eps * norm (A, inf);
L = eye (m, m);
R = zeros (m, n);

% Set m as the row number and n as the column number.
% We can determine two cases:
%
% First case:
% m <= n -> k = 1 : m - 1
%     |.1p. ... ... ... ... ...|
%     |    .2p. ... ... ... ...|
% R = |        .3p. ... ... ...|
%     |            .mp. ... ...|
% There is nothing under the last pivot (mp)
% so we must stop before, that is at m-1.
%
% Second case:
% m > n -> k = 1 : n
%     |.1p. ... ... ...|
%     |    .2p. ... ...|
%     |        .3p. ...|
% R = |            .np.|
%     |                |
%     |                |
%     |                |
% We must stop on the last pivot (np).
%
% Since the stucture of R is the same as A, and because we are using a compact
% form of the algorithm, the previous statements are valid for A
%
% Find if A corresponds to the first or second case.
for k = 1: min (m-1, n)
% The following is the same as gauss2.m. Please refer to that file for
% comments.
	[amax, ind] = max (abs (A (k : m, k)));
	ind = ind +k -1;
	if k ~= ind
		aux = P(k);
		P (k) = P (ind);
		P (ind) = aux;
		deter = - deter;
		temp = A (ind, :);
		A (ind, :) = A (k, :);
		A (k, :) = temp;
	end;
	deter = deter * A (k, k);
	if abs (A (k, k)) > tol
		A (k + 1 : end, k) = A (k + 1 : end, k) / A (k, k);
		A (k + 1: end, k + 1 : end) = A (k + 1 : end, k + 1 : end ) + (- A (k + 1 : end, k) * A (k, k + 1 : end));
	end;
end;

% L has size mxm but has the same structure as in gauss2.m.
L = tril(A, -1);

% First case.
if (m <= n)
	% The last pivot is in A (m, m).
	deter = deter * A (m, m);
	% Keep the same number of rows but keep the first m columns.
	% This is the same as doing L = L (1 : m, 1 : m);
	L = L (:, 1 : m);
	L = L + eye (m);
% Second case.
else
	% The last pivot is in A (n, n).
	deter = deter * A (n , n);
	% Add to L the missing columns so that it becomes squared.
	L = [L, zeros(m, m - n)];
	L = L + eye (m);
end;

% R is mxn so no resize operation is to be done.
% If you want to solve a linear system you must resize R and y. You must delete
% the last m-n rows of R and y. This is true in the second case.
R = triu (A);


end;
