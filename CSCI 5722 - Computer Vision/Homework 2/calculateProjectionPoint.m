function[projection_point] = calculateProjectionPoint(H, image_coords)
    coords1 = image_coords';
    q =H*[coords1; ones(1, size(coords1,2))];
    p = q(3,:);
    % normalize back to x,y coords
    projection_point = [q(1,:)./p; q(2,:)./p]; 
end