clc
clear all
close all

% Distribuzione uniforme in [0,1].
v=[0:(1/24):1]';
w=[0:(1/24):1]';

t=((v'*w)'*v)+((v'*w)'*w); % Prodotti scalari fra vettori con somma finale.

s=[1:1:25]';
p=t./s;

A=zeros(3,25);
% Not sure about the distribution of numbers.
A=[0:1/75:24/75; 25/75:1/75:49/75; 50/75:1/75:74/75]

q=A*p;

I=eye(3);
e1=I(1:1:3)';
e2=I(4:1:6)';
e3=I(7:1:9)';

a1=q'*e1;
a2=q'*e2;
a3=q'*e3;

a=[a1,a2,a3]';

% Even elements of t times 10 and without fractional part.
b=fix((t(2:2:end))*10);

c=[1,2,3]';
D=c*(b');

% Matrix B is built using cols of array q.
B=q'

% b is 1x3 while A is 3x25 so only B*A is possible.
%A*B
B*A
