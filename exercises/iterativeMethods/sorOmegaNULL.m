% If input variable omega is set to the string 'NULL', then the optimal
% parameter is found with a formula.
if omega == 'NULL'
        % Gauss Seidel algorithm.
        % Find some components.
        L = tril (A);
        U = - triu (A, 1);
        invL = invTril (L);

        % Find Gauss Siedel matrix.
        Gs = invL * U;
        c = invL * b;

        G = Gs;
        [spectrum, trash, trash] = convSpeedStep (G);

        omega = 2 / (1 + sqrt (1 - spectrum));
        fprintf ('Optimal omega = %g\n', omega);
end;

