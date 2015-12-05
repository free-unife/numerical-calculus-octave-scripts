% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
%                  Danny Lessio
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [spectrum, convSpeed, numIterations] = convSpeedStep (G)
% [spectrum, convSpeed, numIterations] = convSpeedStep (G)
%
% Check if input matrix is converging. If it's not, we can't apply any
% iterative method.
% Anyway this function is used to compare different iterative methods, i.e. to
% know which one is faster for a given matrix.
%
% I = { Iteration matrix G. }
% P = { usually G = I - (M^-1 * A) where M is a (strong) non singular matrix
% with the same size as A. Infact A = M - N. }
% O = { matrix spectrum spectrum, convergence speed convSpeed, numIterations
% represents the number of iterations to reduce the error of 1/10 i.e. one
% decimal digit.}
% C = { spectrum < 1 || function returns error. }


% Matrix spectrum (i.e. maximum of all the eigenvalues).
spectrum = max (abs (eig (G)));

% We are sure that if the matrix has spectrum >= 1, it will never converge
if spectrum >= 1
        error ('Non converging matrix.');
end;

% Convergence speed.
convSpeed = - log10 (spectrum);
% Number of iteration to reduce initial error of 1/10, i.e. to have 1 decimal
% digit correct. In order to have n decimal digits correct you must multiply
% this number by n.
% This number is used to compare different methods.
numIterations = 1 / convSpeed;
