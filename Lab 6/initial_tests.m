% DTMF frequencies
low_freq = [697 770 852 941];
high_freq = [1209 1336 1477 1633];
fb = [low_freq high_freq];
fs = 8000;  % Common sampling rate for telephone systems

% Test for L = 40
L_40 = 40;
hh_40 = dtmfdesign(fb, L_40, fs);

% Test for L = 80
L_80 = 80;
hh_80 = dtmfdesign(fb, L_80, fs);