%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script file is used to image padding in image.
%
% Name : Ajay Kedia
% Course No. : CSCI 5722 S18
% Assignment No. : Homework 1
% Instructor : Prof. Ioana Fleming
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[padImage] = imagePadding(current_img, k_size)

    [a,b,c] = size(current_img);
    pad = floor((k_size - 1)/2);
    pad1 = ceil((k_size - 1)/2);
    % left and right padding
    leftSide = NaN(a,pad,c);
    rightSide = NaN(a,pad1,c);
    padImage = horzcat(current_img, leftSide);
    padImage = horzcat(rightSide, padImage);
    
    % top and bottom padding
    
    [l,m,n] = size(padImage);
    
    top = NaN(pad, m, c);
    bottom = NaN(pad1, m, c);
    
    padImage = vertcat(padImage, top);
    padImage = vertcat(bottom, padImage);
end