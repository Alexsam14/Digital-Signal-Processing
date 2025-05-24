function [H, w_freq] = designFilter(L)
    wc = 0.44 * pi;
    n = 0:L-1;
    h = (2/L) * cos(wc * n);
    w_freq = linspace(0, pi, 10000);
    H = zeros(size(w_freq));
    for i = 1:length(w_freq)
        H(i) = sum(h .* exp(-1j * w_freq(i) * n));
    end
end