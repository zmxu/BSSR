function [ active, useImg ] = activeImage_v2( delta, epsi, useImg )
%ACTIVEIMAGE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
n = size(delta.left, 2);
active = 1:n;
left = find( delta.left > epsi);
right = find( delta.right > epsi);
key = [left, right];
active(key) = [];
useImg(key) = [];
end

