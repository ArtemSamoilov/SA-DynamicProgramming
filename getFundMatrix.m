function X = getFundMatrix(A, t)
    n = size(A(t(1)), 1);
    F = @(t, x) (x.' * A(t)).';
    X = zeros(size(t, 2), n, n);
    
    init_val = eye(n);
    
    for i = 1:n
        [tau, tX] = ode45(F, -flip(t), init_val(i, :));
        X(:, i, :) = flip(tX);
    end
end