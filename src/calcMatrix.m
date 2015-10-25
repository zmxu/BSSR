function [ theta ] = calcMatrix( leftCorners, rightCorners, picRow, picCol, width, high, epsi, fromRT, useImg, number)
%FINAL_VER1 �˴���ʾ�йش˺�����ժҪ
%   txtFile_l����⵽��ǵ���Ϣ
%   txtFile_r����⵽�ҽǵ���Ϣ
%   picRow,picCol������ͼ���row&col��eg��1792, 3584
%   width,high��x����&y����ǵ����
%   epsi:���ݼ�����Ե�������epsi��ͼƬ���������R��T�ļ���
%   fromRT = 0; %�����������RT��ʼ���Ż�

%   author: hgaolbb

theta.useImg = useImg;
theta.row = picRow;
theta.col = picCol;
theta.n = width * high;
theta.number = number;

theta.Corners.left = leftCorners;
theta.Corners.right = rightCorners;

clear useImg leftCorners rightCorners;

[theta.UVW.left] = llp2sp( theta.Corners.left, picRow, picCol);
[theta.UVW.right] = llp2sp(theta.Corners.right, picRow, picCol);

[ theta.uvw.left ] = splitImage( theta.UVW.left, theta.n);
[ theta.uvw.right ] = splitImage( theta.UVW.right, theta.n);

theta.wp = createWP( width, high );
[ theta.eachR.left, theta.eachT.left, theta.eachDelta.left ] = calcSelfRT( theta.uvw.left, theta.wp);
[ theta.eachR.right, theta.eachT.right, theta.eachDelta.right ] = calcSelfRT( theta.uvw.right, theta.wp);

% TODO��delta > epsi�ļ�¼���ų� theta.active
[ theta.active, theta.useImg ] = active_image( theta.eachDelta, epsi, theta.useImg );

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

