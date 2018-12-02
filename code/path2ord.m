

function Ord = path2ord(Path);
    Ord = zeros(1,size(Path,2));
    L = (1:size(Path,2));
    for t=1:numel(Path)
        city = Path(t);
        idx = find(L==city);
        L(idx)=[];
        Ord(1,t)=idx;
    end