global aggregateVel clockmax 

averageVel = aggregateVel./clockmax;
meanVelocity = mean(averageVel);
stdVelocity = std(averageVel);

disp("Mean velocity of cars in traffic: "+ meanVelocity)
disp("Standard Deviation of velocity: "+ stdVelocity)
