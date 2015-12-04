% Find the inverse of D.
for i = 1 : rows
        if D (i, i) == 0
                error ('Division by zero.')
        end;
        invD (i, i) = 1 / D (i, i);
end;

