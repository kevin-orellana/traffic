rng = 0;
dist= 0;
clockmax = 136;
data = zeros(1, clockmax);
for i=1:clockmax
    data(i) = v(dist);
    dist = dist + .01;
end

j = 0:0.01:1.35;
plot(j, data(:))