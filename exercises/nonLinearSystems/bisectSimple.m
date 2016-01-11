% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [c, k] = bisectSimple (fun, a, b, k, maxSteps);
% [c, k] = bisectSimple (fun, a, b, k, maxSteps);
%
% Find the zero point (c) of a function fun using bisection method, 
% recursively.
%
% I = { anonymous function fun, left extereme of the interval a, right extreme 
% of the interval b, current step counter k, maximum steps to get the solution 
% maxSteps. }
% P = { (fun(a) * fun(b)) < 0, a = float 1x1, b = float 1x1, k must always 
% be set = 0, maxSteps = int 1x1. }
% O = { c is the point where the function fun has (the one and only) value 
% equal to zero  (or at least a close approximation), k is the number of 
% iterations done. }
% C = { fun(c) ~= 0, int k == maxSteps. }


% Get x value of middle point of the interval.
c = (a + b) / 2;

% Current iteration counter.
k = k + 1;
% Exit if the maximum amout of steps has been reached. We know it converged for 
% the steps given by the user (calculated from the tolerance).
if k >= maxSteps
	return
end;

% Get the value of the function in the middle of the current interval.
y = fun (c);
if y > 0
	% Left part of the interval.
	[c, k] = bisectSimple (fun, a, c, k, maxSteps);
elseif y < 0
	% Right part of the interval.
	[c, k] = bisectSimple (fun, c, b, k, maxSteps);
else
	% The solution has been found, so no more calculations needs to be done.
	return
end;

