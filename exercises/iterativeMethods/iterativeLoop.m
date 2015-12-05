% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


% Script that calculates the solutions of linear systems iteratively.
% Precondition = G and c must be already calculated with one of the following
% methods:
% Iacobi
% Gauss Seidel
% Parametric Iacobi
% SOR


% Some matrices will not converge even if the spectrum is less than one.
% For this reason a variable corresponding to the maximum iterations is set.

i = 0;
while true
	xPrev = x;
	x = (G * x) + c;
	i = i + 1;
	% If the following is true the iterative process must be stopped.
	% This is true because that norm tends to the zero machine precision
	% number.
	if (norm (xPrev - x, Inf) < eps * norm (x, Inf)) || (i == maxIterations)
		break;
	end;
end;
