function [ side ] = max_side(M)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%Here the input M will be a 3x4 matrix with the three rows denoting the three vertex
% of the minutiae triangles and for each vertex there will four features(in order) : 
%the x-coordinate, the y-coordinate, the orientation, the type : 1 for termination and
% 0 for bifurcation

    %max side calculation using euclid distance
    euclidside=[];
    euclidside(1)=(((M(1,1)-M(2,1))^2)+((M(1,2)-M(2,2))^2))^(1/2);
    euclidside(2)=(((M(1,1)-M(3,1))^2)+((M(1,2)-M(3,2))^2))^(1/2);
    euclidside(3)=(((M(2,1)-M(3,1))^2)+((M(3,2)-M(2,2))^2))^(1/2);
    side=max(euclidside);
end

