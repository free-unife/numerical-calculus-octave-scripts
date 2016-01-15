% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [x, it] = newton (fun, der, x0, tolx, tolf, maxIt);
% [x, it] = newton (fun, der, x0, tolx, tolf, maxIt);
%
% Function that applies Newton's method.
%
% More conditions and explanations are in the code.
%
% I = { Anonymous function fun, anonymous function der = fun'(x), x0 is the
% approximation of the solution of the equation f(x) = 0, tolerance tolx is
% the precision wanted, tolerance tolf is referred to the function, tolx
% is the tolerance referred to x, maximum iterations maxIt. }
% P = { fx = fun(x0), x0 = int 1x1, tolx and tolf = int 1x1, maxIt = int 1x1. }
% O = { x is a close approximation to (or it is the precise value of) f(x) = 0,
% it = number of iterations done to get the solution. }
% C = { fun(x) ~= 0, it = int 1x1. }


x = x0;
fx = fun (x);
it = 0;

for it = 1 : maxIt
    d = fx / der (x);
    xPrev = x;
    x = x - d;
    fx = fun (x);

    % abs (x - xPrev) >= abs (d)
    % Check if f(xk) is near or equal to zero to zero
    % and if f(xk-1)/f'(xk-1) < xk, which means:
    % If (f(xk) < tolf && abs (xk - xk-1) < tol x) || (f(xk) == 0) then break.
    if abs (fx) < tolf && abs (x - xPrev) < tolx
        fprintf ('First break condition true, step %g\n', it);
    end;
    if (abs (fx) < tolf && abs (d) < tolx * abs (x)) || (fx == 0)
        break
    end;
end;

fprintf ('Solution reached in %g out of %g steps\n', it, maxIt);
