function plotTube(args, hyplane)
    if (isfield(hyplane, 'n3'))
        error("Cannot plot tube in 3d space");
    end
    t = linspace(args.t0, args.T, ceil(1 / args.eps));
    
    n = size(args.A(args.t0), 1);
    l0 = getl(n, 1e-2);
    x = zeros(length(t), size(l0, 2), 2);
    hold on
    for i = 1: size(l0, 2)
        l = l0(:, i);

        [Q, q] = getInEllips(l, args);
        for j = 1 : size(Q, 1)
            tQ = reshape(Q(j, :, :), size(Q, 2), size(Q, 3));
            tQ = tQ.' * tQ;
            tq = reshape(q(j, :), size(q, 2), 1);
            [tx, ~] = getEllRho(tq, tQ, l);
            x(j, i, 1:2) = getProj(tx, hyplane);
            x(j, i, 3) = t(j);
        end
        
    end
    hold on
    j = 2;
    plot3(x(j, :, 1), x(j, :, 2), x(j, :, 3),...
             'color', 'r', 'LineWidth', 2);
    for j = 2 : 10 : size(Q, 1) - 1
        plot3(x(j, :, 1), x(j, :, 2), x(j, :, 3),...
             'color', 'g');
    end
    j = size(Q, 1);
    plot3(x(j, :, 1), x(j, :, 2), x(j, :, 3),...
             'color', 'r', 'LineWidth', 2);
    xlabel('n_1');
    ylabel('n_2');
    zlabel('t');
    grid on
    %axis equal
end