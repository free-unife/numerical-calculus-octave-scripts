function [x, y] = oneEllipse (a, b);
% [x, y] = oneEllipse (a, b);
%
% Function that finds x and y coordinates, that, if plotted, generate an 
% ellipse. The parametric formula of an ellipse centered in the origin 
% is used.
%
% I = { arrays a and b }
% P = { a and b are 1xn }
% O = { arrays x and y }
% C = { x and y are 1xn. x = a cos(phi), y = b sin(phi) }

% a and b size check.
[aRows, aCols] = size (a);
if (aRows != 1)
	error ('a must be a line vector.');
end;

[bRows, bCols] = size (b);
if (bRows != 1)
	error ('b must be a line vector.');
end;

% a and b must be of the same size.
if (aCols != bCols)
	error ('a and b must have the same size');
end;

numElts = aCols;

% Linearry spaced vector from 0 to 2 * pi with numElts elements. 
phi = linspace (0, 2 * pi, numElts);

% Parametric formula to find x and y coordinates of the ellipse.
% NOTE: if you use cosh and sinh instead of cos and sin respectively,
% you will get an hyperbolic function.
x = a .* cos (phi);
y = b .* sin (phi);

end;
