%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ajay Kedia
% CSCI 4830/5722
% Instructor: Fleming
% Homework 4: NormalizeFeatures.m
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function featuresNorm = NormalizeFeatures(features)
% Normalize image features to have zero mean and unit variance. This
% normalization can cause k-means clustering to perform better.
%
% INPUTS
% features - An array of features for an image. features(i, j, :) is the
%            feature vector for the pixel img(i, j, :) of the original
%            image.
%
% OUTPUTS
% featuresNorm - An array of the same shape as features where each feature
%                has been normalized to have zero mean and unit variance.

    features = double(features);
    featuresNorm = features;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                                YOUR CODE HERE:                               %
%                                                                              %
%                HINT: The functions mean and std may be useful                %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [x,y,z] = size(features);
    number=x*y;
    third_dimension=z;
    
    temp=sum(sum(features,1),2);
    temp=temp(:);
    a=temp/number;
    temp_zeros=zeros(size(features));
    for i=1:third_dimension
        temp_zeros(:,:,i)=a(i);
    end

    temp_var=sum(sum((features-temp_zeros).^2,1),2);
    temp_var=temp_var(:); temp_sqrt_var=sqrt(temp_var/(number-1));
    temp_mat=zeros(size(features));
    for i=1:third_dimension
        temp_mat(:,:,i)=temp_sqrt_var(i);
    end
    
    featuresNorm=(features-temp_zeros)./temp_mat;
end