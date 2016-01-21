% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


% 2015-10-06

clc
clear all
close all

% Conversion of positive integers from base b to base 10.


% Maximum base possible is 16.
%	index
%       1    2   ...
cifre=['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];

% Get base.
b=input('Input a base between 2 and 16= ');
while b <= 1 || b > 16 || fix(b) ~= b
	b=input('Input a base between 2 and 16= ');
end

% Get input number.
n=input('Input a string corresponding to the number= ','s');
m=length(n);

% Check if input string is valid.
for i=1:m
	ij=find(n(i) == cifre(1:b)); % Get indices of digits of the current 
% digit.
	if isempty(ij)
		error('Invalid string.');
	else
		p(i)=ij(1)-1;
	end
end

%[alpha,q]=ruffiniHorner(p,b); % The same as polyval except that q is also 
[alpha]=horner(p,b); % The same as polyval except that q is also 
% returned. See also deconv and conv.

fprintf ('Converted= %g\n', alpha);
