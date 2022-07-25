function [Qm, qm, t] = getInEllips(l, args)
    t = linspace(args.t0, args.T, ceil(1 / args.eps));
    X_fund = getFundMatrix(args.A, t);
    n = size(args.A(args.t0), 1);
    X = @(i) reshape(X_fund(i, :, :), n, n);
    
    B = args.B;
    Q = args.Q;
    q = args.q;
    X0_sq = args.X0;
    
    qt = zeros(length(t), n);
    Qt = zeros(length(t), n, n);
    
    for i = 1:length(t)
        tau = t(i);
        qt(i, :) = X(i) * B(tau) * q(tau);
        Q_sq = sqrtm(Q(tau));
        
        a = Q_sq * B(tau).' * X(i).' * l;
        lmb = norm(a) / norm(X0_sq * X(1).' * l);
        b = lmb * X0_sq * X(1).' * l;
        
        [Ua,Sa,Va] = svd(a);
        [Ub,Sb,Vb] = svd(b);
    
        S = Ub * Ua.'...
            * (Sb(1) / (Sa(1) + (Sa(1) == 0) * args.eps))...
            * (Vb / ((Sa(2) == 0) * args.eps + Va));
        Qt(i, :, :) = S * Q_sq * B(tau).' * X(i).';
    end
    Q0 = repmat(reshape(X0_sq * X(1).', 1, n, n), length(t), 1, 1);
    Qm = Q0 + cumtrapz(t, Qt, 1);
    q0 = repmat(reshape(X(1) * args.x0, 1, n), length(t), 1);
    qm = q0 + cumtrapz(t, qt, 1);
end





















