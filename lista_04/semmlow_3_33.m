close all; clear variables; clc;
load eeg_data.mat
fs = 50;
N = length(eeg);
nfft = 100;
PS = abs((fft(eeg)).^2)/length(N);
f = (0:N-1)*fs/N;
subplot(2,1,1)
plot(f(1:N/2),2*PS(1:N/2));
ylabel('Power Spectrum')
xlabel('Frequency (Hz)');
grid()
title('Standard spectrum')


subplot(2,1,2)
[PS_avg,f] = pwelch(eeg,nfft, nfft-1,[], fs);
plot(f,PS_avg);
ylabel('Power Spectrum')
xlabel('Frequency (Hz)');
grid()
title('Periodogram')
saveas(gcf,sprintf('%s.png',mfilename))
