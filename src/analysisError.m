% author: hgaolbb
% ����������֤������OpenCV���ǵ�
% ns����˼��no_sub����û��findSubCorners
% ����txt�����꣬������,[x;y]
left_ns = load('lc_noSub.txt');
left_ns = reshape(left_ns, 2, []);
right_ns = load('rc_noSub.txt');
right_ns = reshape(right_ns, 2, []);
% ��������ͼ�����(x����) & �Ӳ�(y����) [x;y]
error_ns = left_ns - right_ns;
averError_ns = mean(abs(error_ns(1,:)));

% ��Ϊ����ͼ
[m, n] = size(left);
theta.pointData.left = zeros([2, 48, n/48]);
theta.pointData.right = zeros([2, 48, n/48]);
for i = 1:n/48
    theta.pointData.left(:,:,i) = left(:,48*(i-1)+1:48*i);
    theta.pointData.right(:,:,i) =right(:,48*(i-1)+1:48*i);
end

% ��λ��om
 theta.om_l_norm = zeros([3, 1]);
 theta.om_r_norm = zeros([3, 1]);
 for i = 1:18
    if (sum(i == [4,6,14,15]) ~= 0)  
        continue;
    else
        theta.om_l_norm = [theta.om_l_norm, theta.R_rect(i).om_l / norm(theta.R_rect(i).om_l)];
        theta.om_r_norm = [theta.om_r_norm, theta.R_rect(i).om_r / norm(theta.R_rect(i).om_r)];
    end
 end
theta.om_l_norm(:,1) = [];
theta.om_r_norm(:,1) = [];