function [ R, T, delta ] = calcSelfRT( uvw, wp)
k = size(uvw, 3);
R = zeros([3, 3, k]);
T = zeros([3, 1, k]);
delta = zeros([1, k]);
for i = 1:k
    [R(:,:,i), T(:,:,i), delta(i)] = FindHomography(uvw(:,:,i), wp);
end
end