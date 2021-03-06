function [ theta ] = Final_errorAnalysis_v2( fl_, fr_, theta )
%FINAL_ERRORANALYSIS 此处显示有关此函数的摘要
%   textLeft, textRight 是找到的角点
%   isFound是在处理后的图中哪几幅是有用的(可以找到角点，手动填写)，只作为提示一下用
% theta.errorAnalysis.isFound = isFound;
% [ theta.errorAnalysis.leftCorner, theta.errorAnalysis.rightCorner ] = readData( txtLeft, txtRight );

%   author: hgaolbb

[theta.errorAnalysis.leftCorner, theta.errorAnalysis.rightCorner, theta.errorAnalysis.active] = ...
    errorAnafindCorners(fl_, fr_, theta.active);
theta.errorAnalysis.error = theta.errorAnalysis.leftCorner(1,:) - theta.errorAnalysis.rightCorner(1,:);
theta.errorAnalysis.maxErr = max(abs(theta.errorAnalysis.error));
theta.errorAnalysis.averErr = mean(abs(theta.errorAnalysis.error));

end

