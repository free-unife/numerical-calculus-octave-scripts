function [p] = chebyshevPoly (ang, degree);
% [p] = chebyshevPoly (ang, degree);
%
% Find Chebyshev polynomial with the direct formula and iteratively. TODO 
% coefficient output.
%
% I = {}
% P = {}
% O = {}
% C = {}


if ang < -1 || ang > 1
	error ('Angle out of range: ang = [-1, 1]');
end;

theta = acos (ang);

if degree == 0
	p = 1;
	return
elseif degree == 1
	p = ang;
	return
end;

% Direct value calculation.
t = cos (degree * theta);

% Iterative method to find the coefficients.
x = cos (theta);
tPrevPrev = 1;
tPrev = 1;

i = 2;
t = (2 * cos ((i - 1) * theta) * cos (theta) * tPrev) - tPrevPrev

tPrev = t;
tPrevPrev = ang;
for i = 3 : degree
	t = (2 * x * tPrev) - tPrevPrev
	tPrevPrev = tPrev;
	tPrev = t;
end;
p = t;
