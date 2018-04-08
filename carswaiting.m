global stopR waitT clockmax nc

totalNumCarsWaiting = sum(stopR);

individualCarWaitTimeAverage = waitT./clockmax;
universalCarWaitTimeAverage = (sum(individualCarWaitTimeAverage) / nc);

% disp("Total num times a car waited: " + totalNumCarsWaiting );
disp("universalCarWaitTimeAverage " + universalCarWaitTimeAverage );
% disp(individualCarWaitTimeAverage);

