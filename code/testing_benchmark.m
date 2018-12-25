
function tour_lengths = testing_benchmark()

    NIND=[300, 500, 1000];		% Number of individuals
    MAXGEN=[300];		% Maximum no. of generations
    NVAR=26;		% No. of variables
    PRECI=1;		% Precision of variables
    ELITIST=[0.05, 0.1,0.20]%, 0.5, 0.6, 0.95];    % percentage of the elite population
    GGAP=1-ELITIST;		% Generation gap
    STOP_PERCENTAGE=.95;    % percentage of equal fitness individuals for stopping
    PR_CROSS=[0.8, 0.85, 0.95]%, 0.15, 0.2];     % probability of crossover
    PR_MUT=[0.05, 0.1, 0.2];       % probability of mutation
    LOCALLOOP=0;      % local loop removal
    CROSSOVER = 'xalt_edges';
    THRSH = 0.001;%,0.05, 0.01, 0.005, 0.001, 0.0005];
    TIMEPRD = 35; %[5, 10, 20, 25, 30, 35];
    
    
    datasetslist = dir('../datasets/benchmark/');
    datasets=cell( size(datasetslist,1)-2,1);
    
    
    
    % get parameter grids  
    [G_NIND, G_MAXGEN, G_ELITIST, G_PR_CROSS, G_PR_MUT] = ndgrid(NIND, MAXGEN, ELITIST, PR_CROSS, PR_MUT);
        
    % flatten grids to iterate across all parameters
    G_NIND= G_NIND(:);
    G_MAXGEN = G_MAXGEN(:);
    G_ELITIST = G_ELITIST(:);
    G_PR_CROSS = G_PR_CROSS(:);
    G_PR_MUT = G_PR_MUT(:);
    
    param_count = size(G_NIND,1);
    tour_lengths= zeros(size(datasets,1),param_count,6);
    
    textprogressbar('performing grid search');

    for i=1:size(datasets,1);
        datasets{i} = datasetslist(i+2).name;
        data = load(['../datasets/benchmark/' datasets{i}]);
        x=data(:,1);y=data(:,2);
        NVAR=size(data,1);
 
        
        for p=1:param_count;
            i
            p
            
            avg_min= zeros(1,10);
            for t=1:10;
                best = run_ga_test(x, y, THRSH, TIMEPRD, G_NIND(p), G_MAXGEN(p), NVAR, G_ELITIST(p), STOP_PERCENTAGE, G_PR_CROSS(p), G_PR_MUT(p), CROSSOVER, LOCALLOOP, 1, 1, 1);
                minimum = min(best(best>0))
                avg_min(1,t)= minimum;
            end
            
            minimum=mean(avg_min);
            tour_lengths(i,p,1) = minimum; 
            tour_lengths(i,p,2)= G_NIND(p);
            tour_lengths(i,p,3)= G_MAXGEN(p);
            tour_lengths(i,p,4)= G_ELITIST(p);
            tour_lengths(i,p,5)= G_PR_CROSS(p);
            tour_lengths(i,p,6)= G_PR_MUT(p);

        end
       
        
        
          
    end
end


    
      