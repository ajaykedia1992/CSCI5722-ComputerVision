%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script file is used to crop the image and shift it to target image
%
% Name : Ajay Kedia
% Course No. : CSCI 5722 S18
% Assignment No. : Homework 1
% Instructor : Prof. Ioana Fleming
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[final_image] = famousMe(outImg, target_image, original_image)
    
    [a,b] = size(outImg);
    
    final_image = target_image;
    
    
    for color = 1 : size(original_image , 3)
        for row = 1 : a
           for col = 1 : b
               if outImg(row,col) == 1
                final_image(1286 + row,1090 + col, color) = original_image(row,col,color);
               
               end
           end
        end
    end
   
   
   % xpos = 1290;
   % ypos = 989;
    
    %subImage = zeros(a,b, size(original_image , 3));
    
    
   % for color = 1 : size(original_image , 3)
    %    for row = 1 : a
     %      for col = 1 : b
      %         if outImg(row,col) == 1
       %         subImage(row,col,color) = original_image(row,col,color);
        %       else
         %           subImage(row,col,color) = NaN;
          %     end
           %end
        %end
    %end

    %figure
    %imshow(subImage)
    
    %final_image(xpos:xpos+a-1,ypos:ypos+b-1, : )= subImage ;
end