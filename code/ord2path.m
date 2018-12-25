function path = ord2path(Ord);

    path = zeros(1,size(Ord,2));
    L = (1:size(Ord,2));
    for t=1:length(Ord);
        city=Ord(t);
        l=L(city);
        L(city)=[];
        path(t)=l;
    end
    