function [ theta ] = rotatedCorners( theta )
%ROTATEDCORNERS �˴���ʾ�йش˺�����ժҪ
%   ��drawOnPair֮ǰ��������һ����Ϊ������ʡʱ��

%   author: hgaolbb

theta.Corners.left_rotate = toNewPosition( theta.Corners.left, theta.R_rect.leftAver,  theta.row, theta.col);
theta.Corners.right_rotate = toNewPosition( theta.Corners.right, theta.R_rect.rightAver,  theta.row, theta.col);

end

