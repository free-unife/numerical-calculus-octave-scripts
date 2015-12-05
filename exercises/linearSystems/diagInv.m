% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [invD] = diagInv (D);
% [invD] = diagInv (D);
%
% Find the inverse invD of a diagonal square matrix D.
%
% I = { Square diagonal matrix D. }
% P = { D must be a diagonal matrix. If it's not no error is returned. }
% O = { invD }
% C = { invD = inv(D) }


[rows, cols] = size (D);

if rows ~= cols
	error ('Matrix D is not squared.');
end;

for i = 1 : rows
	if D (i, i) == 0
		error ('Division by zero.')
	end;
	invD (i, i) = 1 / D (i, i);
end;
