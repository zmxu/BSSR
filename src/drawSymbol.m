function [ src ] = drawSymbol( src, points  )
%DRAWONPAIR �˴���ʾ�йش˺�����ժҪ
%   ��ͼ����Ӧλ�û���
%   
points = points + 1;
src = insertText(src, points, 1:size(points, 1));
src = insertMarker(src, points, '+', 'Color', 'red', 'Size', 5);

end