function NewChrom = order_crossover(OldChrom, XOVR)
%ORDER_CROSSOVER Crossover for path representation
%   ord crossover introduced by Davis in 1985, viz 
%   http://www.dca.fee.unicamp.br/~gomide/courses/EA072/artigos/Genetic_Algorithm_TSPR_eview_Larranaga_1999.pdf

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
   % size(OldChrom)
   
    if size(OldChrom,1)==1
        NewChrom(end,:)=OldChrom(end,:);
        return;
    end
   
    [pn1,pn2]=parent_selection(OldChrom);
    p1=OldChrom(pn1,:);
    p2=OldChrom(pn2,:);
    rt1=randi(round(size(OldChrom,2)),1);
    rt2=randi(round(size(OldChrom,2)),1);
    
    r1=min(rt1,rt2);
    r2=max(rt1,rt2);
    
    ch1=zeros(size(p1));
    ch2=zeros(size(p1));
    
    ch1(r1:r2)=p1(r1:r2);
    ch2(r1:r2)=p2(r1:r2);
    
    ch1=makeChildForOrderCrossOver(r1,r2,p2,ch1);
     ch2=makeChildForOrderCrossOver(r1,r2,p1,ch2);
    
    OldChrom(pn1,:)=[];
    if pn2>pn1
        OldChrom(pn2-1,:)=[];
    else
        OldChrom(pn2,:)=[];
    end
    
    NewChrom(j,:)=ch1;
    NewChrom(j+1,:)=ch2;
end
    

end

