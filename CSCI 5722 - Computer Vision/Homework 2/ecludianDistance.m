function distance = ecludianDistance(reference_coords, projection_point)

%distance = zeros(size(reference_coords,1),1);
projection_point = projection_point.';
distance = 0;
for  row = 1 : size(projection_point,1)
   
        x = reference_coords(row,:);

        c = projection_point(row,:);

        dimx = size(x,2);
        dimc = size(c,2);
        if dimx ~= dimc
            error('Data dimension does not match dimension of centres')
        end
        distance = distance + sqrt((x(1) - c(1)).^2 + (x(2) - c(2)).^2);

end 