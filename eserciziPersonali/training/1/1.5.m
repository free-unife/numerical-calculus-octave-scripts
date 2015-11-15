clc
clear all
close all

A=[1:1:5; 6:1:10; 11:1:15; 16:1:20; 21:1:25]

v=A(2,:); % Get second row.
w=A(:,3); % Get third col.

B=A(2:1:end-1,2:1:end-1) % Get a sub-matrix of a starting from A(2,2).

C=zeros(7); % 7 x 7 matrix where 0 is in the first and last col; 1 first and 
% last row; matrix A is in the middle.
C(:,2:1:end-1)=1;
C(2:1:end-1,2:1:end-1)=A;

%D=zeros(3)
%D(1:1:end,1:1:end)=D(1:1:end)*D(1:1:end)
%D(1,1)=1*1
%D(1,2)=1*2
%D(1,3)=1*3
%D(2,1)=2*1
%D(2,2)=2*2
%D(2,3)=2*3
%D(3,1)=3*1
%D(3,2)=3*2
%D(3,3)=3*3

D=zeros(3)

% HOW DO I DO THE FOLLOWING WITH A ONE LINER?
for i=1:1:3
	for j=1:1:3
		D(i,j)=i*j;
	end;
end;
D

%D(1:1:3)=[1:1:3].*[1:1:3]
%D=diag(D(1:1:3))

B*D
D*B
B.*D

E=B*(D^2)-3*(B*D)-7*(D^2)

w1=w(1:1:3);
D*w1

v1=v(1:1:3);
v1*D

%    |	Ir	B	0r   |
% M= |	B	D	-B   |
%    |	0r	-B	-Ir  |
r=3

M=[ eye(r) B zeros(r,r); B D -B; zeros(r,r) -B -eye(r) ]
