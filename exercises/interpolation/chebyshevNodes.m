% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [x] = chebyshevNodes (a, b, n);
% function [x] = chebyshevNodes (a, b, n);
%
% Find the n Chebyshev nodes x in the interval [a, b] by applying directly the 
% formula.
%
% I = { a = interval lower bound, b = interval upper bound, n = node number. }
% P = { n = node number = degree + 1. }
% O = { x is an array containing the n Chebyshev nodes. }
% C = { x is 1xn. }


x = zeros (1, n);
for k = 1 : n
	first = (1 / 2) * (a + b);
	second = (1 / 2) * (b - a);
	third = cos (((2 * k + 1) * pi) / (2 * (n + 1)));
	x (k) = (second * third) + first;
end;
