clc
clear all
close all

% Draw sin [0,3*pi] with different densities in the interval.


% Get enough points to draw.
% The loop is executed 20 times (100 / 5 = 20).
for i=1:5:100
	% x is an array with lineary spaced elements etween 0 and 3 * pi.
	x = 0:pi / i:3 * pi;
	% Print The number of points.
	numberOfPoints = numel(x)
	% Find the sine of each element of x and save it in the y array.
	y = sin (x);
	% Plot the two arrays.	
	plot (x,y);
	% Wait for user input on the console so that each plotting can be seen.
	pause
end;
