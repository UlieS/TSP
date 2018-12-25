function ObjVal = tspfunPath(Phen, Dist);
    Phen2=zeros(size(Phen));
    for i=1:size(Phen2,1)
        Phen2(i,:)=path2adj(Phen(i,:));
    end
    ObjVal=tspfun(Phen2,Dist);