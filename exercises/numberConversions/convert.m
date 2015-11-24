% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.

function [n_b2] = convert (n, b1, b2);
% [n_b2] = convert (n, b1, b2);
%
% Convert the number n (a string) from base b1 to base b2 and save the output
% in n_b2. No codition is given for n, so it's assumed that ti is a real
% number.
%
% I = { n = number to be converted expressed in a string, b1 = input base, b2
% = output base.}
% P = {}
% O = { n_b2 is a string containing the number n converted in the base b2. }
% C = {}

maxBase = 16;
if b1 > maxBase || b2 > maxBase || b1 <= 0 || b2 <= 0
	error ('Base b1 or b2 not valid.');
end;

% Generate b1 and b2 symbol arrays.
b1Sym = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];
b2Sym = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];

%n = str2num(n);

% Check if input number is valid, i.e. if each element of n is in the symbols
% array.
for i = 1 : length (n)
	% Get the elements until b1 - 1.
	if n (i) ~= b1Sym (1 : b1)
		error ('Invalid number.');
	end;
end;

% Output must be a string.
n_b2 = ''

% Isolate the integer part...
% n2Int = ?

% Convert the integer part.
%while  ? ~= 0
%end;

% Convert the fractional part.
%while ? ~= 0
%end;


