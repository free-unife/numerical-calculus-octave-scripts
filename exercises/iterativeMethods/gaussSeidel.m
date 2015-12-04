function [x, iterations] = gaussSeidel (A, b, precision)
% [x, iterations] = gaussSeidel (A, b, precision)
%
% Apply Gauss Siedel's method to find the solutions of a linear system.
% 
% I = { }
% P = { }
% O = { }
% C = { }


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
% Check if matrix is converging and find other iteresting facts.
[trash, trash, iteration] = convSpeedStep (G);
maxIterations = abs (round (iteration) * precision);

iterativeLoop

iterations = i;
