function [Qm, qm, t] = getOutEllips(l, args)
    t = linspace(args.t0, args.T, ceil(1 / args.eps));
    X_fund = getFundMatrix(args.A, t);
    n = size(args.A(args.t0), 1);
    X = @(i) reshape(X_fund(i, :, :), n, n);
    
    B = args.B;
    Q = args.Q;
    q = args.q;
    X0 = args.X0;
    
    qt = zeros(length(t), n);
    Qt = zeros(length(t), n, n);
    pt = zeros(1, length(t));
    
    p0 = sqrt(dot(l, X(1) * X0 * X(1).' * l));
    for i = 1:length(t)
        tau = t(i);
        qt(i, :) = X(i) * B(tau) * q(tau);
        
        pt(i) = sqrt(dot(l,...
                X(i) * B(tau) * Q(tau) * B(tau).' * X(i).' * l));
        Qt(i, :, :) = X(i) * B(tau) * Q(tau) * B(tau).' * X(i).' ./ pt(i);
    end
    pt_int = repmat(p0, 1, length(t)) + cumtrapz(t, pt);
    pt_int = repmat(reshape(pt_int, length(t), 1), 1, n, n);
    Q0 = repmat(reshape(X(1) * X0 * X(1).', 1, n, n) / p0, length(t), 1, 1);
    Qm = (Q0 + cumtrapz(t, Qt, 1)) .* pt_int;
    q0 = repmat(reshape(X(1) * args.x0, 1, n), length(t), 1);
    qm = q0 + cumtrapz(t, qt, 1);
end





















