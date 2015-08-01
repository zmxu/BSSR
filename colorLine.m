function [src] = colorLine(src, gap)

color = zeros([3,5]);
color(:,1) = [255;0;0]; % ºì
color(:,2) = [255;255;0];   %»Æ
color(:,3) = [0;255;0]; %ÂÌ
color(:,4) = [255;128;64];
color(:,5) = [128;255;255];

for i = 1:gap:size(src,1)
    src(i,:,1) = color(1,1+rem((i-1)/gap, 5));
    src(i,:,2) = color(2,1+rem((i-1)/gap, 5));
    src(i,:,3) = color(3,1+rem((i-1)/gap, 5));
end