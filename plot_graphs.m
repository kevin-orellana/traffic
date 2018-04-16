global nc g_runs g_tave g_vave

% X-Axis Ranges
x_tlc = linspace(.1, 5, g_runs);
x_nc = linspace(20, 70, g_runs);
x_vmax = linspace(.1, 1.5, g_runs);

% Plotting the Graphs
figure(1)
plot(x_tlc, g_vave);
xlabel('Traffic Light Duration')
ylabel('Average Car Speed')

figure(2)
plot(x_nc, g_vave);
xlabel('Number of Cars')
ylabel('Average Car Speed')

figure(3)
plot(x_vmax, g_vave);
xlabel('Max Speed Limit')
ylabel('Average Car Speed')

figure(4)
plot(x_tlc, g_tave);
xlabel('Traffic Light Duration')
ylabel('Average Car Wait Time')

figure(5)
plot(x_nc, g_tave);
xlabel('Number of Cars')
ylabel('Average Car Wait Time')

figure(6)
plot(x_vmax, g_tave);
xlabel('Max Speed Limit')
ylabel('Average Car Wait Time')
