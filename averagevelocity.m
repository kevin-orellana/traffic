global aggregateVel clockmax 

averageVel = aggregateVel./clockmax;
meanVelocity = mean(averageVel);
stdVelocity = std(averageVel);

meanSpeed = mean(averageVel);
stdSpeed = std(averageVel);

disp("Mean velocity of cars in traffic: "+ meanVelocity)
disp("Standard Deviation of velocity: "+ stdVelocity)

disp("Average speed of car per time step (std): " +  meanSpeed + ' (' +stdSpeed +')' );
