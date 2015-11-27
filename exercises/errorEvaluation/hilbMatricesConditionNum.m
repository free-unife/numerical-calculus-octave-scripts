% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


clear all
close all
clc

% Script that how much the error and the condition number are related
% with every iteration with Hilbert matrices.
% Different methods to find the condition number (and related intermediate
% results) are applied to show difference between them.

% You can change this value and see that if you set maxIterations >= 14, gauss1
% is not able to factorize the matrix.
maxIterations = 13;

relativeErrArray = zeros (1, maxIterations);
hilbMatrixOrderArray = 1 : maxIterations;

for n = 1 : maxIterations
	% Generate an Hilbert matrix of order n.
	A = hilb (n);

	% Ax = b -> b = A * ones (n,1)means that we builb our b using an x
	% array of ones. We can then check, after using LU factorization,
	% how much the calculated x is different from the real x of ones.
	originalX = ones (n, 1);
	b = A * originalX;

	% Since a Hilbert matrix is symmetric positive definite we son't need
	% pivoting and we are sure that the factorization reaches an end.
	[L, R, deter] = gauss1 (A);

	y = solLower (L, b);
	x = solUpper (R, y);

	% Find the residue r. Since: b = Ax -> b - Ax = 0 -> b - Ax = r.
	r = b - (A * x);

	hilbMatrixOrder = n

	fprintf ('\n');

	% To find the condition number of a matrix you can also use the rcond
	% native function like this: conditionNumA = 1 / rcond (A)
	% since rcond is the reciprocal of the condition number.
	% Another way is: conditionNumA = cond (A, Inf)
	%
	% Those are native functions, but what if we want to implement our own
	% algorith to find the conditional number?
	% If we apply direcly the formula we have to calculate the inverse of
	% A. This means that we have a complexity of O (n^2).
	%
	% We can get a rough estimate of ||A^-1||:
	% r = b - Aw
	% r = A (x - w) since Ax = b
	%
	% We set e = x - w
	% Ae = r
	%
	% We isolate e:
	% e = A^-1 * r
	%
	% We know that the norm of the absolute error is like the following:
	% ||x - w|| <= ||A^-1|| ||r||
	% but ||e|| = ||x - w||
	% so: ||e|| <= ||A^-1|| ||r||
	%
	% We isolate ||A^-1|| :
	% ||e|| / ||r|| <= ||A^-1||
	%
	% So we have now a sub-estimate of the norm of the inverse of A.
	% We could sustitute it in the conditional number formula.
	% In out case w = x and x = originalX
	e = originalX - x;
	subestimate1NormInvA = norm (e, Inf) / norm (r, Inf)

	% Another way to find e.
	% Since Ae = r we can find e by solving the linear system:
	% Lr = z
	z = solLower (L, r);
	% Rz = e
	e = solUpper (R, z);
	subestimate2NormInvA = norm (e, Inf) / norm (r, Inf)

	% Direct norm of A^-1.
	NormInvA = norm (inv (A), Inf)

	fprintf ('\n');

	% Anyway, for small matrices,  you can apply the following definition
	% if A is invertible.
	conditionNumA = norm (A, Inf) * norm (inv (A), Inf)

	% k(A) is about 10^t * (||e||inf / ||w||inf).
	% int this case t is 16 and represents the number of digits available
	% on the machine to represents each number. Also: w = x.
	ConditionNumANewDef = 1e16 * (norm (e, Inf) / norm (x, Inf))

	fprintf ('\n');

	% Calculate the absolute error.
	AbsErr = norm (originalX - x, Inf)

        % Relative error from the definition: rErr = ||x - w||inf / ||x||inf.
	relativeErrDefinition = AbsErr / norm (originalX, Inf)
	% The following relative error is always greater or equal than the
	% previous one.
	relativeErrGreater = conditionNumA * (norm (r, Inf) / norm (b, Inf))

	relativeErrArray (n) = relativeErrGreater;

	fprintf('\n\n========\n');
end;

% As you can see from the plot the relative error increases exponentially each
% iteration.
plot (hilbMatrixOrderArray, relativeErrArray);
