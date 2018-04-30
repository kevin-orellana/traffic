function [t_weights] = sensorized_carsonblock()

    global nb firstcar nextcar weights p L final_weights
    
    t_weights = zeros(1, nb);
    
    for b = 1:nb
%       check if there's a car on block b
        c = firstcar(b);
        if (c == 0)
            weights(b) = 0;
%        if there is a car, get a weighted count of all car positions on block b
        else
            weight = p(c) / L(b) ; 
            nc = nextcar(c);
            while (nc ~= 0)
                weight = weight + (p(nc) / L(b));
                nc = nextcar(nc);
            end
%           set the weighted edge of the block b
            weights(b) = weight;
            t_weights(b) = weight;
        end 
    end
    
    % use this fucntion of it works for you
    % normalize weights: normalize(weights_at_t);
    t_weights = (t_weights - mean(t_weights)) ./ std(t_weights);
    % put in range 0 - 1
    t_weights = (t_weights - min(t_weights)) ./ (max(t_weights) - min(t_weights));
    final_weights(1, :) = final_weights + t_weights;
   
    
end
