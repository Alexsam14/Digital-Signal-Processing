function analyzeFilter(L)
    % Filter parameters
    wc = 0.44 * pi;

    % Generate filter coefficients
    n = 0:L-1;
    h = (2/L) * cos(wc * n);

    % Calculate frequency response
    w_freq = linspace(0, pi, 10000);
    H = zeros(size(w_freq));
    for i = 1:length(w_freq)
        H(i) = sum(h .* exp(-1j * w_freq(i) * n));
    end

    % Find maximum magnitude
    Hmax = max(abs(H));

    % Find passband edges
    passband_indices = find(abs(H) >= 0.707 * Hmax);
    lower_edge = w_freq(passband_indices(1));
    upper_edge = w_freq(passband_indices(end));

    % Calculate passband width
    passband_width = upper_edge - lower_edge;

    % Find stopband
    stopband_indices = find(abs(H) < 0.25 * Hmax);
    
    % Plot frequency response
    figure;
    plot(w_freq/pi, abs(H));
    hold on;
    plot([lower_edge, lower_edge]/pi, [0, Hmax], 'r--');
    plot([upper_edge, upper_edge]/pi, [0, Hmax], 'r--');
    plot([0, 1], [0.707 * Hmax, 0.707 * Hmax], 'g--');
    plot([0, 1], [0.25 * Hmax, 0.25 * Hmax], 'm--');
    title(['Frequency Response of Bandpass Filter (L = ', num2str(L), ')']);
    xlabel('Normalized Frequency (ω̂/π)');
    ylabel('Magnitude');
    legend('|H(e^{jω̂})|', 'Passband edges', '0.707 Hmax', '0.25 Hmax');
    grid on;

    % Print results
    fprintf('Filter length L = %d\n', L);
    fprintf('Passband width: %.4f π\n', passband_width/pi);
    fprintf('Lower passband edge: %.4f π\n', lower_edge/pi);
    fprintf('Upper passband edge: %.4f π\n\n', upper_edge/pi);
end

% Analyze filters for different lengths
