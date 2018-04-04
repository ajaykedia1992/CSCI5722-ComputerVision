%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ajay Kedia
% CSCI 4830/5722
% Instructor: Fleming
% Homework 4: ComputeEdgeDetectionFeatures.m
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function features = ComputeEdgeDetectionFeatures(img)
    
    height = size(img, 1);
    width = size(img, 2);
    grayImg = rgb2gray(img);
    features = zeros([height, width, 1]);
    features(:, :, 1) = edge(grayImg, 'Canny');
end