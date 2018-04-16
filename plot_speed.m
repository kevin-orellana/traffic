rng = 0;
dist= 0;
clockmax = 136;
data = zeros(1, clockmax);

for i=1:clockmax
    data(i) = v(dist);
    dist = dist + .01;
end

j = 0:0.01:1.35;

Z = plot(j, data(:),'r');

set(Z,'LineWidth',3)
title('Speed Function');
xlabel("Distance") % x-axis label
ylabel("Speed") % y-axis label