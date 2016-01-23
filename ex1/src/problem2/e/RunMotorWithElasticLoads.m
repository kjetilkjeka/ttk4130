MotorWithElasticLoadsConstants;

[A, B, C, D] = linmod('MotorWithElasticLoads');

figure;
hold on;
bode(A, B, C, D);