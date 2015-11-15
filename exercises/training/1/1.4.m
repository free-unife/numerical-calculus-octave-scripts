clc
clear all
close all

A=[1 2 3; 4 5 6; 7 8 9];
B=[2 -1 0; -1 2 -1; 0 -1 2]

% Work only with cols: put col B1 into A1 and B2 into A3.
A(:, [1,3])=B(:, 1:2);

% Divide A per B element by element.
C=A./B;

% Pow.
C=A.^B;

% triu = triangular upper, tril = tri.. lower. -1 is lower without diagonal.
% C=upper A && lower B
C=triu(A)+tril(B,-1);

% Rows 1 and 2 of A set to NULL (i.e. deleted).
A([1:2], :)=[];

% Select rows 3 then 2 AND cols 1 then 3 (order is very important).
D=B([3,2],1:2:3)
