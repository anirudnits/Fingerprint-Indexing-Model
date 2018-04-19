clc;
close all;
clear all;

% to read fingerprint image
dist_minutiae = [];
folder = 'H:\Project\Database\DB1B';
ListOfImageNames = {};
ImageFiles = dir([folder '\*.*']); % Get all files.
for Index = 1:length(ImageFiles)
	baseFileName = ImageFiles(Index).name;
	[folder, name, extension] = fileparts(baseFileName);
	extension = upper(extension);
	% Let's save just those we are interested in:
	switch lower(extension)
	case {'.png', '.bmp', '.jpg', '.tif', '.avi'}
		% Allow only PNG, TIF, JPG, or BMP images
		ListOfImageNames = [ListOfImageNames baseFileName];
	otherwise
	end
end


pathname='H:\Project\Database\DB1B\';

for xt =1:length(ListOfImageNames)

   
    namefile=ListOfImageNames{xt};
    I=imread(strcat(pathname,namefile));
    [p q] = size(I);
    

    % to find the minutiae points
    [Minutia] = Minutuae_Extraction(I);

    % to remove the unwanted values. Example value zero in the coordinate 
    count = 1;
    M = [];
    for i = 1:length(Minutia)
        if Minutia(i,1)~=0&&Minutia(i,2)~=0
            M(count,:) = Minutia(i,:);
            count = count + 1;
        end
    end
   
    
    
    % extraction of non colinier points
    
    for itr=1:length(Minutia)
        for itr1=itr+1:length(Minutia) 
            for itr2=itr1+1: length(Minutia)
                if ((Minutia(itr,1)==Minutia(itr+1,1)==Minutia(itr+2,1))||(Minutia(itr,2)==Minutia(itr+1,2)==Minutia(itr+2,2)))
                    continue;
                else
                    non_colinear=Minutia([itr,itr1,itr2],:);
                    
                    m=min_med_angles(non_colinear);
                end
            end
        end
    end
%     min_med_angles(M);
%     handedness(A);
%     triangle_type(M);
%     triangle_direction(M,K)
    
end

