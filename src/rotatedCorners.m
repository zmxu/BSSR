function [ theta ] = rotatedCorners( theta )
%ROTATEDCORNERS 此处显示有关此函数的摘要
%   在drawOnPair之前先运行这一步，为后续节省时间

%   author: hgaolbb

theta.Corners.left_rotate = toNewPosition( theta.Corners.left, theta.R_rect.leftAver,  theta.row, theta.col);
theta.Corners.right_rotate = toNewPosition( theta.Corners.right, theta.R_rect.rightAver,  theta.row, theta.col);

end

