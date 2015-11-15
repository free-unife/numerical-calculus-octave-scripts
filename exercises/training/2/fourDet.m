function [deter] = fourDet (A);
% Find the determinant of a 2x2 matrix.
%
% I = { matrix A }
% P = { A belongs to R, A is 2x2 }
% O = { deter }
% C = { deter belongs to Z }

% Check if A is a valid matrix (2x2).
[xRows, xCols] = size (A);
if (xRows != 2 || xCols != 2)
	error ('A is not a valid matrix.');
end;

% Find the determinant manually, as you would do on paper.
deter = (A(1,1) * A(2,2)) - (A(1,2) * A(2,1));

% The manual says that det (A)...
% "Return an estimate of the reciprocal condition number if requested."
% That's why deter-det(A) is not always == 0.
if (deter == det (A))
	fprintf ('Determinant is correct.\n');
else
	fprintf ('Determinant is NOT correct.\n');
	fprintf ('Difference (deter - det(A)) is: %g\n', deter-det(A));
end;

end;
