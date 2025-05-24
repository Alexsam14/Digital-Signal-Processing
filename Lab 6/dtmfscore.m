function sc = dtmfscore(xx, hh)
xx = xx*(2/max(abs(xx))); %--Scale the input x[n] to the range [-2,+2]

% Filter the input signal
y = conv(xx, hh);

% Find the maximum amplitude of the filtered output
max_amp = max(abs(y));

% Determine the score
if max_amp >= 0.59
    sc = 1;
else
    sc = 0;
end

if nargout == 0  % Only plot if no output argument is requested
        figure;
        plot(1:min(500, length(y)), y(1:min(500, length(y))));
        title('Filtered Output');
        xlabel('Sample');
        ylabel('Amplitude');
        grid on;
end
end