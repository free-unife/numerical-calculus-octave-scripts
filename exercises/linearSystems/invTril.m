function [L] = invTril (L);
% [invL] = invTril (L); % Non-compact version.
% [L] = invTril (L); % Compace version.
%
% Get the inverse of matrix L (only lower triangular) using a compact form (or 
% not). Modify the code to your needs.
% The function is heavily commented given its impotance and not intuitiveness 
% (IMOO).
%
% What I've understood from all the following is that if we need to find a
% certain element, lets say x in line a and col b, we need to go through all 
% the elements of col b (up to line a included), included the diagonal element
% and all the elemnts of line a, excluded the diagonal. If this isn't 
% clear: we need the upper and right elements of x not the left and lower.
% Run the following commands as an example:
% L = [ 2 0 0 0; 3 4 0 0; 6 1 5 0; 7 7 8 4]
% invL = inverse (L)
% L * invL
%
% Now we know that L * invL (inverse matrix) = I (identity matrix).
% This is an important fact, infact we can found a formula valid for triangular 
% lower matrices (but the upper have a very similar one). Try multiplying on 
% paper L by invL, step by step.
% For example to find I (3, 1):
% (6 * 0.5) + (1 * (-0.375)) + (5 * (-0.525)) + (0 * (0.83125)) = 0
% Infact I (3,1) = 0
%
% We can now find the indices:
% I will now indicate invL as L^
% L (3,1) * L^ (1,1) + L (3,2) * L^ (2,1) + L (3,3) * L^ (3,1) + L (3,4) *
%      ~        -           ~        -           ~        -           ~
% * L^ (4,1)
%       -
%
% The underlined numbers represents our sum index. We note however that the 
% last multiplication gives zero so our index could ignore that last element.
%
% If we ignore to have L^ (3,1) we should obtain it using the upper formula:
% L^ (3,1) = -(L (3,1) * L^ (1,1) + L (3,2) * L^ (2,1) + L (3,4) * L^ (4,1))/L (3,3)
%
% We can generalize even more:
% if L (3,1) is our L (i,j) and the underlined elements are k (=j), a 
% progressive index, then:
% L^ (i,j) = -(L (i,k) * L^ (k,j) + L (i,k+1) * L^ (k+1,j)) / L (i,i)
%
% We notice that max (k) is i-1 (if we ignore the last element).
% Another thing is that we have to avoid all the calculations involving 
% multiplications by zero. For this reason max (j) = i - 1 (i.e. Don't reach 
% the diagonal horizontally.
%
% After all this we are ready to build our algorithm.
%
%
% NOTE ABOUT THE COMPUTATIONAL COMPLEXITY:
%
% We have 3 loops:
%
% i index: 2 -> n so O(n)
% j index: 1 -> i-1 so O(n)
% k index: j -> i-1 so O(n)
%
% These loops are nested so it's roughly O(n^3).
% More precisely is O(n^3 / 6) (see the sum of the squares of the first n 
% numbers).
%
%
% I = { matrix L. }
% P = { L is an nxn matrix, lower triangular and not singular (inverse (L) 
% exists. }
% O = { matrix invL || L. }
% C = { invL || L is an nxn matrix: invL || L = inverse (L). }


% Check if L is not nxn.
[LRows, LCols] = size (L);
if (LRows != LCols)
	error ('L is not a nxn matrix.');
end;

% Check if it's not triangular
if (L != tril (L))
	error ('L is not a triangular lower matrix.');
end;

% Check if L is singular. If a matrix is singular, its determinant is zero.
% Given that L is a triangular matrix, the determinant is equal to the product 
% of the diagonal elements. For this reason there are at least three ways to 
% find if L is singular or not:
% if (det (L) == 0) % Octave native.
% if (prod (diag (L) == 0)
% The following is the suggested way (possibly the least resource consuming).
if ((isempty (find (diag (L)))) == 1)
	error ('L is singular, i.e. not invertible.');
end;

% Save the original L.
LOrig = L;

n = LRows;

%
% COMPACT VERSION.
%

% The input value of an octave function is a copy of the original one so all 
% the calculations can be done in place without modifying the original matrix.

% The diagonal elements are the inverse (1 / l (i,i)) of the original matrix.
% We could place this in the following loop, remembering that we have to 
% calculate L^ (1,1) before it. I have placed this here because it's simpler to 
% understand.
for i=1:1:n
	L (i, i) = 1 / L (i, i);
end;

% Having calculated the diagonal elements we have to start from the second 
% line, i.e: i=2.
for i=2:1:n
	% Start from the first column, i.e: j=1.
	for j=1:1:i-1
%		s = 0;
%		for k=j:1:i-1
%			i
%			j
%			k
%			fprintf ('\n');
%			L (i, k)
%			L (k,j)
%			fprintf ('\n');
			% Warning this compact version is very tricky (much 
			% more than the non-compact one) because it uses the 
			% previously calculated values on the same matrix. 
			% Doing this on paper is difficult because you should 
			% keep track of every change (i.e. every new value 
			% found must be written on the same matrix.
%			s = s + (L (i, k) * L (k, j));
%			fprintf ('\n');
%		end;
		% Here there is a multiplication instead of a quotient because 
		% L (i, i) has already been calculated in place (i.e. 
		% L (i, i) = 1 / L (i,i).
%		L (i, j) = -s * L (i,i);
		%
		% HYPER COMPACT, USING VECTOR NOTATION.
		%
		% To use it, comment all the last loop (the one with k) and the 
		% last instruction.
		% The same information of the for loop with k is used here.
		% This becomes a product of submatrices, which involves sums.
		L (i, j) = - (L (i, j:i-1) * L (j:i-1, j)) * L (i,i);
	end;
end;


% If residue is zero it means that the inverse matrix is correct.
% The infinite norm infact is the maximum of the sums row by row of a matrix.
% If we do L * L^ we expect to get an identity matrix. So if we subtract that 
% to a new identity matrix of the same size we should get a matrix of all 
% zeros.
% You can call the function with the following to see interesting results:
% [invL] = invTril (tril (1 + round (rand (100) * 9)))
residue = norm ((LOrig * L) - eye(n), Inf)

end;



%
% THE FOLLOWING IS THE NON-COMPACT VERSION (I.E. A NEW MATRIX, THE INVERSE 
% MATRIX IS CREATED, INSTEAD OF SAVINING THE ELEMENTS DIRECTLY IN THE ORIGINAL 
% ONE.
%

% Create an empty nxn matrix which will contain the inverse matrix.
%invL = zeros (n);

% The diagonal elements are the inverse (1 / l (i,i)) of the original matrix.
%for i=1:1:n
%	invL (i, i) = 1 / L (i, i);
%end;

% Having calculated the diagonal elements we have to start from the second 
% line, i.e: i=2.
%for i=2:1:n
	% Start from the first column, i.e: j=1.
%	for j=1:1:i-1
%		s = 0;
		% Putting the max on i or i-1 is the same because
		% L (i,i) * invL (i, j) = 0 (because invL (i,j) is up the 
		% diagonal (i.e. 0)).
%		for k=j:1:i-1
%			i
%			j
%			k
%			fprintf ('\n');
%			L (i, k)
%			invL (k,j)
%			fprintf ('\n');
%			fprintf ('================\n');
%			s = s + (L (i, k) * invL (k, j));
%		end;
%		invL (i, j) = -s / L (i,i);

% The following is quasi-working but it misses lots of sums (it works sometimes 
% with 3x3 matrices).
% invL (i, j) = - ( sum (L (i, j) * invL (j, j)) / L (i, i))
%	end;
%end;

