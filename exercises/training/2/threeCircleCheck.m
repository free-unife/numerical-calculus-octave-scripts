function [retval] = threeCircleCheck (x, R);
% Check if a point x lies outside or inside a circumference of ray R.
%
% I = { array x, int R }
% P = { x belongs to R_2, R >= 0 }
% O = retval
% C = retval = 0 if outside; = 1 if inside 

% Check if x is a valid vector and n an integer.
[xRows, xCols] = size (x);
if (xRows != 1 || xCols != 2)
	error ('x is not a valid vector.');
end;

% Get the integer part of R and transform it in a positive number.
r=abs(fix(R));

if (sqrt (x(1)^2 + x(2)^2) > R)
	fprintf ('Point is outside.\n');
	retval=0;
else
	fprintf ('Point is inside.\n');
	retval=1;
end;


end;
