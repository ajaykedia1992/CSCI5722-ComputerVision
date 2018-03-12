%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ajay Kedia
% CSCI 4830/5722
% Instructor: Fleming
% Homework 3: getDisparity.m
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [dispVec] = getDisparity(leftVec, rightVec, occ)
    length = size(leftVec, 2);rows = length + 1;cols = length + 1;
    cost_matrix = zeros(rows, cols);direction_matrix = zeros(rows, cols);
    for row = 1:rows
        cost_matrix(row, 1) = row * occ; 
    end
    for col = 2:cols
        cost_matrix(1, col) = col * occ;
    end
    for r = 2:rows
        for c = 2:cols
            if r == 2 && c == 2
               vector_diff = (leftVec(r - 1) - rightVec(c - 1)).^2;cost_matrix(r,c) = vector_diff;direction_matrix(r,c) = 1;
            else
                % d(i,j) = min(D(i-1, j-1) + d(i,j), D(i-1,j) + occ, D(i,j-1) + occ
                vector_diff = cost_matrix(r-1, c-1) + (leftVec(r-1)-rightVec(c-1)).^2;
                N = cost_matrix(r-1, c) + occ;W = cost_matrix(r, c-1) + occ;
                if vector_diff < N && vector_diff < W
                    cost_matrix(r, c) = vector_diff;direction_matrix(r,c) = 1;
                elseif N < vector_diff && N < W
                    cost_matrix(r,c) = N;direction_matrix(r,c) = 2;
                else
                    cost_matrix(r,c) = W;direction_matrix(r,c) = 3;
                end
            end
        end
    end
    vec = NaN(1, length);dispVec = backtrack(direction_matrix, vec); 
end