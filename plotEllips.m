function plotEllips(q, Q, hyplane, plot_params)
    n = size(hyplane.n1, 1);
    l = getl(n, 1e-2);
    [x, ~] = getEllRho(q, Q, l);
    plotProjected(x, hyplane, plot_params);
end