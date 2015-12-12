% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [t] = chebyshevPoly (ang, degree);
% [t] = chebyshevPoly (ang, degree);
%
% Find Chebyshev polynomial value t (with the direct trigonometric formula) 
% for an angle ang and a degree degree.
%
% I = { angle ang, polynomial degree degree. }
% P = { -1 <= ang <= 1 where ang is expressed in radians. }
% O = { evaluated polynomial t. }
% C = { -1 <= t <= 1. }


if ang < -1 || ang > 1
	error ('Angle out of range: ang = [-1, 1]');
end;

theta = acos (ang);

t = cos (degree * theta);
