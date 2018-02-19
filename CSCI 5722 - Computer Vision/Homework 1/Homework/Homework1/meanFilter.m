%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file is used to do mean filteration. It supports both even and odd
% value of kernal.
%
% Name : Ajay Kedia
% Course No. : CSCI 5722 S18
% Assignment No. : Homework 1
% Instructor : Prof. Ioana Fleming
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[newImage] = meanFilter(current_img, k_size)
    
    while(k_size<1)
       prompt = {'Error: kernal size can not be less than 1' };
       title = 'Kernal size selection';
       a = inputdlg(prompt, title);
       k_size = str2num(a{1});
    end

    [a,b,c] = size(current_img);
    padImage = imagePadding(current_img, k_size);
    [l,m,n] = size(padImage);
    pad = floor((k_size - 1)/2);
    pad1 = ceil((k_size - 1)/2);
    newImage = zeros(a,b,c);
    
    for color = 1:n
       for row = 1 + pad : l-pad1
          for column = 1 + pad : m - pad1
             subImg  = padImage(row - pad : row + pad1,column - pad : column + pad1,color);
             newImage(row - pad, column - pad, color) = sum(subImg(:))/(k_size * k_size);   
          end
       end
    end 
end