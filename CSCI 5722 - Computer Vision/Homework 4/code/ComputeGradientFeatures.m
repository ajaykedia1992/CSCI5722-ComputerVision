%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ajay Kedia
% CSCI 4830/5722
% Instructor: Fleming
% Homework 4: ComputeGradientFeatures.m
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function features = ComputeGradientFeatures(img)
    height = size(img, 1);
    width = size(img, 2);
    grayImg = rgb2gray(img);
    features = zeros([height, width, 2]);
    [mag, dir] = imgradient(grayImg, 'prewitt');
    features(:, :, 1) = mag;
    features(:, :, 2) = dir;
end