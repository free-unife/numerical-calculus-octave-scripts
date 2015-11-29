% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


clear all
close all
clc

% Even if gauss with partial pivoting (gauss2) guarantees that
% abs (multipliers) <= 1, this does not tell us how much the elemets R will
% increase. In this particular case they increase uniformly of 2^i (with i
% representing each line.) This means that the factor of the last line will be
% 2^(n - 1).
% The following mathematical explanation tries to prove this, although it's
% not very clear to me too :)
%
% The (k) symbol represent the current step.
% |a xy| is an absolute value of an element of the original matrix.
%
%  (k)
% |a ij| means that i and j go from k to n.
%
% =========================================
%
%   (k+1)     (k)             (k)       (k)      (k)
% |a ij|  <= |a ij| + |m ik| |a kj| <= |a ij| + |a kj|
%
% This is true because |m ik| <= 1 when using partial pivoting.
%
%                               (k)
% We now set gk (A) = max [ij] |a ij| / max [ij] |aij|
% This means that we always divide for the maximum of the all the matrix.
%
% We obtain: gk+1 (A) <= 2 * gk (A)
%
% When we reach step n:
%                    (n)
% gn (A) = max [ij] |a ij| / max [ij] |a ij| <= 2^(n - 1)
%
%               (n)
% So: max [ij] |a ij| = 2^(n - 1) * max [ij] |a ij|
%
% This means that 2^(n - 1) is the upper limit of the elements of R, and that
% |r nj| is 2^(n - 1) times bigger than |a 1j|.
%
% The following matrix A has a structure which reaches this limit.
% In this case max [ij] |a ij| = 1
% Example for n= 3:
%     |  1  0  1 |
% A = | -1  1  1 |
%     | -1 -1  1 |


n = 100;

A = - ones (n);
A = tril (A, -1) + diag (ones (n, 1));
A (:, end) = ones (n, 1);

[L, R, P, deter] = gauss2 (A)

condA = cond (A, Inf)

lastElA = A (n, n)
lastEl = L * R;
% lastEl (n, n) should be 1. If n = 100 then it's zero.
% Probably this is caused by errors since we are subtracting and multipliying
% -1 with bigger and bigger numbers.
lastElLR = lastEl (n, n)

Rnew = R;
Rnew (n, n) = R (n, n) - 0.05;

Anew = L * Rnew;
Anew (n, n);
