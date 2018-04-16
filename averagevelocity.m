global aggregateVel clockmax 
global g_vave g_vstd g_run nc g_nc;



averageVel = aggregateVel./clockmax;
meanSpeed = mean(averageVel);
stdSpeed = std(averageVel);

g_vave(g_run) = meanSpeed;
g_vstd(g_run) = stdSpeed;
g_nc(g_run) = nc;
% disp("nc: " + nc + " spd: " + meanSpeed);

% disp("Average speed of car per time step (std): " +  meanSpeed + ' (' +stdSpeed +')' );
