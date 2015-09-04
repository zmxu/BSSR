function [ ] = saveImage( leftImg, rightImg, readType, theta, origPair, linePair, lrImg, gap)
%FINAL_SAVEIMAGE �˴���ʾ�йش˺�����ժҪ
%   leftImg, rightImgΪ����ͼ��λ�ü���base name�����ǵ���������Ϊ 'L (1).jpg'��
%   ��ʱ��Ҫ���� '...\L ('
%   readType Ϊ����ͼ���ʽ
%   active Ϊһ��������ѡ��Ҫ����ͼ��ı�ţ���ӦopenCV�����ҽǵ��ͼ���飬ע�ⲻ��ԭ������ͼ����
%   Ϊ�˼��ٲ�����Ŀ��ֱ�Ӱ�theta�ӽ���
%   origPair, linePair, lrImg ��ʾ�Ƿ񱣴���Щͼ�񣬷�Ļ���0
%   һ�㲻��Ҫдԭͼ��ԣ�û����ת����ģ���������Ҫ�Ļ��ļ������ð� �ǵô���origTheta�ļ���
%
%   ���߼��Ϊgap��ֱ�Ӻ���������
%   �����ҪЩ��Ӧ���ļ�����Ҫ�����ڵ�ǰĿ¼׼���ļ��� origPair, linePair, L&R
origTheta = 0;
fl_ = leftImg;
fr_ = rightImg;
% fp_ = 'pair_';
writeType = '.jpg'; % ��ѡ��������ʽ eg: .jpg

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

