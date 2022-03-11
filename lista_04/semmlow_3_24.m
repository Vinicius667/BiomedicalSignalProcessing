close all; clear variables; clc;
N = 512;
fs = 200;
x = randn(1,N); % Generate random Gaussian noise
nfft1 = 256;
nfft2 = 32;
[PS_avg1,f1] = pwelch(x,nfft1, nfft1-1,[], fs);
[PS_avg2,f2] = pwelch(x,nfft2, nfft2-1,[], fs);

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
