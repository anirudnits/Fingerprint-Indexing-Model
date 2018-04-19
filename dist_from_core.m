function dist_vector = dist_from_core(M,Xc,Yc)

dist_vector = sqrt((M(:,1) - Xc) .^ 2 + (M(:,2) - Yc) .^ 2);

dist_vector = sort(dist_vector);