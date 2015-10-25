function [ theta ] = Final_calcMatrix( txtFile_l, txtFile_r, picRow, picCol, width, high, n ,epsi, fromRT)
%FINAL_VER1 此处显示有关此函数的摘要
%   txtFile_l：检测到左角点信息
%   txtFile_r：检测到右角点信息
%   picRow,picCol：输入图像的row&col，eg：1792, 3584
%   width,high：x方向&y方向角点个数
%   epsi:根据计算各自的误差，大于epsi的图片不参与后续R，T的计算
%   fromRT = 0; %如果非零代表从RT开始就优化

%   author: hgaolbb

[ theta.Corners.left, theta.Corners.right ] = readData( txtFile_l, txtFile_r );

[theta.UVW.left] = llp2sp( theta.Corners.left, picRow, picCol);
[theta.UVW.right] = llp2sp(theta.Corners.right, picRow, picCol);

[ theta.uvw.left ] = splitImage( theta.UVW.left, n);
[ theta.uvw.right ] = splitImage( theta.UVW.right, n);

theta.wp = createWP( width, high );
[ theta.eachR.left, theta.eachT.left, theta.eachDelta.left ] = calcSelfRT( theta.uvw.left, theta.wp);
[ theta.eachR.right, theta.eachT.right, theta.eachDelta.right ] = calcSelfRT( theta.uvw.right, theta.wp);

% TODO：delta > epsi的记录并排除 theta.active
[ theta.active ] = activeImage( theta.eachDelta, epsi );

if(~fromRT)
    [theta.R, theta.T, theta.R_rect.left, theta.R_rect.right] =...
        calcRT(theta.eachR.left, theta.eachR.right, theta.eachT.left, theta.eachT.right,...
        theta.active);

    [ theta.R_rect.leftAver, theta.R_rect.leftOM ] = calcAverRrect( theta.R_rect.left, theta.active );
    [ theta.R_rect.rightAver, theta.R_rect.rightOM ] = calcAverRrect( theta.R_rect.right, theta.active );
else
    [theta.R, theta.T, theta.R_rect.leftAver, theta.R_rect.rightAver,...
        theta.R_rect.leftOM, theta.R_rect.rightOM] =...
        calcRrect(theta.eachR.left, theta.eachR.right, theta.eachT.left, theta.eachT.right,...
        theta.active);
end

end

