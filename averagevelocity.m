global aggregateVel clockmax 
global g_vave g_vstd g_run



averageVel = aggregateVel./clockmax;
meanSpeed = mean(averageVel);
stdSpeed = std(averageVel);

g_vave(g_run) = meanSpeed;
g_vstd(g_run) = stdSpeed;

disp("Average speed of car per time step (std): " +  meanSpeed + ' (' +stdSpeed +')' );
