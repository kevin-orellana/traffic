function  removecar(c,b)
%
    global  lastcar nextcar firstcar onroad x y xd yd

    % disactivate car
    onroad(c) = 0;

    % if car to remove is the first car on the block
    if(c==firstcar(b))
        % make the next car on teh block the first car
        firstcar(b) = nextcar(c);
        if(c==lastcar(b))
            % if the car to remove is the only car to remove
            % then make last car point to 0
            lastcar(b) = 0;
        end
        
    % car is not the first of the block
    else 
    % tag index of the car ahead of car to be removed
     ca = find(nextcar==c);
     % skip over this car in the linekd list
     nextcar(ca) = nextcar(c);
     % if car removed is the last car on the block
        if(c==lastcar(b))
            % car ahead of it becomes the last car
             lastcar(b) = ca;
        end
    end
    % put destination of car as the current position
    x(c) = xd(c);
    y(c) = yd(c);
    % removed car does not point to any next cars
    nextcar(c) = 0;

end

