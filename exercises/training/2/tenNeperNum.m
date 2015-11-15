function [neper] = tenNeperNum (n);
% [neper] = tenNeperNum (n);
%
% Get the neper number and compare it with the machine neper number.
%
% I = { n }
% P = { n belongs to N. }
% O = { neper }
% C = { neper beloings to R and it's an approximation of the number e. }

neper = (1 + (1 / n)) ^ n;

fprintf ('neper - e = %.16g\n', neper - e);

end;
