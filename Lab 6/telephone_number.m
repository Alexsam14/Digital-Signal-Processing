% Set up parameters
fs = 8000;
L = 80;  % Adjust this value if needed

% Test with the example from Fig. 8
tk = ['A','B','C','D','*','#','0','1','2','3','4','5','6','7','8','9'];
xx = dtmfdial(tk, fs);
% soundsc(xx, fs)  % Uncomment to play the sound
keys = dtmfrun(xx, L, fs);
disp('Example test result:');
disp(keys);

% Test with the given phone number
test_number = '407*89132#BADC';
xx_test = dtmfdial(test_number, fs);
keys_test = dtmfrun(xx_test, L, fs);
disp('Phone number test result:');
disp(keys_test);

% Create spectrogram
figure;
spectrogram(xx_test, 256, 250, [], fs, 'yaxis');
title('Spectrogram of DTMF Signal for 407*89132#BADC');
xlabel('Time (s)');
ylabel('Frequency (Hz)');
colorbar;