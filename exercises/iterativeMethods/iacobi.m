function [x, iterations] = iacobi (A, b, precision)
% [x, iterations] = iacobi (A, b, precision)
%
% Apply Iacobi's method to find the solutions of a linear system.
%
% I = { precision is the number of decimal digits without error. }
% P = {}
% O = {}
% C = {}


[rows, cols] = size (A);

% Define our x array.
x = zeros (rows, 1);

% Find some components.
D = diag (diag (A));
L = - tril (A, -1);
U = - triu (A, 1);

% FInd the inverse of D.
for i = 1 : rows
	if D (i, i) == 0
		error ('Division by zero.')
	end;
	invD (i, i) = 1 / D (i, i);
end;

% Jacobi matrix.
J = invD * (L + U);
c = invD * b;

G = J;
% Check if matrix is converging.
[trash, trash, iteration] = convSpeedStep (G);
maxIterations = abs (round (iteration) * precision);

% Some matrices will not convergew even if the spectrum is less than one.
% For this reason we should set a variable corresponding to the maximum
% iterations.
i = 0;
while true
	xPrev = x;
	x = (J * x) + c;
	i = i + 1;
	% If the following is true the iterative process must be stopped.
	% This is true because that norm tends to the zero machine precision
	% number.
	if (norm (xPrev - x, Inf) < eps * norm (x, Inf)) || (i == maxIterations)
		break;
	end;
end;

iterations = i;
