% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


% Script that plots the relative error between each iteration an the correct
% solution xExact.
% SOR method is applied.
% As you can see the error decreases rapidly with the first few iterations,
% then it stabilizes.

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
	if norm (xPrev - x, Inf) < eps * norm (x, Inf) || (i == maxIterations)
		break;
	end;
end;

iterations = i;

plot (1 : iterations, Er);
