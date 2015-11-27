% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


clear all
close all

% Script that how much the error and the condition number are related
% with every iteration with Hilbert matrices.

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
	% To find the condition number of a matrix you can also use the rcond
	% native function like this: conditionNumA = 1 / rcond (A)
	% since rcond is the reciprocal of the condition number.
	% Another way is: conditionNumA = cond (A, Inf)
	% Anyway you can apply the following definition if A is invertible:
	conditionNumA = norm (A, Inf) * norm (inv (A), Inf)

	% Calculate the absolute error.
	AbsErr = norm (originalX - x, Inf)

	% Relative error from the definition: rErr = ||x - w||inf / ||x||inf.
	relativeErrDefinition = AbsErr / norm (originalX, Inf)
	% The following relative error is always greater or equal than the
	% previous.
	relativeErrGreater = conditionNumA * (norm (r, Inf) / norm (b, Inf))

	relativeErrArray (n) = relativeErrGreater;

	fprintf('\n\n');
end;

% As you can see from the plot the relative error increases exponentially each
% iteration.
plot (hilbMatrixOrderArray, relativeErrArray);
