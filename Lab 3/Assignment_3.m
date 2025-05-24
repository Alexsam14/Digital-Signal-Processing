%4
%a
load lighthouse;
xx3 = xx(1:3:end,1:3:end);
%show_img(xx); show_img(xx3);  
L = length(xx3);
nn = ceil((0.999:1:4*L)/4);
xrholdrows = xx3(:,nn);

figure;
imshow(xx3);
title('Downsampled image');

figure;
imshow(xrholdrows);
title('Interpolated image');