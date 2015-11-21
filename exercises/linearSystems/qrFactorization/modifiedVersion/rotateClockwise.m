% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [c, s] = rotateClockwise (x1, x2);
% [c, s] = rotateClockwise (x1, x2);
%
% Calculates sine and cosine from given x1 and x2 elements.
%
% Since the objective of this is to get zeros on the yj vector
% (or on the equivalent element of the matrix, like with LR factorization)
% our equation is:
% yj = -s * xi + c * xj = 0
% where c and s represent respectively cosine and sine of an angle.
%
% From trigonometry we know that c^2 + s^2 = 1.
%
% To obtain s we have to isolate c:
% c * xj = s * xi
% c = (s * xi) / xj
%
% Using our earlier equation we substitute our new c in it:
% (xi / xj)^2 * s^2 + s^2 = 1
% s^2 ((xi^2 / xj ^2) + 1) = 1
%
% Now we isolate s^2
% s^2 = 1 / ((xi^2 / xj^2) + 1)
%
% We sum the lower one and extract the square root.
% s = sqrt (1 / ((xi^2 + xj^2) / xj^2))
%
% To get rid of the lower xj^2 we just multiply numerator and denominator by
% xj^2. We can get rid of the upper square root. The code expresses this final
% step.
% Very similar steps can be applied to get c: you just start by isolating s and
% follow the previous steps.
%
% I = { element x1, element x2. }
% P = { x2 is an element to void, x1 (along with x2) is used to achieve this
% goal. }
% O = { cosine c, sine s. }
% C = { c = x1 / sqrt (x1^2 + x2^2), s = x2 / sqrt (x1^2 + x2^2),  yj = -s * xi
% + c * xj = 0 }

if x2 == 0
	c = 1;
	s = 0;
end;

c = x1 / sqrt (x1^2 + x2^2);
s = x2 / sqrt (x1^2 + x2^2);

end;
