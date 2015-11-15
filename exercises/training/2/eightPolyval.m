function [eval] = eightPolyval (x0, pC);
% [eval] = eightPolyval (x0, pC);
%
% Polynomial evaluation of pC in x0 using vectorial notation.
%
% I = { int x0, array pC (polynom coefficients) of ints. }
% P = { pC is a 1xn array. }
% O = { eval }
% C = { eval is the evluated polynom pC in the point x0. }


% pC size array check.
[pCRows, pCCols] = size (pC);
if (pCRows != 1 || pCCols == 0)
	error ('pC must be a 1xn array');
end;

% Create an empty array of 1xpCCols.
eval = zeros (1, pCCols);

% Traditional for loop and final sum.
for i=pCCols:-1:1
	eval(i) = pC(i) * (x0 ^ (pCCols - i));
end;

% Sum all the vector elements.
eval = sum(eval);

% Save restult because it will be overwritten
prevEval = eval;

% Vectorial notation.
% We know that in the matrix product, sums must be made after the single 
% products. 
% Since pC is an array and we have to sum:
% pc = 1xn; we need an array of constants that must be nx1 to get an 1x1 
% matrix (i.e. a single number).
% What we do here is pow element by element x0 by an array, lineary spaced by 
% 1, from the last element (pCCols-1) to the first (0). This array represents 
% the degrees. That's why it's shifted by -1. Then we make the transpose of 
% that array (with " ' ") so that it becomes an nx1 array. Finally we multiply 
% the previous result with pC -> 1xn * nx1 = 1x1 It holds!!!
eval = pC * (x0 .^ [(pCCols - 1): -1: 0])';

% Even if the result seems correct the problem is not well posed.
% You can try by putting, f.e. 5 or 6 floating point constants in pC
% and see what happens.
if ((prevEval == eval) && (eval == polyval (pC, x0)))
	fprintf ('Polynomial evaluation is correct.\n');
else
	fprintf ('Polynomial evaluation is NOT correct.\n');
	fprintf ('poly=%g\npolyval=%g\n', eval, polyval (pC, x0));
end;

end;
