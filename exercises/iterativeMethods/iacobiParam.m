function [x, iterations] = iacobiParam (A, b, omega)
% [x, iterations] = iacobiParam (A, b, omega)
%
% Apply Iacobi's method to find the solutions of a linear system.

[rows, cols] = size (A);

% Define our x array.
x = zeros (rows, 1);

% Find some components.
D = diag (diag (A));

% FInd the inverse of D.
for i = 1 : rows
	if D (i, i) == 0
		error ('Division by zero.')
	end;
	invD (i, i) = 1 / D (i, i);
end;

c = omega * invD * b;
J = eye (rows) - (omega * invD * A);

G = J;
convSpeedStep (G);

i = 0;
while true
	xPrev = x;
	x = (J * x) + c;
	i = i + 1;
	% If the following is true the iterative process must be stopped.
	% This is true because that norm tends to the zero machine precision 
	% number.
	if norm (xPrev - x, Inf) < eps * norm (x, Inf)
		break;
	end;
end;

iterations = i;
