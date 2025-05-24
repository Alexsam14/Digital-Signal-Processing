function [min_L, hh_final] = find_minimum_L(fb, fs, start_L, max_L)
    for L = start_L:2:max_L  % Increment by 2 for efficiency
        hh = dtmfdesign(fb, L, fs);
        if check_specifications(hh, fs, fb)
            min_L = L;
            hh_final = hh;
            return;
        end
    end
    min_L = NaN;  % If no suitable L found
    hh_final = [];
end