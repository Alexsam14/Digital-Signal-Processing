function beta = calculate_beta(fb, L, fs)
    % Calculate unscaled frequency response
    n = 0:L-1;
    h = cos(2*pi*fb*n/fs);
    
    % Calculate frequency response
    [H, ~] = freqz(h, 1, 1024, fs);
    
    % Find maximum magnitude
    max_magnitude = max(abs(H));
    
    % Set beta as reciprocal of max magnitude
    beta = 1 / max_magnitude;
end