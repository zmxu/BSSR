
function [cornersLeft_, cornersRight_, active] = findCorners(fl_, fr_, activeImg)
% clear all;
% fl_ = 'D:\ThetaPic\2015_01_13_copy\LL\';
% fr_ = 'D:\ThetaPic\2015_01_13_copy\RR\';
cornersLeft_ = [];
cornersRight_ = [];
active = [];

for i = activeImg
    flag = 0;
    fl = sprintf('L (%d).jpg', i);
    fl = [fl_, fl];
    fr = sprintf('R (%d).jpg', i);
    fr = [fr_, fr];
    left = rgb2gray(imread(fl));
    right = rgb2gray(imread(fr));
    [cleft, sleft] = detectCheckerboardPoints(left);
    [cright, sright] = detectCheckerboardPoints(right);
    
    % show if the image pair is useful
    showLeft = insertText(left, cleft, 1:size(cleft, 1));
    showLeft = insertMarker(showLeft, cleft, '+', 'Color', 'red', 'Size', 5);
    showRight = insertText(right, cright, 1:size(cright, 1));
    showRight = insertMarker(showRight, cright, '+', 'Color', 'red', 'Size', 5);
    pair = [showLeft; showRight];
    figure('KeyPressFcn',@fig);
    imshow(pair);
    %input('hello','s');
    pause;
    close;
    if(size(cleft, 1) == 77 && size(cright, 1) == 77 && flag == 0)
        cornersLeft_ = [cornersLeft_; cleft];
        cornersRight_ = [cornersRight_; cright];
        active = [active i];
    end
    if(flag == 2)
        break;
    end
    if(flag == 3)
        imwrite(pair, sprintf('findCorners_%d.jpg', i));
    end
    clear showLeft showRight left right cleft cright pair;
end
cornersLeft_ = cornersLeft_';
cornersRight_ = cornersRight_';

function fig(~,event)
    % Callback to parse keypress event data to print a figure
        if event.Key == 'd'
            % On some systems you must send the file to a printer manually
            flag = 1;
            return;
        end
        if event.Key == 's'
            flag = 3;
            return;
        end
        if strcmp(event.Key, 'escape')
            flag = 2;
        end
    end

end