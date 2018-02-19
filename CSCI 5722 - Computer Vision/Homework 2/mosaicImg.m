%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ajay Kedia
% CSCI 4830/5722
% Instructor: Fleming
% Homework 2: vision_hwk2
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [mosaic] = mosaicImg(reference, image2, H)

    % compute corners of reference
    r_min_row = 1;
    r_min_col = 1;
    r_max_row = size(reference,1);
    r_max_col = size(reference,2);
    
    % compute transformed corners of image2.
    [row,col,~] = size(image2);
    
    % compute the out boundaries of the transformed corners. 
    corners = H\[[1;1;1], [1;row;1], [col;row;1] [col;1;1]];
    % transform our homogenous coords back to (x,y).
    corners(1,:) = corners(1,:)./corners(3,:);
    corners(2,:) = corners(2,:)./corners(3,:);
  
    boundbox = [
     ceil(min(corners(1,:)));
     ceil(max(corners(1,:)));
     ceil(min(corners(2,:)));
     ceil(max(corners(2,:)));
     ];
    % obtain coordinates by which we can meshgrid out output coordinate
    % system.
    i_min_row = boundbox(1);
    i_max_row = boundbox(2);
    i_min_col = boundbox(3);
    i_max_col = boundbox(4);
    
    min_row = floor(min(i_min_row, r_min_row));
    max_row = floor(max(i_max_row, r_max_row));
    min_col = ceil(min(i_min_col, r_min_col));
    max_col = ceil(max(i_max_col, r_max_col));
    
    % determine height and width of output image. 
    width = max_row-min_row;
    height = max_col-min_col;
    fprintf('height mosaic: %d width mosaic: %d\n', height, width);
    
    % paste reference image into boundary box based on calculated offsets.
    [~,c,~] = size(reference);
    
    % calculate offsets to place reference
    r_offset = 1 - min_col;
    c_offset = width-c;
    fprintf('row_offset: %d\n', r_offset);
    fprintf('col_offset: %d\n', c_offset);
    
    % create transform matrix for image placement in output matrix.
    T = [1 0 -c_offset;0 1 min_col;0 0 1];
    
    % warp reference image into panorama using identity homography.
    mosaic1 = warpImage(reference, eye(1), min_row, max_row, min_col, max_col, T);
    imshow(mosaic1);
    
    % interpolate remaining pixels from warped image2 into different
    % panorma image frame.
    mosaic2 = warpImage(image2, H, min_row, max_row, min_col, max_col, T);
    imshow(mosaic2);
    mosaic = max(mosaic1, mosaic2);

end