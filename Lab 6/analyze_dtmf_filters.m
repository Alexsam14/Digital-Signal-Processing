function analyze_dtmf_filters(L)
    % DTMF frequencies
    fb = [697, 770, 852, 941, 1209, 1336, 1477, 1633];
    fs = 8000;

    % Generate filters
    hh = dtmfdesign(fb, L, fs);

    % Analyze frequency response
    nfft = 8192;  % Increased for better resolution
    f = linspace(0, fs/2, nfft/2 + 1);
    H = zeros(nfft/2 + 1, 8);

    figure('Position', [100, 100, 1200, 800]);

    for i = 1:8
        [h, w] = freqz(hh(:,i), 1, nfft, fs);
        H(:,i) = abs(h(1:nfft/2 + 1));
        
        % Plot frequency response
        subplot(2, 4, i);
        plot(f, 20*log10(H(:,i)));
        hold on;
        
        % Add lines for passband and stopband
        yline(-3, 'r--', 'Passband');
        yline(-12, 'g--', 'Stopband');
        
        % Mark DTMF frequencies
        for j = 1:8
            xline(fb(j), 'k:');
            if i == j
                text(fb(j), 0, '\downarrow', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');
            end
        end
        
        title(['Filter for ' num2str(fb(i)) ' Hz']);
        xlabel('Frequency (Hz)');
        ylabel('Magnitude (dB)');
        grid on;
        xlim([600 1700]);  % Zoom to DTMF frequency range
        ylim([-40 5]);
    end

    % Check specifications
    passband_ok = zeros(1, 8);
    stopband_ok = zeros(1, 8);
    for i = 1:8
        passband_ok(i) = sum(H(:,i) > 0.707 & f' ~= fb(i)) == 0;
        stopband_ok(i) = sum(H(:,i) > 0.25 & abs(f' - fb(i)) > 20) == 0;
    end

    fprintf('Filter length L = %d\n', L);
    fprintf('Passband criteria met: %d/8\n', sum(passband_ok));
    fprintf('Stopband criteria met: %d/8\n', sum(stopband_ok));
    
    if sum(passband_ok) < 8 || sum(stopband_ok) < 8
        fprintf('Problematic filters:\n');
        for i = 1:8
            if ~passband_ok(i) || ~stopband_ok(i)
                fprintf('  %d Hz\n', fb(i));
            end
        end
    end
end