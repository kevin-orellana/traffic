function plotcars(nc,x,y,onroad)
    global car_colors
    if (nc>0 && sum(onroad)>0)
        %hcars = gobjects(1, nc);
        disp([length(x), length(y), length(car_colors)])
        hcars = scatter(x, y, 12, car_colors, 'filled');%plot(x ,y, 'o', 'MarkerSize', 3, 'MarkerEdgeColor',car_colors, 'MarkerFaceColor', car_colors);%,'bo');  
     
        %disp(hcars)
        set(hcars,'xdata',x(find(onroad)),'ydata',y(find(onroad)))
    end
%     plotroad();
    drawnow;
    
end
