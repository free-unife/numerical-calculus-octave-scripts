clc
clear all
close all


% Given a polynom p and a constant x0, evaluate p in x0 using polyval.
p = [ 1 -4 4 ];
q = [ 1 -3 ];

% b contains the coeff. of the polynomial quotient.
% r is the reminder polynomial of lowest order.
[b, r] = deconv (p, q)
