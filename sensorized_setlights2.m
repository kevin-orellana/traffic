function [t_weights] = sensorized_setlights2(ux, uy)
    
    global ni nbin  S bin weights
     % Traffic Lights
        % At any given time, the traffic light at intersection i is green for
        % exactly one of the blocks that enter that intersection and red for all
        % the others enter that intersection.
        % Let jgreen(i) be an integer designating which block is the green light,
        % where 1<=jgreen(i)<=nbin(i).
        % Let S(b) be the state of the light at the end of block b, where S = 0
        % denotes red and S = 1 denotes green
    
        % calculate weights of every block
        %weights_at_t = sensorized_carsonblock();
        t_weights = sensorized_carsonblock();
        
%   for each intersection
    for i = 1:ni
    %   if there is only one incoming block into the intersection
    %   ignoring the case where pedestrians are crossing road so we set
    %   a two-block one-way intersection's traffic light as always green
        if nbin(i) == 2
            % switch the light of the incoming block
%             intersection i has only one entrance. Set to green always.
            S(bin(:,1)) = 1;
        else
    %       else there are more than two-ways in the intersection
    %       get the number of blocks entering intersection i
            nbi = nbin(i);
    %       set most_populated_block to first block entering intersection i by
            first_block = bin(i, 1);
            min_dot = 0;
            opposite = NaN;
    %       find opposite block if it exists
            for j = 1:nbi 
                track = bin(i,j);
                dot_product = (ux(first_block)*ux(track)) + (uy(first_block)*uy(track));
                if ((dot_product > -1) && (dot_product < -.65) && (dot_product < min_dot))
                       min_dot = dot_product;
                       opposite = track;       
                end
            end
        
            most_populated_lane = first_block;
            %if no opposite block, set opposite as null
            if (isnan(opposite))
                most_populated_lane_weight = weights(first_block);
            else 
                most_populated_lane_weight = weights(first_block) + weights(opposite);
            end
            
            opposite2 = NaN;
            % compare with all other lanes
            for b = 1:nbi
                this_block = bin(i, b);
                 min_dot2 = 0;
                 % find opposite block if it exists
                for k = 1:nbi 
                    track2 = bin(i,k);
                    dot_product2 = (ux(this_block)*ux(track2)) + (uy(this_block)*uy(track2));
                    if ((dot_product2 > -1) && (dot_product2 < -.65) && (dot_product2 < min_dot2))
                            min_dot2 = dot_product2;
                            opposite2 = track2;       
                    end
                end
           end
           
            %if no opposite block, set opposite as null
            if (isnan(opposite2))
                this_lane_weight = weights(this_block);
            else 
                this_lane_weight = weights(this_block) + weights(opposite2);
            end
           
            if (this_lane_weight > most_populated_lane_weight)
                   most_populated_lane = this_block;
                   most_populated_lane_weight = this_lane_weight;
                   opposite = opposite2;
            end
          
    %       set all lights at interesetion i to red
            for j = 1 : nbin(i)
                    % state of light of all blocks entering are set to red
                    S(bin(i, j)) = 0;
            end
            
%           set light of most_populated_block to green
            block_green = most_populated_lane;
            S(block_green) = 1;
            if (~isnan(opposite))
               S(opposite) = 1;
            end
        end
    end
    
end


