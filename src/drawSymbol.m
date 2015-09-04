function [ src ] = drawSymbol( src, points  )
%DRAWONPAIR 此处显示有关此函数的摘要
%   在图上相应位置画点
%   
points = points + 1;
src = insertText(src, points, 1:size(points, 1));
src = insertMarker(src, points, '+', 'Color', 'red', 'Size', 5);

end