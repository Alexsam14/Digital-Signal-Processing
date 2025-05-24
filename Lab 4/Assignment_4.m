% Load the image
load('echart.mat');

% Define FILTER-1 parameters
q = 0.9;
b = [1, -q];  % Filter coefficients for FILTER-1

% Apply FILTER-1 horizontally
ech_h = zeros(size(echart));
for i = 1:size(echart, 1)
    ech_h(i, :) = filter(b, 1, echart(i, :));
end

% Apply FILTER-1 vertically to the result of horizontal filtering
ech90 = zeros(size(echart));
for j = 1:size(echart, 2)
    ech90(:, j) = filter(b, 1, ech_h(:, j));
end

r = 0.9;
M_values = [11, 22, 33];

figure;
subplot(2,3,1); imshow(echart, []); title('Original');
subplot(2,3,2); imshow(ech90, []); title('After FILTER-1');


for i = 1:length(M_values)
    M = M_values(i);
    b2 = r.^(0:M);
    
    % Apply FILTER-2 horizontally
    ech_dh = zeros(size(ech90));
    for row = 1:size(ech90, 1)
        ech_dh(row, :) = filter(b2, 1, ech90(row, :));
    end
    
    % Apply FILTER-2 vertically
    ech_deconv = zeros(size(ech90));
    for col = 1:size(ech90, 2)
        ech_deconv(:, col) = filter(b2, 1, ech_dh(:, col));
    end
    
    figure;
    imshow(ech_deconv, []);
    title(['Deconvolved (M = ', num2str(M), ')']);
    
    % Calculate and display the error
    error = echart - ech_deconv;
    worst_case_error = max(abs(error(:)));
    fprintf('M = %d, Worst-case error: %.4f\n', M, worst_case_error);
    
    % Generate impulse response of cascaded system
    h1 = [1, -0.9];
    h2 = r.^(0:M);
    h_cascaded = conv(h1, h2);
    figure;
    stem(h_cascaded);
    title(['Impulse Response (M = ', num2str(M), ')']);
    xlabel('n');
    ylabel('Amplitude');
end