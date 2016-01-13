% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [x, it] = fixedPoint (gFun, x0, tol, maxIt)
% [x, it] = fixedPoint (gFun, x0, tol, maxIt)
%
% Function that applies the fixed point method.
%
% gFun = x + (fi(x) * f(x))
% with fi(x) usually = -1 or +1.
%
% I = { Anonymous function gFun, x0, tolerance tol, maximum iteration maxIt. }
% I = {}
% I = {}
% I = {}


xkNext = x0;

for it = 1 : maxIt
    xk = xkNext;
    xkNext = gFun (xkNext);
    if abs (xkNext - xk) <= tol + (eps * abs (xk))
        break
    end;
end;

x = xkNext;

fprintf ('Solution reached in %g out of %g steps\n', it, maxIt);
