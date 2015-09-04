function [R, T, R_rect_l, R_rect_r, oml, omr] = calcRrect(Rl, Rr, Tl, Tr, active)
%   fromRT~=0从RT开始改，否则从R_rect开始改

R = zeros(size(Rl));
T = zeros(size(Tl));
T_list = [];
om_list = [];
% R, T
for i = active
    R(:,:,i) = Rr(:,:,i) * Rl(:,:,i)';
    T(:,:,i) = Tr(:,:,i) - R(:,:,i) * Tl(:,:,i);
    om = rodrigues(R(:,:,i));
    om_list = [om_list om];
    T_list = [T_list T(:,:,i)];
end
averOM = mean(om_list, 2);  % averOM is the average of R transformed by rodrigues
averT = mean(T_list, 2);    % averT is the average of T
averR = rodrigues(om);  % averR is the average R using R_list

% r_l, r_r
    om = rodrigues(averR);
    r_l = om/2;
    R_l = rodrigues(r_l);
    R_r = R_l';
    t = R_r * averT;

    uu = [0;0;1];
    if dot(uu,t)<0,
        uu = -uu; % Swtich side of the vector 
    end;
    ww = cross(t,uu);
    ww = ww/norm(ww);
    ww = acos(abs(dot(t,uu))/(norm(t)*norm(uu)))*ww;        %角度*方向得到rodrigues向量
    R2 = rodrigues(ww);
    
    R_rect_l = R2 * R_l;
    R_rect_r = R2 * R_r;
    oml = rodrigues(R_rect_l);
    omr = rodrigues(R_rect_r);
    % theta.R_rect(i).direction = type_stereo;
end

% R_rect_l, R_rect_r