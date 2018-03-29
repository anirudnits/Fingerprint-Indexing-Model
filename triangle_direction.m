function direction = triangle_direction(M,K) %M will be a 3x4 matrix denoting the x-cordinate,
	%y-cordinate,orientation and minutiea_type of each of the 3 minutiae points that is
	%part of the triplet and K is the binarise image of the fingerprint consisting of 1's and 0's

	x1_cordinate = M(1,1);
	y1_cordinate = M(1,2);

	x2_cordinate = M(2,1);
	y2_cordinate = M(2,2);

	x3_cordinate = M(3,1);
	y3_cordinate = M(3,2);

	%(x1_cordinate,y1_cordinate) is the two cordinates for the 1st minutiae point
	%(x2_cordinate,y2_cordinate) is the two cordinates for the 2nd minutiae point
	%(x3_cordinate,y3_cordinate) is the two cordinates for the 3rd minutiae point

	neigbourhood_region1 = K(y1_cordinate - 1: y1_cordinate,x1_cordinate - 1: x1_cordinate);
	neigbourhood_region2 = K(y2_cordinate - 1: y2_cordinate,x2_cordinate - 1: x2_cordinate);
	neigbourhood_region3 = K(y3_cordinate - 1: y3_cordinate,x3_cordinate - 1: x3_cordinate);

	%neigbourhood_region1 represents the top-left rectangle in which we have to
	%check for ridge starting and  ending.
	%same for the other two

	%i have no idea why the x and y - cordinates are interchanged.

	v1 = 1;
	v2 = 1;
	v3 = 1;

	%v1,v2,v3 are from the paper.

	if(sum(sum(neigbourhood_region1)) > 1) %to check if there is more than one 1's in the neigbourhood(the one '1' will come from the minutiae itself)
		v1 = 0;
	end

	if(sum(sum(neigbourhood_region2)) > 1) %to check if there is more than one 1's in the neigbourhood(the one '1' will come from the minutiae itself)
		v2 = 0;
	end

	if(sum(sum(neigbourhood_region3)) > 1) %to check if there is more than one 1's in the neigbourhood(the one '1' will come from the minutiae itself)
		v3 = 0;
	end

	direction = 4 * v1 + 2 * v2 + v3; % 0 <= direction <= 7

end