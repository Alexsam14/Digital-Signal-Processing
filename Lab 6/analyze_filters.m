function analyze_filters(hh, fs, fb)
    [num_samples, num_filters] = size(hh);
    f = linspace(0, fs/2, 1000);
    for i = 1:num_filters
        H = freqz(hh(:,i), 1, f, fs);
        figure;
        plot(f, 20*log10(abs(H)));
        title(['Filter for ', num2str(fb(i)), ' Hz']);
        xlabel('Frequency (Hz)');
        ylabel('Magnitude (dB)');
        grid on;
        xlim([0 fs/2]);
        ylim([-60 5]);
    end
end

% Analyze both cases
analyze_filters(hh_40, fs, fb);
analyze_filters(hh_80, fs, fb);