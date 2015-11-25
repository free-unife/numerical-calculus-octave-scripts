% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [Q, R] = QRfatt_hessenberg(A);
%TODO

[n,n] = size(A);
Q = eye(n);

for i = 1 : n-1
  G = generateGivensMatrix(i,i+1,A);
  A = G*A;
  Q = Q*G;
end;
  
R = triu(A)
