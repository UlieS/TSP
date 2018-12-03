


function NewChrom = classical_crossover(OldChrom, XOVR);

if nargin < 2, XOVR = NaN; end

NewChrom = zeros(size(OldChrom));
finalI=0;
nI=round(size(OldChrom,1)*(1-XOVR));
if mod(nI,2)~=0
    nI=nI+1;
end
for i=1:1:nI
    r=randi(round(size(OldChrom,1)),1);
    
    NewChrom(i,:)=OldChrom(r,:);
    OldChrom(r,:)=[];
    finalI=i;
end

for j=finalI+1:2:(size(OldChrom,1))+finalI
    size(OldChrom)
    p1=randi(round(size(OldChrom,1)),1); 
    p2=randi(round(size(OldChrom,1)),1);
    if p1==p2
        if p1+1<=size(OldChrom,1)
        p2=p2+1;
        else
            p2=p1-1;
        end
        
    end
    
    %random point 
    r=randi(round(size(OldChrom,2)),1);
    %size(OldChrom)
    p1
    p2
    r
    ch1=[OldChrom(p1,1:r-1),OldChrom(p2,r:end)];
    ch2=[OldChrom(p2,1:r-1),OldChrom(p1,r:end)];
    %delete individuals
    OldChrom(p1,:)=[];
    if p2>p1
        OldChrom(p2-1,:)=[];
    else
        OldChrom(p2,:)=[];
    end
    
    NewChrom(j,:)=ch1;
    NewChrom(j+1,:)=ch2;
end
