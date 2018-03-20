function [TYPE] = triangle_type(M)  
%Here the input M will be a 3x4 matrix with the three rows denoting the three vertex
% of the minutiae triangles and for each vertex there will four features(in order) : 
%the x-coordinate, the y-coordinate, the orientation, the type : 1 for termination and
% 0 for bifurcation

	 p1 = 0;
	 p2 = 0;
	 p3 = 0;

	 if M(1,4) == 1
	 	p1 = 1;

	 if M(2,4) == 1
	 	p2 = 1;

	 if M(3,4) == 1
	 	p3 = 1;

	 TYPE = 4 * p1 + 2 * p2 + p3; %by using the formula described in the paper

	 return TYPE  % 0<= TYPE <= 7