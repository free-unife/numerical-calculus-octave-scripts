% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [x] = solUpper (R, b);
% [x] = solUpper (R, b);
%
% Solve an upper triangular matrix system, Rx = b using the backwards
% substitution algorithm.
%
% I ={ TODO }
% P ={}
% O ={}
% C ={}

x = b;
n = length(x);

% Find the last element on the diagonal which is calculated like solDiag.m.
x(n) = b(n) / R(n,n);

% Backwards substitution algorithm.
for i = n - 1 : -1 : 1
  x (i) = (b (i) -R (i, i + 1 : n) * x (i + 1 : n)) / R (i, i);

end;
