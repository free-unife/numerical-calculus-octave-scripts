clc
clear all
close all


% Given a polynom p and a constant x0, evaluate p in x0 using polyval.
p = [ 1 4 -6 12 -5 ];
x0 = 5;

polyval (p, x0)

% Evaluate p between -1 and 1.
polyval (p, [-1:1:1])
