%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script file is used to scale the image using sclare bilinear filter
%
% Name : Ajay Kedia
% Course No. : CSCI 5722 S18
% Assignment No. : Homework 1
% Instructor : Prof. Ioana Fleming
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[newImage] = scaleBilinearFilter(current_img, factor)
     while factor < 0
           prompt = {'Error : Enter positive value of the factor'};
           title = 'Scale Bilinear';
           answer = inputdlg(prompt,title);
           factor = str2num(answer{1});
     end
    [r, c, a] = size(current_img);
   
    r_out = floor(factor*r);
    c_cout = floor(factor*c);
    scale = factor;
    outImg = zeros(r_out,c_cout,a);
    for row = 1:r_out
       x1 = floor(row/scale);
       x2 = ceil(row/scale);
       if x1 == 0
           x1 = 1;
       end
       x = rem(row/scale,1);
       for col = 1:c_cout
           y1 = floor(col/scale);
           y2 = ceil(col/scale);
           if y1 == 0
               y1 = 1;
           end
           c10 = current_img(x1,y1,:);
           c00 = current_img(x2,y1,:);
           c11 = current_img(x1,y2,:);
           c01 = current_img(x2,y2,:);
           y = rem(col/scale,1);
           tr = (c11*y)+(c10*(1-y));
           br = (c01*y)+(c00*(1-y));
           outImg(row,col,:) = (tr*x)+(br*(1-x));
       end
   end
   newImage = outImg;
end