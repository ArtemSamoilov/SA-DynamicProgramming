function res = getProj(p, hyplane)
    n1 = hyplane.n1;
    n2 = hyplane.n2;
    n1 = repmat(n1, 1, size(p, 2));
    n2 = repmat(n2, 1, size(p, 2));
    if (isfield(hyplane, 'a'))
        a = repmat(hyplane.a, 1, size(p, 2));
    else
        a = zeros(size(n1));
    end
    x = p - a;
    alph1 = dot(x, n1, 1);
    alph2 = dot(x, n2, 1);
    if (isfield(hyplane, 'n3'))
        n3 = hyplane.n3;
        n3 = repmat(n3, 1, size(p, 2));
        alph3 = dot(x, n3, 1);
        res = [alph1; alph2; alph3];
    else
        res = [alph1; alph2];
    end
end