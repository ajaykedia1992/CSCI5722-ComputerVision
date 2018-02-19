%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ajay Kedia
% CSCI 4830/5722
% Instructor: Fleming
% Homework 2: getPoints
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[coordinate_points] = getPoints(coordinate_points, inImg1, inImg2, point_selection, start_index_img1, end_index_img1, start_index_img2, end_index_img2)
  
    for i = 1:point_selection
        % first Image
        if size(inImg1,1) ~= 0 && size(inImg1,2) ~= 0
         figure(i), imshow(inImg1);
         hold on
         [x,y] = ginput(1);
         coordinate_points(i,start_index_img1) = x;
         coordinate_points(i,end_index_img1) = y;
         hold off
         close(figure(i));
        end
         % second Image
        if size(inImg2,1) ~= 0 && size(inImg2,2) ~= 0
         figure(i), imshow(inImg2);
         hold on
         [x,y] = ginput(1);
         coordinate_points(i,start_index_img2) = x;
         coordinate_points(i,end_index_img2) = y;
         hold off
         close(figure(i));
        end
    end
end