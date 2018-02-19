%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script file is used to do frosty filteration
%
% Name : Ajay Kedia
% Course No. : CSCI 5722 S18
% Assignment No. : Homework 1
% Instructor : Prof. Ioana Fleming
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function output_image = frostyFilter(current_image, m, n)
    
    [r,c,d] = size(current_image);
   
    row_padding = (m-1)/2;
    %Getting row padding size for top and bottom padding in the image 
    floor_row_padding=floor(row_padding);
    ceil_row_padding=ceil(row_padding);
    
    col_padding = (n-1)/2;
    %Getting col padding size for right and left padding in the image 
    floor_col_padding=floor(col_padding);
    ceil_col_padding=ceil(col_padding);
    
    %Creating pad array for row and column
    paddingImage=padarray(double(current_image),[floor_row_padding,floor_col_padding],nan,'pre');
    paddingImage=padarray(paddingImage,[ceil_row_padding,ceil_col_padding],nan,'post');
    
    [x,y,z]=size(paddingImage);

    newimage = zeros(r,c,d);
    
    for row = floor_row_padding+1 : x-ceil_row_padding
        for col = floor_col_padding+1 : y-ceil_col_padding
            for color= 1 : z
                subImage =  paddingImage(row-floor_row_padding:row+ceil_row_padding, col-floor_col_padding:col+ceil_col_padding, color);
                newimage(row-floor_row_padding,col-floor_col_padding,color)= subImage(randi(numel(subImage)));
            end
        end
    end
    
    output_image = uint8(newimage);

end
%{
function[newImage] = frostyFilter(current_img, n, m)

    [a,b,c] = size(current_img);
    newImage = current_img;
    for color = 1 : c
        for row = 1 : a - n
           for col = 1 : b - m
              subImage = newImage(row : row + n , col : col + m, color);
              subImage = subImage(:);
              newImage(row,col,color) = datasample(subImage, 1);
           end
        end
    end
end
%}