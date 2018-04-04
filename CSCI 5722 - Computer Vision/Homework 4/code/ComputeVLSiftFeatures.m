%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ajay Kedia
% CSCI 4830/5722
% Instructor: Fleming
% Homework 4: ComputeVLSiftFeatures.m
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function features = ComputeVLSiftFeatures(img)
    
    run('../vl/toolbox/vl_setup');
    
    img = single(rgb2gray(img));
    [f, ~] = vl_sift(img);
    
    height = size(img, 1);
    width = size(img, 2);
    features = zeros([height, width, 2]);
    
    for i = 1:size(f, 2)
        features(floor(f(2,i)), floor(f(1,i)),1) = f(3,i);
        features(floor(f(2,i)), floor(f(1,i)),2) = f(4,i);
    end
   


end