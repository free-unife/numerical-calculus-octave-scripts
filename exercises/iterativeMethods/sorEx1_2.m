function [x, iterations, evec] = sorEs1punto2 (A, b)
% [x, iterations, Er] = sor (A, b, omega)
%
% Apply Iacobi's method to find the solutions of a linear system.
% plot ([0:0.1:2], evec)

[rows, cols] = size (A);

% Define our x array.
x = zeros (rows, 1);

D = diag (diag (A));

L = -tril (A, -1);
U = - triu (A, 1);

evec =  [];
for omega = 0 : 0.1 : 2

	Gs = invTril (D - (omega * L)) * (((1 - omega) * D) + (omega * U));
	c = invTril (D - omega * L) * omega * b;

	%[spectrum, trash, trash] = convSpeedStep (Gs);
	fprintf ('Optimal omega = %g\n', omega);

	i = 0;
	Er = [];
	xExact = [2 1 3 1]';
	while true
		xPrev = x;
		x = (Gs * x) + c;
		i = i + 1;
		if norm (xPrev - x, Inf) < eps * norm (x, Inf) || i == 10000
			break;
		end;
	end;
	Er  = [Er, norm(xExact - x, Inf)/norm(xExact, Inf)];
	evec = [evec, Er];
	iterations = i;
end;
