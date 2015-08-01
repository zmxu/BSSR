function [ theta ] = Final_errorAnalysis_v2( fl_, fr_, theta )
%FINAL_ERRORANALYSIS �˴���ʾ�йش˺�����ժҪ
%   textLeft, textRight ���ҵ��Ľǵ�
%   isFound���ڴ�����ͼ���ļ��������õ�(�����ҵ��ǵ㣬�ֶ���д)��ֻ��Ϊ��ʾһ����
% theta.errorAnalysis.isFound = isFound;
% [ theta.errorAnalysis.leftCorner, theta.errorAnalysis.rightCorner ] = readData( txtLeft, txtRight );
[theta.errorAnalysis.leftCorner, theta.errorAnalysis.rightCorner, theta.errorAnalysis.active] = ...
    errorAnafindCorners(fl_, fr_, theta.active);
theta.errorAnalysis.error = theta.errorAnalysis.leftCorner(1,:) - theta.errorAnalysis.rightCorner(1,:);
theta.errorAnalysis.maxErr = max(abs(theta.errorAnalysis.error));
theta.errorAnalysis.averErr = mean(abs(theta.errorAnalysis.error));

end

