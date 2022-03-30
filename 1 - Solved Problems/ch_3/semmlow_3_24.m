close all; clear variables; clc;
N = 512;  % Data length
fs = 200; % Sampling frequency
x = randn(1,N); % Generate random Gaussian noise
nfft1 = 256;  % Segment length 1
nfft2 = 32;   % Segment length 2
[PS_avg1,f1] = pwelch(x,nfft1, nfft1-1,[], fs); % Periodogram 1, max. overlap
[PS_avg2,f2] = pwelch(x,nfft2, nfft2-1,[], fs); % Periodogram 2, max. overlap
% ---------------- Plotting settings ----------------------------
subplot(2,1,1)
plot(f1,PS_avg1);
ylabel('Power Spectrum')
xlabel('Frequency (Hz)');
grid()
title('Standard spectrum')
subplot(2,1,2)
plot(f2,PS_avg2);
ylabel('Power Spectrum')
xlabel('Frequency (Hz)');
grid()
title('Periodogram')
saveas(gcf,sprintf('%s.png',mfilename))
% ---------------------------------------------------------------
