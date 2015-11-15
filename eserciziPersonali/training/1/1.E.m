clc
clear all
close all

nMin = 2;
nMax = 10;

% n defines the size of the square matrix.
% nMin < n < nMax
n = (nMin + 1) + fix (rand (1) * (nMax - nMin - 1))

aMin = -10
aMax = 10

% -10 <= aij <= 10
A = aMin + fix (rand (n) * aMax * 2)

d = diag (A)

B = triu (A)

B - diag(A)

% C is a symmetric matrix...
C = B + B'

% ...so we can check if it's positive definite.
% We can define any array v except the zero vector) to do that.
% However the propriety is valid only for every possible vectory in that space.
% The best (?) test to use is using the Cholesky function.
% If it returns zero then it's positive definite; else it's not.
v = round (rand (max (size (C), 1)) * aMax)

if ((v' * C * v) > 0 || all (eig (C) > 0) || ([~,p] = chol (C)) == 0)
	fprintf('Matrix C is positive definite.\n');
else
	fprintf('Matrix C is NOT positive definite.\n');
end;

% D = (n+2)x3
D = zeros (n+2, n);

% A's submatrix 3x3...
%
%     | a11	a12	a13 |
% D = | a21	a22	s23 |
%     | a31	a32	a33 |
%     | a21	a22	a23 |
%     | a31	a32	a33 |
 
% Remember that n is the size of A.
D ([1:1:n], [1:1:3]) = A (:, [1:1:3]);
D ([end-1:1:end], :) = A ([end-1:1:end],:);

E = D' * D

% E is a symmetric matrix infact...
if (issymmetric (E) == 1)
	fprintf('Matrix E is symmetric.\n');
end;

v = round (rand (max (size (E), 1)) * aMax)

if ((v' * E * v) > 0 || all (eig (E) > 0) || ([~,p] = chol (E)) == 0)
	fprintf('Matrix E is positive definite.\n');
else
	fprintf('Matrix E is NOT positive definite.\n');
end;
