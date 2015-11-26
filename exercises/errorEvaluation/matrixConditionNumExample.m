% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


clc
clear all
close all

% Matrix condition number script.

% We know that a non-singular matrix has a non-zero determinant.
% If we get a matrix which is quasi singular, we can get the condition number.

% Error quantity
err = 1000 * eps;

A = [ 1, 1; 1, 1 + err ];

% After the following instruction A is about [ 0.5, 0.5; 0.5, 0.5 ]
A = 1 / (2 + err) * A

normInfA = norm (A, Inf);

% If we did: inverse([0.5 0.5; 0.5 0.5]) we would get [Inf Inf; Inf Inf]. 
% Instead we get very big numbers which tends to Infinite.
nativeInverse = inverse (A)

inverseA = ((2 + err) / err) * [ 1 + err, -1; -1, 1 ]

fprintf ('Condition number is the infinite norm of the inverse of A.\n');

% If err = 10^-k then condition number is 10^k. This means that if a 
% non-perturbated matrix is singular but the perturbated is not singular,
% the bigger the condition number, the nearer is (the perturbated matrix) to be
% singular.
% From <http://www.netlib.org/lapack/lug/node75.html> :
% "The condition number measures how sensitive A^-1 is to changes in A; the 
% larger the condition number, the more sensitive is A-1."
% [...]
% "LAPACK error estimation routines typically compute a variable called RCOND, 
% which is the reciprocal of the condition number (or an approximation of the 
% reciprocal). The reciprocal of the condition number is used instead of the 
% condition number itself in order to avoid the possibility of overflow when 
% the condition number is very large." 
err
normInfAInv = norm (inverse (A), Inf)

conditionNumberA = ((2 + err) ^ 2) / err

% Definition of the condition number: k(A) = ||A||2 * ||A ^ -1||2
conditionNUmberADefinition = norm (A, 2) * norm (inverse (A), 2)
