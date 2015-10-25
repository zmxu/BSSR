function [ theta ] = Final_errorAnalysis( txtLeft, txtRight, theta )
%FINAL_ERRORANALYSIS 此处显示有关此函数的摘要
%   textLeft, textRight 是找到的角点
%   isFound是在处理后的图中哪几幅是有用的(可以找到角点，手动填写)，只作为提示一下用
% theta.errorAnalysis.isFound = isFound;

%   author: hgaolbb

[ theta.errorAnalysis.leftCorner, theta.errorAnalysis.rightCorner ] = readData( txtLeft, txtRight );
theta.errorAnalysis.error = theta.errorAnalysis.leftCorner(1,:) - theta.errorAnalysis.rightCorner(1,:);
theta.errorAnalysis.maxErr = max(abs(theta.errorAnalysis.error));
theta.errorAnalysis.averErr = mean(abs(theta.errorAnalysis.error));

end

