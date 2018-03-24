function HANDED = handedness(A)
%Here the input M will be a 3x4 matrix with the three rows denoting the three vertex
% of the minutiae triangles and for each vertex there will four features(in order) : 
%the x-coordinate, the y-coordinate, the orientation, the type : 1 for termination and
% 0 for bifurcation

    a = [A(2,1)-A(1,1) , A(2,2)-A(1,2)];    %finding Z21
    b = [A(3,1)-A(2,1) , A(3,2)-A(2,2)];    %finding Z32
    
    cross_product = cross(a,b);     %finding cross product
    
    HANDED = sign(cross_product);   %finding sign of the cross product