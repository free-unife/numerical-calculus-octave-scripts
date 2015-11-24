% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [Yn2] = integralApprox (n);
% [Yn2] = integralApprox (n);
%
% Calculate the itegral between 0 and 1 of x^n / ((4 * x) + 1)
% The used formula is an approximation of the original one and the result is
% obtained by recursion: Yn = (1 / 4) * ((1 / n) - Yn-1)
%
% I = { n }
% P = { n is the number of iterations to do to find the integral value. }
% O = { Yn2 }
% C = { Yn = (1 / 4) * ((1 / 1 : n) - Y(1 : n - 1) }


% Set a starting value.
Yn2 = log (5) / 4;

for i = 1 : 1 : n
	Yn2 = (1 / 4) * ((1 / i) - Yn2);
end;
