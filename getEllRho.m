function [x, rho] = getEllRho(q, Q, l)
    Ql = Q * l;
    q = repmat(q, 1, size(l, 2));
    x = q + (Ql) ./ (sqrt(dot(l, Ql, 1)));
    rho = dot(l, x, 1);
end