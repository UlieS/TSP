function Mut=mutate_ordinal(Popul, Prob,Dist)
for i=1:size(Popul,1)
    individual=Popul(i,:);
    for j=1:length(Popul(i,:))
        r=rand;
        if r<Prob
            changeTo=randi(size(Popul,2)-(j-1),1);
            Popul(i,j)=changeTo;
        end
    end
    fitnes=tspfun(Popul(i,:),Dist);
    fitnes_prev=tspfun(individual,Dist);
    if fitnes_prev<fitnes
        Popul(i,:)=individual;
    end
end

Mut=Popul;
    
        