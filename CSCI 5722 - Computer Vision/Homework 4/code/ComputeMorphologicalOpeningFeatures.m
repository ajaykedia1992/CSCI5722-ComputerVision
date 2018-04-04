function features = ComputeMorphologicalOpeningFeatures(img)
    I = rgb2gray(img);    
    I = im2bw(I);
    se = strel('disk', 10);
    features = imerode(I,se);
end