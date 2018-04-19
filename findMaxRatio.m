function [max_radius,max_ratio] = findMaxRatio(Xc,Yc,M)

max_radius1 = floor(min([293 - Xc 293 - Yc Yc Xc])); %the maximum distance of the core points from the boundaries.

max_radius = 0; %to store the radius corresponding to the maximum ratio.

max_ratio = 0; %to store the maximum ratio of Num of minutiae / radius.


for r = max_radius1 : -0.5 : 5,
    count = 0; % to count the number of minutiae inside the circle.
    
    for i = 1 : size(M,1),
        if sqrt((M(i,1)-Xc).^2 + (M(i,2)-Yc).^2) <= r,
            count = count + 1;
        end
    end
   % count = (count);
    %fprintf("Count is: %d, and radius is:  %d\n", count, r);

    if (count / r) > max_ratio,
        max_ratio = count / r;
        max_radius = r;
    end
    
end

end