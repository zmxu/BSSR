function [ averR_rect, om ] = calcAverRrect( R_rect, active )
%CALCAVERRRECT �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

%   author: hgaolbb

om_list = [];
for i = active
    om = rodrigues(R_rect(:,:,i));
    om_list = [om_list om];
end
om = median(om_list,2);
averR_rect = rodrigues(om);

end

