function [ ] = saveImage( leftImg, rightImg, readType, theta, origPair, linePair, lrImg, gap)
%FINAL_SAVEIMAGE 此处显示有关此函数的摘要
%   leftImg, rightImg为左右图的位置加上base name，考虑到输入名常为 'L (1).jpg'，
%   此时需要输入 '...\L ('
%   readType 为读入图像格式
%   active 为一组向量，选择要处理图像的编号，对应openCV用来找角点的图像组，注意不是原来所有图像组
%   为了减少参数数目，直接把theta扔进来
%   origPair, linePair, lrImg 表示是否保存这些图像，否的话置0
%   一般不需要写原图像对（没有旋转处理的），所以需要的话文件中设置吧 记得创建origTheta文件夹
%
%   划线间隔为gap，直接函数里设置
%   如果需要些相应的文件，需要首先在当前目录准备文件夹 origPair, linePair, L&R
origTheta = 0;
fl_ = leftImg;
fr_ = rightImg;
% fp_ = 'pair_';
writeType = '.jpg'; % 可选择其他格式 eg: .jpg

for i = theta.number
        fl = [fl_, sprintf('L (%d)', i), readType];
        fr = [fr_, sprintf('R (%d)', i), readType];
        left = imread(fl);
        right = imread(fr);
        [ pair, dst_l, dst_r ] = saveImg_v2( left, right,...
            theta.R_rect.leftAver, theta.R_rect.rightAver );
        
        if(origPair)
            imwrite(uint8(pair), ['..\output\orig_pair\pair_', num2str(i), writeType]);
        end
        if(lrImg)
            imwrite(uint8(dst_l), ['..\output\L_and_R\L_', num2str(i), writeType]);
            imwrite(uint8(dst_r), ['..\output\L_and_R\R_', num2str(i), writeType]);
        end
        if(linePair)
%             pairRGB = uint8(zeros([size(pair),3]));
%             for kk = 1:3
%                 pairRGB(:,:,kk) = pair;
%             end
            pair = colorLine(pair, gap);
            imwrite(uint8(pair), ['..\output\line_pair\linePair_', num2str(i), writeType]);
        end
        if(origTheta)
            Lorig = imread(fl);
            Rorig = imread(fr);
            pair = [Lorig; Rorig];
            pair = imrotate(pair, 90);
            imwrite(uint8(pair), ['pairThetaOrig\', fp_, 'Orig', num2str(i), writeType]);
            imwrite(uint8(pair), ['pairThetaOrigLine\', fp_, 'Line', num2str(i), writeType]);
        end
        clear pair dst_l dst_r;
end

end

