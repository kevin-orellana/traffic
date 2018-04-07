function  decidenextblock(xi,yi,i2,ux,uy,nbout,bout,b,c)
%
    global  nextb

        i = i2(b);
        jnext = 1 + floor(rand*nbout(i));
        nextb(c) = bout(i,jnext);
        
end

