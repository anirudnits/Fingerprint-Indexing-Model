function x=DistHamming(data1,data2)
    x=0;
    for i=1:length(data1)
        if data1(1,i)==data2(1,i)
        else
            x=x+1;
        end
    end
end