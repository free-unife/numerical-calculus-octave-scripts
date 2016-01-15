% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [x, it] = fixedPoint (gFun, x0, tol, maxIt);
% [x, it] = fixedPoint (gFun, x0, tol, maxIt);
%
% Function that applies the fixed point method.
%
% gFun = x - (fi(x) * f(x))
% with fi(x) usually = -1 or +1.
% The system is like this:
% { y = g(x)
% { y = x
%
% We are interested in f(x) = 0, so:
% if y = 0:
% { 0 = g(x)
% { x = 0
%
% Since g(x) = x - (fi(x) * f(x)) and assuming:
% fi(x) - 1, then:
% g(x) = 0 - (-1 * f(x))
%
% { 0 = f(x)
% { x = 0
%
% So the initial systems is the same as: f(x) = 0
%
% I = { Anonymous function gFun, x0 is the approximation of the solution of the
% equation f(x) = 0, tolerance tol is the precision wanted, maximum
% iterations maxIt. }
% P = { xNext = gFun(xCurent), x0 = int 1x1, tol = int 1x1, maxIt = int 1x1. }
% O = { x is a close approximation corresponding to f(x) = 0, it = number of
% iterations done to get the solution. }
% C = { g(x) ~= x, it = int 1x1. }


y = x0;
for it = 1 : maxIt
    % As you can see, the value of the current x is the value of the previous
    % y. This is the iterative process.
    x = y;
    y = gFun (x);

    xPrev = y;
    % If current_x - previous_x <= small_number * current_x
    % means that previous_x tends to zero and current_x is considered to be
    % zero. Usually if the following statement is true, then abs (current_x -
    % previous x) is a (very) small number.
    if abs (x - xPrev) <= tol + (eps * abs (x))
        break
    end;

end;

fprintf ('Solution reached in %g out of %g steps\n', it, maxIt);
