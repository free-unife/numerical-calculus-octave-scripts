clc
clear all
close all


n=100;
m=100;
% Mod const.
k=9;

x=[round(rand(1,n)*k)]';

% V is an n x m matrix
V=zeros(n,m);

% Matlab notation version.
% 1st col = ones (n,1) or better: xi.^0
%V(:,1)=x(:).^0
%V(:,2)=x(:).^1
%V(:,3)=x(:).^2
tic
V=(x(:).^[0:1:m-1]);
v0=toc;

% for (loop) version.
tic
for i=1:1:n
	for j=1:1:m
		V(i,j)=x(i)^(j-1);
	end;
end;
v1=toc;

% Calculate speed ratio between vector notation and traditional for loops.
% For certain numbers the vector notation converges to the tradional one
% (sometimes it's even worse).
% Numbers like n=100; m=40 (or m=100 eben better); k=90 confirm this.
% Numbers like n=1000; m=400; k=900 confute this.
ratioSpeedPercent=(abs(v0/v1))*100
