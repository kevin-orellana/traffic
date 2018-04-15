function [] = sensorized_carsonblock()
    global nb firstcar nextcar weights p
    for b = 1:nb
%       check if there's a car on block b
        c = firstcar(b);
        if (c == 0)
            weights(b) = 0;
%        if there is a car, get a count of all the cars on block b
        else
            weight = p(c);
            nc = nextcar(c);
            while (nc ~= 0)
                weight = weight + p(nc);
                nc = nextcar(nc);
            end
%           set the number of cars on block b to count
            weights(b) = weight;
        end     
    end
end