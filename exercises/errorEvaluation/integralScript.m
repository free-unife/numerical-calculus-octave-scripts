% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


% This script calls integralApprox function.

clc
clear all
close all

% n is the number of iteration to get the approximation of the integer value.
n = (0 : 1 : 20)';
Ivec = zeros (length (n), 1);

for i = 0 : length (n) - 1
	% test integral Approx with all the values of n
	Ivec (i + 1) = integralApprox (n (i + 1));
end;

% The number of values is in the x axis, while the integral approximation is on
% the y axis. The result is that we obtain an exponential function tending to
% zero. This means that it does not care to have lots of iterations to get a
% good value of the integral (as long as we are reasonably distant from n = 0).
plot (n, Ivec, "");
