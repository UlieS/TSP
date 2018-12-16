
function best_ind = test_stop_criteria()

    NIND=50;		% Number of individuals
    MAXGEN=100;		% Maximum no. of generations
    NVAR=26;		% No. of variables
    PRECI=1;		% Precision of variables
    ELITIST=0.05;    % percentage of the elite population
    GGAP=1-ELITIST;		% Generation gap
    STOP_PERCENTAGE=.95;    % percentage of equal fitness individuals for stopping
    PR_CROSS=.95;     % probability of crossover
    PR_MUT=.05;       % probability of mutation
    LOCALLOOP=0;      % local loop removal
    CROSSOVER = 'xalt_edges';
    THRSH = [0.05, 0.01, 0.005, 0.001, 0.0005];
    TIMEPRD = [5, 10, 20, 25, 30, 35];
    
    
    datasetslist = dir('../datasets/');
    datasets=cell( size(datasetslist,1)-2,1);
    best_ind= zeros(1,100,size(datasets,2),size(THRSH,2)*size(TIMEPRD,2));
    
    for i=1:size(datasets,1);
        datasets{i} = datasetslist(i+2).name;
        data = load(['../datasets/' datasets{i}]);
        x=data(:,1)/max([data(:,1);data(:,2)]);y=data(:,2)/max([data(:,1);data(:,2)]);
        NVAR=size(data,1);
        
        % go through different thresholds
        for thr=1:size(THRSH,2);
            
            % go through different Timeperiods
            for time=1:size(TIMEPRD,2);
                best = run_ga_test(x, y, THRSH(1,thr), TIMEPRD(1,time), NIND, MAXGEN, NVAR, ELITIST, STOP_PERCENTAGE, PR_CROSS, PR_MUT, CROSSOVER, LOCALLOOP, 1, 1, 1);
                best_ind(:,:,i,thr*time) = best;
            end
        end
          
    end

    
    