function [ lc, rc ] = readData( fl, fr )
%READDATA1 此处显示有关此函数的摘要
%   此处显示详细说明
lc = load(fl);
rc = load(fr);
lc = reshape(lc, 2, []);
rc = reshape(rc, 2, []);

end

