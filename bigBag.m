% fl_ = 'D:\ThetaPic\2015_01_13_copy\LL\';
% fr_ = 'D:\ThetaPic\2015_01_13_copy\RR\';

function theta = bigBag(fl_, fr_, number)

% 旋转图像
% rotateThetaImage( fr_, 'RR\', '.jpg', '.jpg', number);
% 找角点并保存
% imgNumber = 1:29;   % 图像编号
[cornersLeft_, cornersRight_, active] = findCorners(fl_, fr_, number);
% 计算theta各种参数
% 输出theta结构体 =              左角点，        右角点，    ，row，   col，每行几个点，行数，总点数，
% 最大误差 ,Rrect取平均=0，有效图像编号
[ theta ] = Final_calcMatrix_v2( cornersLeft_, cornersRight_, 1792, 3584,    7,      11, ...
    0.002, 0, active, number );

%  写入图像
% fl = 'D:\ThetaPic\2015_01_13_copy\LL\L (';
% fr = 'D:\ThetaPic\2015_01_13_copy\RR\R (';
%       左图像位置，右图像位置，保存图片格式，theta结构体，origPair,linePair,L&R,gap
% Final_saveImage_v2( fl_, fr_, '.jpg', theta, 0, 1, 1, 15);

% 误差分析
% 输出：主要更新theta.errorAnalysis = （左图位置，右图位置，theta结构体（主要保存数据..））
[ theta ] = rotatedCorners( theta );
[ theta ] = errorAnalysis( theta,  1.5);
% drawOnPair( 'L&R\', theta.active, theta );

end