function visualize_heuristic(three_opt, two_opt);
    y = cat(1,three_opt,two_opt);
    x = [1:size(y,3)];
    shortest_tours = zeros(2,size(y,3));
    for num_heuristic=1:2;
        for b=1:size(y,3);
            min_array = y(num_heuristic,:,b);
            shortest_tours(num_heuristic,b) = min(min_array(min_array>0));
        end
    end

    datasetslist = dir('../datasets/');
    datasets=cell( size(datasetslist,1)-2,1);
    hold on;
    labels = ["3-opt","2-opt"];
    ylabel("shortest tour length");
    xlabel("number of cities");
    xticks([1:11])
    xticklabels(["16","18", "23", "25", "48","50","51", "67","70","100","127" ]);
    scatter(x,shortest_tours(1,:), 'filled');
    scatter(x,shortest_tours(2,:), 'filled');
   
    legend(labels);
    hold off;

end
