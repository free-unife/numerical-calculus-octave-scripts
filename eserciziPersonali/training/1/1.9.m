clc
clear all
close all

min=50;
max=1000;

% 50 < n < 1000
n=min+round(rand(1)*(max-min));

A=round(rand(n,n)*9);
B=round(rand(n,n)*9);
v=(round(rand(1,n)*9))';


tic
(A*B)*v;
v0=toc;

tic
A*(B*v);
v1=toc;

% v1 is faster than v0 by about 1/3.
speedRationPercent=(abs(v0/v1))*100
v0
v1
