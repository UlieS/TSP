function Indexes = tournament_selection(FitnV,Nsel);


%
%
% Input parameters:
%    FitnV     - Column vector containing the fitness values of the
%                individuals in the population.
%    Nsel      - number of individuals to be selected
%
% Output parameters:
%    Indexes - column vector containing the indexes of the selected
%                individuals relative to the original population, shuffled.
%                The new population, ready for mating, can be obtained
%                by calculating OldChrom(NewChrIx,:).

k=3;
Indexes=zeros(Nsel,1);
select=zeros(k,1);
for i=1:Nsel
    %select the individuals
    for j=1:k
        select(j)=randi(length(FitnV));
    end
    %pick up the best one
    maxI=0;
    maxF=0;
    for j=1:k
        if FitnV(select(j))>maxF
            maxF=FitnV(select(j));
            maxI=select(j);
        end
        if FitnV(select(j))==maxF && maxF==0
            maxF=FitnV(select(j));
            maxI=select(j);
        end
    end
    Indexes(i)=maxI;
end