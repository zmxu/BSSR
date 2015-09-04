% fl_ = 'D:\ThetaPic\2015_01_13_copy\LL\';
% fr_ = 'D:\ThetaPic\2015_01_13_copy\RR\';
% fl_ = '..\ThetaPic\2015_01_13_copy\LL\';
% fr_ = '..\ThetaPic\2015_01_13_copy\RR\';

function theta = fish_eye_binocular_stereo(fl_, fr_, number)

% ��תͼ��
% rotateThetaImage( fr_, 'RR\', '.jpg', '.jpg', number);
% �ҽǵ㲢����
% imgNumber = 1:29;   % ͼ����
[cornersLeft_, cornersRight_, active] = findCorners(fl_, fr_, number);
% ����theta���ֲ���
% ���theta�ṹ�� =              ��ǵ㣬        �ҽǵ㣬    ��row��   col��ÿ�м����㣬�������ܵ�����
% ������ ,Rrectȡƽ��=0����Чͼ����
[ theta ] = calcMatrix( cornersLeft_, cornersRight_, 1792, 3584,    6,      8, ...
    0.002, 0, active, number );

%  д��ͼ��
% fl = 'D:\ThetaPic\2015_01_13_copy\LL\L (';
% fr = 'D:\ThetaPic\2015_01_13_copy\RR\R (';
%       ��ͼ��λ�ã���ͼ��λ�ã�����ͼƬ��ʽ��theta�ṹ�壬origPair,linePair,L&R,gap
saveImage( fl_, fr_, '.jpg', theta, 0, 1, 1, 15);

% ������
% �������Ҫ����theta.errorAnalysis = ����ͼλ�ã���ͼλ�ã�theta�ṹ�壨��Ҫ��������..����
[ theta ] = rotatedCorners( theta );
[ theta ] = errorAnalysis( theta,  1.5);
% drawOnPair( 'L&R\', theta.active, theta );

end