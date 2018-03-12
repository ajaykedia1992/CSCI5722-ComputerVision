%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ajay Kedia
% CSCI 4830/5722
% Instructor: Fleming
% Homework 3: DepthEstimationFromStereoVideoExample.m
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plot = SyntheticStereoSequences(disparityMap,disparityMap_SSD_1,disparityMap_SSD_5,disparityMap_SSD_11,disparityMap_NCC_3,disparityMap_NCC_5,disparityMap_NCC_7)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %               Using SSD Algorithm
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [x,z] = ndgrid(1:size(disparityMap_SSD_1,2),1:size(disparityMap_SSD_1,1));
    [p,q] = ndgrid(1:size(disparityMap_SSD_5,2),1:size(disparityMap_SSD_5,1));
    [r,s] = ndgrid(1:size(disparityMap_SSD_11,2),1:size(disparityMap_SSD_11,1));
    [a,b] = ndgrid(1:size(disparityMap,2),1:size(disparityMap,1));
    figure
    subplot(2,2,1)
    plot3(a,disparityMap.',b)
    title('Disparity Map MATLAB')
    subplot(2,2,2)
    plot3(x,disparityMap_SSD_1.',z)
    title('Disparity Using SSD (1x1)')
    subplot(2,2,3)
    plot3(p,disparityMap_SSD_5.',q)
    title('Disparity Using SSD (5x5)')
    subplot(2,2,4)
    plot3(r,disparityMap_SSD_11.',s)
    title('Disparity Using SSD (11x11)')
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %               Using NCC Algorithm
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [x,z] = ndgrid(1:size(disparityMap_NCC_3,2),1:size(disparityMap_NCC_3,1));
    [p,q] = ndgrid(1:size(disparityMap_NCC_5,2),1:size(disparityMap_NCC_5,1));
    [r,s] = ndgrid(1:size(disparityMap_NCC_7,2),1:size(disparityMap_NCC_7,1));
    figure
    subplot(2,2,1)
    plot3(a,disparityMap.',b)
    title('Disparity Map MATLAB')
    subplot(2,2,2)
    plot3(x,disparityMap_NCC_3.',z)
    title('Disparity Using NCC (3x3)')
    subplot(2,2,3)
    plot3(p,disparityMap_NCC_5.',q)
    title('Disparity Using NCC (5x5)')
    subplot(2,2,4)
    plot3(r,disparityMap_NCC_7.',s)
    title('Disparity Using NCC (7x7)')
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %               Task 6 part 2
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    diff_SSD_1 = disparityMap_SSD_1 - disparityMap;
    diff_SSD_2 = disparityMap_SSD_5 - disparityMap;
    diff_SSD_3 = disparityMap_SSD_11 - disparityMap;
    [x,z] = ndgrid(1:size(diff_SSD_1,2),1:size(diff_SSD_1,1));
    [p,q] = ndgrid(1:size(diff_SSD_2,2),1:size(diff_SSD_2,1));
    [r,s] = ndgrid(1:size(diff_SSD_3,2),1:size(diff_SSD_3,1));
    figure
    subplot(2,2,1)
    plot3(x,diff_SSD_1.',z)
    title('Disparity Map Errors Using SSD (1x1)')
    subplot(2,2,2)
    plot3(p,diff_SSD_2.',q)
    title('Disparity Map Errors Using SSD (5x5)')
    subplot(2,2,3)
    plot3(r,diff_SSD_3.',s)
    title('Disparity Map Errors Using SSD (11x11)')
    
    diff_NCC_1 = disparityMap_NCC_3 - disparityMap;
    diff_NCC_2 = disparityMap_NCC_5 - disparityMap;
    diff_NCC_3 = disparityMap_NCC_7 - disparityMap;
    [x,z] = ndgrid(1:size(diff_NCC_1,2),1:size(diff_NCC_1,1));
    [p,q] = ndgrid(1:size(diff_NCC_2,2),1:size(diff_NCC_2,1));
    [r,s] = ndgrid(1:size(diff_NCC_3,2),1:size(diff_NCC_3,1));
    figure
    subplot(2,2,1)
    plot3(x,diff_NCC_1.',z)
    title('Disparity Map Errors Using NCC (3x3)')
    subplot(2,2,2)
    plot3(p,diff_NCC_2.',q)
    title('Disparity Map Errors Using NCC (5x5)')
    subplot(2,2,3)
    plot3(r,diff_NCC_3.',s)
    title('Disparity Map Errors Using NCC (7x7)')
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %               Task 6 part 3
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    figure
    subplot(2,3,1)
    hist(double(reshape(diff_SSD_1,[],1)))
    title('Disparity Diff Histogram Using SSD (1x1)')
    xtickangle(90)
    subplot(2,3,2)
    hist(double(reshape(diff_SSD_2,[],1)))
    title('Disparity Diff Histogram Using SSD (5x5)')
    xtickangle(90)
    subplot(2,3,3)
    hist(double(reshape(diff_SSD_3,[],1)))
    title('Disparity Diff Histogram Using SSD (11x11)')
    xtickangle(90)    
    
    subplot(2,3,4)
    hist(double(reshape(diff_NCC_1,[],1)))
    title('Disparity Diff Histogram Using NCC (3x3)')
    xtickangle(90)
    subplot(2,3,5)
    hist(double(reshape(diff_NCC_2,[],1)))
    title('Disparity Diff Histogram Using NCC (5x5)')
    xtickangle(90)
    subplot(2,3,6)
    hist(double(reshape(diff_NCC_2,[],1)))
    title('Disparity Diff Histogram Using NCC (7x7)')
    xtickangle(90)
    
    plot = 1;
end