
function [dst] = llp2sp(src, m, n)
% 经纬图上的点的uvw坐标
% m,n 是原图的高宽
% src是2*k 矩阵 第一行为x坐标，第二行为y坐标，360经纬图上的棋盘格点

% m = 896;
% n = 1792;

%   author: hgaolbb

long = 2*pi/(n-1).*src(1,:) - pi;
lati = pi/2 - pi/(m-1).*src(2,:);

U = cos(long).*cos(lati);
V = sin(long).*cos(lati);
W = sin(lati);
dst = [U;V;W];

end