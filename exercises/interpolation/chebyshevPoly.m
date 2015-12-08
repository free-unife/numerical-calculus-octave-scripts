function [p] = chebyshevPoly (ang, degree);
%
%
%


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
t = cos (degree * theta)

% Iterative method to find the coefficients TODO.
tPrev = 1;
t = 1;
x = cos (theta);

i = 2;
t = (2 * cos ((i - 1) * theta) * cos (theta) * t) - tPrev

tPrev = ang;
for i = 3 : degree
	t = (2 * x * t) - tPrev
	%t = (2 * cos ((i - 1) * theta) * cos (theta) * t) - tPrev

%	t = (2**t) - tPrev
%	t = (2 * cos ((i) * theta) - cos ((i - 1) * theta))
end;
p = t;
