function [  ] = saveSingleImg( fl, fr, theta, origPair, lrImg, linePair, gap )
%SAVESINGLEIMG 此处显示有关此函数的摘要
%   此处显示详细说明
writeType = '.jpg'; 
left = uint8(imread(fl));
right = uint8(imread(fr));
right = imrotate(right, 180);
[ pair, dst_l, dst_r ] = saveImg_v2( left, right,...
            theta.R_rect.leftAver, theta.R_rect.rightAver );  %!! 这里需要手动设置Rl，Rr
        
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

