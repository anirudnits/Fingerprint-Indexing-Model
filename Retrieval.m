clc;
clear all;
close all;

%This is the portion to take the incoming photo as input.

performance_measure = zeros(80,80);

folder = 'C:\Users\hp\Desktop\New folder (7)\FingerPrint Project\Modifications\4th_sem(cluster_implementation)\dalton manas program\Database\DB4B\';
ListOfImageNames = {};
ImageFiles = dir([folder '\*.*']);
%fprintf('the length os listofimages is %d',length(ListOfImageNames));
final_images = zeros(80,1);

load ('bins.mat');
load ('dist_minutiae');
load ('index_converted');
accepted_strt = load('accepted');
accepted = accepted_strt.accepted;

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
    %f = f + 1;
end


pathname='C:\Users\hp\Desktop\New folder (7)\FingerPrint Project\Modifications\4th_sem(cluster_implementation)\dalton manas program\Database\DB4B\'; 

%L = zeros(8,length(ListOfImageNames));


%fprintf('the length of listofimages is %d',length(ListOfImageNames));
for xt =1:length(ListOfImageNames)
    index_number = zeros(1,4);
    dist = [];
    %rejectindex(1,xt)=0; % To get the index of rejected fingerprints
    namefile=ListOfImageNames{xt};
    I=imread(strcat(pathname,namefile));
    [p,q] = size(I);
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
     [out,Xc,Yc] = centralizing(I);
    
    temp = indexing(Xc,Yc,M);
    index_number(1,:) = temp;
    tmp = dist_from_core(M,Xc,Yc);
    %disp(tmp);
    dist = [dist;{tmp'}];


    index_converted_retrieval = Conversion_index(index_number);

    listed_images = zeros(1,80);

    for i = 1 : 4
        tmp = bins{index_converted_retrieval(i),i};
    % fprintf("The length of tmp is %d\n",length(tmp));
        for j = 1 : length(tmp)
             listed_images(tmp(j)) = listed_images(tmp(j)) + 1;
        end
    end

    shortlisted_images = [];

    for i = 1 : 80
        if listed_images(i) >= 2
            shortlisted_images = [shortlisted_images i];
        end
    end

    max_value = -12334;
    %final_image = 12334;

    for i = 1 : length(shortlisted_images)
        %fprintf("The short listed image is %d\n",shortlisted_images(i));
        if LCS(dist{1,1},dist_minutiae{shortlisted_images(i),1}) > max_value
            max_value = LCS(dist{1,1},dist_minutiae{shortlisted_images(i),1});
            %final_image = shortlisted_images(i);
        end
    end
   % final_images(xt) = final_image;
    
    for i = 1 : length(shortlisted_images)
        %fprintf("The fingerprint calculated is %d\n",shortlisted_images(i));
        %fprintf("The lcs value is %d\n",LCS(dist{1,1},dist_minutiae{shortlisted_images(i),1}));
        performance_measure(xt,shortlisted_images(i)) = LCS(dist{1,1},dist_minutiae{shortlisted_images(i),1}) / max_value;
    end
end
temporary = performance_measure ~= 1;
temporary1 = temporary .* performance_measure;
a = (temporary1 > 0.3) .* temporary1; %used 0.3 as a threshold and made the matrix a from performace_measure.
%b = zeros(80,10); %used to calculate the frequency of all the image_group(i.e which person's it is) of each of the photos.

% for j = 1 : 80
%     i = 1;
%     while i <= 80
%         b(j, floor(i / 8) + 1) = sum(a(j,i : i + 7));
%         i = i + 8;
%     end
% end

%[value,s] = max(b,[],2); % s is the image_group for each of the 80 images.
%count = 0;
% for i = 1 : 80
%     if s(i) == ceil(i / 8)
%         count = count + 1;
%     end
% end
%accuracy = (final_images(:) == (1 : 79)');
%fprintf("The accuracy is %f\n",(count / 80) * 100);
%This is where we apply the Minutiae_Extraction function to give us a
%matrix M containing columns having the
%X-coordinate,Y-coordinate,orientation and the tpye of all the minutiae and
%also find the core of the fingerprint.

final_performance_measure = cell(80,1);

for i = 1 : 80
    final_performance_measure{i} = vertcat(1 : 80,a(i,:));
end

sorted_final_performance_measure = cell(80,1);

for i = 1 : 80
    sorted_final_performance_measure{i} = bubble_sort(final_performance_measure{i});
end

match = 0; %denoting the number of matches.

accuracy=[1 , 27];
for k=1:27
    match = 0;
    for i = 1 : 80
        if accepted(i) == 1
            z = sorted_final_performance_measure{i};
            for j = 1 : k
                if ceil(i / 8) == ceil(z(1,j) / 8)
                    match = match + 1;
                    break;
                end
            end
        end
    end
accuracy = [accuracy,match / 53];
end;
%This is where we apply the dist_from_core and the idexing function to get
%the distance vector for all the minutiae of the image and the index_number
%matrix containing the ring number where the minutiae lie.We also apply the
%Conversion_index function in this portion too.




%This is where we find the list of all the images from the bins by calling
%the changing_index function i.e the PRIMARY HASH



%This is where we apply the LCS function(FINAL VERIFICATION) of the input image with the
%shortlisted images and get the output