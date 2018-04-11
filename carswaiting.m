global stopR waitT clockmax 

totalNumCarsWaiting = sum(stopR);
individualCarWaitTimeAverage = waitT./clockmax;
mean_individCarWait = mean(individualCarWaitTimeAverage);
std_individCarWait = std(individualCarWaitTimeAverage);

disp("Average car waiting time per time step (standard dev): " +  mean_individCarWait + ' (' +std_individCarWait +')' );
