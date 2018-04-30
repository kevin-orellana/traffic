function plotfinalcars(nc,x,y,onroad, count)
    if (nc>0 && sum(onroad)>0)
        figure(count);
        hcars = plot(x ,y, 'o', 'MarkerSize', 3); %,'bo');  
        title(nc + " cars");
        set(hcars,'xdata',x(find(onroad)),'ydata',y(find(onroad)))
    end
    drawnow;
    hold on

    plotfinalroad(count);
%     drawnow;
    
    
end
