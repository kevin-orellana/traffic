function [speed] = v(d)
    
    global dmax 
    dmin = 0.4;
    vmax = 0.2;
    
    if d < dmin
        speed = 0;
    elseif d < dmax
        speed = vmax * log(d/dmin) / log(dmin/dmax);
    else
        speed = vmax;
    end
end

