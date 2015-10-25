function [ theta ] = Final_errorAnalysis( txtLeft, txtRight, theta )
%FINAL_ERRORANALYSIS �˴���ʾ�йش˺�����ժҪ
%   textLeft, textRight ���ҵ��Ľǵ�
%   isFound���ڴ�����ͼ���ļ��������õ�(�����ҵ��ǵ㣬�ֶ���д)��ֻ��Ϊ��ʾһ����
% theta.errorAnalysis.isFound = isFound;

%   author: hgaolbb

[ theta.errorAnalysis.leftCorner, theta.errorAnalysis.rightCorner ] = readData( txtLeft, txtRight );
theta.errorAnalysis.error = theta.errorAnalysis.leftCorner(1,:) - theta.errorAnalysis.rightCorner(1,:);
theta.errorAnalysis.maxErr = max(abs(theta.errorAnalysis.error));
theta.errorAnalysis.averErr = mean(abs(theta.errorAnalysis.error));

end

