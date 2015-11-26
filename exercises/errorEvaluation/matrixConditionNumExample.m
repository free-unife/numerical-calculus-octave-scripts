% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


clc
clear all
close all

% Matrix condition number script.
% This script shows how much an inverse matrix is sensible to perturbations in
% the original matrix. If the condition number is equal to 1 (or close to
% it) then the matrix is well conditioned so the inverse is accurate. Otherwise
% the bigger the condition number, the worst is the accuracy of the inverse.

% We know that a non-singular matrix has a non-zero determinant.
% If we get a matrix which is quasi singular, we can get the condition number.
% For this reason we use the ones(2) matrix but with an inducted error.

% Error quantity
err = 1000 * eps;

% 1 + err is the induced error.
A = [ 1, 1; 1, 1 + err ];

% After the following instruction, A is about: Aorig = [ 0.5, 0.5; 0.5, 0.5 ]
% Obviuosly Aorig is not invertible.
% This induces more error on A.
A = 1 / (2 + err) * A

normInfA = norm (A, Inf)

% If we did: inverse([0.5 0.5; 0.5 0.5]) we would get [Inf Inf; Inf Inf].
% Instead we get very big numbers which tends to Infinite.
nativeInverse = inverse (A)

% Formula of the inverse of a 2x2 matrix.
inverseA = ((2 + err) / err) * [ 1 + err, -1; -1, 1 ]

% If err = 10^-k then condition number is 10^k. This means that if a
% non-perturbated matrix is singular but the perturbated is not singular,
% the bigger the condition number, the nearer is (the perturbated matrix) to be
% singular.
% From <http://www.netlib.org/lapack/lug/node75.html> :
% "The condition number measures how sensitive A^-1 is to changes in A; the
% larger the condition number, the more sensitive is A^-1."
err

% The condition number is also the infinite norm of the inverse of A. This is
% true in this base because ||A|2 = 1. Remember that the condition number is
% calculated with the definition defined below.
normInfAInv = norm (inverseA, Inf)

% ...TOEXPLAIN...
conditionNumberA = ((2 + err) ^ 2) / err

% Definition of the condition number: k(A) = ||A||2 * ||A ^ -1||2
conditionNUmberADefinition = norm (A, 2) * norm (inverseA, 2)

% From <http://www.netlib.org/lapack/lug/node75.html> :
% "LAPACK error estimation routines typically compute a variable called RCOND,
% which is the reciprocal of the condition number (or an approximation of the
% reciprocal). The reciprocal of the condition number is used instead of the
% condition number itself in order to avoid the possibility of overflow when
% the condition number is very large."
rcondA = rcond(A)
