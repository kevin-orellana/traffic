function  movecars(xi,yi,i1,i2,ux,uy,nbout,bout,L,nb,S,dt)
%
    global   p lastcar nextcar firstcar pd bd x y nextb dmax
    
    % move cars by each block
    for b = 1:nb
        % select first car of the block
        c = firstcar(b);
        % set maximum distance to be used
        dmax = 1.0;
        %while there are cars in the block
        while(c>0)
            % if this current car is the first car of the block 
            if (c==firstcar(b))
                % if car is in current block destination and
                % the point destination is ahead of this car
                if (bd(c)==b) && (pd(c)>p(c))
                    % set distance to 1
                    d = dmax;
                % but if the first car is on red light of the block
                elseif (S(b)==0)
                    % set distance to be the position - the length of the
                    % block still to be traveled
                    d = L(b) - p(c);
                else
                    % choose the next block of the car
                    decidenextblock(xi,yi,i2,ux,uy,nbout,bout,b,c)
                    % if the next block of the car is not empty
                    if (lastcar(nextb(c)) > 0)
                        % set the distance as the the length fo the block
                        % in addtion to the postion of the last car of the
                        % next block - positio of the car
                        d =  L(b) - p(c) + p(lastcar(nextb(c)));
                    else
                        % if next block is empty set the distance to max
                        d = dmax;
                    end
                end
                
            % if car is the not the first car of the block
            else
                % set the distance as this car's position subtracted by the
                % positon of the car ahead
              d = p(ca) - p(c);
            end
            
            % hold current position of car
            pz = p(c);
            
            % hold the next car
            nextc = nextcar(c);
            
            % update the position of this car
            % by the distance traveled
            p(c) = p(c) + dt * v(d);
            
            % car is in it's block destination and of it's advanced
            % ahead of it's point destination
            if(b==bd(c)) && (pz<pd(c)) && (pd(c)<=p(c))
                % remove the car from the block
                removecar(c,b)
            % else if the car has passed the length of the block
            elseif (L(b)<=p(c))
                % rescale the postiion of the car by this block
                p(c) = p(c) - L(b);
                % if the next block of car is the block destination
                % and the point destination of car has already been passed
                % remove the car
                if(nextb(c)==bd(c))&&(pd(c)<=p(c))
                    removecar(c,b)
                % else move car to the next block
                else
                    cartonextblock(xi,yi,i1,ux,uy,c,b)
                end
            % if the car is on it's regular path on a non-desitnation block
            else
                % update it's position 
                x(c) = xi(i1(b)) + p(c)*ux(b);
                y(c) = yi(i1(b)) + p(c)*uy(b);
                % car ahead is now this car
                ca = c;
            end 
            % iterate to next car
            c = nextc;
        end % while loops over cars on block
    end % for loops over blocks
end


