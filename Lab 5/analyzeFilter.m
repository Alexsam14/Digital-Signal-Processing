% Filter design (from previous part)
L = 73;  % Optimum filter length from previous part
wc = 0.44 * pi;
n = 0:L-1;
h = (2/L) * cos(wc * n);

% Generate input signal (sum of 3 sinusoids)
N = 100;  % Number of points to plot
n = 0:N-1;
x = 5 * cos(0.3*pi*n) + 22 * cos(0.44*pi*n) + 22 * cos(0.7 * pi* n - (pi/4));

% Apply the filter
y = conv(x, h, 'same');

% Plot input and output signals
figure;
subplot(2,1,1);
plot(n, x);
title('Input Signal: Sum of 3 Sinusoids');
xlabel('Sample Index');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(n, y);
title('Filtered Output Signal');
xlabel('Sample Index');
ylabel('Amplitude');
grid on;

% Calculate and display amplitude ratios
amp_ratios = abs(fft(y)) ./ abs(fft(x));
freq = (0:length(x)-1) * (2*pi/length(x));
ratio_03pi = amp_ratios(round(0.3 * length(x)/2) + 1);
ratio_044pi = amp_ratios(round(0.44 * length(x)/2) + 1);
ratio_07pi = amp_ratios(round(0.7 * length(x)/2) + 1);

fprintf('Amplitude ratio at 0.3π: %.4f\n', ratio_03pi);
fprintf('Amplitude ratio at 0.44π: %.4f\n', ratio_044pi);
fprintf('Amplitude ratio at 0.7π: %.4f\n', ratio_07pi);