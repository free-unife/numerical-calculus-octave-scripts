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
convSpeed = - log (spectrum);
% Number of oteration to reduce initial error of 1/e (where e is native e 
% variable).
% This number is used to compare different methods.
it_To_Reduce_Init_Err_Of_1_Over_e = 1 / convSpeed;

