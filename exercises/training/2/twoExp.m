function [y,diffRatio] = twoExp (x, n);
% Get the taylor number succession.
%
% I = { array x, int n }
% P = { x, -Inf <= n <= Inf }
% O = y, diffRatio
% C = y about= exp(x), diffratio = y / exp(x)

% Check if x is a vector and n an integer.
[xRows, xCols] = size (x);
if ((xRows > 1 && xCols != 1) || (xCols > 1 && xRows != 1))
	error ('x is not a vector');
end;
% Get the integer part of n and transform it in a positive number.
n=abs(fix(n));

% It would be interesting to get this with the vectorial notation...
y = zeros (xRows, xCols);
for i=1:1:max (xRows, xCols)
	for k=1:1:n
		y(i) = y (i) + ((x(i) ^ k) / factorial (k));
	end;
end;

% Get the ratio between y and the native function exp (which is better
% than the previous for loops).
diffRatio = y / exp(x);

%y = sum ( (x([1:1:end]).^[1:1:n]) / factorial ([1:1:n]) )

end;
