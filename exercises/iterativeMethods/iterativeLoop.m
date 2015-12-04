

% Some matrices will not convergew even if the spectrum is less than one.
% For this reason we should set a variable corresponding to the maximum
% iterations.
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

