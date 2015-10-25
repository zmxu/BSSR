
function [R, T, delta] = FindHomography(uvw_1, wp)
% load('uvw&wp.mat');

sphere_pts_set = uvw_1;
model_pts_set = wp;

H0 = [1 0 0 0 1 0 0 0 1];

%[H fval exitflag]=fsolve(@(H)ThetaHomography(H,sphere_pts_set,model_pts_set),H0,optimset('Display','iter'))
options = optimoptions(@fmincon, 'Algorithm', 'sqp');
[H, fval] = fmincon(@(H)ThetaHomography(H,sphere_pts_set,model_pts_set),H0,[],[],[],[],[],[],@confun,options);
H = reshape(H,3,3);
R1 = H(:,1)./sqrt(sum(H(:,1).^2));
R2 = H(:,2)./sqrt(sum(H(:,2).^2));

R3 = cross(R1,R2);
R3 = R3./sqrt(sum(R3.^2));

R = [R1,R2,R3];
T = H(:,3);

% R'*R;

r = rodrigues(R);
R = rodrigues(r);

delta = ThetaHomography(H,sphere_pts_set,model_pts_set);

end

