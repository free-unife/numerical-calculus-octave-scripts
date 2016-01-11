% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [x, it] = bisect (fname, a, b, tol);
% [x, it] = bisect (fname, a, b, tol);
%
% Find the zero point (c) of a function fun using bisection method, 
% iteratively. This is an improved version of bisectSimple.m because it takes 
% in account all the problems that come up with arithmetical operations on a 
% machine.
%
% I = { anonymous function fname, left extereme of the interval a, right 
% extreme of the interval b, maximum absolute error tol of the solution x. }
% P = { (fname(a) * fname(b)) < 0, a = float 1x1, b = float 1x1, 
% tol = int 1x1. }
% O = {x is the point where the function fun has (the one and only) value 
% equal to zero (or at least a close approximation), it = the number of 
% iterations done. }
% C = { fname(x) ~= 0, int k == maxSteps. }


% Get the maximum number of iterations to do, based on input tolerance.
maxit = round (log2 ((b - a) / tol) + 1);
fprintf ('Number of steps to get to a good solution = %g\n', maxit);

% Evaluate anonymous functions. You could simply use: fa = fname (a)
fa = feval (fname, a);
fb = feval (fname, b);

% Check if the function have opposite signs in the limit of the interval.
if sign (fa) * sign (fb) >= 0
	error ('Invalid interval.');
else
	it = 0;

	% while c is computable inside the given tolerance tol && while more 
	% iterations are possible.
	while (abs (b - a) > tol + (eps * max ([abs(a) abs(b)]))) && (it <= maxit)
		it = it + 1;

		% The following is equivalent to c = (a + b) / 2
		pm = a + (b - a) * 0.5;

		%fprintf ('it = %g  x = %g\n', it, pm);
		% Calculate the function value in the middle point of the interval.
		fpm = feval (fname, pm);

		% If y == 0: solution found -> exit.
		if fpm == 0
			break;
		end;

		% if the left subinterval has the same sign in fpm and in fa,
		% then go to the right part.
		% It can be said like this: if fname(a) and fname(c) are both positive 
		% or negative, it means that x must be on the other side of the 
		% interval, so move the new a to the right side of the interval.
		% b remains the same, a = middle, fa = fname (pm)
		if sign (fpm) * sign (fa) > 0
			a = pm;
			fa = fpm;
		% else move b to the upper part of the interval (since x is between a 
		% and b).
		else
			b = pm;
			fb = fpm;
		end;

	end;

	% If it does not converge, exit with error.
	if it > maxit
		error ('Maximum number of iteration reached.');
	% If the value converges, it's returned.
	else
		x = pm;
	end;
end;

