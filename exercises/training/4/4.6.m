clc
clear all
close all


p = [ (1/5) 0 -1 0.2 (1/2) 1 ];

% Draw all the points on the same graph.
hold on

axis ("equal");

for i=1:1:100
	x0 = i;

	poly = polyval (p, x0);

	plot (poly, 'b');
end;

x0 = 0.42;
polyFixed = polyval (p, x0);
plot (polyFixed, 'r');

% Draw line axis
x = [ 0 2e+08 ];
y = [ 0 0 ];
line (x, y);
x = [ 0 0 ];
y = [ 0 2e+09 ];
line (x, y);

% Define the title.
title ('Plot of the polynom point evaluated in 101 points.');

% Lables definitions.
xlabel ('x0');
ylabel ('polyval(p, x0)');

% Legend.
legend ('Blue points are x0=[1, 100]', 'Red point is x0=0.42', 'Location', 'southwest');

% Disable drawings on the same graph.
hold off
