function  choosedestination(xi,yi,i1,ux,uy,L,nb,nc)
% choice of their destinations
% When a car enters the roadway, it is assigned a destination. This can
% also be done randomly. Let bd(c) be the block on which the destination
% lies and let pd(c) be the position on that block, expressed as distance
% from the start of the block.
% In this version we keep trying until we find a position that fits on the
% block, and this makes the block that is ultimately chosen be more likely
% to be a longer one. In fact, the probability of choosing a block is
% exactly proportional to its length, and pd is uniformly distributed over
% that length.

    global xd yd bd pd
    
    Lmax = max(L);
    
    bd(nc) = 1 + floor(rand*nb);
    pd(nc) = rand*Lmax;
    
    while (pd(nc) >= L(bd(nc)))
        bd(nc) = 1 + floor(rand*nb);
        pd(nc) = rand*Lmax;
    end
    
    xd(nc) = xi(i1(bd(nc))) + pd(nc)*ux(bd(nc));
    yd(nc) = yi(i1(bd(nc))) + pd(nc)*uy(bd(nc));

end

