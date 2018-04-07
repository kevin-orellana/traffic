function [] = cartonextblock(car, block)
% 
    global lastcar firstcar nextcar ux uy nextb i1 p xi yi x y
    
    % grab yhr g
    firstcar(block) = nextcar(c);

    if (c == lastcar(block))
        lastcar(block) = 0;
    end

    if (lastcar(next_block()) == 0)
        firstcar(next_block(car)) = car;
    else
        nextcar(lastcar(next_block(car))) = car;
    end

    lastcar(nextb(car)) = car;
    nextcar(car) = 0;
    % this is why we previously set nextc = nextcar(c)
    
    %
    x(car) = xi(i1(nextb(car))) + p(car) * ux(nextb(car));
    y(car) = yi(i1(nextb(car))) + p(car) * uy(nextb(car));

end
