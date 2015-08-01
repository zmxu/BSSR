function [  ] = rotateThetaImage( fr_, fw_, readType, writeType, number)
%ROTATETHETAIMAGE 此处显示有关此函数的摘要
% eg: fr_ = 'D:\ThetaPic\Theta_150104_bigAngle_copy\RR\R (';
%       fw_ = 'rotateRight\R (';
% rotateThetaImage( fr_, fw_, '.jpg', '.jpg', 1:27)
for i = number
    fr = [fr_,sprintf('R (%d)', i), readType];
    fw = [fw_,sprintf('R (%d)', i), writeType];
    src = imread(fr);
    dst = imrotate(src, 180);
    imwrite(uint8(dst), fw);
end

