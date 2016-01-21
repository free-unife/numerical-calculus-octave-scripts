% Copyright © 2016 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


function [r, q] = ruffiniHorner (p, a);
% [r, q] = ruffiniHorner (p, a);
%
% Ruffini horner scheme.
%
% I = { p is an array containing the coeff. of the input polynomial (greater to 
% lower), a is the evaluation parameter. }
% P = {}
% O = { r is the value of the polynomial in a, q is an array containing the 
% coefficients of the divided polynomial. }
% C = {}


q(1)=p(1);
% Get the degree of the polynomial.
n=length(p)-1;

for i=2:1:n+1
	q(i)=q(i-1)*a+p(i);
end;

r=q(n+1);

% Return the polynomial coefficients.
q=q(1:n); % polynomial without the LSDegree.

end

%>> p=[3 2 0 1 -1]
%p =

%   3   2   0   1  -1
   
%>> x=2
%   x =  2
%>> [ris,w]=ruffiniHorner(p,x)
%   ris =  65
%   w =
   
%       3    8   16   33

% (x-2)(3x^3+8x^2+16x+33)+65      
