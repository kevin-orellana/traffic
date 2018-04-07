function createcars(xi,yi,i1,nb,ux,uy,L)
global nc onroad firstcar nextcar lastcar x y p xd yd bd pd nextb ncmax %#ok<NUSED>
  
  while (nc < ncmax)
      for b = 1:nb
        % randomly spawn cars
        if ( rand< L(b))
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
            nextb(nc) = b;
    %       metrics for recording       
    %       tenter(nc) = t;
    %       benter(nc) = b;
    %       penter(nc) = p(nc);
        end
      end
  end
end