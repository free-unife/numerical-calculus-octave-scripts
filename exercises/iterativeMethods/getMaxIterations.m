% Copyright © 2015 Franco Masotti <franco.masotti@student.unife.it>
% This work is free. You can redistribute it and/or modify it under the
% terms of the Do What The Fuck You Want To Public License, Version 2,
% as published by Sam Hocevar. See the LICENSE file for more details.


% Check if matrix is converging.
[trash, trash, iteration] = convSpeedStep (G);
maxIterations = abs (round (iteration) * precision);

