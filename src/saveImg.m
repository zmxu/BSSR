function [ pair, dst_l, dst_r ] = saveImg( filename_l, filename_r, Rl, Rr )
%AA_1412251652 
%   �˴���ʾ��ϸ˵��

%   author: hgaolbb

dst_l = backProjectImg(filename_l, Rl);
dst_r = backProjectImg(filename_r, Rr);

pair = [dst_l; dst_r];
pair = imrotate(pair, 90);

end

