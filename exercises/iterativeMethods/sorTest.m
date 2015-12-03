function [x, iterations] = sorTest (A, b, omega)
% [x, iterations] = sor (A, b)
%
% Apply Iacobi's method to find the solutions of a linear system.

omega
if omega == 'NULL'
	doOmega = 1
else
	doOmega = 0
end;

return
[rows, cols] = size (A);

% Define our x array.
x = zeros (rows, 1);

% Find some components.
L = tril (A);
U = - triu (A, 1);
invL = invTril (L);
D = diag (diag (A));

% FInd the inverse of D.
for i = 1 : rows
	if D (i, i) == 0
		error ('Division by zero.')
	end;
	invD (i, i) = 1 / D (i, i);
end;

% Find Gauss Siedel matrix.
Gs = invL * U;
c = invL * b;


G = Gs;
[spectrum,trash,trash] = convSpeedStep (G);

omega = 2 / (1 + sqrt (1 - spectrum));

L = -tril (A, -1);
U = - triu (A, 1);

Gs = invTril (D - (omega * L)) * (((1 - omega) * D) + (omega * U));
c = invTril (D - omega * L) * omega * b;

[spectrum, trash, trash] = convSpeedStep (Gs);
fprintf ('Optimal omega = %g\n', omega);

i = 0;
while true
	xPrev = x;
	x = (Gs * x) + c;
	i = i + 1;
	% If the following is true the iterative process must be stopped.
	% This is true because that norm tends to the zero machine precision 
	% number.
	if norm (xPrev - x, Inf) < eps * norm (x, Inf)
		break;
	end;
end;

iterations = i;
