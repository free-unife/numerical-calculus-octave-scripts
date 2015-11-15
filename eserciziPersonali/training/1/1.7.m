clc
clear all
close all


z=[10 40 20 80 30 70 60 90]
% Put 0s in the odd (dispari) cols.
z(1:2:7)=zeros(1,4)

z=[10 40 20 80 30 70 60 90]
% Same result as before except that it's done from the opposite side.
z(7:-2:1)=zeros(1,4)

z=[10 40 20 80 30 70 60 90]
% Index 3 4 8 1 of z are set to 0.
z([3 4 8 1])=zeros(1,4)
