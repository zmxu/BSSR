
function [dst] = backProjectImg_v2(src, R)
% R is rotate matrix

R = R';

R = R / norm(R);
Method = 'linear';

[m, n, l] = size(src);
dst = uint8(zeros([m,n,l]));

x = 0:n-1;
y = 0:m-1;

[X, Y] = meshgrid(x,y);
long = 2*pi/(n-1).*X - pi;
lati = pi/2 - pi/(m-1).*Y;
clear x y;

U = cos(long).*cos(lati);
V = sin(long).*cos(lati);
W = sin(lati);

clear long lati;

% add rotation
U_new = R(1,1).*U + R(1,2).*V + R(1,3).*W;
V_new = R(2,1).*U + R(2,2).*V + R(2,3).*W;
W_new = R(3,1).*U + R(3,2).*V + R(3,3).*W;
clear U W V;

lati_new = asin(W_new);
long_sin = asin(V_new ./ cos(lati_new));
long_cos = acos(U_new ./ cos(lati_new));

long_new = zeros(size(lati_new));

key_1 = find(long_sin >= 0 & long_cos < pi/2);
long_new(key_1) = long_sin(key_1);
key_2 = find(long_sin >= 0 & long_cos >= pi/2);
long_new(key_2) = long_cos(key_2);
key_3 = find(long_sin < 0 & long_cos < pi/2);
long_new(key_3) = long_sin(key_3);
key_4 = find(long_sin < 0 & long_cos >= pi/2);
long_new(key_4) = -long_cos(key_4);
long_new = real(long_new);

clear U_new V_new W_new X Y;

% 
X_new = single((long_new + pi) .* (n-1)/(2*pi));
Y_new = single((pi/2 - lati_new) .* (m-1)/pi);
clear long_new lati_new long_cos long_sin key_1 key_2 key_3 key_4;

[X,Y] = meshgrid(1:n,1:m);
% dst = interp2(X,Y,double(src),X_new+1,Y_new+1, Method);
dst(:,:,1) = uint8(interp2(X,Y,single(src(:,:,1)),X_new+1,Y_new+1, Method));
dst(:,:,2) = uint8(interp2(X,Y,single(src(:,:,2)),X_new+1,Y_new+1, Method));
dst(:,:,3) = uint8(interp2(X,Y,single(src(:,:,3)),X_new+1,Y_new+1, Method));

end
