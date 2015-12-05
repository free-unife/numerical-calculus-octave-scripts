A = [7 6 10 6; 6 8 8 6; 10 8 16 10; 6 6 10 9];
b = [56 50 86 57]';
precision = 100;

[rows, cols] = size (A);

% Define our x array.
x = zeros (rows, 1);

D = diag (diag (A));

omega = 'NULL';
findOmega

L = -tril (A, -1);
U = - triu (A, 1);

Gs = invTril (D - (omega * L)) * (((1 - omega) * D) + (omega * U));
c = invTril (D - omega * L) * omega * b;

G = Gs;
[spectrum, trash, iteration] = convSpeedStep (G);
maxIterations = abs (round (iteration) * precision);

i = 0;
Er = [];
xExact = [2 1 3 1]';
while true
	xPrev = x;
	x = (G * x) + c;
	i = i + 1;
	Er  = [Er, norm(xExact - x, Inf) / norm(xExact, Inf)];
	% If the following is true the iterative process must be stopped.
	% This is true because that norm tends to the zero machine precision 
	% number.
	if norm (xPrev - x, Inf) < eps * norm (x, Inf) || (i == maxIterations)
		break;
	end;
end;

iterations = i;

plot (1 : iterations, Er); 
