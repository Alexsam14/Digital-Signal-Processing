function keys = dtmfrun(xx, L, fs)
%DTMFRUN    keys = dtmfrun(xx,L,fs)
%   returns the list of key names found in xx.
%   keys = array of characters, i.e., the decoded key names
%   xx = DTMF waveform
%   L = filter length
%   fs = sampling freq

center_freqs = [697 770 852 941 1209 1336 1477 1633];
hh = dtmfdesign(center_freqs, L, fs);

[nstart, nstop] = dtmfcut(xx, fs);
keys = [];
for kk=1:length(nstart)
    x_seg = xx(nstart(kk):nstop(kk));
    
    scores = zeros(1, 8);
    for i = 1:8
        scores(i) = dtmfscore(x_seg, hh(:,i));
    end
    
    row_freqs = scores(1:4);
    col_freqs = scores(5:8);
    
    row_index = find(row_freqs);
    col_index = find(col_freqs);
    
    if length(row_index) == 1 && length(col_index) == 1
        keypad = ['123A'; '456B'; '789C'; '*0#D'];
        if row_index <= 4 && col_index <= 4  % This is already correct
            keys = [keys keypad(row_index, col_index)];
        else
            keys = [keys '?'];  % Error indicator for out-of-bounds indices
        end
    else
        keys = [keys '?'];  % Error indicator for incorrect number of detected frequencies
    end
    
    % Debugging output
    fprintf('Segment %d: row_index = %d, col_index = %d, scores = [%s]\n', ...
        kk, row_index, col_index, sprintf('%.2f ', scores));
end
end