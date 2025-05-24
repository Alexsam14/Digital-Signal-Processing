load lighthouse.mat
xx3 = xx(1:3:end, 1:3:end);
% Get the size of xx3
[rows, cols] = size(xx3);

% Create the indexing vector for zero-order hold with interpolation factor 3
nn = ceil((0.999:1:3*cols)/3);

% Process all rows of xx3 using zero-order hold
xholdrows = zeros(rows, 3*cols);
for i = 1:rows
    xholdrows(i,:) = xx3(i, nn);
end

% Display the original down-sampled image
figure;
subplot(2,1,1);
imshow(xx3);
title('Down-sampled Image (xx3)');

% Display the zero-order hold interpolated image
subplot(2,1,2);
imshow(xholdrows);
title('Zero-order Hold Interpolated Image (xholdrows)');

% Compare sizes
disp('Size of xx3:');
disp(size(xx3));
disp('Size of xholdrows:');
disp(size(xholdrows));