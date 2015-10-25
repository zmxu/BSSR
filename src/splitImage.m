function [ dst ] = splitImage( src, corners)
%SPLITIMAGE �˴���ʾ�йش˺�����ժҪ
%   src: [u; v; w]
%   dst: [[u; v; w], kk]

%   author: hgaolbb

[m, n] = size(src);
dst = zeros([m, corners, n/corners]);
for i = 1:n/corners
    dst(:,:,i) = src(:,corners*(i-1)+1:corners*i);
end