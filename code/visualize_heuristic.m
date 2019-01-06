function visualize_heuristic(three_opt, two_opt);
    y = cat(1,three_opt,two_opt);
    x = [1:size(y,2)];
   

    datasetslist = dir('../datasets/');
    datasets=cell( size(datasetslist,1)-2,1);
    hold on;
    labels = ["3-opt","2-opt"];
    ylabel("shortest tour length");
    xlabel("number of cities");
    xticks([1:11])
    xticklabels(["16","18", "23", "25", "48","50","51", "67","70","100","127" ]);
    scatter(x,y(1,:), 'filled');
    scatter(x,y(2,:), 'filled');
   
    legend(labels);
    hold off;

end
