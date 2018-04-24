function  movecars(xi,yi,i1,i2,ux,uy,nbout,bout,L,nb,S,dt)
%
    global p lastcar nextcar firstcar x y nextb dmax aggregateVel stopR waitT
    dmax = 1.0;

    % move cars by each block
    for b = 1:nb
        % select first car of the block
        c = firstcar(b);
        % set maximum distance to be used
        
        % while there are cars in the block
        while(c>0)
            % if this current car is the first car of the block 
            if (c==firstcar(b))
                % if the first car is on red light of the block
                if (S(b)==0)
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
            % update the position of this car
            % by the distance traveled
            p(c) = p(c) + dt * v(d);
%             disp("[dev]: speed of car " + c + " is " + v(d));
            aggregateVel(c) = aggregateVel(c) + v(d);
            % hold the next car if it exists
         
%             check if v(d) == 0 or car is waiting
            if v(d) == 0
%                 set stopR(c) to 1 to indicate car is waiting
                stopR(c) = 1;
%                add dt to waitT(c) to indicate amount time 
%                car c has waited
                waitT(c) = waitT(c) + dt;
            else
                stopR(c) = 0;
            end
         
            if (L(b)<=p(c))
                % rescale the postiion of the car by this block
                p(c) = p(c) - L(b);
                decidenextblock(xi,yi,i2,ux,uy,nbout,bout,b,c)
                cartonextblock(xi,yi,i1,ux,uy,c,b)
            else
                % update it's position, third term used for two-way road
                % offset
                x(c) = xi(i1(b)) + p(c)*ux(b) + uy(b) * 0.05;
                y(c) = yi(i1(b)) + p(c)*uy(b) - ux(b) * 0.05;
                % car ahead is now this car
                ca = c;
            end 
           % iterate to next car
            c = nextcar(c);
      end
    % while loops over cars on block
   end % for loops over blocks
end


