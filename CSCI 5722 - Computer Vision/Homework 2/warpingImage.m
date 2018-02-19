%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ajay Kedia
% CSCI 4830/5722
% Instructor: Fleming
% Homework 2: vision_hwk2
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [warpedImg] = warpingImage(image, H)
    [m,n,~] = size(image); 
    corners = H*[[1;1;1], [1;m;1], [n;m;1] [n;1;1]];
    % transform homogenous coords back to (x,y).
    corners(1,:) = corners(1,:)./corners(3,:);
    corners(2,:) = corners(2,:)./corners(3,:);
    
    % calculate max and min of x and y values after transformation. Round
    % to pixel values. obtain coordinates by using meshgrid function.
     boundbox = [
      ceil(min(corners(1,:)));
      ceil(max(corners(1,:)));
      ceil(min(corners(2,:)));
      ceil(max(corners(2,:)));
      ];
  
    % obtain coordinates by which we can meshgrid out output coordinate
    % system.
    x_min = boundbox(1);
    x_max = boundbox(2);
    y_min = boundbox(3);
    y_max = boundbox(4);
    [xi, yi] = meshgrid(x_min:x_max, y_min:y_max);
    
    % take inverse of Homography matrix for inverse mapping. 
    h = inv(H); 
    % homogenous and converting back to (x,y) after translation.
    xx = (h(1,1)*xi+h(1,2)*yi+h(1,3))./(h(3,1)*xi+h(3,2)*yi+h(3,3));
    yy = (h(2,1)*xi+h(2,2)*yi+h(2,3))./(h(3,1)*xi+h(3,2)*yi+h(3,3));
    
    % solve for warpedImage pixels using interp2. 
    warpedImg(:,:,1) = (interp2(image(:,:,1),xx,yy, 'bilinear',0));
    warpedImg(:,:,2) = (interp2(image(:,:,2),xx,yy, 'bilinear',0));
    warpedImg(:,:,3) = (interp2(image(:,:,3),xx,yy, 'bilinear',0));
end