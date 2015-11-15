clc
clear all
close all


% Get the number of points to be plotted. Always get a positive integer value
% greater than 0. 
n = input ('Insert the number of points to be plotted: ');
if (n < 1 && n >= 0)
	n = 1;
end;
n = abs (fix (n));

% Generate two random vectors 1xn big, with numbers between 0 and 9
a = round (rand (1,n)*9);
b = round (rand (1,n)*9);

% Call the function.
[x, y] = oneEllipse (a, b);

% Plot all x and y points with a dot as marker. This avoids the joining of all 
% points which would be a useless mess.
% You should try with values of n >= 10^4 to see a significant result.
plot (x, y ,'.');
