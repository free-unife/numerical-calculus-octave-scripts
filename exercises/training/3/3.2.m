clc
clear all
close all

% Draw f (x) = sin (x), g (x) = sin (5 * x) in the interval [0, 4 * pi].
% Legend, axis labels and different colours are used.

% The loop is executed 20 times (100 / 5 = 20).
for i=1:5:100
	% x is an array with lineary spaced elements etween 0 and 4 * pi.
	x = 0:pi / i:4 * pi;
	% Print The number of points.
	numberOfPoints = numel(x)
	% Find the sine of each element of x and save it in the y array.
	y = sin (x);
	z = sin (5 * x);

	% Plot the two arrays.
	plot (x, y, 'r', x, z, 'b');

	% The following works if you have pstoedit (and xfig??) installed.
	% On Arch Linux those packages are present in the repos. You can do 
	% like this:
	% # pacman -S pstoedit xfig

	% Define the title.
	title ('Plot of sine (x) and sine 5(x) between 0 and 4*pi');

	% Lables definitions.
	xlabel ('x');
	ylabel ('sin (x) and sin (5*x)');

	% Legend.
	legend ('y=sin(x)', 'z=sin(5x)', 'Location', 'southwest');	

	% Wait for user input on the console so that each plotting can be seen.
	pause
end;
