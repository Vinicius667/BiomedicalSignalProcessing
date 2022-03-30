close all; clear variables; clc;
fs = 1024; % Sampling frequency
N = 1024;  % Data length
t = (0:N-1)/fs; % Time vector
Tt = N/fs; % Total time
fsig = 2;  % Signal frequency
x =  0.5*sawtooth(2*pi*fsig*t); % Sawtooth waveform
X = 2*fft(x)/N; % FFT of signal
Phase = unwrap(angle(X));  % Phase spectrum
X_mag = abs(X); % Magnitude spectrum
f1 = 1/Tt;   % fundamental frequency
f = (0:N-1)*f1;  % Frequency vector
c = 24;  % Number of components
xr = zeros(1,N);  % Reconstructed signal 
xr = xr + X_mag(1)/2; % Add in DC term
for m = 2:c
	xr = xr + X_mag(m)*cos(2*pi*f(m)*t + Phase(m));  %Sum of components
end
% ---------------- Plotting settings ----------------------------
hold on
plot(t,x,'k','DisplayName','Original signal');
plot(t,xr,'b','DisplayName','Reconstructed signal');
ylabel('x(t)')
xlabel('Time (s)');
legend('Orientation','horizontal','Box','on','Location','southoutside')
title('Reconstruction of signal using 24 components')
grid()
saveas(gcf,sprintf('%s.png',mfilename));
% ---------------------------------------------------------------
