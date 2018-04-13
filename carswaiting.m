global stopR waitT clockmax 
global g_tave g_tstd g_run


totalNumCarsWaiting = sum(stopR);
individualCarWaitTimeAverage = waitT./clockmax;
mean_individCarWait = mean(individualCarWaitTimeAverage);
std_individCarWait = std(individualCarWaitTimeAverage);


g_tave(g_run) = mean_individCarWait;
g_tstd(g_run) = std_individCarWait;

disp("Average car waiting time per time step (standard dev): " +  mean_individCarWait + ' (' +std_individCarWait +')' );
