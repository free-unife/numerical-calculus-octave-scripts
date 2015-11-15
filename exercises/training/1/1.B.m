clc
clear all
close all

% Mod number.
k=16;

n = 20;
x = linspace (0, n, 2*pi);

y = sin (x);
z = cos (x);

fprintf ('x\ty\tz\n');
fprintf ('==================\n');
for i=1:1:max(size(x))
	fprintf ('%g\t%g\t%g\n',x(i), y(i), z(i)); 
end;

