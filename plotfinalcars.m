function plotfinalcars(nc,x,y,onroad, count)
    global car_colors

    if (nc>0 && sum(onroad)>0)
        figure(count);
%         hcars = plot(x ,y, 'o', 'MarkerSize', 3); %,'bo');  
        title(nc + " cars");
%         set(hcars,'xdata',x(find(onroad)),'ydata',y(find(onroad)));
        
        hcars = scatter(x, y, 12, car_colors, 'filled');%plot(x ,y, 'o', 'MarkerSize', 3, 'MarkerEdgeColor',car_colors, 'MarkerFaceColor', car_colors);%,'bo');
        set(hcars,'xdata',x(find(onroad)),'ydata',y(find(onroad)))


    end
    hold on;
    plotfinalroad(count);
    drawnow;
    
    
end
