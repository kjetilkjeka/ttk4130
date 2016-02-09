% simulation parameters
h = 0.01;
t0 = 0;
T = 10;
t = [t0:h:T];

%initial values
y(:,1) = [2;0];

% constants
K = 1.40;
g = 9.81;


f = @(x, t) [x(2); -g*(1 - (1/x(1))^K)];

for i = 2:length(t)
    y(:,i) = implicit_euler_next_step(f, h, y(:,i-1), t(:,i-1));
end

plot(t, y(1,:));