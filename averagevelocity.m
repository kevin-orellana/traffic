global aggregateVel clockmax  

averageVel = aggregateVel./clockmax;
meanSpeed = mean(averageVel);
stdSpeed = std(averageVel);

disp("Average speed of car per time step (std): " +  meanSpeed + ' (' +stdSpeed +')' );
