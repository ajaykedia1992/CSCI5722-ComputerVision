%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script file is used to convert image at gray scale
%
% Name : Ajay Kedia
% Course No. : CSCI 5722 S18
% Assignment No. : Homework 1
% Instructor : Prof. Ioana Fleming
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[newImage] = binaryMask(inImg)
    
    [a,b,c] = size(inImg);

    %outImg = 0.299*inImg(:,:,1)+0.587*inImg(:,:,2)+0.114*inImg(:,:,3);  
     R = inImg(:, :, 1);
     G = inImg(:, :, 2);
     B = inImg(:, :, 3);
     newImage = uint8(zeros(a, b));
        
     for x=1:size(inImg,1)
        for y=1:size(inImg,2)
            newImage(x,y) = (R(x,y)*0.299)+(G(x,y)*0.5887)+(B(x,y)*0.114);
            if newImage(x,y)<0.9
                newImage(x,y) = 0;
            else
                newImage(x,y) = 1;
            end
        end
     end  
     
end