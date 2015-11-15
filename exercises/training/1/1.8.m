clc
clear all
close all


A=[2 2 1; 1 -1 4; 2 1 -3]

% Return the size of A's submatrix which ARE be p=2 amd q=2.
[p,q]=size(A(1:2,1:2))

% Divide A by A' element per element. This introduces errors!!!
A./A'

% The first row of A is set to the second times the third el. per el,.
A(1,:)=A(2,:).*A(3,:)

% The second row is set to the first transposed col (which now is a row).
A(2,:)=A(:,1)'

% pow(3) of the second col. Having all 1s the second col doesn't change
% so A remains the same.
A(:,2)=A(:,2).^3
