function  decidenextblock(xi,yi,i2,ux,uy,nbout,bout,b,c)
%
    global xd yd bd pd nextb

    if nextb(c)==b
        i = i2(b);
        prchoice = 1.1-1.0/nbout(i);
        if rand < prchoice
            jnext = 1 + floor(rand*nbout(i));
            nextb(c) = bout(i,jnext);
        else
            xdvec = xd(c) - xi(i);
            ydvec = yd(c) - yi(i);
            dp = ux(bout(i,1:nbout(i))) * xdvec...
                + uy(bout(i,1:nbout(i))) * ydvec;
    %         [dpmax,jnext] = max(dp);
              [~,jnext] = max(dp);
            nextb(c) = bout(i,jnext);
        end
    end
end

