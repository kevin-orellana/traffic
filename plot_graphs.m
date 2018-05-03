global nc g_runs g_tave g_vave init_nc end_nc

% X-Axis Ranges
x_tlc = linspace(.1, 5, g_runs);
x_nc = linspace(init_nc, end_nc, g_runs);
x_vmax = linspace(.1, 1.5, g_runs);

% Plotting the Graphs
% figure(1)
% plot(x_tlc, g_vave);
% xlabel('Traffic Light Duration')
% ylabel('Average Car Speed')

figure
plot(x_nc, g_vave);
xlabel('Number of Cars')
ylabel('Average Car Speed')

% figure(3)
% plot(x_vmax, g_vave);
% xlabel('Max Speed Limit')
% ylabel('Average Car Speed')

% figure(4)
% plot(x_tlc, g_tave);
% xlabel('Traffic Light Duration')
% ylabel('Average Car Wait Time')

figure
plot(x_nc, g_tave);
xlabel('Number of Cars')
ylabel('Average Car Wait Time')

% figure(6)
% plot(x_vmax, g_tave);
% xlabel('Max Speed Limit')
% ylabel('Average Car Wait Time')
