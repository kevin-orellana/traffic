function createcars(xi,yi,i1,nb,ux,uy,L,dt,R)
% Cars on blocks
% Let p(c) be the position of car c on whatever block it happens to be on,
% measured as distance from the start of the block. If car c is on block b,
% then 0<=p(c)<L(b)
% and the coordinates of car c are given by
% x(c) = xi(i1(b))+p(c)*ux(b)
% y(c) = yi(i1(b))+p(c)*uy(b)
% To access all of the cars on a block in order of decreasing p, we use the
% following linked-list data structure:
% firstcar(b) = index of first car on block b
% nextcar(c) = index of car immediately behind car c on the same block
% lastcar(b) = index of last car on block b
% In all cases, an entry of 0 means that there is no such car.
% Thus nextcar(lastcar(b)) = 0, and if block b is empty then
% firstcar(b)=last(b)=0
% Entry of cars 
% Cars enter the roadway (from parking garages in parking spaces) at random
% times and locations. Let R be the rate at which this occurs. Then R has
% units of 1/(time*length). Choose the time step dt small enough that
% R*Lmax*dt<<1, where Lmax is the largest length of any block. Then we can
% make the approximation that at most one car enters the roadway per block
% per time step. To decide whether this happens and to choose the location
% p on the block if it does, we can do the following for each block b:

global nc onroad firstcar nextcar lastcar x y p xd yd bd pd nextb nmax %#ok<NUSED>
    % for each block
  for b = 1:nb
    % randomly spawn cars based of R
    if ( rand<dt*R*L(b))
        nc = nc + 1;
        %randomly select a position of a new car
        p(nc) = rand*L(b);
        % find x and y coordinates of new car pased off random 
        % position of car spawned
        x(nc) = xi(i1(b)) + p(nc)*ux(b);
        y(nc) = yi(i1(b)) + p(nc)*uy(b);
        % activate the car
        onroad(nc) = 1;
        % insert the car into the graph
        insertnewcar(nc,b,p)
        choosedestination(xi,yi,i1,ux,uy,L,nb,nc) % or keep it selecting
        % random ?
        
        nextb(nc) = b;
%       metrics for recording       
%       tenter(nc) = t;
%       benter(nc) = b;
%       penter(nc) = p(nc);
    end
  end
end