% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


% 2015-10-06

clc
clear all
close all


% Floating point conversion of a number between 0 and 1 from base 10 to a base 
% between 2 and 16.


% Maximum base possible is 16.
%	index
%       1    2   ...
cifre = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];

% Get input where n is the positive integer to be converted and b is the base.
n=input ('Input a positive real lt 1= ');
% Test if input is an integer.
while n <= 0 || n >= 1
	n=input('Input a positive real lt 1= ');
end

% Get base.
b=input ('Input a base between 2 and 16= ');
while fix (b) ~= b || b < 2 || b > 16
	b=input('Input a base between 2 and 16= ');
end

% get number of digits.
k=input ('Input number of digits= ');
while fix (k) ~= k || k <= 0
	k=input('Input number of digits= ');
end


% algorithm implementation of fwd mults.
p=n;
st='0.'; % output string
cont=0;
while p ~= 0 && cont < k
	q=p*b;
	r=fix(q); % integer part.
	st=[st, cifre(r+1)]; % or st=cat(2,st,cifre(r+1));
	p=q-r; % fractional part.
	cont=cont+1;	
end

fprintf ('Converted number= %s\n', st);
