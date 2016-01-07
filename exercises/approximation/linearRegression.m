% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [a, residue, singleResidues] = linearRegression (A, y);
% [a, residue, singleResidues] = linearRegression (A, y);
%
% Find the coefficients of a degree n-1 approximating polynomial (with
% n = number of columns).
%
% I = { A is the linear regression matrix, array y of observed data. }
% P = { A = mxn, y = mx1. }
% O = { a are the coefficients of the polynomial in decreasing degree order,
% residue is the euclidean norm of singleResidues and represents how much the
% solution is precise, singleResidues is the array of the single residues. }
% C = { a = 1xn, residue = 1x1 , singleResidues = mx1. }


[m, n] = size (A);
% QR factorization is used.
[Q, R] = qr (A);

yTilde = Q' * y';

% Solve the system R * a = y.
a = R (1:n, 1:n) \ yTilde (1:n);

% The following is the same as doing:
% r = y - (A * a);
singleResidues = Q * [zeros(n, 1); yTilde(n+1:m)];
residue = norm (singleResidues, 2) ^ 2;

% Set a to the correct vectorial size and order it in the correct way, so that
% other functions can use this result directly.
a = a';
a = a (n : -1 : 1);
