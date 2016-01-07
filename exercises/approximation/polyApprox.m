% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [a, residue, singleResidues] = polyApprox (x, y, degree);
% [a, residue, singleResidues] = polyApprox (x, y, degree);
%
% Polynomial approximation using linear regression. If m = n (i.e: length (x) =
% degree + 1) we obtain an interpolating polynomial.
%
% I = { array of nodes x, array of observations y, degree of approximating
% polynomial degree. }
% P = { x = 1xm, y = 1xm, degree = 1x1. }
% O = { a are the coefficients of the polynomial in decreasing degree order,
% residue is the euclidean norm of singleResidues and represents how much the
% solution is precise, singleResidues is the array of the single residues. }
% C = { a = 1xn, residue = 1x1 , singleResidues = mx1. }


% There are degree+1 columns for a polynomial of a certain degree.
n = degree + 1;
m = length (x);

% A is an mxn matrix containing all the x, in increasing index order by rows
% and increasing degree order by columns.
% The structure of the matrix A is a generalization of the Vandermonde matrix.
A = zeros (m, n);
for i = 1 : m
        A (i, 1 : n) = x (i) .^ (0 : n - 1);
end;

% Get the coefficients a of the polynomial.
[a, residue, singleResidues] = linearRegression (A, y);
