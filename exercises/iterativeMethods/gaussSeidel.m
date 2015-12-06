% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [x, iterations] = gaussSeidel (A, b, precision)
% [x, iterations] = gaussSeidel (A, b, precision)
%
% Apply Gauss Siedel's method to find the solutions of a linear system.
%
% I = { Coefficient matrix A, known terms b, precision is the number of wanted
% decimal digits of x not affected by error. }
% P = { A is a square matrix nxn, b is an nx1 array. }
% O = { array of the solutions x, number of iterations iterations needed to
% solve the linear system. }
% C = { A * x = b. }


[rows, cols] = size (A);

% Define our x array.
x = zeros (rows, 1);

% Find some components.
L = tril (A);
U = - triu (A, 1);
invL = invTril (L);

% Find Gauss Siedel matrix.
Gs = invL * U;
c = invL * b;

% Find G in a different way by avoiding useless operation (multiplications and
% sums by zero).
%Gs = zeros (rows);
%for i=1:rows
%	for j=1:rows
%		if (i>=j)
%			Gs (i,j) = Gs (i, j) + (invL(i,1:i) * U(1:i,j));
%		else
%			Gs (i,j) = Gs (i, j) + (invL(i,1:i) * U(1:i,j));
%		end
%	end
%end

G = Gs;
getMaxIterations
iterativeLoop

iterations = i;
