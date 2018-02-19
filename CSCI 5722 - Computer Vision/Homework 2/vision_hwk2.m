%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ajay Kedia
% CSCI 4830/5722
% Instructor: Fleming
% Homework 2: vision_hwk2
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Create Driver program

clear all; close all; clc;

choice = menu("Choose an option", "Exit Program","Load Image", "Compute Homography", "Image Stitch and Mosaic","Image Frame");

while(choice ~= 1)
   switch choice
       case 0
           disp('Error - please choose one of the options');
           choice = menu("Choose an option", "Exit Program","Load Image", "Compute Homography", "Image Stitch and Mosaic","Image Frame");
       case 2
           image_choice_1 = menu('choose one of the image','uttower', 'home','outdoor');
           switch image_choice_1
               case 1
                   filename = 'uttower1.jpg';
                   index1 = 1;
               case 2
                   filename = 'home1.jpg';
                   index1 = 2;
               case 3
                   filename = '1.jpg';
                   index1 = 3;
           end
           image_read = imread(filename);
           reference_image_1 = im2double(image_read);
           a = size(reference_image_1,1);
           b = size(reference_image_1,2);
           if(a>1000 || b>2000)
               reference_image_1 = imresize(reference_image_1,0.25);  
           end
           
           image_choice_2 = menu('choose second image : must have the same name','uttower','home','outdoor');
           switch image_choice_2
               case 1
                   filename = 'uttower2.jpg';
                   index2 = 1;
               case 2
                   filename = 'home2.jpg';
                   index2 = 2;
               case 3
                   filename = '2.jpg';
                   index2 = 3;
           end
           image_read = imread(filename);
           reference_image_2 = im2double(image_read);
           
           a = size(reference_image_2,1);
           b = size(reference_image_2,2);
           if(a>1000 || b>2000)
               reference_image_2 = imresize(reference_image_2,0.25);
           end
           
       case 3
           input_choice = menu('Choose an option','Pick new data','Load uttower old data','Load home old data','Load outdoor old data','Load Recent saved old data');
           switch input_choice 
               
               case 1
                   prompt = {'Enter a number greater than or equal to 10 to select point on the image'};
                   title = 'Enter section of point #';
                   answer = inputdlg(prompt,title);
                   point_selection = str2num(answer{1});    
                   coordinate_points = zeros(point_selection, 4);
                   coordinate_points = getPoints(coordinate_points, reference_image_1, reference_image_2, point_selection , 1, 2, 3, 4);
                   %coordinate_points = getPoints(coordinate_points, reference_image_2, point_selection, 3, 4);
                   if index1 == 1 && index2 == 1
                       save('uttowerCoords.mat','coordinate_points');
                       matfile('uttowerCoords.mat');
                       fprintf('coords = %d\n', coordinate_points);
                   elseif index1 == 2 && index2 == 2
                       save('homeCoords.mat','coordinate_points');
                       matfile('homeCoords.mat');
                       fprintf('coords = %d\n', coordinate_points); 
                   elseif index1 == 3 && index2 == 3
                       save('outdoorCoords.mat','coordinate_points');
                       matfile('outdoorCoords.mat');
                       fprintf('coords = %d\n', coordinate_points);
                   else
                       save('savedCoords.mat','coordinate_points');
                       matfile('savedCoords.mat');
                       fprintf('coords = %d\n', coordinate_points);
                   end
           
               case 2
                   example = matfile('uttowerCoords.mat');
                   coordinate_points = example.coordinate_points;
                   fprintf('coords = %d\n', coordinate_points);
               case 3
                   example = matfile('homeCoords.mat');
                   coordinate_points = example.coordinate_points;
                   fprintf('coords = %d\n', coordinate_points);
               case 4
                   example = matfile('outdoorCoords.mat');
                   coordinate_points = example.coordinate_points;
                   fprintf('coords = %d\n', coordinate_points); 
               case 5
                   example = matfile('savedCoords.mat');
                   coordinate_points = example.coordinate_points;
                   fprintf('coords = %d\n', coordinate_points);
           end     
            trials = 20;
            H = computeH(coordinate_points,trials);
            
        case 4
            
           warp = warpingImage(reference_image_2, H);
           
           % display figure of warped image. 
            %figure ('Name','Warped Image','NumberTitle','off'), imshow(warp);
            % call appropriate mosaic function
            mosaic = mosaicImg(reference_image_1, reference_image_2, H);
            
            % display figure of mosaiced images. 
            figure('Name', 'Image Mosaic', 'NumberTitle', 'off'), imshow(mosaic);
            
            % write image mosaic to file for submission.
            imwrite(mosaic, 'mosaic.JPG');
            
        case 5
            destination = imread('billboard.jpg');
            source = imread('Siberian.jpeg');
            
            % convert to double precision to allow imshow
            dest = im2double(destination);
            source = imresize(source, 0.25);
            src = im2double(source);
            
            % compute size destination image for further use.
            [hd,wd,~] = size(dest);
            
            % our source coordinates will be the corners of the source
            % image.
            [h,w,~] = size(src);
            
            coordinates = [0 0; w 0; w h; 0 h];
            
            a = zeros(4,2);
            
            c = horzcat(coordinates,a);

            c = getPoints(c,'', dest, 4, 1,2,3,4);
            
            % compute homgraphy to transform source coords to dest coords. 
            
            H = computeH(c,1);
            
            % allocate outImg.
            frame = zeros(hd, wd, 3);
            
            % add destination to outImg
            frame = frame + dest;
            
            % loop through the src image and calculate its respective
            % coordiantes using inverse homography and paste it in the
            % selected region of the destination
            for i = 1:h
                for j = 1:w
                    % convert to homogenous points
                    coords = [i; j; 1];
                    % transform coordinates using homography matrix
                    coords = inv(H) * coords;
                    % normalize coordinates back
                    coords(1) = coords(1)/coords(3);
                    coords(2) = coords(2)/coords(3);
                    
                    x = coords(1);
                    y = coords(2);
                    % ensure we are in range of destination image.
                    if (x>=1 && x<=w) && (y>=1 && y<=h)
                        % nearest sample coordinates to fill billboard
                        frame(round(y),round(x),:) = src(j,i,:);
                    end
                end
            end
            
            % display completed image.
            figure('Name', 'warped image', 'NumberTitle', 'off'), imshow(frame);
            
            % write image to file for submission.
            imwrite(frame, 'Frame.JPG');     
            
   end
   choice = menu("Choose an option", "Exit Program","Load Image", "Compute Homography", "Image Stitch and Mosaic","Image Frame");
end