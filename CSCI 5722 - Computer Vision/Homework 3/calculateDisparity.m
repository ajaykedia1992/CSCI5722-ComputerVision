%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ajay Kedia
% CSCI 4830/5722
% Instructor: Fleming
% Homework 3: calculateDisparity.m
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [disparityMap] = calculateDisparity(leftImage, rightImage)

    leftImage = im2double(leftImage);rightImage = im2double(rightImage);
    [rows, cols] = size(leftImage);disparityMap = zeros(rows, cols);occ = 0.01;
    for row = 1:rows        
        disparityMap(row,:) = getDisparity(leftImage(row,:), rightImage(row,:), occ);
    end

end