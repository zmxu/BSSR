function [ lc, rc ] = readData( fl, fr )
%READDATA1 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
lc = load(fl);
rc = load(fr);
lc = reshape(lc, 2, []);
rc = reshape(rc, 2, []);

end

