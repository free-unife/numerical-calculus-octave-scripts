% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [c, s] = rotateAntiClockwise (x1, x2);
% [c, s] = rotateAntiClockwise (x1, x2);
%
% Calculates sine and cosine from given x1 and x2 elements.
%
%
% I = { element x1, element x2. }
% P = { x1 is an element to void, x2 (along with x1) is used to achieve this
% goal. }
% O = { cosine c, sine s. }
% C = { c = x2 / sqrt (x1^2 + x2^2), s = x1 / sqrt (x1^2 + x2^2),  yi = xi *
% c - xj * s = 0}


c = x2 / sqrt (x1^2 + x2^2);
s = x1 / sqrt (x1^2 + x2^2);

end;
