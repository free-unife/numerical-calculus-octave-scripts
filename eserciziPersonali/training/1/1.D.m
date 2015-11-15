clc
clear all
close all


xs = ones(10,1)

% randn "returns an n-by-n matrix of normally distributed random numbers"
% having zero mean (zero is the center of the distribution, i.e. the 
% convergence number) and variance one (i.e. sigma=1).
y = 2*randn(10,1)

% Get the absolute value of the difference of input numbers.
abs(xs-y)

% Get the quotient of the norm 2 of the input values.
norm(xs-y)/norm(xs)

% Divide the two inputs (after geting their absolute values) element by 
% element.
abs(xs-y)./abs(xs)
