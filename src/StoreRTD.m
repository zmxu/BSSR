for i = 1:18
    [theta.left(i).R, theta.left(i).T, theta.left(i).delta] = FindHomography(uvw_l(:,:,i), wp);
end
for i = 1:18
    [theta.right(i).R, theta.right(i).T, theta.right(i).delta] = FindHomography(uvw_r(:,:,i), wp);
end