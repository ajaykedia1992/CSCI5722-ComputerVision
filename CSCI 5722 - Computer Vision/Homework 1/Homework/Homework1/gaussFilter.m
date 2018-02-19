%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script file is used to do convert image into fadded one using gauss
% filter
%
% Name : Ajay Kedia
% Course No. : CSCI 5722 S18
% Assignment No. : Homework 1
% Instructor : Prof. Ioana Fleming
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ newImage ] = gaussFilter( current_img, sigma)

    % display error should user enter negative sigma
    while sigma < 0
        prompt={'Error: Please enter a positive value.'};
        title='Sigma Selection';
        answer=inputdlg(prompt,title);
        sigma = str2double(answer{1});
    end
    
    % calculate kernel size.
    kernel_size = 2 * ceil(2 * sigma) + 1;
    
    % generate gaussian kernel.
    index = -floor(kernel_size/2):floor(kernel_size/2);
    [a, b] = meshGridCreation(index, index);
    kernel = exp(-(a.^2 + b.^2) / (2*sigma*sigma));
    kernel = kernel / sum(kernel(:));
    
    [l,m,n] = size(current_img);
    
    % pad current_img based on kernel size. Same as in meanFilter.m 
    paddedImg = imagePadding(current_img, kernel_size);
    
    % determing size of padded image. 
    [x,y,z] = size(paddedImg);
    
    % allocate newImage
    pad = floor(kernel_size/2);
    newImage = zeros(l,m,n);
    
    % loop through image data plane by plane, starting at image edge.
    for color = 1:z
        for row = 1 + pad:x - pad
            for column = 1 + pad:y - pad
                % index through comparable pixels current_img and multiply by
                % kernel value using .*
                accum = paddedImg(row-pad:row+pad,column-pad:column+pad,color) .* kernel;
                % sum our adjusted values and place in output.  
                newImage(row-pad,column-pad,color) = sum(accum(:));
            end
        end
    end
    
end