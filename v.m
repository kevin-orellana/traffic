function [speed] = v(d)    
    
    global dmax vmax
    dmin = 0.3;
    
%     if d is less than dmin
    if d < dmin
        speed = 0;
%     if d is less than dmax
    elseif d < dmax
%        a = log(d/dmin);
%        b = log(dmin/dmax);
%        speed = vmax * a / b;

        dist = (dmax - d);

        speed = vmax * (.5).^ dist;
%         disp("speed: " + speed + "  d: " + d);
%         if (speed < 0 )
%             disp("negative speed.. log(d/dmin): " + a + "log(dmin/dmax) " + b);
%         end
%      if d is greater than or equal to dmax
    else
        speed = vmax;
    end
end

