function insertnewcar(nc,b,p)

global lastcar nextcar firstcar

    % tag first of the block
    c = firstcar(b);
    % if there are no cars on block or position of new car is spawned greater
    % than that of first car
    if(c==0 || p(nc)>p(c))
        % make the next car of new car be the first car of the block
        nextcar(nc) = c;
        % make the first car of this block be the new car
        firstcar(b) = nc;
        % if the block was empty, make new car the last car of block as well
        if(c==0)
           lastcar(b) = nc;
        end
    % if position of new car is less than the last car of block
    elseif p(nc)<=p(lastcar(b))
        % point the last car to the new car
        nextcar(lastcar(b)) = nc;
        % make the new car the last car
        lastcar(b) = nc;
    else
        % car spawned in the middle of the block
        % iterate down singly linked list 
        ca = c;
        c = nextcar(c);
        % while position of new car is slightly below old 2nd car
        while(p(nc)<=p(c))
            % tag different cars
            ca = c;
            c = nextcar(c);
        end
        % when 2nd car is before new car put new car in the middle of
        % linked list
        nextcar(ca) = nc;
        nextcar(nc) = c;
    end

end

