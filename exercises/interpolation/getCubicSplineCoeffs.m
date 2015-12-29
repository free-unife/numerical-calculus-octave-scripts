% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [C] = getCubicSplineCoeffs (x, y, firstNodeDer, lastNodeDer);
% [C] = getCubicSplineCoeffs (x, y, firstNodeDer, lastNodeDer);
%
% Construction of coefficient matrix C for a cubic (degree = 3) spline.
%
% I = { array x of nodes, array y of function values, int firstNodeDer
% and int lastNodeDer are the values of the first derivatives in node 0
% and n + 1 respectively. }
% P = {  TODO   }
% O = { matrix C of coefficients. }
% C = { C(i,1:4) are respectively d(i) c(i) b(i) and a(i) coefficients:
% C(i,1)*(evalPoint-x(i))^3 + C(i,2)*(evalPoint-x(i))^2 +
% + C(i,3)*(evalPoint-x(i)) + C (i,4) }


n = length (x);

% The definition of h is: h(i) = x(i+1) - x(i) for i = 0 to n. The n
% used in the code corresponds to n+1 (and 1 coresponds to 0) in the
% slides. Indices have been adaped to be usable in Octave.
h = x(2:n)-x(1:n-1)

% Main diagonal of T.
tDiag = 2*(h(1:n-2)+h(2:n-1));
% Upper diagonal.
tUpper = [0, h(1:n-3)];
% Lower diagonal.
tLower = [h(3:n-1), 0];

% T is a matrix part of: Tz = b system, where z are the
% first derivatives.
% This is used because T is a quasi-sparse matrix.
% [-1 0 1] builds a tridiagonal matrix using the three vectors.
T = spdiags ([tLower, tDiag, tUpper]', [-1, 0, 1], n-2, n-2)

% Using the formula in the slides:
% z (1 : n - 1) = (y (2 : n - 1) - y (1 : n - 2)) ./ h (1 : n - 2)
% z (2 : n) = (y (3 : n) - y (2 : n - 1)) ./ h (2 : n - 1)
b = (y (2 : n - 1) - y (1 : n - 2)) ./ h (1 : n - 2) .* h (2 : n - 1) + h (1 : n - 2) .* (y (3 : n) - y (2 : n - 1)) ./ h (2 : n - 1);

% WHY THIS?
b = 3 * b;

% Since the first and last node are special cases we have to remove:
% h (2) * z1 and h (n - 2) * z2 respectively.
b (1) = b (1) - (firstNodeDer * h (2));
b (n - 2) = b (n - 2) - (lastNodeDer * h (n - 2));
b = b'

% Linear system resolution to find the first derivative values z.
z = T \ b;
z = [firstNodeDer; z; lastNodeDer]
z=z'

C = zeros (n - 1, 4);

% a
C (:, 4) = y (1: n - 1);

% b
C (:, 3) = z (1: n - 1);

% d
% Once we know z we can find the divided differences.
C (:,1)=( z(1:n-1) + z(2:n) -2*( y(2:n)-y(1:n-1) )./h(1:n-1) ) ./ (h(1:n-1).^2);

% c
C (:,2)=((y(2:n)-y(1:n-1))./h(1:n-1)-z(1:n-1))./h(1:n-1)-C(:,1)'.*h(1:n-1);
