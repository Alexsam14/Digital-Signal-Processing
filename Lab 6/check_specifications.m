function meets_spec = check_specifications(hh, fs, fb)
    meets_spec = true;
    f = linspace(0, fs/2, 1000);
    for i = 1:length(fb)
        H = freqz(hh(:,i), 1, f, fs);
        mag_db = 20*log10(abs(H));
        
        % Check passband width (assuming ±2% of center frequency)
        passband_low = fb(i) * 0.98;
        passband_high = fb(i) * 1.02;
        passband_response = mag_db((f >= passband_low) & (f <= passband_high));
        if any(passband_response < -3)  % -3dB bandwidth check
            meets_spec = false;
            return;
        end
        
        % Check stopband rejection (assuming outside ±4% of center frequency)
        stopband_low = f < fb(i) * 0.96;
        stopband_high = f > fb(i) * 1.04;
        stopband_response = mag_db(stopband_low | stopband_high);
        if any(stopband_response > -20)  % -20dB stopband rejection
            meets_spec = false;
            return;
        end
    end
end