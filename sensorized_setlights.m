function [] =sensorized_setlights()
    
    global ni nbin ncb S bin weights
     % Traffic Lights
        % At any given time, the traffic light at intersection i is green for
        % exactly one of the blocks that enter that intersection and red for all
        % the others enter that intersection.
        % Let jgreen(i) be an integer designating which block is the green light,
        % where 1<=jgreen(i)<=nbin(i).
        % Let S(b) be the state of the light at the end of block b, where S = 0
        % denotes red and S = 1 denotes green

%   for each intersection
    for i = 1:ni
    %   if there is only one incoming block into the intersection
    %   ignoring the case where pedestrians are crossing road so we set
    %   a two-block one-way intersection's traffic light as always green
        if nbin(i) == 1
            % switch the light of the incoming block
%             intersection i has only one entrance. Set to green always.
            S(bin(i,1)) = 1;
        else
    %       else there are more than one cars at an intersection
    %       get the number of blocks entering intersection i
            bei = nbin(i);
    %       set most_populated_block to first block entering intersection i by
    %       default
            most_populated_block = bin(i, 1);
    %       keep track of number of cars on each block. Default value is num
    %       of cars on first block entering intersection i
            most_populated_block_cars = weights(bin(i,1));
            for b =1 : bei
                block = bin(i, b);
    %           get number of cars on block block"
                cars_on_block = weights(block);
    %           if block block has more cars than its predecessor blocks,
    %           update most_populated_block and most_populated_block_cars
                if (cars_on_block > most_populated_block_cars)
                    most_populated_block = block;
                    most_populated_block_cars = cars_on_block;
                end
            end
    %       set all lights at interesetion i to red
            for j = 1 : nbin(i)
                    % state of light of all blocks entering are set to red
                    S(bin(i, j)) = 0;
            end
%           set light of most_populated_block to green
            block_green = most_populated_block;
            S(block_green) = 1;
        end
    end
end


