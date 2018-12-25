function Indexes = roulete_w_selection(FitnV,Nsel);


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
totalFitnes=sum(FitnV);%/length(FitnV);
probs = zeros(size(FitnV));
probs(1)=FitnV(1)/totalFitnes;
Indexes=zeros(Nsel,1);
for i=2:length(FitnV)
    probs(i)=probs(i-1)+FitnV(i)/totalFitnes;
end

for i=1:Nsel
    r= rand;
    for j=1:length(FitnV)
        if r>=probs(j)
            if j~=length(FitnV) && r<=probs(j+1)
                Indexes(i)=j+1;
                break;
            end
            if j==length(FitnV)
                    Indexes(i)=j;
                break
            
            end
        end
        if r<probs(j) && j==1
            Indexes(i)=j;
            break;
        end
    end
end


end