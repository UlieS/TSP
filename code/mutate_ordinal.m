function Mut=mutate_ordinal(Popul, Prob)
for i=1:size(Popul,1)
    %individual=Popul(i,:);
    for j=1:length(Popul(i,:))
        r=rand;
        if r<Prob
            changeTo=randi(size(Popul,2)-(j-1),1);
            Popul(i,j)=changeTo;
        end
    end
end

Mut=Popul;
    
        