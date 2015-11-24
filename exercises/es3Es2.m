clc
clear all
close all

n = (0 : 1 : 20)';
Ivec = zeros(length(n),1);

for i = 0 : length(n)-1
  Ivec(i+1) = ricorrence2(n(i+1));
end;

Ivec

plot(n,Ivec, "");
%semilogy(n,Ivec, "");
