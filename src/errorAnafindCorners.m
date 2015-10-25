% I = imread([fl,'.jpg']);
% [imagePoints, boardSize] = detectCheckerboardPoints(I);
% J = insertText(I, imagePoints, 1:size(imagePoints, 1));
%   J = insertMarker(J, imagePoints, '+', 'Color', 'red', 'Size', 5);
%   imshow(J);
%   title(sprintf('Detected a %d x %d Checkerboard', boardSize));
%   function [ active ] = activeImage( delta, epsi )
function [cornersLeft_, cornersRight_, active] = errorAnafindCorners(fl_, fr_, activeImg)
% clear all;
% fl_ = 'D:\ThetaPic\2015_01_13_copy\LL\';
% fr_ = 'D:\ThetaPic\2015_01_13_copy\RR\';

%   author: hgaolbb

cornersLeft_ = [];
cornersRight_ = [];
active = [];
for i = activeImg
    fl = sprintf('L_%d.jpg', i);
    fl = [fl_, fl];
    fr = sprintf('R_%d.jpg', i);
    fr = [fr_, fr];
    left = rgb2gray(imread(fl));
    right = rgb2gray(imread(fr));
    [cleft, sleft] = detectCheckerboardPoints(left);
    [cright, sright] = detectCheckerboardPoints(right);
 
    % show if the image pair is useful
    showLeft = insertText(left, cleft, 1:size(cleft, 1));
    showLeft = insertMarker(showLeft, cleft, '+', 'Color', 'red', 'Size', 5);
    showRight = insertText(right, cright, 1:size(cright, 1));
    showRight = insertMarker(showRight, cright, '+', 'Color', 'red', 'Size', 5);
    pair = [showLeft; showRight];
    if(size(cleft, 1) == 77 && size(cright, 1) == 77)
        error = abs(cleft(:,1) - cright(:,1));
        imshow(pair);
        max(abs(error))
        find(error >= max(abs(error)))
        pause;
        cornersLeft_ = [cornersLeft_; cleft];
        cornersRight_ = [cornersRight_; cright];
        active = [active i];
    end
    
    %input('hello','s');
    clear showLeft showRight left right cleft cright pair;
end
cornersLeft_ = cornersLeft_';
cornersRight_ = cornersRight_';

end