clc
clear all
close all

A=[1 2 3; 4 5 6];
B=[2 2 1; 1 0 3];
x=[1 2 3];
y=[4 5 6];

% Usual.
C = A.*B

% z is the first row of A times y. It's an array.
z = A(1,:).*y

% Get second column of b.
% Divide x, el by el, by the previous values and by 3.
z=x ./ [B(:,2);3]

% The following is the same as doing z = y./x.
% I don't know why someone has introduced the escape operator to do such
% a thing... Mumble mumble.
z = x.\y

% Get the second row of A. (R1)
% Get the first row of B and start scanning them from the end. (R2)
% pow(R1,R2).
z=A(2,:).^B(1,3:-1:1)
