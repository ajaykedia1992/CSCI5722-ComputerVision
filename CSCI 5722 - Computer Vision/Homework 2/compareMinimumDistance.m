function[minimum_distance,Homography] = compareMinimumDistance(H, distance, minimum_distance, Homography)

%     for row = 1 : size(distance ,1)
%         if(minimum_distance > distance(row))
%             minimum_distance = distance(row);
%             Homography = H;
%         end
%     end
    if distance < minimum_distance
       minimum_distance = distance;
       Homography = H;
    end
    
end