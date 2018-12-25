function [p1,p2] = parent_selection(OldChrom)
p1=-1; p2=-1;
if size(OldChrom,1)==2
    p1=1;
    p2=2;
    return;
end
while p1==p2
    p1=randi(size(OldChrom,1),1); 
    p2=randi(size(OldChrom,1),1);
end