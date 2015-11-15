function [vNormEuc, vNorm1, vNormInf, vNorm2, vNormP] = oneNorm (v, p)
% [vNormEuc, vNorm1, vNormInf, vNorm2, vNormP] = oneNorm (v, p)
%
% Find all the different kind of norms of an input array v.
%
% I = { array v, int p }
% P = { v is a 1x10 array, p is a positive integer > 0 }
% O = { norms { Euclid's, 1, 2, Inf, p} }
% C = { Euclid's norm is the same as norm 2 = sqrt (sum (x (i) .^ 2)) 
% TODO BETTER. }
%
% I handle this as a function so that any array can be checked.


% v is 1 x 10.
[vRows, vCols] = size (v);
if (vRows != 1 || vCols != 10)
	error ('v must be 1x10.');
end;

% Euclid's norm using vector notation.
vNormEuc = sqrt (sum (v .^ 2));

vNorm1 = sum (v);

vNormInf = norm (v, Inf);

vNorm2 = norm (v, 2);
% Check norm 2.
if (vNormEuc == vNorm2)
	fprintf ('Euclid s norm and norm 2 are equal.\n');
else
	fprintf ('Euclid s norm and norm 2 are NOT equal.\n');
end;

vNormP = (sum (v .^ p)) ^ (1 / p);
vNativeNormP = norm (v, p)
% Check norm p.
if (vNormP == vNativeNormP)
	fprintf ('norm p and native norm p are equal.\n');
else
	fprintf ('norm p (%g) and native norm p (%g) are NOT equal.\n', 
vNormP, vNativeNormP);
end;


end;
