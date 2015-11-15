function [A] = sixVectorCompos (v, w, t);
% [A] = sixVectorCompos (v, w, t);
% 
% Create a matrix a with v on the main diagonal, w on the upper one and t on 
% the lower one.
%
% I = { vectors v, w, t }
% P = { v, w, t belong to R; v is 1xn, w is 1x(n-1), t is 1x(n-1) }
% O = { A = zeros (size (v)), matrix diag(A) = v,  diag(A,1) = w, \
% diag (A,-1)  = % t}
% C = { A is an nxn matrix where n is given b the cols of v (the biggest \
% input vector). }


% Arrays check.
[vRows, vCols] = size (v);
if (vRows != 1)
	error ('v is not a valid vector.');
end;

[wRows, wCols] = size (w);
if (wRows != 1 || wCols != vCols-1)
	error ('w is not a valid vector.');
end;

[tRows, tCols] = size (t);
if (tRows != 1 || tCols != vCols-1)
	error ('t is not a valid vector.');
end;

% How big is A???
% It should be nxn, infact, In the 3x3 case:
%	| v1	w1	0   |
% A =	| t2	v2	w2  |
%	| 0	t2	v3  |

% For this reason we set A to be an nxn matrix.
% n should be the equal to the number of cols of the first vector.
n = vCols;
A = zeros(n)

% Main diagonal.
A(1:max (size (A)) + 1:end) = v

% Upper diagonal.
A(max (size (A)) + 1:max (size (A)) + 1:end) = w

% Lower diagonal.
A(2:max (size (A)) + 1:end) = t

end;
