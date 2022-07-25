function plotReachSet(args, hyplane, side)
    n = size(args.A(args.t0), 1);
    l0 = getl(n, args.l_grid);
    x = zeros(size(l0));
    hold on
    for i = 1: size(l0, 2)
        l = l0(:, i);
        if (strcmp(side, 'out') || strcmp(side, 'both'))
            [Q, q] = getOutEllips(l, args);
            tQ = reshape(Q(size(Q, 1), :, :), size(Q, 2), size(Q, 3));
            tq = reshape(q(size(q, 1), :), size(q, 2), 1);
            
            if (rem(i, 10) == 0)
                plot_params = struct('color', 'y');
                plotEllips(tq, tQ, hyplane,plot_params);
            end
        end
        
        if(strcmp(side, 'in') || strcmp(side, 'both'))
            [Q, q] = getInEllips(l, args);
            tQ = reshape(Q(size(Q, 1), :, :), size(Q, 2), size(Q, 3));
            tQ = tQ.' * tQ;
            tq = reshape(q(size(q, 1), :), size(q, 2), 1);
            
            if (rem(i, 10) == 0)
                plot_params = struct('color', 'g');
                plotEllips(tq, tQ, hyplane, plot_params);
            end
        end
        
        if(strcmp(side, 'none'))
            [Q, q] = getInEllips(l, args);
            tQ = reshape(Q(size(Q, 1), :, :), size(Q, 2), size(Q, 3));
            tQ = tQ.' * tQ;
            tq = reshape(q(size(q, 1), :), size(q, 2), 1);
        end
        [x(:, i), ~] = getEllRho(tq, tQ, l);
    end
    plot_params = struct('color', 'r', 'LineWidth', 2);
    plotProjected(x, hyplane, plot_params);
    xlabel('n1');
    ylabel('n2');
    if (isfield(hyplane, 'n3'))
        zlabel('n3');
    end
    grid on
    %axis equal
    hold off
end

















