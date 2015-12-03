function [x, iterations] = sor (A, b, precision, omega)
% [x, iterations] = sor (A, b, precision, omega)
%
% Apply Iacobi's method to find the solutions of a linear system.
%
%


[rows, cols] = size (A);

x = zeros (rows, 1);
D = diag (diag (A));

% If input variable omega is set to the string 'NULL', then the optimal
% parameter is found with a formula.
if omega == 'NULL'
	% Gauss Seidel algorithm.
	% Find some components.
	L = tril (A);
	U = - triu (A, 1);
	invL = invTril (L);

	% Find Gauss Siedel matrix.
	Gs = invL * U;
	c = invL * b;

	G = Gs;
	[spectrum, trash, trash] = convSpeedStep (G);

	omega = 2 / (1 + sqrt (1 - spectrum));
	fprintf ('Optimal omega = %g\n', omega);
end;

L = - tril (A, -1);
U = - triu (A, 1);

Gs = invTril (D - (omega * L)) * (((1 - omega) * D) + (omega * U));
c = invTril (D - omega * L) * omega * b;

G = Gs;
% Check if matrix is converging.
[trash, trash, iteration] = convSpeedStep (G);
maxIterations = abs (round (iteration) * precision);

i = 0;
while true
	xPrev = x;
	x = (Gs * x) + c;
	i = i + 1;
	% If the following is true the iterative process must be stopped.
	% This is true because that norm tends to the zero machine precision
	% number.
	if (norm (xPrev - x, Inf) < eps * norm (x, Inf)) || (i == maxIterations)
		break;
	end;
end;

iterations = i;
