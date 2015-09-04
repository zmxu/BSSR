function [  ] = saveSingleImg( fl, fr, theta, origPair, lrImg, linePair, gap )
%SAVESINGLEIMG �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
writeType = '.jpg'; 
left = uint8(imread(fl));
right = uint8(imread(fr));
right = imrotate(right, 180);
[ pair, dst_l, dst_r ] = saveImg_v2( left, right,...
            theta.R_rect.leftAver, theta.R_rect.rightAver );  %!! ������Ҫ�ֶ�����Rl��Rr
        
        if(origPair)
            imwrite(uint8(pair), ['Data\pairOrigImg', writeType]);
        end
        if(lrImg)
            imwrite(uint8(dst_l), ['Data\L_rotated', writeType]);
            imwrite(uint8(dst_r), ['Data\R_rotated', writeType]);
        end
        if(linePair)
%             pairRGB = uint8(zeros([size(pair),3]));
%             for kk = 1:3
%                 pairRGB(:,:,kk) = pair;
%             end
            pair = colorLine(pair, gap);
            imwrite(uint8(pair), ['Data\pairLineImg', writeType]);
        end

end

