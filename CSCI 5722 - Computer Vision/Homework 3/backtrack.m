%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ajay Kedia
% CSCI 4830/5722
% Instructor: Fleming
% Homework 3: backtrack.m
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [vec] = backtrack(dirMat, vec)
    [rows, cols] = size(dirMat);r = rows; c = cols; 
    while(r ~= 1 && c ~= 1)
       if dirMat(r, c) == 1. 
           disparity = abs(r-c);vec(r-1) = disparity;r = r-1;c = c-1;
       elseif dirMat(r,c) == 2
           r = r-1;
       elseif dirMat(r,c) == 3
           c = c-1;
       end       
    end
end