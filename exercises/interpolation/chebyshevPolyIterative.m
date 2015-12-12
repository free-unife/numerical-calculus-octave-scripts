% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [t] = chebyshevPolyIterative (ang, degree);
% [t] = chebyshevPolyIterative (ang, degree);
%
% Find Chebyshev polynomial value t iteratively (without any trigonomertic 
% function) for an angle ang and a degree degree.
%
% I = { angle ang, polynomial degree degree. }
% P = { -1 <= ang <= 1 where ang is expressed in radians. }
% O = { array of the evaluated polynomial t. }
% C = { -1 <= t(i) <= 1 for i = 1 : degree + 1. }


if ang < -1 || ang > 1
	error ('Angle out of range: ang = [-1, 1]');
end;

% Base cases.
if degree == 0
	t = [1];
	return
elseif degree == 1
	t = [1, ang];
	return
end;

% Iterative method to find the coefficients.

% r is a placeholder so that t can be used in the iteration.
r = [0, 0];
r(1:2) = [1, ang];

% Since x = cos (theta) = ang, we can say:
x = ang;
tPrev = x;
tPrevPrev = 1;
for i = 2 : degree
	t = (2 * x * tPrev) - tPrevPrev;
	tPrevPrev = tPrev;
	tPrev = t;
	r = [r, t];
end;

t = r;

% The following are older versions which show the correlation between the 
% trigonometric and the iterative formulas.
% Old version:
%theta = acos (ang);
%tPrevPrev = 1;
%tPrev = 1;

% Even older version:
%i = 2;
%t = (2 * cos ((i - 1) * theta) * cos (theta) * tPrev) - tPrevPrev
% END even older version.
%t = (2 * x * x) - tPrevPrev;

%tPrev = t;
%tPrevPrev = ang;
%for i = 3 : degree
%	t = (2 * x * tPrev) - tPrevPrev
%	tPrevPrev = tPrev;
%	tPrev = t;
%end;
