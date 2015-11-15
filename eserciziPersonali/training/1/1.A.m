clc
clear all
close all

% Mod number.
k=16;

n = input ('Select square matrix size: ');
A = round(rand(n,n)*k)

v=A(:)

V=v.^2

% Changes array V into an nxn matrix B (going through cols).
B=reshape(V,n,n)

if(B==A.^2)
	printf('B is equal to A.^2');
end;

