function index_changed = Changing_index(index_converted,max_value,accepted)

index_changed=cell(max_value,4);
for i= 1:80
    if accepted(i) == 1
        for j = 1:4
            index_changed{index_converted(i,j),j} = [index_changed{index_converted(i,j),j} i];
        end
    end
end