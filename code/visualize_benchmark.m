function visualize_benchmark(data);
    
    cities131 = data(1,:,:);
    cities380 = data(2,:,:);
    cities662 = data(3,:,:);
    cities711 = data(4,:,:);
    
    x = [1:size(data,2)];

    hold on;
    labels = ["131","380", "662","711"];
    ylabel("optimal tour length");
    xlabel("parameter settings");
    %xticks([1:11])
    %xticklabels(["16","18", "23", "25", "48","50","51", "67","70","100","127" ]);
    scatter(x,cities131(:,:,1), 'filled');
    %scatter(x,cities380(:,:,1), 'filled');
    %scatter(x,cities662(:,:,1), 'filled');
    %scatter(x,cities711(:,:,1), 'filled');
    
    legend(labels);
    hold off;

end

