close all; clear variables; clc;
fs = 1000; % Sampling frequency
N = 64; % Number of samples
f1 = 200; % Signal frequency 1
f2 = 300; % Signal frequency 2
[x, t] = sig_noise([f1,f2],-3,N); % Noisy signal containing freqs f1 and f2
Xb = fft(x.*blackmanharris(N)'); % FFT of signal with blackmanharris window applied
Xr = fft(x); % FFT of unwindowed signal
Xb_mag = 2*abs(Xb(1:N/2)/N);  % Magnitude spectrum of windowed signal
Xr_mag = 2*abs(Xr(1:N/2)/N);  % Magnitude spectrum of unwindowed signal
f = (0:N/2-1)*fs/N; % Frequncy vector
% ---------------- Plotting settings ----------------------------
subplot(2,1,1)
hold on
plot(f,Xb_mag,'DisplayName','Blackman-Harris');
plot(f(1:N/2),Xr_mag,'DisplayName','Rectangular');
legend('Orientation','horizontal','Box','on','Location','southoutside')
ylabel('Magnitude Spectrum')
xlabel('Frequency (Hz)');
grid()
subplot(2,1,2)
% ---------------------------------------------------------------
scale_factor = N/sum(blackmanharris(N));  % scale factor to compensate for the reduction in energy
hold on
Xb = fft(scale_factor*x.*blackmanharris(N)'); % FFT of the scaled windowed signal
Xr = fft(x); % FFT o the original signal 
Xb_mag = 2*abs(Xb(1:N/2)/N); % FFT of the scaled signal with blackmanharris window applied
Xr_mag = 2*abs(Xr(1:N/2)/N); % FFT of the original signal
% ---------------- Plotting settings ----------------------------
plot(f(1:N/2),Xb_mag,'DisplayName','Blackman-Harris');
plot(f(1:N/2),Xr_mag,'DisplayName','Rectangular');
legend('Orientation','horizontal','Box','on','Location','southoutside')
ylabel('Magnitude Spectrum')
xlabel('Frequency (Hz)');
grid()
saveas(gcf,sprintf('%s.png',mfilename))
% ---------------------------------------------------------------
