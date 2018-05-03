function plotcars(nc,x,y,onroad)
    global car_colors
    plotroad();
    if (nc>0 && sum(onroad)>0)
        %hcars = gobjects(1, nc);
        hcars = scatter(x, y, 30, car_colors, 'filled');%plot(x ,y, 'o', 'MarkerSize', 3, 'MarkerEdgeColor',car_colors, 'MarkerFaceColor', car_colors);%,'bo');  
     
        %disp(hcars)
        set(hcars,'xdata',x(find(onroad)),'ydata',y(find(onroad)))
    end
    drawnow;
    hold off;
    
end
