function meetsCriteria = checkCriteria(H, w_freq)
    Hmax = max(abs(H));
    lowFreqIndices = find(w_freq <= 0.3*pi);
    highFreqIndices = find(w_freq >= 0.7*pi);
    
    lowFreqMet = all(abs(H(lowFreqIndices)) <= 0.1 * Hmax);
    highFreqMet = all(abs(H(highFreqIndices)) <= 0.1 * Hmax);
    
    meetsCriteria = lowFreqMet && highFreqMet;
end