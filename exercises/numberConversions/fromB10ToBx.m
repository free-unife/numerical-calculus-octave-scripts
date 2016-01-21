% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


% 2015-10-06

clc
clear all
close all

% Integer conversion from a number in base 10 to a number in a base between 2 
% and 16.


% Maximum base possible is 16.
%	index
%       1    2   ...
cifre=['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];

% Get input where n is the positive integer to be converted and b is the base.
n=input('Input a positive integer= ');
% Test if input is an integer.
while fix(n) ~= n || n <= 0
	n=input('Input a positive integer= ');
end

% Get base.
b=input('Input a base between 2 and 16= ');
while fix(b) ~= b || b < 2 || b > 16
	b=input('Input a base between 2 and 16= ');
end

% algorithm implementation of fwd divs.
d=n;
st=''; % output string
while d ~= 0
	q=fix(d/b); % remaining number.
	r=d-q*b; % r=rem(d,b); it's like mod.
	st=[cifre(r+1),st]; % since array are indexed from 1 to n to get the 
% correct value we must get the r+1 element. Another function that can be used 
% here is st=cat(2,cifre(r+1),st) where 2 represents the rows (while 1 cols).
	d=q;
end

fprintf ('Converted number= %s\n', st)

% dec2base(smt,smtelse); to convert to smtelse base


% esercizio teorico
% conversione num da bin a dec a manazza (con le potenze di 2).


% conversione da IEEE 754 a dec di
% 1 11101100 00110011000001000000000
% - 4+8+32+64+128 
% - (236)-127 1+2^-3+2^-4+....
