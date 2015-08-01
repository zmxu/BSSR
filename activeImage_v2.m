function [ active, useImg ] = activeImage_v2( delta, epsi, useImg )
%ACTIVEIMAGE 此处显示有关此函数的摘要
%   此处显示详细说明
n = size(delta.left, 2);
active = 1:n;
left = find( delta.left > epsi);
right = find( delta.right > epsi);
key = [left, right];
active(key) = [];
useImg(key) = [];
end

