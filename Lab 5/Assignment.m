
L = 10;
meetsCriteria = false;

while ~meetsCriteria
    [H, w_freq] = designFilter(L);
    meetsCriteria = checkCriteria(H, w_freq);
    if ~meetsCriteria
        L = L + 1;
    end
end

fprintf('Minimum filter length L: %d\n', L);

% Plot the final filter response
figure;
plot(w_freq/pi, abs(H));
hold on;
plot([0.3, 0.3], [0, 1], 'r--');
plot([0.7, 0.7], [0, 1], 'r--');
plot([0, 1], [0.1*max(abs(H)), 0.1*max(abs(H))], 'g--');
title(['Frequency Response of Bandpass Filter (L = ', num2str(L), ')']);
xlabel('Normalized Frequency (ω̂/π)');
ylabel('Magnitude');
legend('|H(e^{jω̂})|', 'Frequency Bounds', 'Attenuation Threshold');
grid on;

% Calculate passband width
Hmax = max(abs(H));
passband_indices = find(abs(H) >= 0.707 * Hmax);
passband_width = (w_freq(passband_indices(end)) - w_freq(passband_indices(1))) / pi;
fprintf('Passband width: %.4f π\n', passband_width);