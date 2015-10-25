
function [dst] = llp2sp(src, m, n)
% ��γͼ�ϵĵ��uvw����
% m,n ��ԭͼ�ĸ߿�
% src��2*k ���� ��һ��Ϊx���꣬�ڶ���Ϊy���꣬360��γͼ�ϵ����̸��

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