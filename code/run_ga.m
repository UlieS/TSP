function run_ga(x, y, NIND, MAXGEN, NVAR, ELITIST, STOP_PERCENTAGE, PR_CROSS, PR_MUT, CROSSOVER, LOCALLOOP, ah1, ah2, ah3)
% usage: run_ga(x, y, 
%               NIND, MAXGEN, NVAR, 
%               ELITIST, STOP_PERCENTAGE, 
%               PR_CROSS, PR_MUT, CROSSOVER, 
%               ah1, ah2, ah3)
%
%
% x, y: coordinates of the cities
% NIND: number of individuals
% MAXGEN: maximal number of generations
% ELITIST: percentage of elite population
% STOP_PERCENTAGE: percentage of equal fitness (stop criterium)
% PR_CROSS: probability for crossover
% PR_MUT: probability for mutation
% CROSSOVER: the crossover operator
% calculate distance matrix between each pair of cities
% ah1, ah2, ah3: axes handles to visualise tsp

bests = zeros(1,11);
for ttt=1:11
%{NIND MAXGEN NVAR ELITIST STOP_PERCENTAGE PR_CROSS PR_MUT CROSSOVER LOCALLOOP}
        THRSH = 0.001;
        TIMEPRD = 10;
        GGAP = 1 - ELITIST;
        mean_fits=zeros(1,MAXGEN+1);
        worst=zeros(1,MAXGEN+1);
        Dist=zeros(NVAR,NVAR);
        for i=1:size(x,1)
            for j=1:size(y,1)
                Dist(i,j)=sqrt((x(i)-x(j))^2+(y(i)-y(j))^2);
            end
        end
        % initialize population
        Chrom=zeros(NIND,NVAR);
        for row=1:NIND
        	%Chrom(row,:)=path2adj(randperm(NVAR));
            Chrom(row,:)=randperm(NVAR);
            %Chrom(row,:)=path2ord(randperm(NVAR));
        end
        gen=0;
        % number of individuals of equal fitness needed to stop
        stopN=ceil(STOP_PERCENTAGE*NIND);
        % evaluate initial population
        ObjV = tspfun(Chrom,Dist);
        best=zeros(1,MAXGEN);
        % generational loop
        
        count = 0;
        while gen<MAXGEN
            sObjV=sort(ObjV);
          	best(gen+1)=min(ObjV);
        	minimum=best(gen+1);
            mean_fits(gen+1)=mean(ObjV);
            worst(gen+1)=max(ObjV);
            for t=1:size(ObjV,1)
                if (ObjV(t)==minimum)
                    break;
                end
            end
            
            %visualizeTSP(x,y,adj2path(Chrom(t,:)), minimum, ah1, gen, best, mean_fits, worst, ah2, ObjV, NIND, ah3);
            %visualizeTSP(x,y,Chrom(t,:), minimum, ah1, gen, best, mean_fits, worst, ah2, ObjV, NIND, ah3);
            % if the difference between the stopNth individual and the best
            % individual is smaller than 1e-15 we have reached the stopping
            % criterium
            if (sObjV(stopN)-sObjV(1) <= 1e-15)
                  break;
            end  
            
            %n = longestSubTour(5,Chrom);
            % stopping criterium for early convergence
            % if in defined number of generations (TIMEPRD) there is not
            % enough improvement -> stop
            if gen>1
                diff = best(gen-1)-best(gen);
                if diff < THRSH
                    count = count +1;
                else 
                    count = 0;
                end
                    
            end 
            if count > TIMEPRD
                break;
            end
            
            
        	%assign fitness values to entire population
        	FitnV=ranking(ObjV);
        	%select individuals for breeding
        	SelCh=select('roulete_w_selection', Chrom, FitnV, GGAP);
            
            SelCh = recombin(CROSSOVER,SelCh,PR_CROSS);
            SelCh=mutateTSP('mutate_path',SelCh,PR_MUT);

                        
        	ObjVSel = tspfunPath(SelCh,Dist);
            %reinsert offspring into population
        	[Chrom ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);
            
            Chrom = tsp_ImprovePopulationPath(NIND, NVAR, Chrom,LOCALLOOP,Dist);
           
        	%increment generation counter
        	gen=gen+1;            
        end
bests(ttt)=best(gen)
end
bests
%csvwrite('100city95cr13mutloopOnelit10indi200gen110.csv',bests);
end
