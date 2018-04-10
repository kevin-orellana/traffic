global stopR waitT clockmax nc

totalNumCarsWaiting = sum(stopR);
individualCarWaitTimeAverage = waitT./clockmax;
mean_individCarWait = mean(individualCarWaitTimeAverage);
std_individCarWait = std(individualCarWaitTimeAverage);



disp("Mean car waiting time per time step: " +  mean_individCarWait);
disp("Standard Deviation of car waiting time: " + std_individCarWait  );


