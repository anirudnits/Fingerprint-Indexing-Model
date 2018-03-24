function ANGLE = min_med_angles(M)
%Here the input M will be a 3x4 matrix with the three rows denoting the three vertex
% of the minutiae triangles and for each vertex there will four features(in order) : 
%the x-coordinate, the y-coordinate, the orientation, the type : 1 for termination and
% 0 for bifurcation
    B = [];
    a = [];
    
    for i = 1:3
        for j = 1:3
            if i~=j
                a = [a ; M(j,1) - M(i,1), M(j,2) - M(i,2)];
            end
        end 
        B = [B , acos(dot(a(2*i-1,:),a(2*i,:))/(sqrt(a(2*i-1,1)^2 + a(2*i-1,2)^2)*sqrt(a(2*i,1)^2 + a(2*i,2)^2)))]; %Calculating the angle using dot product.
    end
    
    B = sort(B);    %sorting the angles.
    ANGLE =[B(1) , B(2)];   %taking only the smallest and medium angles
