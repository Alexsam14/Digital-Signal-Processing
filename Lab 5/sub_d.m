L = 10;  % Start with L = 10
meetsCriteria = false;

while ~meetsCriteria
    [H, w] = designFilter(L);
    meetsCriteria = checkCriteria(H, w);
    if ~meetsCriteria
        L = L + 1;
    end
end

fprintf('Smallest filter length L: %d\n', L);

% Plot the frequency response
figure;
plot(w/pi, abs(H));
title(['Frequency Response (L = ', num2str(L), ')']);
xlabel('Normalized Frequency (ω/π)');
ylabel('Magnitude');
grid on;
hold on;
plot([0.3 0.3], [0 1], 'r--');
plot([0.7 0.7], [0 1], 'r--');
plot([0 1], [0.1 0.1], 'g--');
legend('|H(e^{jω})|', 'ω = 0.3π', 'ω = 0.7π', '0.1 * H_{max}');