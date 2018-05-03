function  cartonextblock(xi,yi,i1,ux,uy,c,b)
%
    global  lastcar nextcar firstcar x y nextb p
    
    % change first car of the block
    firstcar(b) = nextcar(c);
    
    % if car is the last car of block
    if (c==lastcar(b))
        % set block as empty
        lastcar(b) = 0; 
    end
    % if the next block of the car is empty
    if (lastcar(nextb(c))==0)
        % make this car the first car of the new block
        firstcar(nextb(c)) = c;
        
    % if next block has cars
    else
        % make this car the next car of the last car in next block
        nextcar(lastcar(nextb(c))) = c;
    end
    % car is the last car of the block
    lastcar(nextb(c)) = c;
    % no cars before it
    nextcar(c) = 0;
    % update x, y coordiantes of car in new block
    x(c) =  xi(i1(nextb(c))) + p(c)*ux(nextb(c)) + uy(nextb(c)) * 0.05;
    y(c) =  yi(i1(nextb(c))) + p(c)*uy(nextb(c)) - ux(nextb(c)) * 0.05;
end

