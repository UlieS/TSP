function visualize_benchmark(data);
    
    %cities131 = data(1,:,:);
    %cities380 = data(2,1:47,:);
    %cities662 = data(3,:,:);
    %cities711 = data(4,:,:);
    
    
    [x,y]=find(data(1,:,6)==0.05)
    e= data(1,y,:)
    [x,y]=find(e(1,:,4)==0.2)
    elit_05 = e(1,y,:)
    
    [x,y]=find(data(1,:,6)==0.1)
    e= data(1,y,:)
    [x,y]=find(e(1,:,4)==0.2)
    elit_1 = e(1,y,:)
    
    [x,y]=find(data(1,:,6)==0.2)
    e= data(1,y,:)
    [x,y]=find(e(1,:,4)==0.2)
    elit_2 = e(1,y,:)
    
    %x = [1:size(data,2)];
    x = [1:3];
    hold on;
    labels = ["mutation 0.05","mutation 0.1", "mutation 0.2"];
    ylabel("optimal tour length");
    xlabel("crossover probability");
    xticks([1:3]);
    sz = linspace(100,100,3);
    xticklabels(["0.8", "0.85", "0.95"]);
    scatter(x,elit_05(1,:,1), sz, 'filled');
    scatter(x,elit_1(1,:,1), sz, 'filled');
    scatter(x,elit_2(1,:,1), sz, 'filled');
    
    %scatter(x,cities380(:,:,1), 'filled');
    %scatter(x,cities662(:,:,1), 'filled');
    %scatter(x,cities711(:,:,1), 'filled');
    
    legend(labels);
    hold off;

end

