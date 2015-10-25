function [ theta ] = Final_calcMatrix( txtFile_l, txtFile_r, picRow, picCol, width, high, n ,epsi, fromRT)
%FINAL_VER1 �˴���ʾ�йش˺�����ժҪ
%   txtFile_l����⵽��ǵ���Ϣ
%   txtFile_r����⵽�ҽǵ���Ϣ
%   picRow,picCol������ͼ���row&col��eg��1792, 3584
%   width,high��x����&y����ǵ����
%   epsi:���ݼ�����Ե�������epsi��ͼƬ���������R��T�ļ���
%   fromRT = 0; %�����������RT��ʼ���Ż�

%   author: hgaolbb

[ theta.Corners.left, theta.Corners.right ] = readData( txtFile_l, txtFile_r );

[theta.UVW.left] = llp2sp( theta.Corners.left, picRow, picCol);
[theta.UVW.right] = llp2sp(theta.Corners.right, picRow, picCol);

[ theta.uvw.left ] = splitImage( theta.UVW.left, n);
[ theta.uvw.right ] = splitImage( theta.UVW.right, n);

theta.wp = createWP( width, high );
[ theta.eachR.left, theta.eachT.left, theta.eachDelta.left ] = calcSelfRT( theta.uvw.left, theta.wp);
[ theta.eachR.right, theta.eachT.right, theta.eachDelta.right ] = calcSelfRT( theta.uvw.right, theta.wp);

% TODO��delta > epsi�ļ�¼���ų� theta.active
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

