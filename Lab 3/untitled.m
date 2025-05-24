load bach_fugue.mat
note_durations = theVoices.durations;
note_frequencies = 440 * 2.^((theVoices.noteNumbers-69)/12);
total_duration = sum(note_durations);

fs = 40000;
waveform = [];

for i = 1:length(theVoices.noteNumbers)
    duration = theVoices.noteNumbers(i);
    t = 0:1/fs:duration; % Time vector for the current note
    f = note_frequencies(i); % Frequency of the current note
    sinusoid = sin(2 * pi * f * t);
    waveform = [waveform, sinusoid]; % Concatenate to the full waveform
end

soundsc(waveform, fs);