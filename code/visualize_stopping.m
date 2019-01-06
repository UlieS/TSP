function visualize_stopping(data);
    
    cities16 = data(1,:,:);
    cities18 = data(2,:,:);
    cities23 = data(3,:,:);
    cities25 = data(4,:,:);
    cities48 = data(5,:,:);
    cities50 = data(6,:,:);
    cities51 = data(7,:,:);
    cities67 = data(8,:,:);
    cities70 = data(9,:,:);
    cities100 = data(10,:,:);
    cities127 = data(11,:,:);
    
    j = 1;
    x = [1:6];
    sz = linspace(100,100,6);
    for i=1:7;
        hold on;
        labels = ["5","10", "20", "25", "30", "35", "no stopping criterion"];
        ylabel("optimal tour length");
        xlabel("threshold of convergence");
        xticks([1:6]);
        xticklabels(["0.05","0.01", "0.005", "0.001", "0.0005", "no stopping criterion"]);
        scatter(x,cities16(:,j:j+5,1), sz,'filled');
        %scatter(x,cities18(:,:,1), 'filled');
        %scatter(x,cities23(:,:,1), 'filled');
        %scatter(x,cities25(:,:,1), 'filled');
        
        j = i+5;
        
    end
    legend(labels);
    
    hold off;
    

end

