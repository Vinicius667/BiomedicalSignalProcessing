close all; clear variables; clc;
load eeg_data.mat
fs = 50;  % Sampling frequency 
N = length(eeg); % Data length
nfft = 100;  % Segment length
PS = abs((fft(eeg)).^2)/length(N); % Calculate un-averaged PS
f = (0:N-1)*fs/N;  % Frequency vector
subplot(2,1,1)
plot(f(1:N/2),2*PS(1:N/2));
ylabel('Power Spectrum')
xlabel('Frequency (Hz)');
grid()
title('Standard spectrum')
subplot(2,1,2)
[PS_avg,f] = pwelch(eeg,nfft, 0.99*nfft,[], fs); % Periodogram, 99% overlap
% ---------------- Plotting settings ----------------------------
plot(f,PS_avg);
ylabel('Power Spectrum')
xlabel('Frequency (Hz)');
grid()
title('Periodogram')
saveas(gcf,sprintf('%s.png',mfilename))
% ---------------------------------------------------------------
