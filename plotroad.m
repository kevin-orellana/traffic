function [xi,yi,i1,i2,ni,nb,ux,uy,L] = plotroad()
%
% xi(i), yi(i) = coordinates of intersection i
xi = [0 2 2 3 3 4 4 6];
yi = [3 2 4 0 6 2 4 3];

% i1(b), i2(b) = indices of intersections connected by block b, ordered by
% the direction traffic flow
i1 = [1 5 8 4 1 2 3 7 6 8];
i2 = [5 8 4 1 3 1 6 2 8 7];
ni = length(xi);  % ni = # of intersections
nb = length(i1);  % nb = # of blocks
% Geometric information
% L(b) = length of block b
% (ux(b), uy(b)) = unit vector along block b in direction of traffic flow
% Given xi, yi, we can find L, ux, uy as follows:
ux = xi(i2)-xi(i1);
uy = yi(i2)-yi(i1);
L = sqrt(ux.^2+uy.^2);
ux = ux./L;
uy = uy./L;
%
hold on
axis([min(xi)-1 max(xi)+1 min(yi)-1 max(yi)+1])
% 
for b = 1:nb
%     x = [xi(i1(b)),xi(i2(b))];
%     y = [yi(i1(b)),yi(i2(b))];  
%     plot(xi(i1(b)),yi(i1(b)),xi(i2(b)),yi(i2(b)))
%     plot(x,y)
      ux1 = xi(i2(b))-xi(i1(b));
      uy1 = yi(i2(b))-yi(i1(b));
     quiver(xi(i1(b)),yi(i1(b)),ux1,uy1,'k')
    xt = (xi(i1(b)) + xi(i2(b)))/2;
    yt = (yi(i1(b)) + yi(i2(b)))/2;
    str = ['(',num2str(b),')'];
    text(xt,yt,str)
end

for i = 1:ni
    % change to string
   str = num2str(i);
   plot(xi(i),yi(i),'bo')
   %location of text
   xt = xi(i)+0.1;
   yt = yi(i)-0.1;
   % text the interesection
   text(xt,yt,str)
end

hold off
end
