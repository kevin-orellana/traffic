function [t_weights] = sensorized_setlights_naive(ux, uy)
    
    global ni nbin  S bin weights
    
    t_weights = sensorized_carsonblock();
%   for each intersection
    for i = 1:ni

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
                if ((dot_product >= -1) && (dot_product < -.5) && (dot_product < min_dot))
                       min_dot = dot_product;
                       opposite = track;       
                end
            end
        
            most_populated_lane = carsonblock(first_block);
            
            %if no opposite block, set opposite as null
            if (isnan(opposite))
                most_populated_lane_weight = carsonblock(first_block);
            else 
                most_populated_lane_weight = carsonblock(first_block) + carsonblock(opposite);
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
                    if ((dot_product2 >= -1) && (dot_product2 < -.65) && (dot_product2 < min_dot2))
                            min_dot2 = dot_product2;
                            opposite2 = track2;       
                    end
                end
           
            %if no opposite block, set opposite as null
            if (isnan(opposite2))
                this_lane_weight = carsonblock(this_block);
            else 
                this_lane_weight = carsonblock(this_block) + carsonblock(opposite2);
            end
           
            if (this_lane_weight > most_populated_lane_weight)
                   most_populated_lane = this_block;
                   most_populated_lane_weight = this_lane_weight;
                   opposite = opposite2;
            end
            
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


