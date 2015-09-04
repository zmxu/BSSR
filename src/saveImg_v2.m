function [ pair, dst_l, dst_r ] = saveImg_v2( left, right, Rl, Rr )
%AA_1412251652 
%   此处显示详细说明
dst_l = backProjectImg_v2(left, Rl);
dst_r = backProjectImg_v2(right, Rr);

pair = [dst_l; dst_r];
pair = imrotate(pair, 90);

end

