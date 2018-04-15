function [speed] = v(d)
    
    global dmax vmax allV
    dmin = 0.25;
    dmax = 1.0;
    
%   if d is less than dmin
    if d < dmin
        speed = 0;
%     if d is less than dmax
    elseif d < dmax
        %speed = vmax * (1 - .5).^dist;
        speed = vmax * log(d/dmin) / log(dmax/dmin);
    else
        speed = vmax;
    end
    allV = [allV, speed];
end

