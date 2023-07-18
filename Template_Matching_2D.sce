function [yIndex, xIndex] = find_template_2D(template, img)
    c = normxcorr2(template, img);
    [~,idx] = max(c(:));
    [yIndex xIndex] = ind2sub(size(c), idx);
    xIndex = xIndex - size(template, 2) + 1;
    yIndex = yIndex - size(template, 1) + 1;
endfunction

pkg load image;

tablet = imread('tablet.png');
imshow(tablet);
glyph = tablet(75:165, 150:185);
imshow(glyph);

[y x] = find_template_2D(glyph, tablet);

disp([y x]);
colormap('gray'),imagesc(tablet);
hold on;
plot(x,y,'r+','markersize',16);
hold on;
