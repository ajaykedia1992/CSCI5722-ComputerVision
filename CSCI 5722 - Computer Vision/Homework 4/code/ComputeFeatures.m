%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ajay Kedia
% CSCI 4830/5722
% Instructor: Fleming
% Homework 4: ComputeFeatures.m
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function features = ComputeFeatures(img)
% Compute a feature vector for all pixels of an image. You can use this
% function as a starting point to implement your own custom feature
% vectors.
%
% INPUT
% img - Array of image data of size h x w x 3.
%
% OUTPUT
% features - Array of computed features for all pixels of size h x w x f
%            such that features(i, j, :) is the feature vector (of
%            dimension f) for the pixel img(i, j, :).

    %img = double(img);
    height = size(img, 1);
    width = size(img, 2);
    features = zeros([height, width, 11]);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                                                                         %
    %                              YOUR CODE HERE                             %
    %                                                                         %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % run these features one by one to get the accuracy
    features(:, :, 1:5) = ComputePositionColorFeatures(img);
    features(:, :, 6:7) = ComputeGradientFeatures(img);
    features(:, :, 8) = ComputeEdgeDetectionFeatures(img);
    features(:, :, 9:10) = ComputeVLSiftFeatures(img);
    features(:,:, 11) = ComputeMorphologicalOpeningFeatures(img);  
end