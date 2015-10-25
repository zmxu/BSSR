function [R, T, R_rect_l, R_rect_r] = calcRT(Rl, Rr, Tl, Tr, active)
%   fromRT~=0从RT开始改，否则从R_rect开始改

%   author: hgaolbb

R = zeros(size(Rl));
R_rect_l = zeros(size(Rl));
R_rect_r = zeros(size(Rl));
T = zeros(size(Tl));
% R, T
for i = active
    R(:,:,i) = Rr(:,:,i) * Rl(:,:,i)';
    T(:,:,i) = Tr(:,:,i) - R(:,:,i) * Tl(:,:,i);
end

% r_l, r_r
for i = active
    
    om = rodrigues(R(:,:,i));
    r_l = om/2;
    R_l = rodrigues(r_l);
    R_r = R_l';
    t = R_r * T(:,:,i);
    
    % Rotate both cameras so as to bring the translation vector in alignment with the (1;0;0) axis:
%     if abs(t(1)) > abs(t(2)),
%         type_stereo = 0;
%         uu = [1;0;0]; % Horizontal epipolar lines
%     else
%         type_stereo = 1;
%         uu = [0;1;0]; % Vertical epipolar lines
%     end;
    uu = [0;0;1];
    if dot(uu,t)<0,
        uu = -uu; % Swtich side of the vector 
    end;
    ww = cross(t,uu);
    ww = ww/norm(ww);
    ww = acos(abs(dot(t,uu))/(norm(t)*norm(uu)))*ww;        %角度*方向得到rodrigues向量
    R2 = rodrigues(ww);
    
    R_rect_l(:,:,i) = R2 * R_l;
    R_rect_r(:,:,i) = R2 * R_r;
    % theta.R_rect(i).direction = type_stereo;
end

% R_rect_l, R_rect_r