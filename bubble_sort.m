function sorted_array = bubble_sort(input_array)

    [n, m] = size(input_array);
    
    for i = 1 : m
        for j = i + 1 : m
            if input_array(2,i) < input_array(2,j)
                tmp = input_array(2,i);
                input_array(2,i) = input_array(2,j);
                input_array(2,j) = tmp;
                tmp1 = input_array(1,i);
                input_array(1,i) = input_array(1,j);
                input_array(1,j) = tmp1;
            end
        end
    end
    
    sorted_array = input_array;
    
                