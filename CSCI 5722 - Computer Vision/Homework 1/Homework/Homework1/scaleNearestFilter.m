%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script file is used to scale the image using sclare nearest filter
%
% Name : Ajay Kedia
% Course No. : CSCI 5722 S18
% Assignment No. : Homework 1
% Instructor : Prof. Ioana Fleming
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[newImage] = scaleNearestFilter(current_img, factor)
    while factor < 0
           prompt = {'Error : Enter positive value of the factor'};
           title = 'Scale Nearest';
           answer = inputdlg(prompt,title);
           factor = str2num(answer{1});
    end

    [a,b,c] = size(current_img);
    
    newImage = zeros(a*factor,b*factor, c);
    
    for row = 1:factor*a
        for col = 1:factor*b
            %Scaling row value by factor
            l = round((row-1)*(a-1)/(a*factor-1)+1);
            %Scaling col value by factor
            m = round((col-1)*(b-1)/(b*factor-1)+1);
            newImage(row,col,:) = current_img(l,m,:);
        end      
    end
end