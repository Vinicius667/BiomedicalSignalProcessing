close all; clear variables; clc;
load short.mat 
fs = 1; % Sampling frequency
N = length(x); % Original data length
N2 = 256; % Data length with padding
X = fft(x); % FFT of original signal
Xmag = 2*abs(X(1:N/2)); % Magnitude spectrum of original signal
x2 = [x zeros(1,N2-N)]; % Padded signal
X2 = fft(x2); % FFT of padded signal
Xmag2 = 2*abs(X2(1:N2/2)); % Magnitude spectrum of padded signal
f = (0:N/2-1)*fs/N; % Frequency vector for original signal
f2 = (0:N2/2-1)*fs/N2; % % Frequency vector for signal with padding
% ---------------- Plotting settings ----------------------------
hold on
plot(f,Xmag,'DisplayName','No padding');
plot(f2,Xmag2,'DisplayName','With padding');
title('Interpolation of spectrum using padding')
ylabel('Magnitude Spectrum')
xlabel('Frequency (Hz)');
grid()
legend('Orientation','vertical','Box','on','Location','southoutside')
saveas(gcf,sprintf('%s.png',mfilename))
% ---------------------------------------------------------------
