% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


clear all
close all

% Script that shows how bad is Runge phenomenon at the bounds of a chosen
% interval for a famous function. The higher the degree, the worse Newton's
% polynomial is (red polynomial). A solution to this problem is using piecewise
% interpolation: lots of Newton's polynomials are used, but each one in a
% different subdomain of the original one. The result is sticked together and
% finally plotted (green polynomial). As you can see piecewise interpolaton is
% much better of the traditional one in these particular cases (comparison made
% with the blue line, i.e. the exact function).


% Preliminary stuff.
pkg load all
figure

% You can change the following variables and see what happens.
degreeOfSubpolys = 3;
numberOfPoints = 7;
evalPointsStep = 0.01;

% Function definition. As you can notice, to have significant result input
% data, like function domain, x and y must remain the same in all three cases.
x = linspace (-1, 1, numberOfPoints);
%y = sin (pi * x);
y = 1 ./ (1 + (25 .* (x.^2)));


% Piecewise interpolation.
[p, evalPoints] = piecewiseInterp (x, y, degreeOfSubpolys, evalPointsStep);

% Traditional Newton polynomial.
evalPointsS = [-1 : evalPointsStep : 1];
[pS] = newtonPolySimpler (x, y, evalPointsS);

% Correct function.
syms xx
%fun = sin (pi * xx);
fun = 1 / (1 + (25 * (xx^2)));


% Plotting part.
hold on
% Plot the exact function.
ezplot (fun, [-1 1]);
% Plot the traditional Newton polynomial.
plot (evalPointsS, pS, 'r');
% Plot the piecewise function. The missing parts are automatically filled.
plot (evalPoints, p, 'g');
hold off




% The following are steps used to arrive at the above solution (i.e:
% piecewiseInterp function)

% Newton polynomial is used.
%evalPoints1 = [x(1) : 0.01 : x(3)];
%[p1] = newtonPolySimpler (x (1:3), y (1:3), evalPoints1);

%evalPoints2 = [x(3) : 0.01 : x(5)];
%[p2] = newtonPolySimpler (x (3:5), y (3:5), evalPoints2);

%evalPoints3 = [x(5) : 0.01 : x(7)];
%[p3] = newtonPolySimpler (x (5:7), y (5:7), evalPoints3);

%hold on

%syms xx
%fun = sin (pi * xx);
%ezplot (fun, [0 1]);

%plot (evalPoints1, p1, 'g');
%plot (evalPoints2, p2, 'g');
%plot (evalPoints3, p3, 'g');
% Joining the three lines.
%plot ([evalPoints1(end), evalPoints2(1)], [p1(end), p2(1)], 'g');
%plot ([evalPoints2(end), evalPoints3(1)], [p2(end), p3(1)], 'g');

%plot (evalPoints, p, 'r');

%hold off
