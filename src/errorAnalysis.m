function [ theta ] = errorAnalysis( theta,  errorEpsi)
%ERRORANALYSIS 此处显示有关此函数的摘要
%   此处显示详细说明
theta.errorAnalysis.error = theta.Corners.left_rotate(1,:) - theta.Corners.right_rotate(1,:);
key = find(abs(theta.errorAnalysis.error) > errorEpsi);
line1 = ceil(key./theta.n);
line2 = theta.useImg(uint8(line1));
line3 = mod(key, theta.n);
line4 = theta.errorAnalysis.error(key);
theta.errorAnalysis.points = [line1; line2; line3; line4];
theta.errorAnalysis.max = max(abs(theta.errorAnalysis.error));
theta.errorAnalysis.mean = mean(abs(theta.errorAnalysis.error));
end

