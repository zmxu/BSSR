function [  ] = drawOnPair( file, number, theta )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

for i = number
    cur = theta.useImg(i);
    fl = [file, 'L_', num2str(cur), '.jpg'];
    fr = [file, 'R_', num2str(cur), '.jpg'];
    left = imread(fl);
    right = imread(fr);
%     pointLeft = theta.Corners.left(:,(i-1)*theta.n+1 : i*theta.n);
%     pointRight = theta.Corners.right(:,(i-1)*theta.n+1 : i*theta.n);
%     % rotate
%     left_rect = toNewPosition( pointLeft, theta.R_rect.leftAver,  theta.row, theta.col);
%     right_rect = toNewPosition( pointRight, theta.R_rect.rightAver,  theta.row, theta.col);
    % draw
    left = drawSymbol( left, theta.Corners.left_rotate(:,(i-1)*theta.n+1 : i*theta.n)'  );
    right = drawSymbol( right, theta.Corners.right_rotate(:,(i-1)*theta.n+1 : i*theta.n)'  );
    % show
    figure;imshow(left);title(sprintf('%d th Left image',cur));
    figure;imshow(right);title(sprintf('%d th Right image',cur));
    pair = [left; right];
    %pair = imrotate(pair, 90);
    %pair = colorLine(pair, 15);
    %pair = imrotate(pair, -90);
    figure;imshow(pair);title(sprintf('%d th Pair image',cur));
    pause;
    close all;
end

end

