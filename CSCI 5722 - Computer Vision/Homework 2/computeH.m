function[Homography] = computeH(coordinate_points,trials)
    
    %select random four rows from coordinate_points without replacement
    minimum_distance = 10000;
    Homography = zeros(3,3);
    for iterations = 1:trials
        index = randsample(1:length(coordinate_points), 4, false);
        random_four_coords = coordinate_points(index,:);

        reference_coords = random_four_coords(:,[1,2]);
        image_coords = random_four_coords(:,[3,4]);
       
        % determine size of corresponding points.
        n = size(image_coords, 1);
        % allocate coefficient matrix
        A = zeros(2*n, 9);
        
        for i = 1:n
            x1 = image_coords(i, 1);
            y1 = image_coords(i, 2);
            x2 = reference_coords(i,1);
            y2 = reference_coords(i,2);
            
%             A(2*i-1:2*i, :) = [0  0  0  -x1  -y1  -1  y2*x1  y2*y1  1
%                         x1  y1  1  0  0  0  -x2*x1  -x2*y1  -x2];  
                    
            A(2*i-1:2*i, :) =  [x1 y1 1  0  0  0 -x1*x2 -y1*x2 -x2
                       0  0  0  x1 y1 1 -x1*y2 -y1*y2 -y2];        
        end
        
        % Calculating SVD Value
        
        [~, ~, V] = svd(A);
        
        V_vector = V(:,9);
        
        H = reshape(V_vector, 3, 3)';
        
        projection_point = calculateProjectionPoint(H, coordinate_points(:,[3,4]));
        
        distance = ecludianDistance(coordinate_points(:,[1,2]), projection_point);

        [minimum_distance,Homography] = compareMinimumDistance(H, distance, minimum_distance, Homography);
        
    end
    
end