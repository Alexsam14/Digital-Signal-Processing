function xx = dtmfdial(keyNames,fs)
%DTMFDIAL Create a signal vector of tones which will dial
%         a DTMF (Touch Tone) telephone system.
%
% usage: xx = dtmfdial(keyNames,fs)
% keyNames = vector of characters containing valid key names
% fs = sampling frequency
% xx = signal vector that is the concatenation of DTMF tones.

dtmf.keys = ...
    ['1','2','3','A';
     '4','5','6','B';
     '7','8','9','C';
     '*','0','#','D'];
dtmf.colTones = ones(4,1)*[1209,1336,1477,1633];
dtmf.rowTones = [697;770;852;941]*ones(1,4);

% Error checking
if ~all(ismember(keyNames, dtmf.keys))
    error('Invalid key name(s) detected.');
end

% Initialize output vector
xx = [];

% Generate tones for each key
for k = 1:length(keyNames)
    % Find the row and column indices for the current key
    [ii, jj] = find(dtmf.keys == keyNames(k));
    
    % Generate the tone pair
    t = 0:1/fs:0.2;  % 0.2 seconds duration
    tone = sin(2*pi*dtmf.rowTones(ii,jj)*t) + sin(2*pi*dtmf.colTones(ii,jj)*t);
    
    % Normalize the tone
    tone = 0.5 * tone / max(abs(tone));
    
    % Add silence
    silence = zeros(1, round(0.05*fs));
    
    % Append the tone and silence to the output
    xx = [xx, tone, silence];
end

end