% ��ͼ��������,ԭͼ��Ϊtheta�����ԭͼ������ '���\14_12_30\141231'�ļ�����
% pairLine�ļ����б��滮�ߵ�pairͼ(����ת)��pairOrig�б���û�л��ߵ�pairͼ
% L&R �ļ����б��澭��R_rect��ת�������ͼ��(������OpenCV�ҽǵ㣬��֤���)
fl_ = 'D:\ThetaPic\150104_1750_18floor_copyChessBoard\LL\L (';
fr_ = 'D:\ThetaPic\150104_1750_18floor_copyChessBoard\RR\R (';
fp_ = 'pair_';
readType = '.jpg';
writeType = '.jpg'; % ��ѡ��������ʽ eg: .jpg
for i = [1, 2, 5, 8, 9, 10]
%     if (sum(i == [4,6,14,15]) ~= 0)  
%         continue;
%     else
        fl = [fl_, num2str(i), ')', readType];
        fr = [fr_, num2str(i), ')', readType];
        %fw = [fw_, num2str(i), ')', writeType];
        [ pair, dst_l, dst_r ] = aa_1412251652( fl, fr, theta.R_rMean_l, theta.R_rMean_r );
%         imwrite(uint8(dst_l), ['L&R\L_', num2str(i), writeType]);
%         imwrite(uint8(dst_r), ['L&R\R_', num2str(i), writeType]);
        imwrite(uint8(pair), ['150105\pairOrig\', fp_, 'Orig', num2str(i), writeType]);
        pair(1:10:end,:) = 0;
        imwrite(uint8(pair), ['150105\pairLine\', fp_, 'Line', num2str(i), writeType]);
%     end
end
