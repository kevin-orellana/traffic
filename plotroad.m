function [xi,yi,i1,i2,ni,nb,ux,uy] = plotroad()
    global L weights_at_t
%

% xi(i), yi(i) = coordinates of intersection i
xi = [0 .5  .5 2 2 3 3 3 4 4 5.5 5.5 6 ];
yi = [3 .5 5.5 4 2 0 3 6 2 4 5.5 .5 3 ];

% i1(b), i2(b) = indices of intersections connected by block b, ordered by
% the direction traffic flow
i1_oneway = [1 3 8  11 13 12 6 2 2 5 5 4 1 11 10 9 13 8 10 6 5 7 4 9 9 7 4 10];
i2_oneway = [3 8 11 13 12 6  2 1 5 6 1 3 4 10 8 12 9  4 13 9 4 5 7 5 7 10 10 9];

% Creating two-way roads
i1 = zeros(1, length(i1_oneway) * 2);
i2 = zeros(1, length(i2_oneway) * 2);
for i = 1:2:length(i1) - 1
    i1(i:i+1) = [i1_oneway(ceil(i/2)), i2_oneway(ceil(i/2))];
    i2(i:i+1) = [i2_oneway(ceil(i/2)), i1_oneway(ceil(i/2))];    
end

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

hold on
axis([min(xi)-1 max(xi)+1 min(yi)-1 max(yi)+1]);

%Determine the 
colors = zeros(3, nb);
if isempty(weights_at_t) || isnan(weights_at_t(1,2))
    for i = 1:nb
        colors(:, i) = [0, 0, 0];
    end
else
    for i = 1:nb
        colors(:, i) = [1, 0.9 - weights_at_t(i) * 0.9,  0.9 - weights_at_t(i)* 0.9];
    end
end

    
for b = 1:nb

    ux1 = xi(i2(b))-xi(i1(b));
    uy1 = yi(i2(b))-yi(i1(b));
    x1 = xi(i1(b));
    y1 = yi(i1(b));
    
    %Seperate two roads
    x1 = x1 + uy(b) * 0.05;
    y1 = y1 - ux(b) * 0.05;
    %adjust road position for appearence
    x1 = x1 + ux(b) * 0.1;
    y1 = y1 + uy(b) * 0.1;
    quiver(x1,y1,ux1,uy1,'k', 'color', colors(:, b));
    
    xt = (xi(i1(b)) + xi(i2(b)))/2;
    yt = (yi(i1(b)) + yi(i2(b)))/2;
    str = ['(',num2str(b),')'];
    %text(xt,yt,str)
end

for i = 1:ni
    % change to string
   str = num2str(i);
   plot(xi(i),yi(i),'rd');
   %location of text
   xt = xi(i)+0.1;
   yt = yi(i)-0.1;
   % text the interesection
   % text(xt,yt,str)
end

hold off
end
