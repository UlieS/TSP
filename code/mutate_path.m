function Mut=mutate_path(OldChrom, Prob,Dist)
%inversion mutation for path representation
NewChrom = zeros(size(OldChrom));
finalI=0;
nI=round(size(OldChrom,1)*(1-Prob));
if mod(nI,2)~=0
    nI=nI+1;
end
for i=1:1:nI
    r=randi(round(size(OldChrom,1)),1);
    
    NewChrom(i,:)=OldChrom(r,:);
    OldChrom(r,:)=[];
    finalI=i;
end

for i=1:size(OldChrom,1)
     rt1=randi(round(size(OldChrom,2)),1);
     rt2=randi(round(size(OldChrom,2)),1);
     r1=min(rt1,rt2);
     r2=max(rt1,rt2);
     
     subPath = OldChrom(i,r1:r2);
     subPath=fliplr(subPath);
     restLength=(size(OldChrom(i,:),2))-(size(subPath,2));
   
     if restLength==0
         NewChrom(finalI+i,:)=subPath;
         continue;
     end
     putSubPathIndex = randi(size(OldChrom(i,:)));
     newPath=zeros(size(OldChrom(i,:)));
     
      for j=putSubPathIndex:(putSubPathIndex+size(subPath,2)-1)
          if size(newPath,2)>=j
             newPath(j)=subPath(j-(putSubPathIndex-1));
          end
      end
  
      if size(newPath,2)<(putSubPathIndex+size(subPath,2))
          for t = 1:(putSubPathIndex+size(subPath,2)-1)-size(newPath,2)
              newPath(t)=subPath(size(newPath,2)-(putSubPathIndex-1)+t);
          end
      end
     
      for j=1:size(newPath,2)
          if newPath(j)==0
              for t=1:size(newPath,2)
                  if ~ismember(OldChrom(i,t),newPath)
                      newPath(j)=OldChrom(i,t);
                      break;
                  end
              end
          end
      end
  % fitnes=tspfunPath(OldChrom(i,:),Dist);
   % fitnes_prev=tspfunPath(newPath,Dist);
   % if fitnes_prev<fitnes
     %   newPath=OldChrom(i,:);
   % end
    NewChrom(finalI+i,:)=newPath;

end
Mut=NewChrom;
end