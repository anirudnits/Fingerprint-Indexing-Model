function r = indexing(Xc,Yc,M)

n = 4; %number of rings
radius = 12.5; %radius of each ring
r = zeros(4,1); %vector to store the number of minutiae in each ring

for i = 1 : size(M,1),
   % fprintf("The distance of  %d  th minutae is %d \n", i,sqrt((M(i,1) - Xc)^2 + (M(i,2) - Yc)^2));
    for j = 0 : n - 1,
        if j * radius <= sqrt((M(i,1) - Xc)^2 + (M(i,2) - Yc)^2) && sqrt((M(i,1) - Xc)^2 + (M(i,2) - Yc)^2) < (j + 1)*radius,
            r(j + 1) = r(j + 1) + 1;
            %fprintf("%d th ring is selected\n",j+1);
        end
    end
end

