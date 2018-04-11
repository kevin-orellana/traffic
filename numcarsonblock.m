function [] = numcarsonblock()
    global nb firstcar nextcar ncb
    for b = 1:nb
%       check if there's a car on block b
        c = firstcar(b);
        if (c == 0)
            ncb(b) = 0;
%        if there is a car, get a count of all the cars on block b
        else
            count = 1;
            nc = nextcar(c);
            while (nc ~= 0)
                count = count + 1;
                nc = nextcar(nc);
            end
%           set the number of cars on block b to count
            ncb(b) = count;
        end     
    end
end
