%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script is used to convert image in circular way using swirl filter. 
%
% Name : Ajay Kedia
% Course No. : CSCI 5722 S18
% Assignment No. : Homework 1
% Instructor : Prof. Ioana Fleming
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ newImage ] = swirlFilter(current_img, factor, ox, oy)

    [a,b,c] = size(current_img);

    newImage = zeros(a,b,c);
    xt=zeros([a b]);
    yt=zeros([a b]);
    %ox = ceil((size(current_img,1)+1)/2);
    %oy = ceil((size(current_img,2)+1)/2);
    for row=1:a
        x=row-ox-factor;
        for col=1:b
           theta = atan2(col-oy+factor,x);
           radius = hypot(x,col-oy+factor);
           new_theta=theta+(radius/factor);
           l = radius.*cos(new_theta);
           m = radius.*sin(new_theta);
           xt(row,col)=ceil(l)+ox;
           yt(row,col)=ceil(m)+oy;
       
       end
   end
   xt=max(xt,1);
   xt=min(xt,a);
   yt=max(yt,1);
   yt=min(yt,b);
   for row=1:a
       for col=1:b
           newImage(row,col,:)=current_img(xt(row,col),yt(row,col),:);
       end
   end
end
