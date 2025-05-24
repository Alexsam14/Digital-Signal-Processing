function hh = dtmfdesign(fb, L, fs)
% DTMFDESIGN Designs a bank of DTMF bandpass filters
%   hh = dtmfdesign(fb, L, fs)
%
%   Inputs:
%   fb - vector of center frequencies for the DTMF tones
%   L  - length of FIR bandpass filters
%   fs - sampling frequency
%
%   Output:
%   hh - matrix (L x 8) where each column contains the impulse response
%        of a bandpass filter, one for each DTMF frequency

% Ensure fb is a column vector
fb = fb(:);

% Number of filters (should be 8 for DTMF)
num_filters = length(fb);

% Initialize the output matrix
hh = zeros(L, num_filters);

% Generate time vector
n = (0:L-1)';

% Design each bandpass filter
for i = 1:num_filters
    % Generate the unscaled impulse response
    h = cos(2*pi*fb(i)*n/fs);
    
    % Calculate the frequency response
    [H, ~] = freqz(h, 1, 1024, fs);
    
    % Find the maximum magnitude of the frequency response
    max_magnitude = max(abs(H));
    
    % Calculate beta to scale the response
    beta = 1 / max_magnitude;
    
    % Scale the impulse response and store in hh
    hh(:,i) = beta * h;
end

% Each BPF is now scaled so that its frequency response has a
% maximum magnitude equal to one.

end