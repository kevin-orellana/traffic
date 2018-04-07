function plotcars(nc,x,y,onroad)

    if (nc>0 && sum(onroad)>0)
        hcars = plot(x,y,'r*');  
        set(hcars,'xdata',x(find(onroad)),'ydata',y(find(onroad)))
    end
    plotroad();
    drawnow;
    
end