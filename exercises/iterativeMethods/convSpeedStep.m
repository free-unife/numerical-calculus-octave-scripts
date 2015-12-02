function [convSpeed, it_To_Reduce_Init_Err_Of_1_Over_e] = convSpeedStep (G)
%
%
% Check if input matrix is converging. If it's not, we can't apply any(?) 
% iterative method.
% Anyway this function is used to compare different iterative methods, i.e. to 
% know which one is faster for a given matrix.


% Matrix spectrum.
spectrum = max (abs (eig (G)));

if spectrum >= 1
        error ('Non converging matrix.');
end;
       
% Convergence speed.
convSpeed = - log10 (spectrum);
% Number of iteration to reduce initial error of 1/10, i.e. to have 1 decimal 
% digit correct. In order to have n decimal digits correct you must multiply 
% this number by n.
% This number is used to compare different methods.
it_To_Reduce_Init_Err_Of_1_Over_e = 1 / convSpeed;
