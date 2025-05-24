load bach_fugue.mat
note_durations = theVoices.durations;
note_numbers = theVoices.noteNumbers;
note_frequencies = 440 * 2.^((note_numbers - 69)/12);
total_duration = sum(note_durations);

fs = 40000;
total_samples = round(total_duration * fs);
waveform = zeros(1, total_samples);
current_sample = 1;

figure;
hold on;

for i = 1:length(note_numbers)
    duration = note_durations(i);
    num_samples = round(duration * fs);
    t = (0:num_samples-1) / fs;  % Time vector for the current note
    f = note_frequencies(i); % Frequency of the current note
    sinusoid = sin(2 * pi * f * t);

    % Fill the waveform array with the sinusoid
    waveform(current_sample:current_sample+num_samples-1) = sinusoid;
    current_sample = current_sample + num_samples; % Update the current sample index
end 
    
% Select a portion of the waveform (e.g., 1 or 2 seconds)
portion_duration = 2; % seconds
portion_samples = round(portion_duration * fs);
portion_waveform = waveform(1:portion_samples);

% Generate the spectrogram
window_length = 512;
overlap = window_length / 2;
nfft = 1024;

% Create a figure for the spectrogram
figure;

% Generate and plot the spectrogram
spectrogram(portion_waveform, window_length, overlap, nfft, fs, 'yaxis');
title('Spectrogram of a Portion of the Synthesized Music');

% Zoom in on the frequency range where the notes are (e.g., 0 to 2000 Hz)
ylim([0 2]);

% Display the colorbar
colorbar;