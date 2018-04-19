clc;
close all;
clear all;

% to read fingerprint image
dist_minutiae = [];
folder = 'C:\Users\hp\Desktop\New folder (7)\FingerPrint Project\Modifications\4th_sem(cluster_implementation)\dalton manas program\Database\DB4B\';
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


pathname='C:\Users\hp\Desktop\New folder (7)\FingerPrint Project\Modifications\4th_sem(cluster_implementation)\dalton manas program\Database\DB4B\';

rejected_index = zeros(80,1); %to store the index of the rejected images.

for xt =1:length(ListOfImageNames)

    rejectindex(1,xt)=0; % To get the index of rejected fingerprints
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
   % M(:,5) = 0;
% to calculate the core point
    [out,Xc,Yc] = centralizing(I);
    
% % to calculate the distance from core to all perpendicular direction
% % it is used to reject unwanted fingerprint input     
      d1=abs(q-Yc);
     d2=abs(1-Xc);
     d3=abs(1-Yc);
     d4=abs(p-Xc);
     
     if min(d1,min(d2,min(d3,d4))) < 55
           rejected_index(xt) = 1; %store 1 if the image is rejected.
     end
     
end
