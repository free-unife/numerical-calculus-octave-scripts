function [x] = chebyshevNodes (a, b, n);
% function [x] = chebyshevNodes (a, b, n);
%
% Find Chebyshev polynomial with the direct formula and iteratively. TODO 
% coefficient output.
%
% I = { a = min, b = max, n = node number = degree + 1. }
% P = {}
% O = {}
% C = {}


x = zeros (1, n);
for k = 1 : n
	first = (1 / 2) * (a + b);
	second = (1 / 2) * (b - a);
	third = cos (((2 * k + 1) * pi) / (2 * (n + 1)));
	x (k) = (second * third) + first;
end;
