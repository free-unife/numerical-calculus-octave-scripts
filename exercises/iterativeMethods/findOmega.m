% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


% Script that finds the optimal value of the parameter omega. This is valid
% only for the SOR method.

% If omega variable has not been set, then it must be found.
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

	% Direct application of the formula.
	omega = 2 / (1 + sqrt (1 - spectrum));
	fprintf ('Optimal omega = %g\n', omega);
end;

