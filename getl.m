function l = getl(dim, eps)
    if (dim == 2)
        t = linspace(0, 2 * pi, ceil(1 / eps));
        l = [cos(t); sin(t)];
    else
        error("Function is not defined for this dim!")
    end
end