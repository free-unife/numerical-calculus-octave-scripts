% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


% Script that plots the relative error for each omega value.
% SOR method is applied.
% As you can see the error decreases rapidly with the first few iterations,
% then it stabilizes.
% Have a look at sorEx1_1.m for more information.


A = [7 6 10 6; 6 8 8 6; 10 8 16 10; 6 6 10 9];
b = [56 50 86 57]';
precision = 100;

[rows, cols] = size (A);

% Define our x array.
x = zeros (rows, 1);

D = diag (diag (A));

L = -tril (A, -1);
U = - triu (A, 1);

evec = [];
xExact = [2 1 3 1]';

for omega = 0 : 0.1 : 2

	Gs = invTril (D - (omega * L)) * (((1 - omega) * D) + (omega * U));
	c = invTril (D - omega * L) * omega * b;

	i = 0;
	Er = [];

	%G = Gs;
	%[spectrum, trash, iteration] = convSpeedStep (G);
	%maxIterations = abs (round (iteration) * precision);
	maxIterations = 10000;

	while true
		xPrev = x;
		x = (Gs * x) + c;
		i = i + 1;
		if (norm (xPrev - x, Inf) < eps * norm (x, Inf)) || (i == maxIterations)
			break;
		end;
	end;
	Er  = [Er, norm(xExact - x, Inf)/norm(xExact, Inf)];
	evec = [evec, Er];
	iterations = i;
end;

omega = [0: 0.1: 2];
plot (omega, evec);
