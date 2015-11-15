clc
clear all
close all

% t is an array with lineary spaced elements from 0 to 2*pi.
% Remember the syntax of the command: linspace (START, END, NUM OF ELTS).
t = linspace (0, 2*pi, 150);

% Find sin and cos of t, element by element.
y = sin (t);
z = cos (t);

% x and y axis have the same scale.
axis ("equal");

% A goniometric circumference is plotted.
plot (y, z);

% Generic vector 1x2.
v = round (rand (1, 2) * 10);

% By definition a normalized vector v is obtained by:
% unit vector v = v / ||v||
% where ||v|| is the norm 2 of that vector, i.e. its length.
v = v / norm (v, 2);

phi = input ('Insert an angle phi in degrees: ');
% Convert the angle from degrees to radians because sin, cos and other native
% functions work with radians. A whole circumference is 6.28 (2 * pi) radians 
% long, which means that 6.28 cirumference rays can lie on the cirumference.
phi = phi * (pi / 180);

% Counter-clockwise rotation matrix. (See computer graphics).
% https://en.wikipedia.org/wiki/Transformation_matrix#Rotation
O = [ cos(phi), - sin(phi); sin(phi), cos(phi) ];

% Rotate v.
w = O * v';

% Plot a single line where the first index is x and the second is y (for both 
% vectors).
line (v, w);
