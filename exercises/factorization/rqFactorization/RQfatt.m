function [R, Q] = RQfatt (A);

[m,n] = size(A);
if m ~= n
	error ('A must be a square matrix.')
end;

Qtransposed = eye(n);

for j = 2 : n
	for i = j - 1 : -1: 1
		G = generatePostGivensMatrix (j, i, A);
		A = A * G;
		Qtransposed = Qtransposed * G;
	end;
end;

Q = Qtransposed'
R = triu(A);

