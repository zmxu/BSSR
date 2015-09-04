% 将图像处理并保存,原图像为theta拍摄的原图，放在 '结果\14_12_30\141231'文件夹中
% pairLine文件夹中保存划线的pair图(已旋转)，pairOrig中保存没有划线的pair图
% L&R 文件夹中保存经过R_rect旋转后的左右图像(可用于OpenCV找角点，验证误差)
fl_ = 'D:\ThetaPic\150104_1750_18floor_copyChessBoard\LL\L (';
fr_ = 'D:\ThetaPic\150104_1750_18floor_copyChessBoard\RR\R (';
fp_ = 'pair_';
readType = '.jpg';
writeType = '.jpg'; % 可选择其他格式 eg: .jpg
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
