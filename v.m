function [speed] = v(d)
    
    global dmax vmax
    dmin = 0.3;
    
%   if d is less than dmin
    if d < dmin
        speed = 0;
%     if d is less than dmax
    elseif d < dmax
        dist = (dmax - d);
        speed = vmax * (1 - .5).^dist;
    else
        speed = vmax;
    end
end

