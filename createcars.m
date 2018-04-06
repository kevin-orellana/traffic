function createcars(xi,yi,i1,nb,ux,uy,L,dt,R)
global nc onroad firstcar nextcar lastcar x y p xd yd bd pd nextb nmax %#ok<NUSED>

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