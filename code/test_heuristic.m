
function best_ind = test_heuristic()

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
    THRSH = 0.00005;
    TIMEPRD =2000;
   
    datasetslist = dir('../datasets/');
    datasets=cell( size(datasetslist,1)-2,1);
    
    best_ind= zeros(1,100,size(datasets,1));
    
    for i=1:size(datasets,1);
        datasets{i} = datasetslist(i+2).name;
        data = load(['../datasets/' datasets{i}]);
        % take out scaling 
        %x=data(:,1)/max([data(:,1);data(:,2)]);y=data(:,2)/max([data(:,1);data(:,2)]);
        x=data(:,1);y=data(:,2);
        NVAR=size(data,1);

        best = run_ga_test(x, y, THRSH, TIMEPRD, NIND, MAXGEN, NVAR, ELITIST, STOP_PERCENTAGE, PR_CROSS, PR_MUT, CROSSOVER, LOCALLOOP, 1, 1, 1);
        best_ind(:,:,i) = best;


          
    end
