%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script file creates mesh grid
%
% Name : Ajay Kedia
% Course No. : CSCI 5722 S18
% Assignment No. : Homework 1
% Instructor : Prof. Ioana Fleming
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[xx, yy] = meshGridCreation(x, y)
    
  if nargin == 2 || (nargin == 1 && nargout < 3) % 2-D array case
    if nargin == 1
        y = x;
    end
    if isempty(x) || isempty(y)
        xx = zeros(0,class(x));
        yy = zeros(0,class(y));
    else
        xrow = full(x(:)).'; 
        ycol = full(y(:));  
        lenRow = size(xrow);
        lenCol = size(ycol);
        xx = zeros(lenRow(2),lenRow(2));
        yy = zeros(lenCol(1),lenCol(1));
        for ii = 1 : lenRow(2)
            xx(ii,:) = xrow;
        end    
       % xx = repmat(xrow,size(ycol));
        %yy = repmat(ycol,size(xrow));
        for ii = 1 : lenCol(1)
            yy(:,ii) = ycol;
        end  
    end
  end
end