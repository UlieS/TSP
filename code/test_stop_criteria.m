
function tour_lengths = test_stop_criteria()

    NIND=50;		% Number of individuals
    MAXGEN=100;		% Maximum no. of generations
    NVAR=26;		% No. of variables
    PRECI=1;		% Precision of variables
    ELITIST=0.05;    % percentage of the elite population
    GGAP=1-ELITIST;		% Generation gap
    STOP_PERCENTAGE=.95;    % percentage of equal fitness individuals for stopping
    PR_CROSS=.2;     % probability of crossover
    PR_MUT=.95;       % probability of mutation
    LOCALLOOP=0;      % local loop removal
    CROSSOVER = 'xalt_edges';
    THRSH = [0.05, 0.01, 0.005, 0.001, 0.0005, 0.001];
    TIMEPRD = [5, 10, 20, 25, 30, 35, 100];
    
    
    datasetslist = dir('../datasets/');
    datasets=cell( size(datasetslist,1)-2,1);
    
    [G_THRSH, G_TIMEPRD] = ndgrid(THRSH, TIMEPRD);
        
    % flatten grids to iterate across all parameters
    G_THRSH= G_THRSH(:);
    G_TIMEPRD = G_TIMEPRD(:);
    
    param_count = size(G_THRSH,1);
    tour_lengths= zeros(size(datasets,1),param_count,3);
    
    for i=1:size(datasets,1);
        datasets{i} = datasetslist(i+2).name;
        data = load(['../datasets/' datasets{i}]);
        x=data(:,1)/max([data(:,1);data(:,2)]);y=data(:,2)/max([data(:,1);data(:,2)]);
        NVAR=size(data,1);
        
        for p=1:param_count;
            avg_min= zeros(1,10);
            for t=1:10;
                best = run_ga_test(x, y, G_THRSH(p), G_TIMEPRD(p), NIND, MAXGEN, NVAR, ELITIST, STOP_PERCENTAGE, PR_CROSS, PR_MUT, CROSSOVER, LOCALLOOP, 1, 1, 1);
                minimum = min(best(best>0));
                avg_min(1,t) = minimum;
            end
            minimum=mean(avg_min);
            tour_lengths(i,p,1) = minimum;
            tour_lengths(i,p,2) = G_THRSH(p);
            tour_lengths(i,p,3) = G_TIMEPRD(p);
            
        end
          
    end

    
    