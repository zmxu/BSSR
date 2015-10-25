function [ wp ] = createWP( width, high )
%CREATEWP 此处显示有关此函数的摘要
%   此处显示详细说明

%   author: hgaolbb

wp = ones([3, width*high]);
for i = 1:high
    for j = 1:width
        wp(1,(i-1)*width+j) = i-1;
    end
end

for i = 1:high
    for j = 1:width
        wp(2,(i-1)*width+j) = j-1;
    end
end

end

