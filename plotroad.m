function [] = plotroad()
    global L weights_at_t xi yi i1_oneway i2_oneway i1 i2 ni nb ux uy L

hold on
% axis([min(xi)-1 max(xi)+1 min(yi)-1 max(yi)+1]);
axis([0 35 0 35]);

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
    quiver(x1,y1,ux1,uy1,'k', 'color', colors(:, b), 'linewidth', 2);
    
    xt = (xi(i1(b)) + xi(i2(b)))/2;
    yt = (yi(i1(b)) + yi(i2(b)))/2;
    
    %Seperate text for two roads
    xt = xt + uy(b) * 0.1;
    yt = yt - ux(b) * 0.1;
    
    str = ['(',num2str(b),')'];
%     text(xt,yt,str, 'FontSize', 6)
end

for i = 1:ni
    % change to string
   str = num2str(i);
   plot(xi(i),yi(i),'rd');
   %location of text
   xt = xi(i)+0.1;
   yt = yi(i)-0.1;
   % text the interesection
%     text(xt,yt,str)
end

% hold off
end
