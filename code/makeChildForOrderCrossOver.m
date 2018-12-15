function child = makeChildForOrderCrossOver(r1,r2,p,ch)

ii=1;
    for i=r2:size(p,2)
        for jj=r2:size(p,2)
            if ~ismember(p(jj),ch)
                ch(i)=p(jj);
                ii=i;
                break;
            end
        end
        
    end
    
    if ii<size(p,2)+1
        for i=ii:size(p,2)
            for jj=1:size(p,2)
               
                if ~ismember(p(jj),ch)
                    ch(i)=p(jj);
                    break;
                end
            end
    
        end
    end
    
    
    
    for i=1:r1
        for jj=1:size(p,2)
             if ~ismember(p(jj),ch)
                ch(i)=p(jj);
                break;
             end
        end
    end
child=ch;
end