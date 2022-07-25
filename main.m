clear; clc;

A = @(t) [1     ,    t;
          sin(t), -1.5];
B = @(t) [-1, 0.5; 
          t, 1 + 10.*sin(t)];
Q = @(t) [1,  -0.1 * t .* t;
          -0.1 * t .* t, 1];
X0 = [1, 0; 
      0, 1];

x0 = [0; 0];
q = @(t) [10; -1];

t0 = 0;
T = 1;

eps = 1e-3;
l_grid = 1e-2;

n1 = [1;0];% ort number 1
n2 = [0;-1];% ort number 2
a = [0;0];% center position


args = struct('A', A, 'B', B, 'Q', Q, 'X0', X0, ...
              'x0', x0, 'q', q, 't0', t0, 'T', T, ...
              'eps', eps,'l_grid', l_grid);
hyplane = struct('n1', n1, 'n2', n2, 'a', a);

figure();
plotReachSet(args, hyplane, 'both');

%%
clear; clc;

A = @(t) [1     ,    t;
          sin(t), -1.5];
B = @(t) [-1, 0.5; 
          t, 1 + 10.*sin(t)];
Q = @(t) [1,  -0.1 * t .* t;
          -0.1 * t .* t, 1];
X0 = [1, 0; 
      0, 1];

x0 = [0; 0];
q = @(t) [10; -1];

t0 = 0;
T = 1;

eps = 1e-3;

n1 = [1;0];% ort number 1
n2 = [0;-1];% ort number 2
a = [0;0];% center position


args = struct('A', A, 'B', B, 'Q', Q, 'X0', X0, ...
              'x0', x0, 'q', q, 't0', t0, 'T', T, ...
              'eps', eps);
hyplane = struct('n1', n1, 'n2', n2, 'a', a);

%figure();
plotTube(args, hyplane);
view(3);
axis vis3d




















