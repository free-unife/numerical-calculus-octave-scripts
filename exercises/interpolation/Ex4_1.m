% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


clear all
close all

% Script that plots the value of Chebyshev polynomial up to the tenth degree 
% using the iterative formula.

ang = pi / 4;
degree = 10;
[t] = chebyshevPolyIterative (ang, degree);

plot ([0:degree], t, '*');
