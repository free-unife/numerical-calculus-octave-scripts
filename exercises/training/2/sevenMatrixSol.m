function [retval] = sevenMatrixSol (x);
% [retval] = sevenMatrixSol (x);
%
% Check if the input array x is a solution of the given fixed system.
%
% I = { array x }
% P = { x is a 3x1 array }
% O = { retval }
% C = { retval = 1 if x is the solution of the system, 0 otherwise. }


% x size array check.
[xRows, xCols] = size (x);
if (xRows != 3 || xCols != 1)
	error ('x must be a 3x1 array');
end;

% Matrix A 3x3 of positive integers, array b 3x1 of positivr integers.
A = [ 8 9 2; 9 6 5; 1 0 9 ];
b = [ 19 20 10 ]';

% Steps to obtain the correct x:
% A * x = b -> x = inverse (A) * b -> x = [ 1 1 1 ]';
% Where " ' " character means transposed.
if (A * x == b)
	fprintf ('Input array is the solution of the system.\n');
	retval = 1;
else
	fprintf ('Input array is NOT the solution of the system.\n');
	retval = 0;
end;

end;
