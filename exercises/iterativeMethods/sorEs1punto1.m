function [x, iterations, Er] = sorEs1punto1 (A, b, omega)
% [x, iterations, Er] = sor (A, b, omega)
%
% Apply Iacobi's method to find the solutions of a linear system.

[rows, cols] = size (A);

% Define our x array.
x = zeros (rows, 1);

D = diag (diag (A));

if omega == 'NULL'

	% Find some components.
	L = tril (A);
	U = - triu (A, 1);
	invL = invTril (L);

	% Find Gauss Siedel matrix.
	Gs = invL * U;
	c = invL * b;

	G = Gs;
	[spectrum,trash,trash] = convSpeedStep (G);

	omega = 2 / (1 + sqrt (1 - spectrum));

end;

L = -tril (A, -1);
U = - triu (A, 1);

Gs = invTril (D - (omega * L)) * (((1 - omega) * D) + (omega * U));
c = invTril (D - omega * L) * omega * b;

[spectrum, trash, trash] = convSpeedStep (Gs);
fprintf ('Optimal omega = %g\n', omega);

i = 0;
Er = [];
xExact = [2 1 3 1]';
while true
	xPrev = x;
	x = (Gs * x) + c;
	i = i + 1;
	Er  = [Er, norm(xExact - x, Inf)/norm(x, Inf)];
	% If the following is true the iterative process must be stopped.
	% This is true because that norm tends to the zero machine precision 
	% number.
	if norm (xPrev - x, Inf) < eps * norm (x, Inf) || i == 10000
		break;
	end;
end;

iterations = i;
