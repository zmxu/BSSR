
% �ҽǵ㲢����
fl_ = 'D:\ThetaPic\2015_01_13_copy\LL\';
fr_ = 'D:\ThetaPic\2015_01_13_copy\RR\';
imgNumber = 1:29;   % ͼ����
[cornersLeft_, cornersRight_, active] = findCorners(fl_, fr_, imgNumber);
% ����theta���ֲ���
% ���theta�ṹ�� =              ��ǵ㣬        �ҽǵ㣬    ��row��   col��ÿ�м����㣬�������ܵ�����
% ������ ,Rrectȡƽ��=0����Чͼ����
[ theta ] = Final_calcMatrix_v2( cornersLeft_, cornersRight_, 1792, 3584,    7,      11,    77, ...
    0.002, 0, active );

%  д��ͼ��
fl = 'D:\ThetaPic\2015_01_13_copy\LL\L (';
fr = 'D:\ThetaPic\2015_01_13_copy\RR\R (';
%       ��ͼ��λ�ã���ͼ��λ�ã�����ͼƬ��ʽ��theta�ṹ�壬origPair,linePair,L&R,gap
Final_saveImage( fl, fr, '.jpg', theta, 1, 1, 1, 15);

% ������
% �������Ҫ����theta.errorAnalysis = ����ͼλ�ã���ͼλ�ã�theta�ṹ�壨��Ҫ��������..����
[ theta ] = Final_errorAnalysis_v2( 'L&R\', 'L&R\', theta );