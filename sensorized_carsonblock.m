function [weights_at_t] = sensorized_carsonblock()

    global nb firstcar nextcar weights p L final_weights
    
    weights_at_t = zeros(nb);
    
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
            weights_at_t(b) = weight;
        end 
    end
    
    normalize(weights_at_t);
    weights_at_t = (weights_at_t - min(weights_at_t)) ./ (max(weights_at_t) - min(weights_at_t));
    final_weights = final_weights + weights_at_t;
    
end
