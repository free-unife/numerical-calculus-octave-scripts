% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function x = solLower(L, b);

x = b;
n = length(b);

%% Calcolo il primo x1
x(1) = b(1)/L(1,1);
%% Calcolo i restanti xi
for i = 2 : 1 : n
  x(i) = (x(i) - L(i, 1 : i-1) * x(1 : i-1)) / L(i,i);
end;

