global aggregateVel clockmax nc

averageVel = aggregateVel./clockmax;
sumVel = sum(averageVel);
sumAve = sumVel / nc;
disp("Average velocities: "+ sumAve)
