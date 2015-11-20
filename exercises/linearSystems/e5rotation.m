function [c, s] = e5rotation(x1,x2);

c = x1/sqrt(x1^2+x2^2);
s = x2/sqrt(x1^2+x2^2);

end;