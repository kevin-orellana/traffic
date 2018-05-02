function plotcars(nc,x,y,onroad,count)
    global car_colors
    if (nc>0 && sum(onroad)>0)
        figure(count);
        %hcars = gobjects(1, nc);
        hcars = scatter(x, y, 22, car_colors, 'filled');%plot(x ,y, 'o', 'MarkerSize', 3, 'MarkerEdgeColor',car_colors, 'MarkerFaceColor', car_colors);%,'bo');  
        title(nc + " cars");
        %disp(hcars)
        set(hcars,'xdata',x(find(onroad)),'ydata',y(find(onroad)))
    end
     plotroad();
    drawnow;
    
end
