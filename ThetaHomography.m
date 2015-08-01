function y = ThetaHomography(H,sphere_pts_set,model_pts_set)

H = reshape(H,3,3);

M = H * model_pts_set;
R = diag(sqrt(M'*M));
R = [R';R';R'];
M = M./R;

y = sum(sum((sphere_pts_set - M).^2));


