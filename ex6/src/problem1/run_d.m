% simulation parameters
h = 0.05;
t0 = 0;
T = 20;
t = [t0:h:T];

%initial values
y_eeu(:,1) = [1;4];
y_ieu(:,1) = [1;4];
y_imp(:,1) = [1;4];

% constants
K = 1.40;
g = 9.81;


f = @(x, t) [2*x(2); -3*x(1)];
V = @(u, v) u - 2 .* log(u) + v - 3 .* log(v);

for i = 2:length(t)
    y_eeu(:,i) = euler_next_step(f, h, y_eeu(:,i-1), t(:,i-1));
end

for i = 2:length(t)
    y_ieu(:,i) = implicit_euler_next_step(f, h, y_ieu(:,i-1), t(:,i-1));
end

for i = 2:length(t)
    y_imp(:,i) = implicit_midpoint_next_step(f, h, y_imp(:,i-1), t(:,i-1));
end

figure;
hold on;
plot(t, y_eeu(1,:));
plot(t, y_eeu(2,:));
plot(t, V(y_eeu(1,:),y_eeu(2,:)));
legend('u', 'v', 'V');

figure;
hold on;
plot(t, y_ieu(1,:));
plot(t, y_ieu(2,:));
plot(t, V(y_ieu(1,:),y_ieu(2,:)));
legend('u', 'v', 'V');

figure;
hold on;
plot(t, y_imp(1,:));
plot(t, y_imp(2,:));
plot(t, V(y_imp(1,:),y_imp(2,:)));
legend('u', 'v', 'V');