function visualize_stopping(x,y);
    hold all;
    labels = string(1: size(y,3));
    for i=1:size(y,3);
        plot(x,y(1,:,i));

    end
    legend(labels);


end

