function plotProjected(x, hyplane, plot_params)
    projX = getProj(x, hyplane);
    if (size(projX, 1) == 2)
        plot(projX(1, :), projX(2, :), plot_params);
    end
end