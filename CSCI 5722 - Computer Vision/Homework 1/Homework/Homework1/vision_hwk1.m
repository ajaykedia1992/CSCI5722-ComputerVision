% This script creates a menu driven application

%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Name : Ajay Kedia
% Course No. : CSCI 5722 S18
% Assignment No. : Homework 1
% Instructor : Prof. Ioana Fleming
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;close all;clc;

% Display a menu and get a choice
choice = menu('Choose an option', 'Exit Program', 'Load Image', ...
    'Display Image', 'Mean Filter', 'Gaussian Filter', 'Frosty Filter', ...
    'Scale Nearest', 'Scale Bilinear', 'Swirl Filter','Famous Me');  % as you develop functions, add buttons for them here
 
% Choice 1 is to exit the program
while choice ~= 1
   switch choice
       case 0
           disp('Error - please choose one of the options.')
           % Display a menu and get a choice
           choice = menu('Choose an option', 'Exit Program', 'Load Image', ...
    'Display Image', 'Mean Filter', 'Gaussian Filter', 'Frosty Filter', ...
    'Scale Nearest', 'Scale Bilinear', 'Swirl Filter','Famous Me');  % as you develop functions, add buttons for them here
        case 2
           % Load an image
           image_choice = menu('Choose an image', 'lena1', 'mandril1', 'sully', 'yoda');
           switch image_choice
               case 1
                   filename = 'lena1.jpg';
               case 2
                   filename = 'mandrill1.jpg';
               case 3
                   filename = 'sully.bmp';
               case 4
                   filename = 'yoda.bmp';
               % fill in cases for all the images you plan to use
           end
           current_img = imread(filename);
       case 3
           % Display image
           figure
           imagesc(current_img);
           if size(current_img,3) == 1
               colormap gray
           end
           
       case 4
           % Mean Filter
           
           % 1. Ask the user for size of kernel
           prompt = {'Enter kernal size greater than 0'};
           title = 'Kernal size selection';
           a = inputdlg(prompt, title);
           k_size = str2num(a{1});
           current_img = double(current_img)/255; % it will help in removing colour saturation
           % 2. Call the appropriate function  
           newImage = meanFilter(current_img, k_size);
           % 3. Display the old and the new image using subplot
           figure
           subplot(2,2,1), imagesc(current_img)
           subplot(2,2,2), imagesc(newImage)
           % 4. Save resulting image.
           imwrite(newImage, 'mean_filter_result.jpg');  
       case 5
           %....
           % sigma value from user
           prompt={'Enter a positive sigma value.'};
           title='Sigma Selection';
           answer=inputdlg(prompt,title);
           sigma = str2double(answer{1});
           
           current_img = double(current_img)/255;
           
           % Gaussian filter calling
           newImage = gaussFilter(current_img, sigma); 
           
           % 3. Display original image and image returned by function. 
           figure
           subplot(2,2,1), imagesc(current_img);
           subplot(2,2,2), imagesc(newImage);
           
           % 4. Save resulting image. 
           imwrite(newImage, 'gauss_filter_result.jpg');
              
           
       case 6
           %....
           % n and m value from user
           prompt = {'Enter m:','Enter n:'};
           dlg_title = 'Frosy Filter';
           num_lines = 1;
           answer = inputdlg(prompt,dlg_title,num_lines);
           n = str2num(answer{1});
           m = str2num(answer{2});
           
           % Color saturation removel
           %current_img = double(current_img)/255;
           
            % Gaussian filter calling
           newImage = frostyFilter(current_img, n, m); 
           
           % 3. Display original image and image returned by function. 
           figure
           subplot(2,2,1), imagesc(current_img);
           subplot(2,2,2), imagesc(newImage);
           
           % 4. Save resulting image. 
           imwrite(newImage, 'frosty_filter_result.jpg');
           
       case 7
           %....
           prompt = {'Enter positive value of the factor'};
           title = 'Scale Nearest';
           answer = inputdlg(prompt,title);
           factor = str2num(answer{1});
           
           % Color saturation removel
           current_img = double(current_img)/255;
           
            % Gaussian filter calling
           newImage = scaleNearestFilter(current_img, factor); 
           
           % 3. Display original image and image returned by function. 
           figure
           subplot(2,2,1), imagesc(current_img);
           subplot(2,2,2), imagesc(newImage);
           
           % 4. Save resulting image. 
           imwrite(newImage, 'scale_nearest_filter_result.jpg');
       case 8
           %....
           prompt = {'Enter positive value of the factor'};
           title = 'Scale Bilinear';
           answer = inputdlg(prompt,title);
           factor = str2num(answer{1});
           
           % Color saturation removel
           current_img = double(current_img)/255;
           
            % Gaussian filter calling
           newImage = scaleBilinearFilter(current_img, factor); 
           
           % 3. Display original image and image returned by function. 
           figure
           subplot(2,2,1), imagesc(current_img);
           subplot(2,2,2), imagesc(newImage);
           
           % 4. Save resulting image. 
           imwrite(newImage, 'scale_bilinear_filter_result.jpg');
           
        case 9
           %....
           prompt = {'Enter factor', 'Enter ox', 'Enter oy' };
           title = 'Swirl Filter';
           num_lines = 1;
           answer = inputdlg(prompt,title,num_lines);
           factor = str2num(answer{1});
           ox = str2num(answer{2});
           oy = str2num(answer{3});
           
           % Color saturation removel
           current_img = double(current_img)/255;
           
            % Gaussian filter calling
           newImage = swirlFilter(current_img, factor, ox, oy); 
           
           % 3. Display original image and image returned by function. 
           figure
           subplot(2,2,1), imagesc(current_img);
           subplot(2,2,2), imagesc(newImage);
           
           % 4. Save resulting image. 
           imwrite(newImage, 'swirl_filter_result.jpg');
           
       case 10
           original_image = imread('original.jpg');
           target_image = imread('target.jpg');
           original_image = double(original_image)/255;
           target_image = double(target_image)/255;
           [o1,o2,o3] = size(original_image);
           [t1,t2,t3] = size(target_image);
           if (o1>t1) && (o2>t2)
               scaleBilinearFilter(target_image, 3);
           end
           %greyImage = meanFilter(original_image,3);
           %greyImage = rgb2gray(greyImage);
           %figure
           %imshow(greyImage);
           outImg = binaryMask(original_image);
           %outImg = im2bw(outImg, 0.13);       
           final_image = famousMe(outImg, target_image, original_image);
           
           figure
           subplot(2,2,1), imagesc(original_image);
           subplot(2,2,2), imagesc(target_image);
           subplot(2,2,3), imagesc(final_image);
           
           imwrite(final_image, 'famous_me_result.jpg');
       %....
   end
   % Display menu again and get user's choice
   choice = menu('Choose an option', 'Exit Program', 'Load Image', ...
    'Display Image', 'Mean Filter', 'Gaussian Filter', 'Frosty Filter', ...
    'Scale Nearest', 'Scale Bilinear', 'Swirl Filter','Famous Me'); % as you develop functions, add buttons for them here
end



