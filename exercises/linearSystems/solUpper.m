% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [x] = solUpper (R, b);
% [x] = solUpper (R, b);
%
% Solve an upper triangular matrix system, Rx = b using the backwards
% substitution algorithm.
%
% Complexity is O (n^2 / 2) i.e. O (n^2). We have infact n-1 main iterations,
% and n-1 sums (and products) on the WORST (last) case. On the best (first)
% case we have one product only. As you can see this is progressive.
% The n-1 sums (and products) find one x only. To get all the x we must repeat
% those sums (and products) n-1 times.
% The b(i) subtraction, as well as the quotient, is only done n-1 times in
% total so it is not relevant in the complexity count.
%
% I = { Upper triangular matrix R nxn, array b nx1. }
% P = { R is a coefficient matrix, b is an array of known terms. }
% O = { array x nx1. }
% C = { Rx = b -> x = R^-1 * b }


% x must have the same structure of b.
x = b;
n = length (x);

% Find the last element on the diagonal which is calculated like the
% one in solDiag.m.
x (n) = b (n) / R (n, n);

% Backwards substitution algorithm.
% Start by finding x(n-1) and go backwards by subsituting previously found x by
% rows. The product involves a sum from the current index i, to the last index
% n. This is achieved with the vectorial notation.
% This method is called SDOT.
for i = n - 1 : -1 : 1
	x (i) = (b (i) - R (i, i + 1 : n) * x (i + 1 : n)) / R (i, i);
end;
