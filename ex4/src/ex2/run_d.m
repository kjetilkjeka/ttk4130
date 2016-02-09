% constants
A = 0.01;
m = 200;
p0 = 2e5;

% energy function
E = @(K, x, g, v) 1/(K-1)*p0*A*x.^(1-K) + m*g*x + 1/2*m*v.^2;

run_a;
E_a = E(K, y(1,:), g, y(2,:));
t_a = t;

run_b;
E_b = E(K, y(1,:), g, y(2,:));
t_b = t;

run_c;
E_c = E(K, y(1,:), g, y(2,:));
t_c = t;

figure();
hold on;
plot(t_a, E_a);

plot(t_b, E_b);

plot(t_c, E_c);

legend('2a', '2b', '2c');