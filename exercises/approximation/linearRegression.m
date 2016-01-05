% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [a, residue, r] = linearRegression (A, y);
%
% TOBEFINISHED.
%
% I = { A = linear regression matrix, y = array of observed data. }


[m, n] = size (A);
[Q, R] = qr (A);

yTilde = Q' * y';

a = R (1:n, 1:n) \ yTilde (1:n);
r = Q * [zeros(n, 1); yTilde(n+1:m)];
residue = norm (r, 2) ^ 2;

a = a';
a = a (n : -1 : 1);
